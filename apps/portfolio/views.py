# apps/portfolio/views.py
import os
from django.shortcuts import render, get_object_or_404, redirect
from django.http import Http404, FileResponse
from django.db.models import Q
from .models import (
    Project, ProjectCategory, CaseStudy, Service,
    Experience, Education, SkillCategory, ResumeDownload
)
from core.models import SiteSetting
from django.contrib import messages
from django.db.models import F
from .models import StoreCategory, DigitalProduct, ProductOrder

def store_list(request):
    categories = StoreCategory.objects.prefetch_related('products').all()
    category_slug = request.GET.get('category')
    products = DigitalProduct.objects.filter(is_active=True)

    if category_slug:
        products = products.filter(category__slug=category_slug)

    context = {
        'products': products,
        'categories': categories,
        'selected_category': category_slug,
    }
    return render(request, 'portfolio/store_list.html', context)

def product_detail(request, slug):
    product = get_object_or_404(DigitalProduct, slug=slug, is_active=True)
    related_products = DigitalProduct.objects.filter(category=product.category, is_active=True).exclude(id=product.id)[:3]
    return render(request, 'portfolio/product_detail.html', {'product': product, 'related_products': related_products})

def checkout_view(request, slug):
    product = get_object_or_404(DigitalProduct, slug=slug, is_active=True)

    if request.method == 'POST':
        name = request.POST.get('name')
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        txid = request.POST.get('transaction_id', '').strip()
        method = request.POST.get('payment_method', 'MANUAL_BKASH')

        if not name or not email or not phone:
            messages.error(request, "Please fill in all required contact information.")
            return redirect('portfolio:checkout', slug=slug)

        order = ProductOrder.objects.create(
            product=product,
            customer_name=name,
            customer_email=email,
            customer_phone=phone,
            amount_paid=product.price,
            payment_method='FREE' if product.is_free else method,
            transaction_id=txid,
            status='COMPLETED' if product.is_free else 'PENDING'
        )

        # Generate download access token
        order.generate_token()

        if product.is_free:
            DigitalProduct.objects.filter(id=product.id).update(downloads_count=F('downloads_count') + 1)
            messages.success(request, "Your download link has been generated!")
            return redirect('portfolio:order_success', token=order.download_token)
        else:
            messages.info(request, "Your order is placed. The download token will activate upon transaction verification.")
            return redirect('portfolio:order_success', token=order.download_token)

    return render(request, 'portfolio/checkout.html', {'product': product})

def order_success(request, token):
    order = get_object_or_404(ProductOrder, download_token=token)
    return render(request, 'portfolio/order_success.html', {'order': order})

def download_asset(request, token):
    order = get_object_or_404(ProductOrder, download_token=token)

    if order.status != 'COMPLETED':
        raise Http404("Payment confirmation is pending. File download is unavailable.")

    if not order.is_download_valid():
        raise Http404("This download link has expired.")

    file_path = order.product.file_asset.path
    if not os.path.exists(file_path):
        raise Http404("Requested digital asset was not found on the server.")

    return FileResponse(open(file_path, 'rb'), as_attachment=True, filename=os.path.basename(file_path))

def project_list(request):
    category_slug = request.GET.get('category')
    categories = ProjectCategory.objects.all()
    projects = Project.objects.filter(is_published=True)

    if category_slug:
        projects = projects.filter(category__slug=category_slug)

    context = {
        'projects': projects,
        'categories': categories,
        'selected_category': category_slug,
    }
    return render(request, 'portfolio/project_list.html', context)

def project_detail(request, slug):
    project = get_object_or_404(Project, slug=slug, is_published=True)
    related_projects = Project.objects.filter(category=project.category, is_published=True).exclude(id=project.id)[:3]
    return render(request, 'portfolio/project_detail.html', {'project': project, 'related_projects': related_projects})

def case_study_list(request):
    case_studies = CaseStudy.objects.all()
    return render(request, 'portfolio/case_study_list.html', {'case_studies': case_studies})

def case_study_detail(request, slug):
    case_study = get_object_or_404(CaseStudy, slug=slug)
    return render(request, 'portfolio/case_study_detail.html', {'case_study': case_study})

def services(request):
    service_items = Service.objects.filter(is_active=True)
    return render(request, 'portfolio/services.html', {'services': service_items})

def experience_view(request):
    experiences = Experience.objects.all()
    education = Education.objects.all()
    return render(request, 'portfolio/experience.html', {'experiences': experiences, 'education': education})

def skills_view(request):
    categories = SkillCategory.objects.prefetch_related('skills').all()
    return render(request, 'portfolio/skills.html', {'categories': categories})

def download_resume(request):
    setting = SiteSetting.load()

    # Track download action
    ip = request.META.get('HTTP_X_FORWARDED_FOR')
    if ip:
        ip = ip.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')

    ResumeDownload.objects.create(
        ip_address=ip,
        user_agent=request.META.get('HTTP_USER_AGENT', '')[:250]
    )

    # 1. Prioritize Google Drive link if configured
    if setting.resume_drive_link:
        return redirect(setting.resume_drive_link)

    # 2. Fall back to uploaded file
    if setting.resume_file and os.path.exists(setting.resume_file.path):
        return FileResponse(open(setting.resume_file.path, 'rb'), as_attachment=True, filename='Md_Alam_Hossain_CV.pdf')

    raise Http404("Resume is currently unavailable.")