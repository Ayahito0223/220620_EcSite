from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
import random, string
import hashlib

def slug_maker():
  str = ''.join(random.choice(string.ascii_lowercase + string.digits) for _ in range(20))
  return hashlib.md5(str.encode('utf-8')).hexdigest()

class Item(models.Model):
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