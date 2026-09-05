# apps/contact/models.py
from django.db import models

class ContactMessage(models.Model):
    STATUS_CHOICES = (
        ('NEW', 'New Inquiry'),
        ('READ', 'Read'),
        ('REPLIED', 'Replied'),
        ('CLOSED', 'Closed'),
    )
    name = models.CharField(max_length=120)
    email = models.EmailField()
    phone = models.CharField(max_length=40, blank=True)
    subject = models.CharField(max_length=200)
    service_interested = models.CharField(max_length=100, blank=True)
    message = models.TextField()
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='NEW')
    ip_address = models.GenericIPAddressField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-created_at']

    def __str__(self):
        return f"{self.name} - {self.subject} ({self.get_status_display()})"