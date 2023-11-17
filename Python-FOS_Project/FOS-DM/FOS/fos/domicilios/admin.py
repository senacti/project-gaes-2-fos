from django.contrib import admin

from . models import City, Domicile_Status, Domicile, Company_Transportation

admin.site.register(City)
admin.site.register(Domicile_Status)
admin.site.register(Domicile)    
admin.site.register(Company_Transportation)

# Register your models here.
