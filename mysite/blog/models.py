from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse


POST_CATEGORIES = [
    ('Science', 'Science'),
    ('Politics', 'Politics'),
    ('Technics', 'Technics'),
    ('History', 'History'),
    ('Music', 'Music'),
]


class Author(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return str(self.user)


class Category(models.Model):
    cat_name = models.CharField(max_length=20, blank=False, null=False, choices=POST_CATEGORIES)

    def __str__(self):
        return self.cat_name

    def get_absolute_url(self):
        return reverse('post_detail', kwargs={'pk': self.id})


class Post (models.Model):
    author = models.ForeignKey(Author, on_delete=models.CASCADE)
    pub_date = models.DateTimeField(editable=True, auto_now_add=True, blank=True, null=True)
    title = models.TextField(max_length=50)
    article = models.TextField(max_length=1500, blank=True)
    category = models.ForeignKey(Category, max_length=20, on_delete=models.CASCADE, blank=True, null=True)



    def __str__(self):
        return '{} ({})'.format(self.title, self.category)

class Comment(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='comments', related_query_name='comment_post')
    commentator = models.ForeignKey(Author, on_delete=models.CASCADE, max_length=80)
    content = models.TextField()
    created = models.DateTimeField(auto_now_add=True)
    status = models.BooleanField(default=False)

    class Meta:
        ordering = ['created']

    def __str__(self):
        return 'Comment {} by {}'.format(self.created, self.commentator)

