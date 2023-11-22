from django.contrib import admin
from . models import City, Domicile_Status, Domicile, Company_Transportation
from import_export import resources
from import_export.admin import ImportExportModelAdmin

@admin.register(City)
class CityAdmin(ImportExportModelAdmin):
    list_display=['cod_city','city']

class CityResource(resources.ModelResource):
    class Meta:
        model = City
        fields = ('cod_city', 'city')


@admin.register(Domicile_Status)
class Domicile_StatusAdmin(ImportExportModelAdmin):
    lis
admin.site.register(Domicile)    
admin.site.register(Company_Transportation)

# Register your models here.
