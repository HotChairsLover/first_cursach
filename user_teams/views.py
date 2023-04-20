from django.shortcuts import render, redirect

# Create your views here.
from django.template.defaulttags import url
from django.urls import reverse
from django.views import generic
from django.views.generic.edit import ModelFormMixin

from user_teams.models import *
from . import forms


class TeamsListView(generic.ListView):
    model = Team
    template_name = "user_teams/teams_list.html"
    context_object_name = "teams"


class TeamsDetailView(ModelFormMixin, generic.DetailView):
    model = Team
    template_name = "user_teams/teams_detail.html"
    context_object_name = "team"
    form_class = forms.TaskAdd

    def get_success_url(self):
        self.object = self.get_object()
        return reverse("teams_detail", kwargs={'pk': self.object.id})

    def post(self, request, *args, **kwargs):
        form = self.get_form()
        self.object = self.get_object()
        if form.is_valid():
            post_team = Team.objects.get(id=self.object.id)
            post_task = form.save()
            task_to_team = TaskToTeam(team=post_team, task=post_task)
            task_to_team.save()
            return self.form_valid(form, )
        else:
            return self.form_invalid(form)

