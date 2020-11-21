from django.db import models
#from django.contrib.auth.models import User


class Author(models.Model):
    name = models.CharField
    birthday = models.DateField

    def __str__(self):
        return self.name


class Post (models.Model):
    author = models.ForeignKey(Author, on_delete=models.PROTECT)
    pub_date = models.DateTimeField(auto_now_add=True)
    title = models.CharField(max_length=35)
    post_content = models.CharField

    def __str__(self):
        return self.title


class Comment(models.Model):
    username = models.ForeignKey(Author, on_delete=models.PROTECT)
    pub_date = models.DateTimeField(auto_now_add=True)
    comment_text = models.CharField(max_length=200)

    def __str__(self):
        return '{} + ' ' + {}'.format(self.username, self.comment_text)
