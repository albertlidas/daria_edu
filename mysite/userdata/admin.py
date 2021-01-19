from django.contrib import admin
from .models import *

class ProfileAdmin(admin.ModelAdmin):
    list_display = ('user', 'id')
    list_filter = ('user', 'id')
    search_fields = ('user', 'id')

admin.site.register(Profile, ProfileAdmin)

