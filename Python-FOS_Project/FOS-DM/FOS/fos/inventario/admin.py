from django.contrib import admin
from . models import Supplier_Status, Entry, Request_Status, Employee, Employee_Type, Work_Time, Output, Inventory, Product_Request, Suplier


admin.site.register(Supplier_Status) 
admin.site.register(Entry)
admin.site.register(Request_Status)
admin.site.register(Employee) 
admin.site.register(Employee_Type)
admin.site.register(Work_Time)
admin.site.register(Output)
admin.site.register(Inventory)
admin.site.register(Product_Request)
admin.site.register(Suplier)
# Register your models here.
