# Generated by Django 4.1.7 on 2023-03-23 09:47

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user_teams', '0002_alter_users_selected_task_alter_users_team'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tasks',
            name='completed_at',
            field=models.DateField(blank=True, default=None, null=True),
        ),
        migrations.AlterField(
            model_name='team',
            name='tasks',
            field=models.ManyToManyField(blank=True, default=None, null=True, to='user_teams.tasks'),
        ),
        migrations.AlterField(
            model_name='users',
            name='selected_task',
            field=models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.SET_DEFAULT, to='user_teams.tasks', verbose_name='Задача'),
        ),
        migrations.AlterField(
            model_name='users',
            name='team',
            field=models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.SET_DEFAULT, to='user_teams.team', verbose_name='Команда'),
        ),
    ]