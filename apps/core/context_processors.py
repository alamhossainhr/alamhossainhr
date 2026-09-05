from .models import SiteSetting, SocialLink

def site_settings(request):
    return {
        'site_settings': SiteSetting.load(),
        'social_links': SocialLink.objects.all(),
    }