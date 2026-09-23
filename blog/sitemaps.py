from django.contrib.sitemaps import Sitemap
from django.urls import reverse

from .models import Post


def to_gregorian(value):
    """jDateTimeField returns a jalali datetime; sitemaps need a real one."""
    if hasattr(value, "togregorian"):
        return value.togregorian()
    return value


class PostSitemap(Sitemap):
    """Every published post."""
    changefreq = "weekly"
    priority = 0.8
    protocol = "https"

    def items(self):
        return Post.published.all()

    def lastmod(self, obj):
        return to_gregorian(obj.updated)


class CategorySitemap(Sitemap):
    """One entry per category that has at least one published post."""
    changefreq = "weekly"
    priority = 0.6
    protocol = "https"

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
    protocol = "https"

    def items(self):
        return ["blog:index", "blog:post_list", "blog:ticket"]
    def location(self, item):
        return reverse(item)