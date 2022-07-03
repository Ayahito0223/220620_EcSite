from django.urls import path
from app import views

urlpatterns = [
  path('', views.IndexView.as_view(), name="index"),
  path('detail/<slug>', views.ItemDetailView.as_view(), name='detail'),
  path('additem/<slug>', views.addItem, name='additem'),
  path('order/', views.OrderView.as_view(), name='order'),
]