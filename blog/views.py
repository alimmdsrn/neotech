from urllib.parse import unquote
from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, Http404
from .forms import *
from .models import *
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.views.generic import ListView, DetailView
from django.views.decorators.http import require_POST
from django.db.models import Q, Case, When, Value, IntegerField
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages


# Create your views here.


def index(request):
    return render(request, 'blog/index.html')



def post_list(request, category=None):
    if category is not None:
        # Some hosts pass the URL still percent-encoded
        category = unquote(category)
        posts = Post.published.filter(category=category)
    else:
        posts = Post.published.all()
    paginator = Paginator(posts, 3)
    page_number = request.GET.get('page', 1)
    try:
        posts = paginator.page(page_number)
    except EmptyPage:
        posts = paginator.page(paginator.num_pages)
    except PageNotAnInteger:
        posts = paginator.page(1)
    print(posts, type(posts))
    context = {
        'posts': posts,
        'category': category
    }
    return render(request, "blog/list.html", context)





def post_detail(request, pk):
    post = get_object_or_404(Post, id=pk, status=Post.Status.PUBLISHED)
    comments = post.comments.filter(active=True)
    form = CommentForm()

    context = {
        'post': post,
        'form': form,
        'comments': comments,
        # 'new_date': datetime.datetime.now()
    }

    return render(request, "blog/detail.html", context)




def ticket(request):
    if request.method == "POST":
        form = TicketForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            Ticket.objects.create(message=cd['message'], name=cd['name'], email=cd['email'],
                                  phone=cd['phone'], subject=cd['subject'])
            messages.success(request, 'تیکت شما با موفقیت ارسال شد.')
            return redirect("blog:index")
    else:
        form = TicketForm()
    return render(request, "forms/ticket.html", {'form': form})


@require_POST
def post_comment(request, post_id):
    post = get_object_or_404(Post, id=post_id, status=Post.Status.PUBLISHED)
    comment = None
    form = CommentForm(data=request.POST)
    if form.is_valid():
        comment = form.save(commit=False)
        comment.post = post
        comment.save()
    context = {
        'post': post,
        'form': form,
        'comment': comment
    }
    return render(request, "forms/comment.html", context)




def post_search(request):
    query = None
    results = []
    if 'query' in request.GET:
        form = SearchForm(data=request.GET)
        if form.is_valid():
            query = form.cleaned_data['query'].strip()
            words = query.split()
            if words:
                condition = Q()
                for word in words:
                    condition &= Q(title__icontains=word) | Q(description__icontains=word)

                results = (
                    Post.published.filter(condition)
                    .annotate(
                        relevance=Case(
                            When(title__icontains=query, then=Value(3)),
                            When(description__icontains=query, then=Value(2)),
                            default=Value(1),
                            output_field=IntegerField(),
                        )
                    )
                    .order_by('-relevance', '-pk')
                )
    context = {
        'query': query,
        'results': results
    }
    return render(request, 'blog/search.html', context)




def profile(request):
    if not request.user.is_authenticated:
        messages.warning(request, 'شما اجازه ورود به این صفحه را ندارید.')
        return redirect('blog:index')

    if not request.user.is_staff:
        messages.warning(request, 'شما اجازه ورود به این صفحه را ندارید.')
        return redirect('blog:index')

    user = request.user
    posts = Post.published.filter(author=user)

    return render(request, 'blog/profile.html', {'posts': posts})






def create_post(request):
    if not request.user.is_authenticated:
        messages.warning(request, 'شما اجازه ورود به این صفحه را ندارید.')
        return redirect('blog:index')

    if not request.user.is_staff:
        messages.warning(request, 'شما اجازه ورود به این صفحه را ندارید.')
        return redirect('blog:index')

    if request.method == "POST":
        form = CreatePostForm(request.POST, request.FILES)
        if form.is_valid():
            cd = form.cleaned_data
            post = form.save(commit=False)
            post.author = request.user
            post.save()

            Image.objects.create(image_file=form.cleaned_data['image1'], post=post)
            return redirect("blog:profile")
    else:
        form = CreatePostForm()

    return render(request, "forms/creat-post.html", {'form': form})


def delete_post(request, post_id):
    if not request.user.is_authenticated:
        messages.warning(request, 'شما اجازه ورود به این صفحه را ندارید.')
        return redirect('blog:index')

    if not request.user.is_staff:
        messages.warning(request, 'شما اجازه ورود به این صفحه را ندارید.')
        return redirect('blog:index')

    post = get_object_or_404(Post, id=post_id)

    if request.method == "POST":
        post.delete()
        return redirect("blog:profile")

    return render(request, "forms/delete-post.html", {'post': post})


def delete_image(request, image_id):
    if not request.user.is_authenticated:
        messages.warning(request, 'شما اجازه ورود به این صفحه را ندارید.')
        return redirect('blog:index')

    if not request.user.is_staff:
        messages.warning(request, 'شما اجازه ورود به این صفحه را ندارید.')
        return redirect('blog:index')

    image = get_object_or_404(Image, id=image_id)
    image.delete()

    return redirect("blog:profile")


def edit_post(request, post_id):
    if not request.user.is_authenticated:
        messages.warning(request, 'شما اجازه ورود به این صفحه را ندارید.')
        return redirect('blog:index')

    if not request.user.is_staff:
        messages.warning(request, 'شما اجازه ورود به این صفحه را ندارید.')
        return redirect('blog:index')

    post = get_object_or_404(Post, id=post_id)

    if request.method == "POST":
        form = CreatePostForm(request.POST, request.FILES, instance=post)
        form.fields['image1'].required = False

        if form.is_valid():
            cd = form.cleaned_data
            post = form.save(commit=False)
            post.author = request.user
            post.save()

            if cd['image1']:
                Image.objects.create(image_file=cd['image1'], post=post)
            return redirect("blog:profile")
    else:
        form = CreatePostForm(instance=post)
        form.fields['image1'].required = False

    return render(request, "forms/creat-post.html", {'form': form, 'post': post})
