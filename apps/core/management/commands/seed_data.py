import datetime
from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from core.models import SiteSetting, SocialLink
from portfolio.models import (
    SkillCategory, Skill, Technology, ProjectCategory,
    Project, CaseStudy, Experience, Education, Service, Achievement
)
from blog.models import BlogCategory, BlogPost

class Command(BaseCommand):
    help = 'Seeds database with realistic initial HR, Data, and Technical records'

    def handle(self, *args, **kwargs):
        self.stdout.write("Seeding data...")

        # 1. Site Settings
        setting = SiteSetting.load()
        setting.site_name = "Md. Alam Hossain"
        setting.site_title_suffix = "HR & Payroll Specialist | Data Analyst | Python & Django Developer"
        setting.hero_headline = "Turning HR, Payroll & Workforce Data Into Smarter Business Decisions."
        setting.hero_subheadline = "HR and payroll professional with strong experience in workforce management, payroll processing, HRIS, SQL reporting, data analytics, automation, and web-based HR solutions."
        setting.about_intro = "I bridge the gap between regulatory labor compliance, complex multi-tier payroll logic, and modern software development."
        setting.years_experience = 6
        setting.projects_completed = 18
        setting.reports_dashboards_developed = 75
        setting.hr_processes_automated = 14
        setting.save()

        # 2. Social Links
        SocialLink.objects.get_or_create(platform='linkedin', defaults={'url': 'https://linkedin.com', 'icon_class': 'bi bi-linkedin', 'display_order': 1})
        SocialLink.objects.get_or_create(platform='github', defaults={'url': 'https://github.com', 'icon_class': 'bi bi-github', 'display_order': 2})

        # 3. Technologies
        tech_names = ['Python', 'Django', 'MySQL', 'MS SQL Server', 'Advanced Excel', 'Bootstrap 5', 'Power BI', 'JavaScript']
        tech_objs = {}
        for name in tech_names:
            obj, _ = Technology.objects.get_or_create(name=name)
            tech_objs[name] = obj

        # 4. Skill Categories & Skills
        hr_cat, _ = SkillCategory.objects.get_or_create(name="HR & Payroll", defaults={'icon_class': 'bi bi-people-fill', 'display_order': 1})
        data_cat, _ = SkillCategory.objects.get_or_create(name="Data & Analytics", defaults={'icon_class': 'bi bi-database-fill-check', 'display_order': 2})
        dev_cat, _ = SkillCategory.objects.get_or_create(name="Development & Tools", defaults={'icon_class': 'bi bi-code-square', 'display_order': 3})

        Skill.objects.get_or_create(category=hr_cat, name="Payroll Processing & Tax", defaults={'proficiency_percentage': 98, 'is_featured': True})
        Skill.objects.get_or_create(category=hr_cat, name="Final Settlement & Benefits", defaults={'proficiency_percentage': 95, 'is_featured': True})
        Skill.objects.get_or_create(category=hr_cat, name="Labor Law & Compliance", defaults={'proficiency_percentage': 90, 'is_featured': True})

        Skill.objects.get_or_create(category=data_cat, name="Microsoft SQL Server / T-SQL", defaults={'proficiency_percentage': 92, 'is_featured': True})
        Skill.objects.get_or_create(category=data_cat, name="Workforce Analytics & Dashboards", defaults={'proficiency_percentage': 88, 'is_featured': True})
        Skill.objects.get_or_create(category=data_cat, name="Advanced Excel & Power Query", defaults={'proficiency_percentage': 95, 'is_featured': True})

        Skill.objects.get_or_create(category=dev_cat, name="Python & Django Web Apps", defaults={'proficiency_percentage': 85, 'is_featured': True})
        Skill.objects.get_or_create(category=dev_cat, name="MySQL Database Architecture", defaults={'proficiency_percentage': 88, 'is_featured': True})

        # 5. Project Categories & Projects
        pcat_hris, _ = ProjectCategory.objects.get_or_create(name="HR Technology")
        pcat_sql, _ = ProjectCategory.objects.get_or_create(name="SQL & Analytics")

        p1, _ = Project.objects.get_or_create(
            title="Enterprise Employee & Attendance System",
            defaults={
                'category': pcat_hris,
                'summary': "Comprehensive Django-based HR web application featuring employee master records, shift management, and biometric logs integration.",
                'business_challenge': "Manual attendance reconciliation for over 1,500 factory workers was leading to 2-day payroll delays and calculation errors.",
                'engineered_solution': "Engineered a normalized database architecture in MySQL with Django views to process raw biometric punches, auto-detect late/absent statuses, and trigger shift alerts.",
                'key_features': "* Real-time biometric punch sync\n* Shift roster scheduling engine\n* Granular role-based permissions\n* Exportable audit-ready Excel reports",
                'business_impact': "Reduced monthly attendance preparation time by 80% and eliminated manual punch-entry errors.",
                'role': "Full Stack Developer & Systems Designer",
                'duration': "4 Months",
                'is_featured': True,
                'is_published': True
            }
        )
        p1.technologies.set([tech_objs['Python'], tech_objs['Django'], tech_objs['MySQL'], tech_objs['Bootstrap 5']])

        # 6. Case Studies
        CaseStudy.objects.get_or_create(
            title="Automating Multi-Tier Payroll Calculations",
            defaults={
                'domain_tag': "Payroll Optimization",
                'problem': "Calculating overtime, statutory deductions, and tax slabs manually in spreadsheets took 4 days every month.",
                'solution': "Constructed parameterized SQL Server Stored Procedures and a custom validation script to compute 2,000+ payslips in minutes.",
                'results': "100% computational accuracy, zero tax reporting discrepancies, and 90% reduction in processing time.",
                'tools_used': "MS SQL Server, T-SQL, Python, Excel",
                'is_featured': True
            }
        )

        # 7. Services
        Service.objects.get_or_create(
            title="Payroll & Final Settlement Architecture",
            defaults={
                'icon_class': 'bi bi-cash-stack',
                'short_description': "End-to-end payroll processing logic, compliance audits, and final settlement computations.",
                'detailed_description': "Audit-proof calculations covering gratuity, earned leave encashment, notice pay, and statutory tax deductions compliant with regional labor acts.",
                'is_active': True
            }
        )
        Service.objects.get_or_create(
            title="Custom Django HR Application Development",
            defaults={
                'icon_class': 'bi bi-laptop',
                'short_description': "Web-based HRIS, KPI tracking systems, and automated approval workflows.",
                'detailed_description': "Custom web systems built using Python/Django and MySQL tailored to organizational operational hierarchies.",
                'is_active': True
            }
        )

        # 8. Achievements
        Achievement.objects.get_or_create(
            title="Payroll Turnaround Acceleration",
            defaults={
                'metric_value': "85% Faster",
                'category': "Process Automation",
                'description': "Reduced end-of-month salary compilation timeline from 4 working days to 4 hours."
            }
        )
        Achievement.objects.get_or_create(
            title="Enterprise Workforce Records Managed",
            defaults={
                'metric_value': "2,500+ Staff",
                'category': "HRIS & Database",
                'description': "Successfully architected relational database schemas handling master employee data and daily biometric logs."
            }
        )

        # 9. Blog Post Sample
        user = User.objects.filter(is_superuser=True).first()
        if user:
            bcat, _ = BlogCategory.objects.get_or_create(name="HR Analytics")
            BlogPost.objects.get_or_create(
                title="Leveraging SQL Window Functions for Workforce Absenteeism Analysis",
                defaults={
                    'category': bcat,
                    'author': user,
                    'short_description': "How to use T-SQL and window functions to detect consecutive employee absenteeism patterns.",
                    'content': "Tracking patterns of absenteeism is essential for operational workforce management. Using SQL window functions such as LEAD and LAG allows HR analysts to identify trends before they escalate into compliance concerns...",
                    'is_featured': True,
                    'is_published': True
                }
            )

        self.stdout.write(self.style.SUCCESS("Database populated successfully!"))