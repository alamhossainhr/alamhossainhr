from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.sitemaps.views import sitemap
from django.http import HttpResponse
from blog.models import BlogPost
from portfolio.models import Project, CaseStudy
from django.contrib.sitemaps import GenericSitemap

sitemaps = {
    'blog': GenericSitemap({'queryset': BlogPost.objects.filter(is_published=True), 'date_field': 'updated_at'}, priority=0.8),
    'projects': GenericSitemap({'queryset': Project.objects.filter(is_published=True), 'date_field': 'updated_at'}, priority=0.9),
}

def robots_txt(request):
    lines = [
        "User-agent: *",
        "Disallow: /admin/",
        f"Sitemap: {request.build_absolute_uri('/sitemap.xml')}"
    ]
    return HttpResponse("\n".join(lines), content_type="text/plain")

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('core.urls')),
    path('', include('portfolio.urls')),
    path('blog/', include('blog.urls')),
    path('contact/', include('contact.urls')),
    path('sitemap.xml', sitemap, {'sitemaps': sitemaps}, name='django.contrib.sitemaps.views.sitemap'),
    path('robots.txt', robots_txt, name='robots_txt'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

handler404 = 'core.views.custom_404'
handler500 = 'core.views.custom_500'