# Generated by Django 3.1.3 on 2020-11-21 20:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0009_remove_author_name'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='comment',
            name='comment_text',
        ),
    ]
