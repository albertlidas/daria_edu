from django.contrib.auth.models import AbstractUser
from django.db import models
# from django.contrib.auth.models import User

class User(AbstractUser):
    pass

POST_CATEGORIES = [
    ('CL', 'Clothes'),
    ('SH', 'Shoes'),
    ('ACC', 'Accsesuars'),
    ('OT', 'Other')
]

class Category(models.Model):
    category_name = models.CharField(choices=POST_CATEGORIES, max_length=30)

    def __str__(self):
        return (f"{self. category_name}")

class Post(models.Model):
    title = models.TextField(max_length=64)
    description = models.TextField(max_length=500)
    img_url = models.URLField(blank=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    user = models.OneToOneField(User, on_delete=models.CASCADE)

    def __str__(self):
        return (f"{self.category} {self.title} {self.user}")

class Comment(models.Model):
    content = models.TextField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    date = models.DateTimeField()