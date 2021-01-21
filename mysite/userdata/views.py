from django.contrib.auth import login, authenticate
from django.shortcuts import render, redirect
from .forms import *
from django.contrib import auth, messages
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required

def logIn(request):
    form = UserLoginForm
    if request.method == 'POST':
        username = request.POST.get('username', '')
        password = request.POST.get('password', '')
        user = auth.authenticate(username=username, password=password)
        if user is not None and user.is_active:
            auth.login(request, user)
            return redirect('post_list')
        else:
            return HttpResponse('Invalid login. Please try again.')
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

@login_required
def profile(request):
    if request.method == 'POST':
        img_profile = ProfileImage(request.POST, request.FILES, instance=request.user.profile.user)
        update_user = UserUpdateForm(request.POST, instance=request.user)
        if update_user.is_valid() and img_profile.is_valid():
            update_user.save()
            img_profile.save()
            messages.success(request, f'Profile for {User.username} has been updated successfully')
            return redirect('profile')
    else:
        img_profile = ProfileImage(instance=request.user.profile.user)
        update_user = UserUpdateForm(instance=request.user)
    data = {
        'img_profile': img_profile,
        'update_user': update_user
    }
    return render(request, 'profile.html', data)
