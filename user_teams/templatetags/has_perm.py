from django import template
from user_teams.models import Users

register = template.Library()


@register.filter(name="has_perm")
def has_perm(user, perm):
    for group in user.groups.all():
        for permission in group.permissions.all():
            if permission.codename == perm:
                return True
    return False

