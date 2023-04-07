from django.contrib.auth import get_user_model
from django.contrib.auth.views import LoginView
from django.shortcuts import render


class UserAuth(LoginView):
    template_name = "user_auth/login.html"
