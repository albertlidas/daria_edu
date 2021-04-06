from django.urls import path, re_path
from .views import *

urlpatterns = [
    path(r'', HomeView.as_view(), name='post_list'),
    re_path(r'^(?P<pk>\d+)/$', PostDetailView.as_view(), name='post_detail'),
    re_path(r'^category/(?P<pk>\d+)/$', CategoryView.as_view(), name='post_category_view'),
    re_path(r'^add/$', add_post, name='article_add'),
    re_path(r'^search/', search_bar, name='search'),
    re_path(r'^update/(?P<pk>\d+)/$', edit_post, name='post_update'),
    re_path(r'^delete/(?P<pk>\d+)/$', delete_post, name='post_delete'),
]