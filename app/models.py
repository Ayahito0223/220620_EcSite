from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator
from django.conf import settings
import random, string
import hashlib

def slug_maker():
  repeat = True
  while repeat:
    str = ''.join(random.choice(string.ascii_lowercase + string.digits) for _ in range(19))
    new_slug = hashlib.md5(str.encode('utf-8')).hexdigest()
    counter = Item.objects.filter(slug=new_slug).count()
    if counter == 0:
      repeat = False
  return new_slug

class Item(models.Model):
  """
  1つの商品の情報
  """
  number = models.AutoField(primary_key=True)
  slug = models.SlugField(max_length=64, unique=True, default=slug_maker)
  code = models.CharField(max_length=7, null=False)
  pref_reading = models.TextField()
  city_reading = models.TextField()
  area_reading = models.TextField()
  prefecture = models.TextField()
  city = models.TextField()
  area = models.TextField()
  price = models.IntegerField(default=0, validators=[MinValueValidator(0)])
  quantity = models.IntegerField(default=0, validators=[MinValueValidator(0), MaxValueValidator(1)])

  def __str__(self):
    return f'code: {self.code}'


class Cart(models.Model):
  """
  商品とユーザーの多対多の関係を表すためのもの
  ユーザーのIDに一致したものを全て取り出すとショッピングカートの商品になる。
  """
  user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
  item = models.ForeignKey(Item, on_delete=models.CASCADE)
  quantity = models.IntegerField(default = 0)
  add_date = models.DateTimeField(auto_now_add=True)

  def get_total_item_price(self):
    return self.quantity * self.item.price

  def __str__(self):
    return f'code: {self.item.code}, quantity: {self.quantity}'

class Order(models.Model):
  """
  注文明細
  """
  order_id = models.AutoField(primary_key=True)
  user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
  ordered_data = models.DateTimeField(auto_now_add=True)
  total_price = models.IntegerField(default=0)

  def __str__(self):
    return f'order_id: {self.order_id}'

class OrderItem(models.Model):
  """
  注文した商品
  """
  order_id = models.ForeignKey(Order, on_delete=models.CASCADE)
  item = models.ForeignKey(Item, on_delete=models.CASCADE)
  quantity = models.IntegerField()
  total_price = models.IntegerField()

  def __str__(self):
    return f'order_id: {self.order_id}, item: {self.item}'