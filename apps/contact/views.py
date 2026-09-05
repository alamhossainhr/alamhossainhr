# apps/contact/views.py
from django.shortcuts import render, redirect
from django.contrib import messages
from django.core.mail import send_mail
from django.conf import settings
from .forms import ContactForm
from core.models import SiteSetting

def contact_view(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            contact = form.save(commit=False)
            ip = request.META.get('HTTP_X_FORWARDED_FOR')
            if ip:
                ip = ip.split(',')[0]
            else:
                ip = request.META.get('REMOTE_ADDR')
            contact.ip_address = ip
            contact.save()

            # Email notification logic
            site_info = SiteSetting.load()
            subject = f"Portfolio Inquiry: {contact.subject} from {contact.name}"
            body = (
                f"New Message Received:\n\n"
                f"Name: {contact.name}\n"
                f"Email: {contact.email}\n"
                f"Phone: {contact.phone}\n"
                f"Interested Service: {contact.service_interested}\n\n"
                f"Message:\n{contact.message}"
            )
            try:
                send_mail(
                    subject,
                    body,
                    settings.DEFAULT_FROM_EMAIL,
                    [site_info.primary_email],
                    fail_silently=True
                )
            except Exception:
                pass

            messages.success(request, "Your message has been successfully transmitted. I will respond within 24 business hours.")
            return redirect('contact:contact')
    else:
        initial_service = request.GET.get('service', '')
        form = ContactForm(initial={'service_interested': initial_service})

    return render(request, 'contact/contact.html', {'form': form})