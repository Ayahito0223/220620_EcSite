from django import template
from app.models import Cart

register = template.Library()

@register.filter
def itemCount(user):
  if user.is_authenticated:
    cart = Cart.objects.filter(user=user)
    if cart.exists():
      return cart.count()
  return 0