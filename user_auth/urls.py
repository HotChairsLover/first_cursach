from django.urls import path
from user_auth.views import UserAuth

urlpatterns = [
    path('', UserAuth.as_view(), name="user_auth")
]