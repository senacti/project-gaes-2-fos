from django.contrib import admin
from . models import Supplier_Status, Entry, Request_Status, Employee, Employee_Type, Work_Time, Output, Inventory, Product_Request, Suplier
from import_export import resources
from import_export.admin import ImportExportModelAdmin

admin.site.register(Request_Status)
admin.site.register(Product_Request)
admin.site.register(Employee) 

#Supplier status
class Supplier_StatusResource(resources.ModelResource):
    class Meta:
        model = Supplier_Status
        fields = ('status_s')

@admin.register(Supplier_Status)
class Supplier_StatusAdmin(ImportExportModelAdmin):
    list_display = ['status_s']
    list_editable = []  
    list_display_links = ['status_s']  


#Entry
class EntryResource(resources.ModelResource):
    class Meta:
        model = Entry
        fields = ('amount','detail','entry_date')

@admin.register(Entry)
class EntryAdmin(ImportExportModelAdmin):
    list_display = ['amount', 'detail', 'entry_date']
    list_editable = []  
    list_display_links = ['amount']  


#Employee type
class Employee_TypeResource(resources.ModelResource):
    class Meta:
        model = Employee_Type
        fields = ('employee_type')

@admin.register(Employee_Type)
class Employee_TypeAdmin(ImportExportModelAdmin):
    list_display = ['employee_type']
    list_editable = []  
    list_display_links = ['employee_type']  


#Work Time
class Work_TimeResource(resources.ModelResource):
    class Meta:
        model = Work_Time
        fields = ('timetable')

@admin.register(Work_Time)
class Work_TimeAdmin(ImportExportModelAdmin):
    list_display = ['timetable', 'days']
    list_editable = []  
    list_display_links = ['timetable']  


#Output



class OutputResource(resources.ModelResource):
    class Meta:
        model = Output
        fields = ('output_amount','detail','output_date')

@admin.register(Output)
class OutputAdmin(ImportExportModelAdmin):
    list_display = ['output_amount', 'detail', 'output_date']
    list_editable = []  
    list_display_links = ['output_amount']  




@admin.register(Inventory)

class InventoryAdmin(ImportExportModelAdmin):
    list_display=['stock','inventory_amount','minimum_amount','cod_entry','id_employee','id_product']
    list_editable = ['inventory_amount','minimum_amount','cod_entry','id_employee','id_product']
    list_filter = ['id_product']
    search_fields = ['id_product']
    list_per_page = 30

class InventoryResource(resources.ModelResource):
    class Meta:
        model = Inventory
        fields = ('stock','inventory_amount','cod_entry','id_employee','id_product')

#Suplier
@admin.register(Suplier)
class SuplierAdmin(ImportExportModelAdmin):
    list_display = ['nit', 'legal_representative_name', 'phone', 'cod_status', 'cod_city']
    list_editable = []  
    list_display_links = ['nit']  


class SuplierResource(resources.ModelResource):
    class Meta:
        model = Suplier
        fields = ('nit','legal_representative_name','phone')


# Register your models here.
