from django.urls import path
from user_teams.views import *

urlpatterns = [
    path('', TeamsListView.as_view(), name="teams_list"),
    path('<int:pk>', TeamsDetailView.as_view(), name="teams_detail"),
    path('task/<int:pk>', task_change, name="task_change"),
]
