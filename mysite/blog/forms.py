from django import forms
from .models import Comment, Post, Category

choices = Category.objects.all().values_list()

class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ('commentator', 'content')

class PostForm(forms.ModelForm):
    class Meta:
        model = Post
        fields = '__all__'

        widgets = {
            'author': forms.Select,
            'pub_date': forms.DateTimeField,
            'category': forms.Select(choices=choices),
            'title': forms.TextInput,
            'article': forms.Textarea
        }

class PostDeleteForm(forms.ModelForm):
    class Meta:
        model = Post
        fields = []