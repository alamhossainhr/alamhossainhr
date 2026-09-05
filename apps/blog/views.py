# apps/blog/views.py
from django.shortcuts import render, get_object_or_404
from django.core.paginator import Paginator
from django.db.models import Q, F
from .models import BlogPost, BlogCategory

def blog_list(request, category_slug=None):
    posts = BlogPost.objects.filter(is_published=True)
    category = None
    query = request.GET.get('q')

    if category_slug:
        category = get_object_or_404(BlogCategory, slug=category_slug)
        posts = posts.filter(category=category)

    if query:
        posts = posts.filter(Q(title__icontains=query) | Q(content__icontains=query) | Q(short_description__icontains=query))

    paginator = Paginator(posts, 6)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    categories = BlogCategory.objects.all()
    recent_posts = BlogPost.objects.filter(is_published=True).order_by('-created_at')[:4]

    context = {
        'page_obj': page_obj,
        'categories': categories,
        'selected_category': category,
        'recent_posts': recent_posts,
        'search_query': query,
    }
    return render(request, 'blog/blog_list.html', context)

def blog_detail(request, slug):
    post = get_object_or_404(BlogPost, slug=slug, is_published=True)
    BlogPost.objects.filter(id=post.id).update(views_count=F('views_count') + 1)
    post.refresh_from_db()
    related_posts = BlogPost.objects.filter(category=post.category, is_published=True).exclude(id=post.id)[:3]
    categories = BlogCategory.objects.all()
    return render(request, 'blog/blog_detail.html', {'post': post, 'related_posts': related_posts, 'categories': categories})