import datetime
import io
from sqlite3 import Date

from django.http import HttpResponse, FileResponse
from django.shortcuts import render, redirect, get_object_or_404

# Create your views here.
from django.template.defaulttags import url
from django.urls import reverse
from django.views import generic
from django.views.generic.edit import ModelFormMixin, FormMixin

from user_teams.models import *
from . import forms
import xlsxwriter


class TeamsListView(generic.ListView):
    model = Team
    template_name = "user_teams/teams_list.html"
    context_object_name = "teams"


def task_change(request, pk):
    task = Tasks.objects.get(id=pk)

    if request.method == "POST":
        form = forms.TaskAdd(request.POST, instance=task)
        if form.is_valid():
            form.save()
            return redirect('teams_detail', pk=task.in_team.get().id)
    else:
        form = forms.TaskAdd(instance=task)
    return render(request,
                  'user_teams/task_change.html',
                  {'form': form})


class TeamsDetailView(ModelFormMixin, generic.DetailView):
    model = Team
    template_name = "user_teams/teams_detail.html"
    context_object_name = "team"
    form_class = forms.TaskAdd

    def get_context_data(self, **kwargs):
        context = super(TeamsDetailView, self).get_context_data(**kwargs)
        context['users'] = Users.objects.all()
        return context

    def get_success_url(self):
        self.object = self.get_object()
        return reverse("teams_detail", kwargs={'pk': self.object.id})

    def post(self, request, *args, **kwargs):
        if request.POST.get("task_select"):
            return self.post_select_task(request)
        elif request.POST.get("task_refuse"):
            return self.post_refuse_task(request)
        elif request.POST.get("task_delete"):
            task_id = request.POST.get("task_id")
            Tasks.objects.filter(id=task_id).delete()
            return self.get(request)
        elif request.POST.get("make_report"):
            return self.post_make_report(request)
        elif request.POST.get("task_complete"):
            return self.post_task_complete(request)
        elif request.POST.get("user_remove"):
            return self.post_user_manager(request, "remove")
        elif request.POST.get("user_add"):
            return self.post_user_manager(request, "add")
        else:
            return self.post_create_task()

    def post_make_report(self, request):
        team_id = request.POST.get("make_report")
        days = int(request.POST.get("make_report_days"))
        team = Team.objects.filter(id=team_id).get()
        buffer = io.BytesIO()
        excel_file = xlsxwriter.Workbook(buffer)
        #excel_file = xlsxwriter.Workbook("report.xlsx")
        excel = excel_file.add_worksheet("report")
        row = 0
        column = 0
        excel.write(row, column, "Свободные задачи")
        row += 1
        excel.write(row, column, "Описание")
        column += 1
        excel.write(row, column, "Дедлайн")
        column += 1
        excel.write(row, column, "Ограничения")
        column = 0
        row += 1
        for task in team.tasks.all():
            if task.is_selected is False and task.completed_by is None:
                excel.write(row, column, task.description)
                column += 1
                excel.write(row, column, f"{task.deadline}")
                column += 1
                restrictions_string = ""
                for restr in task.restrictions.all():
                    restrictions_string += f"{restr.name} "
                excel.write(row, column, restrictions_string)
                column = 0
                row += 1
        row += 1
        excel.write(row, column, "Выбранные задачи")
        row += 1
        excel.write(row, column, "Описание")
        column += 1
        excel.write(row, column, "Дедлайн")
        column += 1
        excel.write(row, column, "Ограничения")
        column += 1
        excel.write(row, column, "Выполняющий")
        column = 0
        row += 1
        for task in team.tasks.all():
            if task.is_selected is not False:
                excel.write(row, column, task.description)
                column += 1
                excel.write(row, column, f"{task.deadline}")
                column += 1
                restrictions_string = ""
                for restr in task.restrictions.all():
                    restrictions_string += f"{restr.name} "
                excel.write(row, column, restrictions_string)
                column += 1
                excel.write(row, column, f"{task.selected_by.get().__str__()}")
                column = 0
                row += 1
        row += 1
        excel.write(row, column, "Законченные задачи")
        row += 1
        excel.write(row, column, "Описание")
        column += 1
        excel.write(row, column, "Дедлайн")
        column += 1
        excel.write(row, column, "Ограничения")
        column += 1
        excel.write(row, column, "Выполнивший")
        column += 1
        excel.write(row, column, "Дата выполнения")
        column = 0
        row += 1
        for task in team.tasks.all():
            if task.completed_by is not None and (datetime.date.today() - task.completed_at).days < days:
                excel.write(row, column, task.description)
                column += 1
                excel.write(row, column, f"{task.deadline}")
                column += 1
                restrictions_string = ""
                for restr in task.restrictions.all():
                    restrictions_string += f"{restr.name} "
                excel.write(row, column, restrictions_string)
                column += 1
                excel.write(row, column, f"{task.completed_by}")
                column += 1
                excel.write(row, column, f"{task.completed_at}")
                column = 0
                row += 1
        row += 1
        excel.write(row, column, f"{Date.today()}")
        excel_file.close()
        buffer.seek(0)
        return FileResponse(buffer, as_attachment=True, filename='report.xlsx')
        #return HttpResponse(excel_file, content_type="application/vnd.ms-excel")
        #return self.get(request)

    def post_task_complete(self, request):
        task_id = request.POST.get("task_id")
        task = Tasks.objects.filter(id=task_id).get()
        task.completed_at = Date.today()
        task.completed_by = task.selected_by.get()
        task.is_selected = False
        user_id = request.user.id
        user = Users.objects.filter(id=user_id).get()
        user.selected_task = None
        user.save()
        task.save()
        return self.get(request)

    def post_user_manager(self, request, method):
        self.object = self.get_object()
        user_id = request.POST.get(f"user_{method}")
        team = Team.objects.get(id=self.object.id)
        user = Users.objects.get(id=user_id)
        if method == "remove":
            task = user.selected_task
            task.is_selected = False
            task.save()
            user.selected_task = None
            user.save()
            team.users.remove(user)
            team.save()
        elif method == "add":
            team.users.add(user)
            team.save()
        return self.get(request)

    def post_refuse_task(self, request):
        user_id = request.user.id
        task_id = request.POST.get("task_id")
        user = Users.objects.filter(id=user_id).get()
        task = Tasks.objects.filter(id=task_id).get()
        user.selected_task = None
        task.is_selected = False
        user.save()
        task.save()
        return self.get(request)

    def post_create_task(self):
        form = self.get_form()
        self.object = self.get_object()
        if form.is_valid():
            post_team = Team.objects.get(id=self.object.id)
            post_task = form.save()
            task_to_team = TaskToTeam(team=post_team, task=post_task)
            task_to_team.save()
            return self.form_valid(form)
        else:
            return self.form_invalid(form)

    def post_select_task(self, request):
        user_id = request.user.id
        task_id = request.POST.get("task_id")
        user = Users.objects.filter(id=user_id).get()
        task = Tasks.objects.filter(id=task_id).get()
        if task.is_selected is False and user.selected_task is None:
            if user.position in task.restrictions.all() or task.restrictions.all().count() == 0:
                user.selected_task = task
                task.is_selected = True
                user.save()
                task.save()
        return self.get(request)
