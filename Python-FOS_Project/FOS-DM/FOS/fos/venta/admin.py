from django.contrib import admin
from . models import Sale, Product, Product_Status, Product_Category

admin.site.register(Sale) 
admin.site.register(Product)
admin.site.register(Product_Status)
admin.site.register(Product_Category)
# Register your models here.
