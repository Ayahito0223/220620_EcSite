from django.contrib import admin
from .models import Item, OrderItem, Order, Payment
from import_export import resources
from import_export.admin import ImportExportModelAdmin

class ItemResource(resources.ModelResource):
  class Meta:
    model = Item
    import_id_fields = ['number']
    fields = ('number', 'code', 'pref_reading', 'city_reading', 'area_reading', 'prefecture', 'city', 'area', 'price', 'quantity')
    use_bulk = True
  
@admin.register(Item)
class ItemAdmin(ImportExportModelAdmin):
  from_encoding= 'shift_jis'
  list_display = ('number', 'code', 'pref_reading', 'city_reading', 'area_reading', 'prefecture', 'city', 'area', 'price', 'quantity')
  resource_class = ItemResource

# admin.site.register(Item)
admin.site.register(OrderItem)
admin.site.register(Order)
admin.site.register(Payment)