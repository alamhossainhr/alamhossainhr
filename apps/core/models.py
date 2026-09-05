from django.db import models

class SiteSetting(models.Model):
    site_name = models.CharField(max_length=150, default="Md. Alam Hossain")
    site_title_suffix = models.CharField(max_length=255, default="HR & Payroll Specialist | Data Analyst | Django Developer")
    hero_headline = models.CharField(max_length=255, default="Turning HR, Payroll & Workforce Data Into Smarter Business Decisions.")
    hero_subheadline = models.TextField(default="HR and payroll professional with deep expertise in workforce management, payroll processing, HRIS, SQL reporting, data analytics, and modern Django automation.")
    about_intro = models.TextField(default="I connect People + Payroll + Data + Technology to streamline HR operations and engineer resilient software solutions.")
    primary_email = models.EmailField(default="contact@alamhossain.com")
    phone = models.CharField(max_length=50, default="+880 1700-000000")
    whatsapp_number = models.CharField(max_length=50, default="8801700000000", help_text="International format without + or special characters")
    address = models.CharField(max_length=255, default="Dhaka, Bangladesh")
    footer_statement = models.TextField(default="Connecting People, Payroll, Data & Technology to drive organizational productivity.")
    seo_meta_description = models.TextField(default="Portfolio of Md. Alam Hossain - Senior HR & Payroll Specialist, HRIS Consultant, SQL Data Analyst, and Full-Stack Django Developer.")
    google_analytics_id = models.CharField(max_length=50, blank=True, null=True)
    resume_file = models.FileField(upload_to='resume/', blank=True, null=True)
    profile_image = models.ImageField(upload_to='profile/', blank=True, null=True)

    # Resume Management (File Upload or External Drive Link)
    resume_file = models.FileField(upload_to='resume/', blank=True, null=True, help_text="Upload local PDF copy")
    resume_drive_link = models.URLField(blank=True, null=True, help_text="Google Drive / OneDrive view or download link")
    profile_image = models.ImageField(upload_to='profile/', blank=True, null=True)
        
    # Counter metrics
    years_experience = models.PositiveIntegerField(default=6)
    projects_completed = models.PositiveIntegerField(default=25)
    reports_dashboards_developed = models.PositiveIntegerField(default=80)
    hr_processes_automated = models.PositiveIntegerField(default=15)

    def save(self, *args, **kwargs):
        self.pk = 1
        super().save(*args, **kwargs)

    @classmethod
    def load(cls):
        obj, created = cls.objects.get_or_create(pk=1)
        return obj

    def __str__(self):
        return f"Site Configuration ({self.site_name})"

class SocialLink(models.Model):
    PLATFORMS = (
        ('linkedin', 'LinkedIn'),
        ('github', 'GitHub'),
        ('facebook', 'Facebook'),
        ('twitter', 'Twitter/X'),
        ('whatsapp', 'WhatsApp'),
    )
    platform = models.CharField(max_length=30, choices=PLATFORMS)
    url = models.URLField()
    icon_class = models.CharField(max_length=50, help_text="e.g., bi bi-linkedin or fa-brands fa-linkedin")
    display_order = models.PositiveIntegerField(default=0)

    class Meta:
        ordering = ['display_order']

    def __str__(self):
        return self.get_platform_display()

class PageView(models.Model):
    page_path = models.CharField(max_length=255)
    ip_address = models.GenericIPAddressField(null=True, blank=True)
    user_agent = models.TextField(blank=True, null=True)
    visited_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        indexes = [models.Index(fields=['visited_at', 'page_path'])]