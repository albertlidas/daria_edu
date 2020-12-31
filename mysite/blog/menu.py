from django import template
from models import Category

def show_menu(request):
    categories = Category.objects.all()
    return categories
