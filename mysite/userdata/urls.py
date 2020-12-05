from django.urls import path
from . import views


urlpatterns = [
    path(r'', views.signup, name='signup'),
    path(r'', views.logIn, name='logIn'),
]