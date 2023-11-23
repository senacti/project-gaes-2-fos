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
    list_display=['statud_d',]
    search_fields = ('statud_d',)

class Domicile_StatusResource(resources.ModelResource):
    class Meta:
        model = Domicile_Status
        fields = ('status_d',)

@admin.site.register(Domicile)
class DomicileAdmin(ImportExportModelAdmin):
    list_display=['date','direction','city','cod_status_domicile',]
    list_editable = ('date','direction','city','cod_status_domicile',)
    list_filter = ('date',)
    search_fields = ('date','cod_status_domicile',)
    list_per_page = 20  

class DomicileResource(resources.ModelResource):
    class Meta:
        model = Domicile
        fields = ('date','direction','city','cod_status_domicile',)

@admin.site.register(Company_Transportation)
class Company_TransportationAdmin(ImportExportModelAdmin):
    list_display=['company_nit','date_domicile',]
    list_editable = ('date_domicile',)
    list_filter = ('company_nit','date_domicile')
    search_fields = ('date_domicile',)
    list_per_page = 30

class Company_TransportationResource(resources.ModelResource):
    class Meta:
        model = Company_Transportation
        fields = ('company_nit','date_domicile','id_domicile',)




# Register your models here.
