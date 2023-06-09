from django.urls import path
from user_auth.views import UserAuth, logout_request, change_password, UserProfile, change_user

urlpatterns = [
    path('', UserAuth.as_view(), name="user_auth"),
    path("logout", logout_request, name="user_logout"),
    path("password", change_password, name="user_password"),
    path('profile/<int:pk>/', UserProfile.as_view(), name="user_profile"),
    path('user', change_user, name="user_change"),
]
