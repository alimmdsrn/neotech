from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django_jalali.db import models as jmodels
from django.urls import reverse
from django_resized import ResizedImageField
from django.template.defaultfilters import slugify


# Manager
class PublishedManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset().filter(status=Post.Status.PUBLISHED)


# Create your models here.


class Post(models.Model):
    class Status(models.TextChoices):
        DRAFT = 'DF', 'Draft'
        PUBLISHED = 'PB', 'Published'
        REJECTED = 'RJ', 'Rejected'

    CATEGORY_CHOICES = (
        ('اخبار تکنولوژی', 'اخبار تکنولوژی'),
        ('مصاحبه', 'مصاحبه'),
        ('هوش مصنوعی', 'هوش مصنوعی'),
        ('نئولرنینگ', 'نئولرنینگ'),
        ('دورنگاه', 'دورنگاه'),
        ('مقاله های علمی', 'مقاله های علمی'),
        ('سرگرمی', 'سرگرمی'),
        ('پادکست', 'پادکست'),
        ('سایر', 'سایر'),

    )

    # relations
    author = models.ForeignKey(User, on_delete=models.CASCADE, related_name='user_posts', verbose_name='نویسنده')
    # data fields
    title = models.CharField(max_length=250, verbose_name='عنوان')
    description = models.TextField(verbose_name='توضحیات')
    slug = models.SlugField(max_length=250, verbose_name='اسلاگ')
    # date
    publish = jmodels.jDateTimeField(default=timezone.now, verbose_name='تاریخ انتشار')
    created = jmodels.jDateTimeField(auto_now_add=True)
    updated = jmodels.jDateTimeField(auto_now=True)
    # choice fields
    status = models.CharField(max_length=2, choices=Status.choices, default=Status.DRAFT, verbose_name='وضعیت پست')
    reading_time = models.PositiveIntegerField(verbose_name="زمان مطالعه")
    category = models.CharField(verbose_name="دسته بندی", max_length=20, choices=CATEGORY_CHOICES, default='سایر')
    attachment = models.FileField(upload_to="post_files/", blank=True, null=True, verbose_name="فایل پیوست")

    objects = models.Manager()
    # objects = jmodels.jManager()
    published = PublishedManager()

    class Meta:
        ordering = ['-publish']
        indexes = [
            models.Index(fields=['-publish']),
        ]
        verbose_name = 'پست'
        verbose_name_plural = 'پست ها'

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('blog:post_detail', args=[self.id])

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        if self.pk:
            old = Post.objects.filter(pk=self.pk).first()
            if old and old.attachment and old.attachment != self.attachment:
                old.attachment.delete(save=False)
        super().save(*args, **kwargs)

    def delete(self, *args, **kwargs):
        for img in self.images.all():
            storage, path = img.image_file.storage, img.image_file.path
            storage.delete(path)
        if self.attachment:
            self.attachment.delete(save=False)
        super().delete(*args, **kwargs)


class Ticket(models.Model):

    message = models.TextField(verbose_name="پیام")
    name = models.CharField(max_length=250, verbose_name="نام")
    email = models.EmailField(verbose_name=("ایمیل"))
    phone = models.CharField(max_length=11, verbose_name="شماره تماس")
    subject = models.CharField(max_length=250, verbose_name="موضوع")

    class Meta:
        verbose_name = "تیکت"
        verbose_name_plural = "تیکت ها"

    def __str__(self):
        return self.subject


class Comment(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name="comments", verbose_name="پست")
    name = models.CharField(max_length=250, verbose_name="اسم")
    body = models.TextField(verbose_name="متن")
    created = jmodels.jDateTimeField(auto_now_add=True, verbose_name="تاریخ ایجاد")
    updated = jmodels.jDateTimeField(auto_now=True, verbose_name="تاریخ ویرایش")
    active = models.BooleanField(default=False, verbose_name="اکتیو")

    class Meta:
        ordering = ['created']
        indexes = [
            models.Index(fields=['created'])
        ]
        verbose_name = "کامنت"
        verbose_name_plural = "کامنت ها"

    def __str__(self):
        return f"{self.name}: {self.post}"


class Image(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name="images", verbose_name="پست")
    image_file = ResizedImageField(upload_to="post_images/", size=[1600, 1600], quality=85)
    title = models.CharField(max_length=250, verbose_name="اسم", null=True, blank=True)
    description = models.TextField(verbose_name="توضیحات", null=True, blank=True)
    created = jmodels.jDateTimeField(auto_now_add=True, verbose_name="تاریخ ایجاد")

    class Meta:
        ordering = ['created']
        indexes = [
            models.Index(fields=['created'])
        ]
        verbose_name = "تصویر"
        verbose_name_plural = "تصویر ها"

    def delete(self, *args, **kwargs):
        storage, path = self.image_file.storage, self.image_file.path
        storage.delete(path)
        super().delete(*args, **kwargs)

    def __str__(self):
        return self.title if self.title else "None"


class Account(models.Model):
    user = models.OneToOneField(User, related_name="account", on_delete=models.CASCADE)
    date_of_birth = jmodels.jDateField(verbose_name="تاریخ تولد", blank=True, null=True)
    bio = models.TextField(verbose_name="بایو", null=True, blank=True)
    photo = ResizedImageField(verbose_name="تصویر", upload_to="account_images/", size=[500, 500], quality=60,
                              crop=['middle', 'center'], blank=True, null=True)
    job = models.CharField(max_length=250, verbose_name="شغل", null=True, blank=True)
    is_active = models.BooleanField(default=False, verbose_name="وضعیت اکانت (فعال/غیرفعال)")


    def __str__(self):
        # return self.user.username
        status = "فعال" if self.is_active else "غیرفعال"
        return f"{self.user.username} ({status})"

    class Meta:
        verbose_name = "اکانت"
        verbose_name_plural = "اکانت ها"

