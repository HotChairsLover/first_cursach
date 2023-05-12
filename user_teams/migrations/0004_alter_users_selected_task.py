# Generated by Django 4.1.7 on 2023-04-22 15:06

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user_teams', '0003_tasks_is_selected'),
    ]

    operations = [
        migrations.AlterField(
            model_name='users',
            name='selected_task',
            field=models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.SET_DEFAULT, related_name='selected_by', to='user_teams.tasks', verbose_name='Задача'),
        ),
    ]
