from django.urls import path, re_path
from .views import HomeView, PostDetailView
from . import views

urlpatterns = [
    re_path(r'^post/(?:page-(?P<page_number>\d+)/)?/$', PostDetailView.as_view(), name='post_detail'),
    path(r'', HomeView.as_view(), name='post_list'),
]