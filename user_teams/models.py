from django.db import models


class Users(models.Model):
    name = models.CharField(max_length=200, verbose_name="Имя")
    position = models.ForeignKey("Positions", on_delete=models.CASCADE, verbose_name="Должность")
    team = models.ForeignKey("Team", blank=True, null=True, default=None, on_delete=models.SET_DEFAULT,
                             verbose_name="Команда")
    selected_task = models.ForeignKey("Tasks", blank=True, null=True, default=None, on_delete=models.SET_DEFAULT,
                                      verbose_name="Задача")

    def __str__(self):
        return self.name


class Team(models.Model):
    title = models.CharField(max_length=200)
    tasks = models.ManyToManyField("Tasks", blank=True, null=True, default=None)

    def __str__(self):
        return self.title


class Tasks(models.Model):
    description = models.TextField(max_length=5000)
    restrictions = models.ManyToManyField("Positions")
    deadline = models.DateField(verbose_name="Дедлайн")
    created_at = models.DateField(auto_now_add=True)
    completed_at = models.DateField(blank=True, null=True, default=None)

    def __str__(self):
        return self.description


class Positions(models.Model):
    name = models.CharField(max_length=300)

    def __str__(self):
        return self.name


