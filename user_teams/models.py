from django.contrib.auth.base_user import AbstractBaseUser
from django.db import models
from django.contrib.auth.models import AbstractUser


class Users(AbstractBaseUser):
    name = models.CharField(max_length=200, null=True, blank=True, verbose_name="Имя")
    phone = models.CharField(max_length=20, null=True, default=None, verbose_name="Телефон")
    position = models.ForeignKey("Positions", null=True, blank=True, on_delete=models.CASCADE, verbose_name="Должность")
    selected_task = models.ForeignKey("Tasks", blank=True, null=True, default=None, on_delete=models.SET_DEFAULT,
                                      verbose_name="Задача")

    def __str__(self):
        return self.name


class Team(models.Model):
    title = models.CharField(max_length=200, verbose_name="Название")
    tasks = models.ManyToManyField("Tasks", blank=True, null=True, default=None, verbose_name="Задачи")
    users = models.ManyToManyField("Users", blank=True, null=True, default=None, verbose_name="Участники")

    def __str__(self):
        return self.title


class Tasks(models.Model):
    description = models.TextField(max_length=5000, verbose_name="Описание")
    restrictions = models.ManyToManyField("Positions", verbose_name="Ограничения")
    deadline = models.DateField(verbose_name="Дедлайн")
    created_at = models.DateField(auto_now_add=True)
    completed_at = models.DateField(blank=True, null=True, default=None)

    def __str__(self):
        return self.description


class Positions(models.Model):
    name = models.CharField(max_length=300, verbose_name="Название")

    def __str__(self):
        return self.name


