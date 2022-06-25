from django import views
from django.shortcuts import render
from django.views.generic import View
from .models import Item

class IndexView(View):
  def get(self, request, *args, **kwargs):
    item_data = Item.objects.all()
    return render(request, 'app/index.html', {
      'item_data': item_data[:50],
    })

class ItemDetailView(View):
  def get(self, request, *args, **kwargs):
    item_data = Item.objects.get(slug=self.kwargs['slug'])
    return render(request, 'app/detail.html', {
      'item_data': item_data
    })