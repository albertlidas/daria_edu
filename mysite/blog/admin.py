from django.contrib import admin
from .models import Author, Post, Category, Comment

admin.site.register(Author)
admin.site.register(Post)
admin.site.register(Category)

class CommentAdmin(admin.ModelAdmin):
    list_display = ('commentator', 'post', 'created')
    list_filter = ('created', 'commentator')
    search_fields = ('commentator', 'content')

admin.site.register(Comment, CommentAdmin)
