from django.urls import path
from .views import HomeView, PostDetailView, FormView
from . import views

urlpatterns = [
    path('post/<int:pk>/', PostDetailView.as_view(), name='post_detail'),
    path(r'', HomeView.as_view(), name='post_list'),
    # path('register/', RegisterFormView.as_view(), name='register'),

]