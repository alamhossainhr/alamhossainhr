from django.contrib import admin
from .models import (
    SkillCategory, Skill, Technology, ProjectCategory,
    Project, ProjectImage, CaseStudy, Experience,
    Education, Service, Achievement, Certificate,
    Testimonial, ResumeDownload
)
from .models import StoreCategory, DigitalProduct, ProductOrder

@admin.register(StoreCategory)
class StoreCategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'slug', 'display_order')
    prepopulated_fields = {'slug': ('name',)}
    list_editable = ('display_order',)

@admin.register(DigitalProduct)
class DigitalProductAdmin(admin.ModelAdmin):
    list_display = ('title', 'category', 'format_type', 'price', 'currency', 'downloads_count', 'is_featured', 'is_active')
    list_filter = ('category', 'format_type', 'is_active', 'is_featured')
    search_fields = ('title', 'short_description')
    list_editable = ('price', 'is_featured', 'is_active')
    prepopulated_fields = {'slug': ('title',)}

@admin.register(ProductOrder)
class ProductOrderAdmin(admin.ModelAdmin):
    list_display = ('order_id', 'product', 'customer_name', 'customer_email', 'amount_paid', 'status', 'created_at')
    list_filter = ('status', 'created_at')
    search_fields = ('customer_name', 'customer_email', 'customer_phone', 'transaction_id')
    readonly_fields = ('order_id', 'download_token', 'token_expires_at', 'created_at')

class ProjectImageInline(admin.TabularInline):
    model = ProjectImage
    extra = 1

@admin.register(Project)
class ProjectAdmin(admin.ModelAdmin):
    list_display = ('title', 'category', 'is_featured', 'is_published', 'display_order', 'created_at')
    list_filter = ('category', 'is_featured', 'is_published')
    search_fields = ('title', 'summary', 'business_challenge', 'engineered_solution')
    list_editable = ('is_featured', 'is_published', 'display_order')
    prepopulated_fields = {'slug': ('title',)}
    inlines = [ProjectImageInline]

@admin.register(Skill)
class SkillAdmin(admin.ModelAdmin):
    list_display = ('name', 'category', 'proficiency_percentage', 'is_featured', 'display_order')
    list_filter = ('category', 'is_featured')
    list_editable = ('proficiency_percentage', 'is_featured', 'display_order')
    search_fields = ('name',)

@admin.register(SkillCategory)
class SkillCategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'display_order')
    list_editable = ('display_order',)
    prepopulated_fields = {'slug': ('name',)}

@admin.register(Experience)
class ExperienceAdmin(admin.ModelAdmin):
    list_display = ('position', 'company', 'start_date', 'end_date', 'is_current', 'display_order')
    list_editable = ('display_order',)

@admin.register(Education)
class EducationAdmin(admin.ModelAdmin):
    list_display = ('degree', 'institution', 'start_year', 'completion_year')

@admin.register(CaseStudy)
class CaseStudyAdmin(admin.ModelAdmin):
    list_display = ('title', 'domain_tag', 'is_featured', 'display_order')
    prepopulated_fields = {'slug': ('title',)}
    list_editable = ('is_featured', 'display_order')

@admin.register(Service)
class ServiceAdmin(admin.ModelAdmin):
    list_display = ('title', 'is_active', 'display_order')
    list_editable = ('is_active', 'display_order')

@admin.register(Achievement)
class AchievementAdmin(admin.ModelAdmin):
    list_display = ('title', 'metric_value', 'category', 'display_order')
    list_editable = ('display_order',)

@admin.register(Certificate)
class CertificateAdmin(admin.ModelAdmin):
    list_display = ('title', 'issuing_organization', 'issue_date')

@admin.register(Testimonial)
class TestimonialAdmin(admin.ModelAdmin):
    list_display = ('client_name', 'company', 'rating', 'is_featured', 'display_order')
    list_editable = ('is_featured', 'display_order')

@admin.register(ResumeDownload)
class ResumeDownloadAdmin(admin.ModelAdmin):
    list_display = ('downloaded_at', 'ip_address')
    readonly_fields = ('downloaded_at', 'ip_address', 'user_agent')

admin.site.register(Technology)
admin.site.register(ProjectCategory)