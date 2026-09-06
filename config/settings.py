import os
import sys
from pathlib import Path
import dj_database_url
import environ


BASE_DIR = Path(__file__).resolve().parent.parent

# Add apps folder to sys.path
sys.path.insert(0, os.path.join(BASE_DIR, 'apps'))

# Initialize environment variables
env = environ.Env()
environ.Env.read_env(os.path.join(BASE_DIR, '.env'))

SECRET_KEY = env('SECRET_KEY', default='django-insecure-production-temp-key-secret-2026')
DEBUG = env.bool('DEBUG', default=False)
ALLOWED_HOSTS = env.list('ALLOWED_HOSTS', default=['*', '.vercel.app', '127.0.0.1', 'localhost'])

INSTALLED_APPS = [
    'jazzmin',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.sitemaps',
    
    # Custom Apps
    'core.apps.CoreConfig',
    'portfolio.apps.PortfolioConfig',
    'blog.apps.BlogConfig',
    'contact.apps.ContactConfig',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'config.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'core.context_processors.site_settings',
            ],
        },
    },
]

WSGI_APPLICATION = 'config.wsgi.application'

# Add 'storages' to INSTALLED_APPS if not already present
if 'storages' not in INSTALLED_APPS:
    INSTALLED_APPS.append('storages')

# AWS S3 / Neon Storage Configuration
AWS_ACCESS_KEY_ID = env('AWS_ACCESS_KEY_ID', default=None)
AWS_SECRET_ACCESS_KEY = env('AWS_SECRET_ACCESS_KEY', default=None)
AWS_STORAGE_BUCKET_NAME = env('AWS_STORAGE_BUCKET_NAME', default=None)
AWS_S3_ENDPOINT_URL = env('AWS_ENDPOINT_URL_S3', default=None)
AWS_S3_REGION_NAME = env('AWS_REGION', default='us-east-2')

if AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY and AWS_STORAGE_BUCKET_NAME:
    AWS_S3_SIGNATURE_VERSION = 's3v4'
    AWS_S3_FILE_OVERWRITE = False
    AWS_DEFAULT_ACL = None
    AWS_QUERYSTRING_AUTH = False

    # Media files served directly from Neon Object Storage
    STORAGES = {
        "default": {
            "BACKEND": "storages.backends.s3boto3.S3Boto3Storage",
            "OPTIONS": {
                "location": "media",
            },
        },
        "staticfiles": {
            "BACKEND": "whitenoise.storage.CompressedStaticFilesStorage",
        },
    }
    MEDIA_URL = f'{AWS_S3_ENDPOINT_URL}/{AWS_STORAGE_BUCKET_NAME}/media/'
else:
    # Local development fallback
    MEDIA_URL = '/media/'
    MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
    STORAGES = {
        "default": {
            "BACKEND": "django.core.files.storage.FileSystemStorage",
        },
        "staticfiles": {
            "BACKEND": "whitenoise.storage.CompressedStaticFilesStorage",
        },
    }


# 1. Grab the DATABASE_URL from Vercel/local environment
db_url = os.getenv('DATABASE_URL')
if not db_url and 'DATABASE_URL' in globals().get('env', {}):
    db_url = env('DATABASE_URL')

if db_url:
    db_url = str(db_url).strip(" '\"")
    DATABASES = {
        'default': dj_database_url.parse(
            db_url,
            conn_max_age=600,
            ssl_require=True
        )
    }
else:
    # 2. Serverless-safe SQLite fallback (Vercel container root is read-only; /tmp is writable)
    db_path = '/tmp/db.sqlite3' if os.getenv('VERCEL') else BASE_DIR / 'db.sqlite3'
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': db_path,
        }
    }
# ========================================================
# Jazzmin Executive Admin Dashboard Settings
# ========================================================
JAZZMIN_SETTINGS = {
    "site_title": "Md. Alam Hossain Admin",
    "site_header": "Alam Hossain | Console",
    "site_brand": "Executive Portal",
    "welcome_sign": "Welcome to Md. Alam Hossain Management System",
    "copyright": "Md. Alam Hossain",
    "search_model": ["portfolio.Project", "blog.BlogPost", "contact.ContactMessage"],
    "user_avatar": None,

    "topmenu_links": [
        {"name": "Home View", "url": "admin:index", "permissions": ["auth.view_user"]},
        {"name": "Live Portfolio", "url": "/", "new_window": True},
        {"name": "Store Front", "url": "/store/", "new_window": True},
    ],

    "usermenu_links": [
        {"name": "View Site", "url": "/", "new_window": True, "icon": "fas fa-globe"},
    ],

    "show_sidebar": True,
    "navigation_expanded": True,
    "hide_apps": [],
    "hide_models": [],
    "order_with_respect_to": ["core", "portfolio", "blog", "contact", "auth"],

    "icons": {
        "auth": "fas fa-users-cog",
        "auth.user": "fas fa-user",
        "auth.Group": "fas fa-users",
        "core.SiteSetting": "fas fa-sliders-h",
        "core.SocialLink": "fas fa-share-alt",
        "core.PageView": "fas fa-chart-line",
        "portfolio.SkillCategory": "fas fa-layer-group",
        "portfolio.Skill": "fas fa-tools",
        "portfolio.Technology": "fas fa-code",
        "portfolio.ProjectCategory": "fas fa-folder-open",
        "portfolio.Project": "fas fa-laptop-code",
        "portfolio.CaseStudy": "fas fa-file-medical-alt",
        "portfolio.Experience": "fas fa-briefcase",
        "portfolio.Education": "fas fa-graduation-cap",
        "portfolio.Service": "fas fa-handshake",
        "portfolio.Achievement": "fas fa-trophy",
        "portfolio.Certificate": "fas fa-certificate",
        "portfolio.Testimonial": "fas fa-comment-dots",
        "portfolio.ResumeDownload": "fas fa-file-download",
        "portfolio.StoreCategory": "fas fa-tags",
        "portfolio.DigitalProduct": "fas fa-box-open",
        "portfolio.ProductOrder": "fas fa-shopping-cart",
        "blog.BlogCategory": "fas fa-bookmark",
        "blog.BlogPost": "fas fa-newspaper",
        "contact.ContactMessage": "fas fa-envelope-open-text",
    },
    "default_icon_parents": "fas fa-chevron-circle-right",
    "default_icon_children": "fas fa-circle",
    "related_modal_active": True,
    "custom_css": None,
    "custom_js": None,
    "show_ui_builder": False,
    "changeform_format": "horizontal_tabs",
}

JAZZMIN_UI_TWEAKS = {
    "navbar_small_text": False,
    "footer_small_text": False,
    "body_small_text": False,
    "brand_small_text": False,
    "brand_colour": "navbar-dark",
    "accent": "accent-info",
    "navbar": "navbar-dark navbar-navy",
    "no_navbar_border": True,
    "navbar_fixed": True,
    "layout_boxed": False,
    "footer_fixed": False,
    "sidebar_fixed": True,
    "sidebar": "sidebar-dark-navy",
    "sidebar_nav_small_text": False,
    "sidebar_disable_expand": False,
    "sidebar_nav_child_indent": True,
    "sidebar_nav_compact_style": False,
    "sidebar_nav_legacy_style": False,
    "sidebar_nav_flat_style": False,
    "theme": "slate",
    "dark_mode_theme": "darkly",
    "button_classes": {
        "primary": "btn-primary",
        "secondary": "btn-secondary",
        "info": "btn-info",
        "warning": "btn-warning",
        "danger": "btn-danger",
        "success": "btn-success"
    }
}

AUTH_PASSWORD_VALIDATORS = [
    {'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator'},
    {'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator'},
    {'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator'},
    {'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator'},
]

LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'Asia/Dhaka'
USE_I18N = True
USE_TZ = True

STATIC_URL = '/static/'
STATIC_ROOT = BASE_DIR / 'staticfiles'
STATICFILES_DIRS = [os.path.join(BASE_DIR, 'static')]

STATICFILES_STORAGE = 'whitenoise.storage.CompressedStaticFilesStorage'

MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# Email Settings
EMAIL_BACKEND = env('EMAIL_BACKEND', default='django.core.mail.backends.console.EmailBackend')
EMAIL_HOST = env('EMAIL_HOST', default='smtp.gmail.com')
EMAIL_PORT = env.int('EMAIL_PORT', default=587)
EMAIL_USE_TLS = env.bool('EMAIL_USE_TLS', default=True)
EMAIL_HOST_USER = env('EMAIL_HOST_USER', default='')
EMAIL_HOST_PASSWORD = env('EMAIL_HOST_PASSWORD', default='')
DEFAULT_FROM_EMAIL = env('DEFAULT_FROM_EMAIL', default='webmaster@localhost')

# Production Security Headers
if not DEBUG:
    SECURE_BROWSER_XSS_FILTER = True
    SECURE_CONTENT_TYPE_NOSNIFF = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SECURE = True
    X_FRAME_OPTIONS = 'DENY'