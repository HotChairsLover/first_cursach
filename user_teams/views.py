from django.shortcuts import render, redirect

# Create your views here.
from django.template.defaulttags import url
from django.urls import reverse
from django.views import generic
from user_teams.models import *


class TeamsListView(generic.ListView):
    model = Team
    template_name = "user_teams/teams_list.html"
    context_object_name = "teams"


class TeamsDetailView(generic.DetailView):
    model = Team
    template_name = "user_teams/teams_detail.html"
    context_object_name = "team"


