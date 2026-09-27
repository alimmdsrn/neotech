from django.conf import settings
from django.contrib import admin
from django.contrib.sitemaps.views import sitemap
from django.templatetags.static import static as static_url
from django.urls import path, include, re_path
from django.views.generic import RedirectView, TemplateView
from django.views.static import serve

from blog.sitemaps import PostSitemap, CategorySitemap, StaticSitemap

sitemaps = {
    "static": StaticSitemap,
    "posts": PostSitemap,
    "categories": CategorySitemap,
}

urlpatterns = [
    # Home page of the domain -> blog index
    path("", RedirectView.as_view(pattern_name="blog:index", permanent=False)),
    path("admin/", admin.site.urls),
    path("blog/", include("blog.urls", namespace="blog")),

    # SEO / branding
    path("sitemap.xml", sitemap, {"sitemaps": sitemaps}, name="sitemap"),
    path(
        "robots.txt",
        TemplateView.as_view(template_name="robots.txt", content_type="text/plain"),
        name="robots",
    ),
    # Google and many tools look for the icon at the site root first
    path(
        "favicon.ico",
        RedirectView.as_view(url=static_url("images/icon/favicon.ico"), permanent=True),
    ),
    path(
        "manifest.json",
        RedirectView.as_view(url=static_url("manifest.json"), permanent=True),
    ),
    path(
        "apple-touch-icon.png",
        RedirectView.as_view(url=static_url("images/icon/favicon-192.png"), permanent=True),
    ),

    # Uploaded files (post images, profile photos, attachments) served by Django
    re_path(r"^media/(?P<path>.*)$", serve, {"document_root": settings.MEDIA_ROOT}),
]
