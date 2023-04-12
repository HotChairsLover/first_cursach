from django.contrib.auth import get_user_model, logout
from django.contrib.auth.views import LoginView
from django.shortcuts import render, redirect
from django.urls import reverse


class UserAuth(LoginView):
    template_name = "user_auth/login.html"


def logout_request(request):
    logout(request)
    return redirect(reverse("user_auth"))
