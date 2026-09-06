from .models import SiteSetting

def site_settings(request):
    try:
        return {'site_settings': SiteSetting.load()}
    except Exception:
        return {'site_settings': None}