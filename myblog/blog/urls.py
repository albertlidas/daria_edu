from django.urls import path
from .views import HomeView, PostDetailView
from . import views

urlpatterns = [
    path('post/<int:pk>/', PostDetailView.as_view(), name='post_detail'),
    path(r'', HomeView.as_view(), name='post_list'),
    #path(r'^$', views.index, name='index'),
]