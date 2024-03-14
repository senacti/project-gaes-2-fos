from django.shortcuts import render
from domicilios.models import Domicile
from django.contrib.auth.models import User
from report.report import report

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