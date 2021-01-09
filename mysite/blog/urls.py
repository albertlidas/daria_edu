from django.urls import path, re_path
from .views import HomeView, PostDetailView, PostCreateView
from . import views

urlpatterns = [
    path(r'', HomeView.as_view(), name='post_list'),
    re_path(r'^(?P<pk>\d+)/$', PostDetailView.as_view(), name='post_detail'),
    re_path(r'^add/$', PostCreateView.as_view(), name='article_add'),
]