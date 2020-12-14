from django.urls import path, re_path
from .views import HomeView, PostDetailView, MenuCategory
from . import views

urlpatterns = [
    re_path(r'post/<int:pk>/', PostDetailView.as_view(), name='post_detail'),
    path(r'', HomeView.as_view(), name='post_list'),
    path(r'category/', MenuCategory.as_view(), name='category'),
]