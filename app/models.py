from django.db import models
from django.core.validators import  MinValueValidator
from django.conf import settings
import random, string
import hashlib

def slug_maker():
  str = ''.join(random.choice(string.ascii_lowercase + string.digits) for _ in range(20))
  return hashlib.md5(str.encode('utf-8')).hexdigest()

class Item(models.Model):
  """
  商品の情報に関する事
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
  quantity = models.IntegerField(default=0, validators=[MinValueValidator(0)])

  def __str__(self):
    return self.city

class OrderItem(models.Model):
  """
  一つの商品のオーダー状況に関する事
  """

  user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
  ordered = models.BooleanField(default=False)
  item = models.ForeignKey(Item, on_delete=models.CASCADE)
  quantity = models.IntegerField(default = 1)

  def get_total_item_price(self):
    return self.quantity * self.item.price

  def __str__(self):
    return f'{self.item.title}:{self.quantity}'
  

class Order(models.Model):
  """
  複数のオーダー状況に関する事
  """

  user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
  items = models.ManyToManyField(OrderItem)
  start_date = models.DateTimeField(auto_now_add=True)
  ordered_data = models.DateTimeField()
  ordered = models.BooleanField(default=False)

  payment = models.ForeignKey('Payment', on_delete=models.SET_NULL, blank=True, null=True)

  def get_total(self):
    total = 0
    for order_item in self.items.all():
      total += order_item.get_total_item_price()
    return total

  def __str__(self):
    return self.user.email

class Payment(models.Model):
  """

  """
  user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True)
  stripe_charge_id = models.CharField(max_length=50)
  amount = models.IntegerField()
  timestamp = models.DateTimeField(auto_now_add=True)

  def __str__(self):
    return self.user.email