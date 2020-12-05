from django.urls import path, re_path
from . import views


urlpatterns = [
    re_path(r'^login/$', views.logIn, name='logIn'),
    path(r'', views.signup, name='signup'),
]

