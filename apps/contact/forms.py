# apps/contact/forms.py
from django import forms
from .models import ContactMessage

class ContactForm(forms.ModelForm):
    class Meta:
        model = ContactMessage
        fields = ['name', 'email', 'phone', 'service_interested', 'subject', 'message']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Your Full Name'}),
            'email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'name@company.com'}),
            'phone': forms.TextInput(attrs={'class': 'form-control', 'placeholder': '+880 1XXXXXXXXX'}),
            'service_interested': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'e.g. Payroll System, SQL Reporting, HRIS'}),
            'subject': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Brief Subject of Inquiry'}),
            'message': forms.Textarea(attrs={'class': 'form-control', 'rows': 5, 'placeholder': 'Describe your organization challenges or software requirements...'}),
        }