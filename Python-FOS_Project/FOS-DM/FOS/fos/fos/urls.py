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
from django.contrib.auth import views as auth_views
from domicilios.views import exportUsersPDF,exportDomicilePDF


urlpatterns = [


    # Todo principal
    path('PDF/', views.PDF, name='PDF'),

    path('admin/', admin.site.urls, name='admin:index'),
    path('', views.inicio, name='inicio'),
    path('login/',  views.login_view, name='login'),
    path('salir/', views.salir, name='salir'),
    path('contactopg/', views.contactopg, name='contactopg'),
    path('servicios/', views.servicios, name='servicios'),
    path('loading/', views.loading, name='loading'),
    path('loadingcontac/', views.loadingcontac, name='loadingcontac'),
    path('signup', views.signup, name='signup'),
    path('contactanos', views.contactanos, name='contactanos'),
    path('factura', views.factura, name='factura'),
    # restablecer contrasena
    path('reset_password/', auth_views.PasswordResetView.as_view(
        template_name="reset_password.html"), name='reset_password'),
    path('reset_password_sent/', auth_views.PasswordResetDoneView.as_view(
        template_name="reset_password_sent.html"), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(
        template_name="reset.html"), name='password_reset_confirm'),
    path('reset_password_complete/', auth_views.PasswordResetCompleteView.as_view(
        template_name="reset_password_complete.html"), name='password_reset_complete'),
    # //restablecer contrasena

    # Cierre todo principal

    # Domicilios
    path('domicilios/', views.domicilios, name='domicilios'),
    path('domiciliosloa/', views.domiciliosloa, name='domiciliosloa'),
    path('consultar_domicilios/', views.consultar_domicilios,
        name='consultar_domicilios'),
    path('consultar_empresa/', views.consultar_empresa, name='consultar_empresa'),
    path('agendar_consultar/', views.agendar_consultar, name='agendar_consultar'),
    path('agendar', views.agendar, name='agendar'),
    # Cierre domicilios

    # PDF
    path('report/', include(('report.urls', 'report'))),
    path('export_user_pdf/', exportUsersPDF, name='export_user'),
    path('export_domicile_pdf/', exportDomicilePDF, name='export_domicile'),
    path('pdfpg', views.pdfpg, name='pdfpg'),
    # Cierre PDF

    # Ventas
    path('ventas/', views.ventas, name='ventas'),
    # Cierre ventas

    # Inventario
    # Cierre inventario
]
