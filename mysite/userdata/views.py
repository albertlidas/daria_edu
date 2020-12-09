from django.contrib.auth import login, authenticate
from django.shortcuts import render, redirect
from .forms import UserLoginForm, UserRegisterForm

def logIn(request):
    form = UserLoginForm
    return render(request, 'login.html', {'form': form})

def signup(request):
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('fullname')
            password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=password)
            login(request, user)
            return redirect('post_list')
    else:
        form = UserRegisterForm()
    return render(request, 'signup.html', {'form': form})

