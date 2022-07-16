from django.urls import path
from app import views

urlpatterns = [
  path('', views.IndexView.as_view(), name="index"),
  path('detail/<slug>', views.ItemDetailView.as_view(), name='detail'),
  path('additem/<slug>', views.addItem, name='additem'),
  path('cart/', views.CartView.as_view(), name='cart'),
  path('removeitem/<slug>', views.removeItem, name='removeitem'),
  path('removesingleitem/<slug>', views.removeSingleItem, name='removesingleitem'),
  path('ordercheck/', views.OrderCheckView.as_view(), name='ordercheck'),
  path('thanks/', views.ThanksView.as_view(), name='thanks'),
]