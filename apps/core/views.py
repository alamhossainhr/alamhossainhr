# apps/core/views.py
from django.shortcuts import render
from portfolio.models import Project, CaseStudy, Experience, Skill, Service, Achievement, Testimonial, Certificate
from blog.models import BlogPost
from .models import PageView

def log_view(request):
    ip = request.META.get('HTTP_X_FORWARDED_FOR')
    if ip:
        ip = ip.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    PageView.objects.create(
        page_path=request.path,
        ip_address=ip,
        user_agent=request.META.get('HTTP_USER_AGENT', '')[:250]
    )

def index(request):
    log_view(request)
    context = {
        'featured_projects': Project.objects.filter(is_published=True, is_featured=True)[:6],
        'case_studies': CaseStudy.objects.filter(is_featured=True)[:3],
        'experiences': Experience.objects.all()[:4],
        'featured_skills': Skill.objects.filter(is_featured=True)[:8],
        'services': Service.objects.filter(is_active=True)[:6],
        'achievements': Achievement.objects.all()[:6],
        'testimonials': Testimonial.objects.filter(is_featured=True)[:4],
        'recent_posts': BlogPost.objects.filter(is_published=True)[:3],
        'certificates': Certificate.objects.all()[:4],
    }
    return render(request, 'core/index.html', context)

def about(request):
    log_view(request)
    context = {
        'experiences': Experience.objects.all(),
        'achievements': Achievement.objects.all(),
        'certificates': Certificate.objects.all(),
    }
    return render(request, 'core/about.html', context)

def custom_404(request, exception):
    return render(request, '404.html', status=404)

def custom_500(request):
    return render(request, '500.html', status=500)

