from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django import forms

from . import models


class CustomUserCreationForm(UserCreationForm):

    class Meta:
        model = models.Users
        fields = ("username", "first_name", "last_name", "second_name", "phone", "position", "selected_task")


class CustomUserChangeForm(UserChangeForm):

    class Meta:
        model = models.Users
        fields = ("username", "first_name", "last_name", "second_name", "phone", "position", "selected_task")


class TaskAdd(forms.ModelForm):

    class Meta:
        model = models.Tasks
        exclude = ["completed_at", "is_selected"]
