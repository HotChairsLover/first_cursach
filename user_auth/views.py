from django.contrib import messages
from django.contrib.auth import get_user_model, logout, update_session_auth_hash
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth.views import LoginView
from django.shortcuts import render, redirect
from django.urls import reverse
from django.views import View
from django.views.generic import DetailView
from user_teams.models import Users


class UserAuth(LoginView):
    template_name = "user_auth/login.html"


def logout_request(request):
    logout(request)
    return redirect(reverse("user_auth"))


def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)
            return redirect('user_profile', pk=user.id)
        else:
            messages.error(request, 'Ошибка в изменении пароля')
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'user_auth/change_password.html', {
        'form': form
    })


class UserProfile(DetailView):
    model = Users
    template_name = "user_auth/profile.html"
    context_object_name = "User"
