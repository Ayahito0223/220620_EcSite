from django import views
from django.shortcuts import render, get_object_or_404, redirect
from django.views.generic import View
from .models import Item, OrderItem, Order
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.mixins import LoginRequiredMixin

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

@login_required
def addItem(request, slug):
  """
  商品をカートに追加する。
  """

  item = get_object_or_404(Item, slug=slug) #Itemが存在しない場合404を送る
  order_item, created = OrderItem.objects.get_or_create(
    item=item,
    user=request.user,
    ordered=False,
  )
  order = Order.objects.filter(user=request.user, ordered=False)

  if order.exists():
    order = order[0]
    if order.items.filter(item__slug=item.slug).exists():
      order_item.quantity += 1
      order_item.save()
    else:
      order.items.add(order_item)
    
  else:
    order = Order.objects.create(user=request.user, ordered_data=timezone.now())
    order.items.add(order_item)
  
  return redirect('order')

class OrderView(LoginRequiredMixin, View):
  """
  カートの画面
  """

  def get(self, request, *args, **kwargs):
    """
    リクエストが来たら、そのユーザーのOrderを検索してそれを返す。
    """

    try:
      order = Order.objects.get(user=request.user, ordered=False)
      context = {
        'order': order
      }
      return render(request, 'app/order.html', context)
    except ObjectDoesNotExist:
      return render(request, 'app/order.html')