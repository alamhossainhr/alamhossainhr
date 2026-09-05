from django.db import models
from django.urls import reverse
from django.utils.text import slugify
import uuid
from django.utils import timezone
from datetime import timedelta
from django.utils.text import slugify

class StoreCategory(models.Model):
    name = models.CharField(max_length=100)
    slug = models.SlugField(unique=True, blank=True)
    icon_class = models.CharField(max_length=60, default="bi bi-folder-fill")
    display_order = models.PositiveIntegerField(default=0)

    class Meta:
        verbose_name_plural = "Store Categories"
        ordering = ['display_order', 'name']

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.name)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.name

class DigitalProduct(models.Model):
    PRODUCT_FORMATS = (
        ('EXCEL', 'Microsoft Excel (.xlsx / .xlsm)'),
        ('SQL', 'SQL Script Pack (.sql)'),
        ('PDF', 'PDF Document / Checklist'),
        ('DOCX', 'Word Template (.docx)'),
        ('ZIP', 'Toolkit Archive (.zip)'),
    )

    title = models.CharField(max_length=200)
    slug = models.SlugField(unique=True, blank=True, max_length=220)
    category = models.ForeignKey(StoreCategory, related_name='products', on_delete=models.SET_NULL, null=True)
    format_type = models.CharField(max_length=10, choices=PRODUCT_FORMATS, default='EXCEL')
    preview_image = models.ImageField(upload_to='store/previews/')
    file_asset = models.FileField(upload_to='store/protected_assets/')
    
    short_description = models.CharField(max_length=255)
    full_description = models.TextField(help_text="Include details like formula structure, compatibility, and features.")
    
    price = models.DecimalField(max_digits=10, decimal_places=2, default=0.00, help_text="Set to 0.00 for free lead magnets.")
    currency = models.CharField(max_length=10, default="BDT")
    
    downloads_count = models.PositiveIntegerField(default=0)
    is_featured = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    display_order = models.PositiveIntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['display_order', '-created_at']

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        super().save(*args, **kwargs)

    @property
    def is_free(self):
        return self.price <= 0

    def __str__(self):
        return f"{self.title} ({self.currency} {self.price})"

class ProductOrder(models.Model):
    ORDER_STATUS = (
        ('PENDING', 'Pending Payment'),
        ('COMPLETED', 'Completed / Verified'),
        ('FAILED', 'Failed / Cancelled'),
    )
    order_id = models.UUIDField(default=uuid.uuid4, editable=False, unique=True)
    product = models.ForeignKey(DigitalProduct, related_name='orders', on_delete=models.CASCADE)
    customer_name = models.CharField(max_length=120)
    customer_email = models.EmailField()
    customer_phone = models.CharField(max_length=30)
    amount_paid = models.DecimalField(max_digits=10, decimal_places=2)
    payment_method = models.CharField(max_length=50, default="FREE_DOWNLOAD")
    transaction_id = models.CharField(max_length=100, blank=True, null=True)
    status = models.CharField(max_length=20, choices=ORDER_STATUS, default='PENDING')
    
    download_token = models.UUIDField(default=uuid.uuid4, unique=True)
    token_expires_at = models.DateTimeField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def generate_token(self):
        self.download_token = uuid.uuid4()
        self.token_expires_at = timezone.now() + timedelta(hours=48)
        self.save()

    def is_download_valid(self):
        if not self.token_expires_at:
            return False
        return timezone.now() <= self.token_expires_at

    def __str__(self):
        return f"Order {self.order_id} - {self.customer_name} ({self.status})"

class SkillCategory(models.Model):
    name = models.CharField(max_length=100)
    slug = models.SlugField(unique=True, blank=True)
    icon_class = models.CharField(max_length=60, default="bi bi-gear")
    display_order = models.PositiveIntegerField(default=0)

    class Meta:
        verbose_name_plural = "Skill Categories"
        ordering = ['display_order', 'name']

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.name)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.name

class Skill(models.Model):
    category = models.ForeignKey(SkillCategory, related_name='skills', on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    proficiency_percentage = models.PositiveIntegerField(default=85)
    icon_class = models.CharField(max_length=60, blank=True, null=True)
    is_featured = models.BooleanField(default=False)
    display_order = models.PositiveIntegerField(default=0)

    class Meta:
        ordering = ['display_order', '-proficiency_percentage']

    def __str__(self):
        return f"{self.name} ({self.proficiency_percentage}%)"

class Technology(models.Model):
    name = models.CharField(max_length=60, unique=True)
    badge_class = models.CharField(max_length=50, default="bg-secondary")

    class Meta:
        verbose_name_plural = "Technologies"

    def __str__(self):
        return self.name

class ProjectCategory(models.Model):
    name = models.CharField(max_length=80)
    slug = models.SlugField(unique=True, blank=True)

    class Meta:
        verbose_name_plural = "Project Categories"

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.name)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.name

class Project(models.Model):
    title = models.CharField(max_length=200)
    slug = models.SlugField(unique=True, blank=True, max_length=220)
    category = models.ForeignKey(ProjectCategory, related_name='projects', on_delete=models.SET_NULL, null=True)
    technologies = models.ManyToManyField(Technology, related_name='projects')
    thumbnail = models.ImageField(upload_to='projects/')
    summary = models.TextField(help_text="Concise 2-sentence executive summary.")
    
    # Case study structural breakdown
    business_challenge = models.TextField(help_text="Detailed problem faced by business/HR.")
    engineered_solution = models.TextField(help_text="Architectural/Technical solution developed.")
    key_features = models.TextField(help_text="Markdown or bullet list of implemented functionalities.")
    business_impact = models.TextField(help_text="Measurable business results, efficiency gains, accuracy improvements.")
    
    role = models.CharField(max_length=150, default="Lead Developer & HR Systems Architect")
    duration = models.CharField(max_length=100, default="3 Months")
    client_or_company = models.CharField(max_length=150, blank=True, null=True)
    
    live_demo_url = models.URLField(blank=True, null=True)
    github_url = models.URLField(blank=True, null=True)
    
    is_featured = models.BooleanField(default=False)
    is_published = models.BooleanField(default=True)
    display_order = models.PositiveIntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['display_order', '-created_at']

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        super().save(*args, **kwargs)

    def get_absolute_url(self):
        return reverse('portfolio:project_detail', kwargs={'slug': self.slug})

    def __str__(self):
        return self.title

class ProjectImage(models.Model):
    project = models.ForeignKey(Project, related_name='screenshots', on_delete=models.CASCADE)
    image = models.ImageField(upload_to='projects/screenshots/')
    caption = models.CharField(max_length=200, blank=True)

class CaseStudy(models.Model):
    title = models.CharField(max_length=200)
    slug = models.SlugField(unique=True, blank=True)
    domain_tag = models.CharField(max_length=100, default="Payroll Optimization")
    problem = models.TextField()
    solution = models.TextField()
    results = models.TextField()
    tools_used = models.CharField(max_length=255, default="SQL Server, Python, Django, Excel")
    is_featured = models.BooleanField(default=True)
    display_order = models.PositiveIntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name_plural = "Case Studies"
        ordering = ['display_order', '-created_at']

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.title

class Experience(models.Model):
    company = models.CharField(max_length=150)
    position = models.CharField(max_length=150)
    location = models.CharField(max_length=150, default="Dhaka, Bangladesh")
    department = models.CharField(max_length=100, default="HR & Administration")
    start_date = models.DateField()
    end_date = models.DateField(blank=True, null=True)
    is_current = models.BooleanField(default=False)
    responsibilities = models.TextField(help_text="Detailed responsibilities. Use new lines for bullets.")
    achievements = models.TextField(help_text="Key measurable outcomes delivered.")
    technologies_used = models.CharField(max_length=255, help_text="e.g. MS SQL Server, Django, Biometric Systems, Advanced Excel")
    company_logo = models.ImageField(upload_to='companies/', blank=True, null=True)
    display_order = models.PositiveIntegerField(default=0)

    class Meta:
        ordering = ['display_order', '-start_date']

    def __str__(self):
        return f"{self.position} at {self.company}"

class Education(models.Model):
    degree = models.CharField(max_length=150)
    institution = models.CharField(max_length=200)
    major = models.CharField(max_length=150)
    start_year = models.PositiveIntegerField()
    completion_year = models.PositiveIntegerField(blank=True, null=True)
    result = models.CharField(max_length=50, blank=True)
    description = models.TextField(blank=True)
    institution_logo = models.ImageField(upload_to='education/', blank=True, null=True)
    display_order = models.PositiveIntegerField(default=0)

    class Meta:
        verbose_name_plural = "Education"
        ordering = ['display_order', '-start_year']

    def __str__(self):
        return f"{self.degree} - {self.institution}"

class Service(models.Model):
    title = models.CharField(max_length=150)
    icon_class = models.CharField(max_length=60, default="bi bi-cpu")
    short_description = models.CharField(max_length=255)
    detailed_description = models.TextField()
    is_active = models.BooleanField(default=True)
    display_order = models.PositiveIntegerField(default=0)

    class Meta:
        ordering = ['display_order', 'title']

    def __str__(self):
        return self.title

class Achievement(models.Model):
    title = models.CharField(max_length=150)
    metric_value = models.CharField(max_length=50, help_text="e.g., 99.8%, 10x, 2,500+ Manpower")
    description = models.TextField()
    category = models.CharField(max_length=100, default="Payroll Automation")
    display_order = models.PositiveIntegerField(default=0)

    class Meta:
        ordering = ['display_order']

    def __str__(self):
        return f"{self.metric_value} - {self.title}"

class Certificate(models.Model):
    title = models.CharField(max_length=200)
    issuing_organization = models.CharField(max_length=150)
    issue_date = models.DateField()
    credential_id = models.CharField(max_length=100, blank=True, null=True)
    credential_url = models.URLField(blank=True, null=True)
    certificate_image = models.ImageField(upload_to='certificates/', blank=True, null=True)
    description = models.TextField(blank=True)

    class Meta:
        ordering = ['-issue_date']

    def __str__(self):
        return self.title

class Testimonial(models.Model):
    client_name = models.CharField(max_length=100)
    position = models.CharField(max_length=150)
    company = models.CharField(max_length=150)
    photo = models.ImageField(upload_to='testimonials/', blank=True, null=True)
    content = models.TextField()
    rating = models.PositiveIntegerField(default=5)
    is_featured = models.BooleanField(default=True)
    display_order = models.PositiveIntegerField(default=0)

    class Meta:
        ordering = ['display_order']

    def __str__(self):
        return f"{self.client_name} - {self.company}"

class ResumeDownload(models.Model):
    downloaded_at = models.DateTimeField(auto_now_add=True)
    ip_address = models.GenericIPAddressField(null=True, blank=True)
    user_agent = models.TextField(null=True, blank=True)

    def __str__(self):
        return f"Download on {self.downloaded_at.strftime('%Y-%m-%d %H:%M')}"