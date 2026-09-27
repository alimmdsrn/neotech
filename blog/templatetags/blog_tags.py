from django import template
from django.contrib.auth.models import User
from django.db.models import Count
from django.utils.safestring import mark_safe
from markdown import markdown

from ..models import Post, Comment

register = template.Library()


@register.simple_tag()
def total_posts():
    return Post.published.count()


@register.simple_tag()
def total_comments():
    return Comment.objects.filter(active=True).count()


@register.simple_tag()
def total_categories():
    return len(Post.CATEGORY_CHOICES)


@register.simple_tag()
def total_authors():
    """Users who have at least one published post."""
    return User.objects.filter(user_posts__status=Post.Status.PUBLISHED).distinct().count()


@register.simple_tag()
def category_list():
    """All category names, in the order defined on the model."""
    return [value for value, label in Post.CATEGORY_CHOICES]


@register.simple_tag()
def last_post_date():
    last = Post.published.last()
    return last.publish if last else None


@register.simple_tag()
def most_popular_posts(count=5):
    return Post.published.annotate(comments_count=Count('comments')).order_by('-comments_count')[:count]


@register.simple_tag()
def related_posts(post, count=3):
    """Other published posts from the same category, newest first.

    If the category has too few posts, the rest is filled with the newest
    posts of the site so the section never looks half empty.
    """
    if post is None:
        return []

    related = list(
        Post.published.filter(category=post.category)
        .exclude(pk=post.pk)
        .order_by('-publish')[:count]
    )

    if len(related) < count:
        seen = {p.pk for p in related} | {post.pk}
        fillers = Post.published.exclude(pk__in=seen).order_by('-publish')[:count - len(related)]
        related.extend(fillers)

    return related


@register.inclusion_tag("partials/latest-post.html")
def latest_posts(count=2):
    l_posts = Post.published.order_by('-publish')[:count]
    return {'l_posts': l_posts}


@register.simple_tag()
def current_jalali_year():
    import jdatetime
    return jdatetime.date.today().year


@register.filter(name='iso')
def to_iso(value):
    """Jalali datetimes are not valid for search engines; emit Gregorian ISO."""
    if not value:
        return ''
    if hasattr(value, 'togregorian'):
        value = value.togregorian()
    return value.isoformat()


@register.filter(name='markdown')
def to_markdown(text):
    # nl2br: a single Enter becomes a real line break
    html = markdown(text or '', extensions=['nl2br'])
    # open every link in a new tab, safely
    html = html.replace('<a href=', '<a target="_blank" rel="noopener noreferrer" href=')
    return mark_safe(html)
