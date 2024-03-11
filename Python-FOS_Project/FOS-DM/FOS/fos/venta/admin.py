from django.contrib import admin
from venta.models import *
from import_export import resources
from import_export.admin import ImportExportModelAdmin

@admin.register(Sale)
class SaleAdmin(ImportExportModelAdmin):
    list_display = ['unit_value', 'discount', 'vat', 'subtotal', 'total']
    list_editable = ['unit_value', 'discount', 'vat'] 
    list_display_links = None  
    list_filter = ['sale_date']
    search_fields = ['sale_date']
    list_per_page = 20


class SaleResource(resources.ModelResource):
    class Meta:
        model = Sale
        fields = ('vat','subtotal','total','sale_date')



class ProductResource(resources.ModelResource):
    class Meta:
        model = Product
        fields = ('Status_P', 'category_P', 'product_Color', 'product_name', 'fabrication_date')

@admin.register(Product)
class ProductAdmin(ImportExportModelAdmin):
    resource_class = ProductResource
    list_display = ['Status_p', 'category_p', 'product_color', 'product_name', 'fabrication_date']
    search_fields = ['product_name', 'category_P']
    list_per_page = 20

@admin.register(Product_Status)
class Product_StatusAdmin(ImportExportModelAdmin):
    list_display=['status']
    search_fields = ['status']

class Product_StatusResource(resources.ModelResource):
    class Meta:
        model = Product_Status
        fields = ('status')

@admin.register(Product_Category)
class Product_CategoryAdmin(ImportExportModelAdmin):
    list_display=['category']
    search_fields = ['category']

class Product_CategoryResource(resources.ModelResource):
    class Meta:
        model = Product_Category
        fields = ('category')
# Register your models here.
