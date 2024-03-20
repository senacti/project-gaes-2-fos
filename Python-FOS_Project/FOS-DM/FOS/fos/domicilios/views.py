from django.shortcuts import render
from domicilios.models import Domicile
from venta.models import Sale
from inventario.models import Suplier, Supplier_Status
from django.contrib.auth.models import User
from report.report import report
from django.http import HttpResponseServerError
import traceback



#PDF domicilio
def exportDomicilePDF(request):
    domiciles = Domicile.objects.all()

    domiciles_list = []
    for domicile in domiciles:
        domiciles_list.append({
            'date':domicile.date,
            'direction':domicile.direction,
            'city': f"{domicile.city.cod_city} - {domicile.city.city}",
            'cod_status_domicile': domicile.cod_status_domicile.status_d,
            'sale': f"{domicile.sale.sale_date} - {domicile.sale.sale_amount} - {domicile.sale.sale_send}"
        })

    data = {
        'domiciles': domiciles_list
    }

    return report(request, 'domiciles', data)

#/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


#PDF ventas
def exportSalePDF(request):
    sales = Sale.objects.all()

    sales_list = []
    for sale in sales:
        sales_list.append({
            'sale_date':sale.sale_date,
            'sale_amount':sale.sale_amount,
            'sale_send': sale.sale_send,
            'unit_value': sale.unit_value,
            'discount': sale.discount,
            'vat': sale.vat,
            'subtotal': sale.subtotal,
            'total': sale.total
        })

    data = {
        'sales': sales_list
    }

    return report(request, 'sales', data)

#/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#PDF Inventario
def exportInventoryPDF(request):
    suppliers = Supplier_Status.objects.all()
    
    suppliers_list = []
    for supplier in suppliers:
        suppliers_list.append({
            'status_s': supplier.status_s,
        })
    data = {
        'suppliers': suppliers_list
    }

    return report(request, 'suppliers', data)

#/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

def exportUsersPDF(request):
    users = User.objects.all()

    users_list = []
    for user in users:
        users_list.append({
            'name': user.first_name,
            'username': user.username
            
        })

    data = {
        'users': users_list
    }
    
    return report(request, 'users', data)