# Generated by Django 4.1.7 on 2023-04-22 15:21

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user_teams', '0004_alter_users_selected_task'),
    ]

    operations = [
        migrations.AlterField(
            model_name='team',
            name='users',
            field=models.ManyToManyField(blank=True, related_name='team', to=settings.AUTH_USER_MODEL, verbose_name='Участники'),
        ),
    ]
