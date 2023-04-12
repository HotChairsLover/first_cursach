from django.contrib import admin
from django.contrib.auth import get_user_model

from user_teams.models import *


User = get_user_model()
@admin.register(User)


@admin.register(Team)
class TeamAdmin(admin.ModelAdmin):
    pass


@admin.register(Tasks)
class TasksAdmin(admin.ModelAdmin):
    pass


@admin.register(Positions)
class PositionsAdmin(admin.ModelAdmin):
    pass

