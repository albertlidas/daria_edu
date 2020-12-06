from django.urls import path, re_path
from . import views


urlpatterns = [
    path(r'', views.logIn, name='login'),
    path(r'', views.signup, name='signup'),
]

