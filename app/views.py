from django import views
from django.shortcuts import render, get_object_or_404, redirect
from django.views.generic import View
from .models import Item, Cart, Order, OrderItem
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from django.core.exceptions import ObjectDoesNotExist
from django.core.paginator import Paginator
from django.contrib.auth.mixins import LoginRequiredMixin
from accounts.models import CustomUser
from django.db.models import Q
from functools import reduce
from operator import and_, or_

class IndexView(View):
  def get(self, request, *args, **kwargs):
    free_word = self.request.GET.get('query')
    searchOption_word = self.request.GET.get('searchOption')
    code_word = self.request.GET.get('code')
    prefecture_word = self.request.GET.getlist('prefecture')
    city_word = self.request.GET.get('city')
    area_word = self.request.GET.get('area')
    price_word = self.request.GET.getlist('price')
    sortOption_word = self.request.GET.get('sortOption')


    if free_word:
      queryset = Item.objects.all()
      q_list = free_word.split()
      
      query = reduce(
        and_, [ 
          Q(code__icontains=q) |
          Q(pref_reading__icontains=q) |
          Q(city_reading__icontains=q) |
          Q(area_reading__icontains=q) |
          Q(prefecture__icontains=q) |
          Q(city__icontains=q) |
          Q(area__icontains=q)
          for q in q_list
        ]
      )

      all_item_data = queryset.filter(query)

    else:
      if searchOption_word:
        queryset = Item.objects.all()
        queryList = []

        if code_word:
          if code_word != '':
            queryList.append(Q(code__icontains = code_word))
        
        if prefecture_word:
          pref_queryList = []
          for pref in prefecture_word:
            pref_queryList.append(Q(prefecture__icontains=pref))

          if len(pref_queryList) != 0:
            queryList.append(reduce(or_, pref_queryList))
        
        if city_word:
          if city_word != '':
            queryList.append(Q(city__icontains = city_word))
        
        if area_word:
          if area_word != '':
            queryList.append(Q(area__icontains = area_word))

        if price_word:
          price_queryList = []
          for pri in price_word:
            for i in range(100000, 1000001, 100000):
              if pri == str(i):
                price_queryList.append(Q(price__range=(i - 100000 + 1, i)))
              if pri == str(1000001):
                price_queryList.append(Q(price__gte=1000001))

          if len(price_queryList) != 0:
            queryList.append(reduce(or_, price_queryList))

        if len(queryList) != 0:
          if searchOption_word == 'or':
            query = reduce(
              or_, queryList
            )
            
          else:
            query = reduce(
              and_, queryList
            )
          
          
          all_item_data = queryset.filter(query)

        else:
          all_item_data = Item.objects.all()
        

        sortOption = ''
        if sortOption_word:
          if sortOption_word == 'price':
            sortOption = 'price'
          elif sortOption_word == '-price':
            sortOption = '-price'

        if sortOption != '':
          all_item_data = all_item_data.order_by(sortOption)

      else:
        all_item_data = Item.objects.all()

    paginator = Paginator(all_item_data, 28)
    p = request.GET.get('p')
    item_data = paginator.get_page(p)

    # パラメータ生成
    url_param = ''
    for q in self.request.GET:
      if q == 'p':
        continue
      if len(self.request.GET.get(q)) == 0:
        continue
      url_param += '&' + q + '=' + self.request.GET.get(q)

    return render(request, 'app/index.html', {
      'item_data': item_data,
      'url_param': url_param,
    })

class ItemDetailView(View):
  def get(self, request, *args, **kwargs):
    item_data = Item.objects.get(slug=self.kwargs['slug'])
    return render(request, 'app/detail.html', {
      'item_data': item_data
    })

class CartView(LoginRequiredMixin, View):
  """
  カートの画面
  """

  def get(self, request, *args, **kwargs):
    """
    リクエストが来たら、そのユーザーのcartを検索してそれを返す。
    """

    try:
      cart = Cart.objects.filter(user=request.user)

      total_price = 0
      for cart_item in cart:
        total_price += cart_item.get_total_item_price()

      context = {
        'cart': cart,
        'total_price': total_price
      }
      return render(request, 'app/cart.html', context)
    except ObjectDoesNotExist:
      return render(request, 'app/cart.html')

class OrderCheckView(LoginRequiredMixin, View):
  def get(self, request, *args, **kwargs):
    cart = Cart.objects.filter(user=request.user)

    total_price = 0
    for cart_item in cart:
      total_price += cart_item.get_total_item_price()

    user_data = CustomUser.objects.get(id=request.user.id)
    context = {
      'total_price': total_price,
      'user_data': user_data
    }

    return render(request, 'app/ordercheck.html', context)

  def post(self, request, *args, **kwargs):
    cart = Cart.objects.filter(user=request.user)

    order = Order(
      user=request.user
    )
    order.save()

    total_price = 0
    for cart_item in cart:
      cart_item_price = cart_item.get_total_item_price()
      total_price += cart_item_price
      order_item = OrderItem(
        order_id = order,
        item = cart_item.item,
        quantity = cart_item.quantity,
        total_price = cart_item_price
      )
      order_item.save()
      cart_item.delete()

    order.total_price = total_price
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
  error = {
    'notItem': False
  }

  item = get_object_or_404(Item, slug=slug) #Itemが存在しない場合404を送る
  cart_item, created = Cart.objects.get_or_create(
    user=request.user,
    item=item
  )

  if item.quantity - 1 >= 0:
    item.quantity -= 1
    item.save()

    cart_item.quantity += 1
    cart_item.save()
  else:
    error['notItem'] = True

  return redirect('cart')

@login_required
def removeItem(request, slug):
  """
  商品をカートから削除する。
  """
  item = get_object_or_404(Item, slug=slug) #Itemが存在しない場合404を送る
  cart_item = Cart.objects.filter(
    user=request.user,
    item=item
  )

  if cart_item.exists():
    cart_item = cart_item[0]
    item.quantity += cart_item.quantity
    item.save()
    
    cart_item.delete()
    return redirect('cart')
  
  return redirect('cart')

@login_required
def removeSingleItem(request, slug):
  """
  商品をカートから個数を減らす。
  """

  item = get_object_or_404(Item, slug=slug) #Itemが存在しない場合404を送る
  cart_item = Cart.objects.filter(
    user=request.user,
    item=item
  )

  if cart_item.exists():
    cart_item = cart_item[0]

    item.quantity += 1
    item.save()

    if cart_item.quantity == 1:
      cart_item.delete()
    else:
      cart_item.quantity -= 1
      cart_item.save()

    return redirect('cart')
  
  return redirect('cart')
