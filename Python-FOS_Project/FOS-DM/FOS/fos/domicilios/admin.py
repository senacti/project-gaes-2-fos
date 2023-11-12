from django.contrib import admin

from . models import City, Domicile_Status, Domicile

admin.site.register(City)
admin.site.register(Domicile_Status)
admin.site.register(Domicile)

# Register your models here.
