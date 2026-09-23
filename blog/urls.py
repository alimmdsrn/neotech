from django.urls import path
from . import views
from django.contrib.auth import views as auth_views

app_name = 'blog'

urlpatterns = [
    path('index/', views.index, name='index'),
    path('posts/', views.post_list, name='post_list'),
    path('posts/<str:category>', views.post_list, name="post_list_category"),
    path('posts/<int:pk>/', views.post_detail, name='post_detail'),
    path('posts/<post_id>/comment', views.post_comment, name='post_comment'),
    path('tickets/', views.ticket, name='ticket'),
    path('search/', views.post_search, name='post_search'),
    path('profile/', views.profile, name='profile'),
    path('profile/create_post', views.create_post, name='create_post'),
    path('profile/delete_post/<post_id>', views.delete_post, name='delete_post'),
    path('profile/edit_post/<post_id>', views.edit_post, name='edit_post'),
    path('profile/delete_image/<image_id>', views.delete_image, name='delete_image'),
    path('login/', auth_views.LoginView.as_view(), name="login"),
    path('logout/', auth_views.LogoutView.as_view(), name="logout"),

]

