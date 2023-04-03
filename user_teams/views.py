from django.shortcuts import render

# Create your views here.
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

    def get_context_data(self, **kwargs):
        context = super(TeamsDetailView, self).get_context_data(**kwargs)
        context['users'] = Users.objects.filter(team=Team.objects.filter(id=self.kwargs['pk']).first())

        return context
