from django import forms
from .models import Comment, Post, User, Account


class TicketForm(forms.Form):
    SUBJECT_CHOICES = (
        ('پیشنهاد', 'پیشنهادات'),
        ('انتقاد', 'انتقادات'),
        ('گزارش', 'گزارش'),
    )
    message = forms.CharField(widget=forms.Textarea, required=True, label='متن')
    name = forms.CharField(max_length=250, required=True, label='نام و نام خانوادگی')
    email = forms.EmailField(label='ایمیل')
    phone = forms.CharField(max_length=11, required=True, label='شماره تماس')
    subject = forms.ChoiceField(choices=SUBJECT_CHOICES, label='موضوع')

    def clean_phone(self):
        phone = self.cleaned_data['phone']
        if phone:
            if not phone.isnumeric():
                raise forms.ValidationError("شماره تماس فقط باید عدد باشد.")
            else:
                return phone


class CommentForm(forms.ModelForm):
    def clean_name(self):
        name = self.cleaned_data['name']
        if name:
            if len(name) < 3:
                raise forms.ValidationError("name is too short!")
            else:
                return name

    class Meta:
        model = Comment
        fields = ['name', 'body']
        widgets = {
            'body': forms.TextInput(attrs={
                'placeholder': 'متن کامنت',
                'class': 'form-control'
            }),
            'name': forms.TextInput(attrs={
                'placeholder': 'نام و نام خانوادگی',
                'class': 'form-control'
            }),
        }


class SearchForm(forms.Form):
    query = forms.CharField()


class CreatePostForm(forms.ModelForm):
    image1 = forms.ImageField()


    class Meta:
        model = Post
        fields = ['title', 'description', 'reading_time', 'category','attachment']


