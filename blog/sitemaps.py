from django.contrib.sitemaps import Sitemap
from django.urls import reverse

from .models import Post


class PostSitemap(Sitemap):
    """Every published post."""
    changefreq = "weekly"
    priority = 0.8

    def items(self):
        return Post.published.all()

    def lastmod(self, obj):
        return obj.updated


class CategorySitemap(Sitemap):
    """One entry per category that has at least one published post."""
    changefreq = "weekly"
    priority = 0.6

    def items(self):
        return list(
            Post.published.values_list("category", flat=True).distinct()
        )

    def location(self, item):
        return reverse("blog:post_list_category", args=[item])


class StaticSitemap(Sitemap):
    """Fixed pages of the site."""
    changefreq = "daily"
    priority = 1.0

    def items(self):
        return ["blog:index", "blog:post_list"]

    def location(self, item):
        return reverse(item)