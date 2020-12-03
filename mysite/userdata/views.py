from django.views.generic import DetailView, ListView, FormView
from django.contrib.auth import views, login, authenticate
#from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render, redirect
from .forms import UserLoginForm


def signup(request):
    if request.method == 'POST':
        form = UserLoginForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            password1 = form.cleaned_data.get('password1')
            password2 = form.cleaned_data.get('password2')
            user = authenticate(username=username, password1=password1, password12=password2)
            login(request, user)
            return redirect('home')
    else:
        form = UserLoginForm()
    return render(request, 'signup.html', {'form': form})

