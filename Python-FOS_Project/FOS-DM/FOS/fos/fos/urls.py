"""
URL configuration for fos project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from . import views
from django.urls import path
from .views import CustomSaleInvoicePdf


urlpatterns = [


    # Todo principal
    path('admin/', admin.site.urls, name='admin:index'),
    path('', views.inicio, name='inicio'),
    path('login/',  views.login_view, name='login'),
    path('salir/', views.salir, name='salir'),
    path('contactanos/', views.contactanos, name='contactanos'),
    path('servicios/', views.servicios, name='servicios'),
    path('loading/', views.loading, name='loading'),
    path('loadingcontac', views.loadingcontac, name='loadingcontac'),
    path('signup', views.signup, name='signup'),



    # Cierre todo principal

    # Domicilios
    path('domicilios/', views.domicilios, name='domicilios'),
    path('domiciliosloa/', views.domiciliosloa, name='domiciliosloa'),
    path('consultar_domicilios/', views.consultar_domicilios, name='consultar_domicilios'),
    path('consultar_empresa/', views.consultar_empresa, name='consultar_empresa'),
    path('agendar_consultar/', views.agendar_consultar, name='agendar_consultar'),
    path('agendar', views.agendar, name='agendar'),
    # Cierre domicilios

    # PDF
    path('custom_invoice/pdf', CustomSaleInvoicePdf.as_view(), name='custom_invoice'),
    # Cierre PDF

    # Ventas
    path('ventas/', views.ventas, name='ventas'),
    # Cierre ventas

    # Inventario
    # Cierre inventario
]
