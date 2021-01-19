from django.db import models
from django.contrib.auth.models import User


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    img = models.ImageField(default='default.jpg', upload_to='pictures/user_img')

    def __str__(self):
        return self.user.username
