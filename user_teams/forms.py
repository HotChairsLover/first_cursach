from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.forms import ModelForm

from . import models


class CustomUserCreationForm(UserCreationForm):

    class Meta:
        model = models.Users
        fields = ("username", "first_name", "last_name", "second_name", "phone", "position")


class CustomUserChangeForm(UserChangeForm):

    class Meta:
        model = models.Users
        fields = ("username", "first_name", "last_name", "second_name", "phone", "position")


class TaskAdd(ModelForm):

    class Meta:
        model = models.Tasks
        exclude = ["completed_at"]
