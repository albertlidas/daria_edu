from django.contrib import admin
from .models import *

class AuthorAdmin(admin.ModelAdmin):
    list_display = ('user', 'user_id')

admin.site.register(Author, AuthorAdmin)

class CommentAdmin(admin.ModelAdmin):
    list_display = ('commentator', 'post', 'created')
    list_filter = ('commentator', 'post', 'created')
    search_fields = ('commentator', 'post', 'created')

admin.site.register(Comment, CommentAdmin)


class PostAdmin(admin.ModelAdmin):
    list_display = ('author', 'pub_date', 'title', 'category', 'id')
    list_filter = ('author', 'pub_date', 'title', 'category', 'id')
    search_fields = ('author', 'pub_date', 'title', 'category', 'id')

admin.site.register(Post, PostAdmin)

class CategoryAdmin(admin.ModelAdmin):
    list_display = ('cat_name', 'id')
    list_filter = ('cat_name', 'id')
    search_fields = ('cat_name', 'id')

admin.site.register(Category, CategoryAdmin)

