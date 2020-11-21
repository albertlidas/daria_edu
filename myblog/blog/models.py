from django.db import models
#from django.utils import timezone
from django.contrib.auth.models import User


class Author(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return str(self.user)


class Post (models.Model):
    author = models.ForeignKey(Author, on_delete=models.CASCADE)
    pub_date = models.DateTimeField(auto_now_add=True)
    title = models.CharField(max_length=35)
    article = models.TextField(max_length=1500, blank=True)

    def __str__(self):
        return self.title


class Comment(models.Model):
    username = models.ForeignKey(Author, on_delete=models.CASCADE)
    pub_date = models.DateTimeField(auto_now_add=True)
    comment_text = models.TextField(max_length=35, null=True)
    post_for_comment = models.ForeignKey(Post, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return ('{}' + ' : ' + '{}').format(self.username, self.comment_text[:20])
