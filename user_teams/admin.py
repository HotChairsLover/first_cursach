from django.contrib import admin
from user_teams.models import *


@admin.register(Users)
class UsersAdmin(admin.ModelAdmin):
    pass


@admin.register(Team)
class TeamAdmin(admin.ModelAdmin):
    pass


@admin.register(Tasks)
class TasksAdmin(admin.ModelAdmin):
    pass


@admin.register(Positions)
class PositionsAdmin(admin.ModelAdmin):
    pass

