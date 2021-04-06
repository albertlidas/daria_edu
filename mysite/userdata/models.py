from django.db import models
from django.contrib.auth.models import User
from PIL import Image


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    img = models.ImageField(upload_to='pictures/user_img', default='default.jpg')

    def __str__(self):
        return self.user.username

    def save(self, *args, **kwargs):
        super().save()
        image = Image.open(self.img.path)
        if image.height != 150 or image.width != 150:
            resized = (150, 150)
            image.thumbnail(resized, Image.ANTIALIAS)
            image.save(self.img.path)

