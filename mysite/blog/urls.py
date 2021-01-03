from django.urls import path, re_path
from .views import HomeView, PostDetailView
from . import views

urlpatterns = [
    path(r'', HomeView.as_view(), name='post_list'),
    path(r'(?P<int:pk>\d+)/', PostDetailView.as_view(), name='post_detail')
]