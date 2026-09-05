# apps/portfolio/urls.py
from django.urls import path
from . import views

app_name = 'portfolio'

urlpatterns = [
    path('projects/', views.project_list, name='project_list'),
    path('projects/<slug:slug>/', views.project_detail, name='project_detail'),
    path('case-studies/', views.case_study_list, name='case_study_list'),
    path('case-studies/<slug:slug>/', views.case_study_detail, name='case_study_detail'),
    path('services/', views.services, name='services'),
    path('experience/', views.experience_view, name='experience'),
    path('skills/', views.skills_view, name='skills'),
    path('resume/download/', views.download_resume, name='resume_download'),
    # Append inside urlpatterns in apps/portfolio/urls.py
    path('store/', views.store_list, name='store_list'),
    path('store/<slug:slug>/', views.product_detail, name='product_detail'),
    path('store/<slug:slug>/checkout/', views.checkout_view, name='checkout'),
    path('store/order/<uuid:token>/success/', views.order_success, name='order_success'),
    path('store/download/<uuid:token>/', views.download_asset, name='download_asset'),
]