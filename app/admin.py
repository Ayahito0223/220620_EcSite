from django.contrib import admin
from .models import Item, Cart, Order, OrderItem
from import_export import resources
from import_export.admin import ImportMixin

class PriceFilter(admin.SimpleListFilter):
  title = '価格'
  parameter_name = 'price'

  def lookups(self, request, model_admin):
    return (
      (100000, '1 - 100,000'),
      (200000, '100,001 - 200,000'),
      (300000, '200,001 - 300,000'),
      (400000, '300,001 - 400,000'),
      (500000, '400,001 - 500,000'),
      (600000, '500,001 - 600,000'),
      (700000, '600,001 - 700,000'),
      (800000, '700,001 - 800,000'),
      (900000, '800,001 - 900,000'),
      (1000000, '900,001 - 1,000,000'),
      (1000001, '1,000,001 -'),
    )

  def queryset(self, request, queryset):
    for i in range(100000, 1000001, 100000):
      if self.value() == str(i):
        return queryset.filter(price__range=(i - 100000 + 1, i))
      if self.value() == str(1000001):
        return queryset.filter(price__gte=1000001)

class ItemResource(resources.ModelResource):
  class Meta:
    model = Item
    import_id_fields = ['number']
    fields = ('number', 'code', 'pref_reading', 'city_reading', 'area_reading', 'prefecture', 'city', 'area', 'price', 'quantity')
    
@admin.register(Item)
class ItemAdmin(ImportMixin, admin.ModelAdmin):
  search_fields = ['code', 'pref_reading', 'city_reading', 'area_reading', 'prefecture', 'city', 'area']
  list_filter = ['prefecture', PriceFilter]

  from_encoding= 'shift_jis'
  list_display = ('number', 'slug', 'code', 'pref_reading', 'city_reading', 'area_reading', 'prefecture', 'city', 'area', 'price', 'quantity')
  resource_class = ItemResource

@admin.register(Cart)
class CartAdmin(admin.ModelAdmin):
  model = Cart
  list_display = ("user", "item", "quantity", "add_date")

class OrderItemInline(admin.StackedInline):
  model = OrderItem
  extra = 0
  list_display = ("order_id", "item", "quantity", "total_price")

@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
  search_fields = ['order_id']

  model = Order
  list_display = ("order_id", "user", "ordered_data", "total_price")

  inlines = [OrderItemInline]