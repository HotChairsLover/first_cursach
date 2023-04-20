from django.contrib import admin
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin
from . import models
from . import forms


class CustomUserAdmin(UserAdmin):
    add_form = forms.UserCreationForm
    form = forms.UserChangeForm
    model = models.Users
    list_display = ("username", "first_name", "last_name", "second_name", "phone", "position", "is_staff", "is_active")
    list_filter = ("username", "position", "is_staff", "is_active")
    fieldsets = (
        (None, {"fields": ("username", "first_name", "last_name", "second_name", "phone", "position", "selected_task")}),
        ("Permissions", {"fields": ("is_staff", "is_active", "groups", "user_permissions")})
    )
    add_fieldsets = (
        (None, {
            "classes": "wide",
            "fields": (
                "username", "first_name", "last_name", "second_name", "phone", "position", "selected_task",
                "password1", "password2", "is_staff", "is_active", "groups", "user_permissions"
            )}
         ),
    )
    search_fields = ("username", "position")
    ordering = ("username", "position")


admin.site.register(models.Users, CustomUserAdmin)


@admin.register(models.Team)
class TeamAdmin(admin.ModelAdmin):
    pass


@admin.register(models.Tasks)
class TasksAdmin(admin.ModelAdmin):
    pass


@admin.register(models.Positions)
class PositionsAdmin(admin.ModelAdmin):
    pass

