from django.urls import path
from .views import HomeView, PostDetailView
from . import views

urlpatterns = [
    path(r'post/(?:page-(?P<page_number>\d+)/)?$/', PostDetailView.as_view(), name='post_detail'),
    path(r'', HomeView.as_view(), name='post_list'),
]