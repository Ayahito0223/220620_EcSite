from django import views
from django.shortcuts import render, get_object_or_404, redirect
from django.views.generic import View
from .models import Item, OrderItem, Order, Payment
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from django.core.exceptions import ObjectDoesNotExist
from django.core.paginator import Paginator
from django.contrib.auth.mixins import LoginRequiredMixin
from accounts.models import CustomUser

class IndexView(View):
  def get(self, request, *args, **kwargs):
    all_item_data = Item.objects.order_by('number')
    paginator = Paginator(all_item_data, 28)
    p = request.GET.get('p')
    item_data = paginator.get_page(p)

    return render(request, 'app/index.html', {
      'item_data': item_data,
    })

class ItemDetailView(View):
  def get(self, request, *args, **kwargs):
    item_data = Item.objects.get(slug=self.kwargs['slug'])
    return render(request, 'app/detail.html', {
      'item_data': item_data
    })

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

class PaymentView(LoginRequiredMixin, View):
  def get(self, request, *args, **kwargs):
    order = Order.objects.get(user=request.user, ordered=False)
    user_data = CustomUser.objects.get(id=request.user.id)
    context = {
      'order': order,
      'user_data': user_data
    }

    return render(request, 'app/payment.html', context)

  def post(self, request, *args, **kwargs):
    order = Order.objects.get(user=request.user, ordered=False)
    order_items = order.items.all()
    amount = order.get_total()

    payment = Payment(user=request.user)
    payment.amount = amount
    payment.save()

    order_items.update(ordered=True)
    for item in order_items:
      item.save()

    order.ordered = True
    order.payment = payment
    order.save()

    return redirect('thanks')

class ThanksView(LoginRequiredMixin, View):
  def get(self, request, *args, **kwargs):
    return render(request, 'app/thanks.html')

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

@login_required
def removeItem(request, slug):
  """
  商品をカートから削除する。
  """

  item = get_object_or_404(Item, slug=slug) #Itemが存在しない場合404を送る
  order = Order.objects.filter(
    user=request.user,
    ordered=False,
  )
  if order.exists():
    order = order[0]
    if order.items.filter(item__slug=item.slug).exists():
      order_item = OrderItem.objects.filter(
        item=item,
        user=request.user,
        ordered=False
      )[0]
      order.items.remove(order_item)
      order_item.delete()
      return redirect('order')
  
  return redirect('detail', slug=slug)

@login_required
def removeSingleItem(request, slug):
  """
  商品をカートから個数を減らす。
  """

  item = get_object_or_404(Item, slug=slug) #Itemが存在しない場合404を送る
  order = Order.objects.filter(
    user=request.user,
    ordered=False,
  )
  if order.exists():
    order = order[0]
    if order.items.filter(item__slug=item.slug).exists():
      order_item = OrderItem.objects.filter(
        item=item,
        user=request.user,
        ordered=False
      )[0]
      if order_item.quantity > 1:
        order_item.quantity -= 1
        order_item.save()
      else:
        order.items.remove(order_item)
        order_item.delete()
      return redirect('order')
  
  return redirect('detail', slug=slug)
