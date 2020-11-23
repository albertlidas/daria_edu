from django.shortcuts import render
from django.template.response import TemplateResponse


from .models import Post


def index(request):
    context = {'title': Post.title, 'article': Post.article}
    return render(request, 'blog/index.html', context)
