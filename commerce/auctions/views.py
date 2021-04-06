from django.contrib.auth import authenticate, login, logout
from django.db import IntegrityError
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse
from .models import *
from .models import User


def index(request):
    return render(request, "auctions/index.html")


def login_view(request):
    if request.method == "POST":

        # Attempt to sign user in
        username = request.POST["username"]
        password = request.POST["password"]
        user = authenticate(request, username=username, password=password)

        # Check if authentication successful
        if user is not None:
            login(request, user)
            return HttpResponseRedirect(reverse("index"))
        else:
            return render(request, "auctions/login.html", {
                "message": "Invalid username and/or password."
            })
    else:
        return render(request, "auctions/login.html")


def logout_view(request):
    logout(request)
    return HttpResponseRedirect(reverse("index"))


def register(request):
    if request.method == "POST":
        username = request.POST["username"]
        email = request.POST["email"]

        # Ensure password matches confirmation
        password = request.POST["password"]
        confirmation = request.POST["confirmation"]
        if password != confirmation:
            return render(request, "auctions/register.html", {
                "message": "Passwords must match."
            })

        # Attempt to create new user
        try:
            user = User.objects.create_user(username, email, password)
            user.save()
        except IntegrityError:
            return render(request, "auctions/register.html", {
                "message": "Username already taken."
            })
        login(request, user)
        return HttpResponseRedirect(reverse("index"))
    else:
        return render(request, "auctions/register.html")

def categories(request):
    l = Category.objects.all().values()
    return render(request, "auctions/categories.html", {
        "listings": l
    })

def create_post(request):
    if request.method == "POST":

        if not request.user.is_authenticated:
            return render(request, "auctions/create.html", {"message": "Please log in to publish the post"})

        title = request.POST['title']
        description = request.POST['description']
        img_url = request.POST['img_url']
        category = Category.objects.get(category_name=request.POST['category'])
        user = request.user

        post = Post.objects.create(title=title,
                                   category=category,
                                   description=description,
                                   img_url=img_url,
                                   user=user)
        post.save()
        return HttpResponseRedirect(reverse('index'))

    else:

        return render(request, 'auctions/create.html')



