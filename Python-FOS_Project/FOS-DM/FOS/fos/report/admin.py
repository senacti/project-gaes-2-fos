from django.contrib import admin
from import_export.admin import ImportExportModelAdmin
from report.models import ReportRequest, ReportDefinition

class ReportRequestAdmin(ImportExportModelAdmin):
    pass

class ReportDefinitionAdmin(ImportExportModelAdmin):
    pass

admin.site.register(ReportRequest, ReportRequestAdmin)
admin.site.register(ReportDefinition, ReportDefinitionAdmin)

# Register your models here.
