from django.db import models

class User(models.Model):
    name = models.CharField
    age = models.IntegerField

class Post (models.Model):
    author = models.ForeignKey(User, on_delete=models.PROTECT)
    pub_date = models.DateTimeField(auto_now_add=True)

class Comment(models.Model):
    username = models.ForeignKey(User, on_delete=models.PROTECT)
    pub_date = models.DateTimeField(auto_now_add=True)