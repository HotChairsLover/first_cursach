from django.db import models
from django.contrib.auth.models import AbstractUser


class Users(AbstractUser):
    first_name = models.CharField(max_length=200, verbose_name="Имя")
    second_name = models.CharField(max_length=200, verbose_name="Фамилия")
    last_name = models.CharField(max_length=200, verbose_name="Отчество")
    phone = models.CharField(max_length=20, verbose_name="Телефон")
    position = models.ForeignKey("Positions", on_delete=models.CASCADE, null=True, blank=True, verbose_name="Должность")
    selected_task = models.ForeignKey("Tasks", blank=True, null=True, default=None, on_delete=models.SET_DEFAULT,
                                      verbose_name="Задача", related_name="selected_by")

    def __str__(self):
        return f"{self.first_name} {self.last_name} {self.second_name}"


class TaskToTeam(models.Model):
    task = models.ForeignKey("Tasks", on_delete=models.CASCADE)
    team = models.ForeignKey("Team", on_delete=models.CASCADE)


class UserToTeam(models.Model):
    user = models.ForeignKey("Users", on_delete=models.CASCADE)
    team = models.ForeignKey("Team", on_delete=models.CASCADE)


class Team(models.Model):
    title = models.CharField(max_length=200, verbose_name="Название")
    tasks = models.ManyToManyField("Tasks", blank=True, verbose_name="Задачи", through="TaskToTeam",
                                   related_name="in_team")
    users = models.ManyToManyField("Users", blank=True, verbose_name="Участники", related_name="team")

    def __str__(self):
        return self.title


class RestrictionsToTask(models.Model):
    restriction = models.ForeignKey("Positions", on_delete=models.CASCADE)
    task = models.ForeignKey("Tasks", on_delete=models.CASCADE)


class Tasks(models.Model):
    description = models.TextField(max_length=5000, verbose_name="Описание")
    restrictions = models.ManyToManyField("Positions", blank=True, verbose_name="Ограничения", through="RestrictionsToTask")
    deadline = models.DateField(verbose_name="Дедлайн")
    created_at = models.DateField(auto_now_add=True)
    is_selected = models.BooleanField(null=True, default=False)
    completed_at = models.DateField(blank=True, null=True, default=None)

    class Meta:
        ordering = ["deadline"]

    def __str__(self):
        return self.description


class Positions(models.Model):
    name = models.CharField(max_length=300, verbose_name="Название")

    def __str__(self):
        return self.name


