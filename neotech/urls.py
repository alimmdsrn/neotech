from django.conf import settings
from django.contrib import admin
from django.urls import path, include, re_path
from django.views.generic import RedirectView
from django.views.static import serve

urlpatterns = [
    # Home page of the domain -> blog index
    path("", RedirectView.as_view(pattern_name="blog:index", permanent=False)),
    path("admin/", admin.site.urls),
    path("blog/", include("blog.urls", namespace="blog")),
    # Uploaded files (post images, profile photos, attachments) served by Django
    re_path(r"^media/(?P<path>.*)$", serve, {"document_root": settings.MEDIA_ROOT}),
]