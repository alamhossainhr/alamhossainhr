from django.contrib import admin
from .models import SiteSetting, SocialLink, PageView

@admin.register(SiteSetting)
class SiteSettingAdmin(admin.ModelAdmin):
    fieldsets = (
        ('Branding & Identity', {
            'fields': ('site_name', 'site_title_suffix', 'profile_image', 'resume_file', 'resume_drive_link')
        }),
        ('Hero & Professional Statements', {
            'fields': ('hero_headline', 'hero_subheadline', 'about_intro', 'footer_statement')
        }),
        ('Key Operational Counters', {
            'fields': ('years_experience', 'projects_completed', 'reports_dashboards_developed', 'hr_processes_automated')
        }),
        ('Contact & Social Integration', {
            'fields': ('primary_email', 'phone', 'whatsapp_number', 'address')
        }),
        ('SEO & Analytics', {
            'fields': ('seo_meta_description', 'google_analytics_id')
        }),
    )

    def has_add_permission(self, request):
        return False if SiteSetting.objects.exists() else True

@admin.register(SocialLink)
class SocialLinkAdmin(admin.ModelAdmin):
    list_display = ('platform', 'url', 'display_order')
    list_editable = ('display_order',)

@admin.register(PageView)
class PageViewAdmin(admin.ModelAdmin):
    list_display = ('page_path', 'ip_address', 'visited_at')
    list_filter = ('visited_at',)
    readonly_fields = ('page_path', 'ip_address', 'user_agent', 'visited_at')