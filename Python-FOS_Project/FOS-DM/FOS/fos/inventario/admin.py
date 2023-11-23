from django.contrib import admin
from . models import Supplier_Status, Entry, Request_Status, Employee, Employee_Type, Work_Time, Output, Inventory, Product_Request, Suplier
from import_export import resources
from import_export.admin import ImportExportModelAdmin

admin.site.register(Request_Status)
admin.site.register(Product_Request)
admin.site.register(Employee) 

@admin.site.register(Supplier_Status) 
class Supplier_StatusAdmin(ImportExportModelAdmin):
    list_display=['status_s',]
    list_editable = ('status_s',)
    search_fields = ('status_s',)
    

class Supplier_StatusResource(resources.ModelResource):
    class Meta:
        model = Supplier_Status
        fields = ('status_s',)


@admin.site.register(Entry)

class EntryAdmin(ImportExportModelAdmin):
    list_display=['amount','detail','entry_date',]
    list_editable = ('amount','detail','entry_date',)
    list_filter = ('entry_date',)
    search_fields = ('entry_date',)
    list_per_page = 20

class EntryResource(resources.ModelResource):
    class Meta:
        model = Entry
        fields = ('amount','detail','entry_date',)


@admin.site.register(Employee_Type)
class Employee_TypeAdmin(ImportExportModelAdmin):
    list_display=['employee_type',]
    list_editable = ('employee_type',)
    
    
    

class Employee_TypeResource(resources.ModelResource):
    class Meta:
        model = Employee_Type
        fields = ('employee_type',)


@admin.site.register(Work_Time)

class Work_TimeAdmin(ImportExportModelAdmin):
    list_display=['timetable','days',]
    list_editable = ('timetable','days',)
    
    
    

class Work_TimeResource(resources.ModelResource):
    class Meta:
        model = Work_Time
        fields = ('timetable',)


@admin.site.register(Output)

class OutputAdmin(ImportExportModelAdmin):
    list_display=['output_amount','detail','output_date',]
    list_editable = ('output_amount','detail','output_date',)
    list_filter = ('output_date',)
    search_fields = ('output_date',)
    list_per_page = 20

class OutputResource(resources.ModelResource):
    class Meta:
        model = Output
        fields = ('output_amount','detail','output_date',)


@admin.site.register(Inventory)

class InventoryAdmin(ImportExportModelAdmin):
    list_display=['stock','inventory_amount','minimum_amount','cod_entry','id_employee','id_product',]
    list_editable = ('inventory_amount','minimum_amount','cod_entry','id_employee','id_product',)
    list_filter = ('id_product',)
    search_fields = ('id_product',)
    list_per_page = 30

class InventoryResource(resources.ModelResource):
    class Meta:
        model = Inventory
        fields = ('stock','inventory_amount','cod_entry','id_employee','id_product',)




@admin.site.register(Suplier)

class SuplierAdmin(ImportExportModelAdmin):
    list_display=['nit','legal_representative_name','phone','cod_status','cod_city',]
    list_editable = ('nit','legal_representative_name','phone',)
    list_filter = ('nit',)
    search_fields = ('nit',)
    list_per_page = 10

class SuplierResource(resources.ModelResource):
    class Meta:
        model = Suplier
        fields = ('nit','legal_representative_name','phone',)


# Register your models here.
