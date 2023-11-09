from django.contrib import admin

from . models import  City, Supplier_Status, Entry, Request_Status, Domicile_Status, Product_Status, Employee, Employee_Type, Product_Category, Work_Time, Product, Sale, Output, Inventory, Domicile, Company_Transportation, Activities, Product_Request, Suplier, Client_Type

#admin.site.register(Client)
admin.site.register(City)
admin.site.register(Supplier_Status)
admin.site.register(Entry)
admin.site.register(Request_Status)
admin.site.register(Domicile_Status)
admin.site.register(Product_Status)
admin.site.register(Employee)
admin.site.register(Employee_Type)
admin.site.register(Product_Category)
admin.site.register(Work_Time)
admin.site.register(Product)
admin.site.register(Sale)
admin.site.register(Output)
admin.site.register(Inventory)
admin.site.register(Domicile)
admin.site.register(Company_Transportation)
admin.site.register(Activities)
admin.site.register(Product_Request)
admin.site.register(Suplier)
admin.site.register(Client_Type)

# Register your models here.
