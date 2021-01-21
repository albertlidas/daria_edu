from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.models import User
from django import forms
from .models import *


class UserLoginForm(AuthenticationForm):
    username = forms.CharField(label="User Name", max_length=254, widget=forms.TextInput)
    password = forms.CharField(label="Password", widget=forms.PasswordInput)

class UserRegisterForm(UserCreationForm):
    email = forms.EmailField(label="Email")
    fullname = forms.CharField(label="Full name")
    error_messages = {
        'password_mismatch': ("The two password fields didn't match."),
    }
    password1 = forms.CharField(label="Password", widget=forms.PasswordInput)
    password2 = forms.CharField(label="Password confirmation", widget=forms.PasswordInput)

    class Meta:
        model = User
        fields = ['fullname', 'email', 'password1', 'password2']

class UserUpdateForm (forms.ModelForm):
    email = forms.EmailField(required=True)

    class Meta:
        model = User
        fields = ['username', 'email']


class ProfileImage(forms.ModelForm):
    def __init__(self, *args, **kwards):
        super().__init__(*args, **kwards)
        self.fields['img'].label = "Profile Photo"

    class Meta:
        model = Profile
        fields = ['img']
