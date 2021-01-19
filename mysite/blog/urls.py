from django.urls import path, re_path
from .views import *

urlpatterns = [
    path(r'', HomeView.as_view(), name='post_list'),
    re_path(r'^(?P<pk>\d+)/$', PostDetailView.as_view(), name='post_detail'),
    re_path(r'^add/$', PostCreateView.as_view(), name='article_add'),
    re_path(r'^(?P<pk>\d+)/update/$', UpdatePostView.as_view(), name='post_update'),
    re_path(r'^(?P<pk>\d+)/delete/$', DeletePostView.as_view(), name='post_delete'),
    re_path(r'^category/(?P<pk>\d+)/$', CategoryView.as_view(), name='post_category_view'),

]