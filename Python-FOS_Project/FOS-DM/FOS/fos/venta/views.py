"""from django.shortcuts import render
from venta.models import Sale
from django.contrib.auth.models import User
from report.report import report

def exportSalePDF(request):
    sales = Sale.objects.all()

    sales_list = []
    for sale in sales:
        sales_list.append({
            'sale_date':sale.sale_date,
            'sale_amount':sale.sale_amount,
            'sale_sent': sale.sale_send,
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
"""
"""def exportUsersPDF(request):
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
    
    return report(request, 'users', data)"""
