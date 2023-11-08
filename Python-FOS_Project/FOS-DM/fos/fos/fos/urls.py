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
from django.urls import path
from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.inicio, name='inicio'),
    path('administrador/', views.administrador, name='administrador'),
    path('agendarenvios/', views.agendarenvios, name='agendarenvio'),
    path('contacto/', views.contacto, name='contacto'),
    path('domiciliosprinci/', views.domiciliosprinci, name='domiciliosprinci'),
    path('error404/', views.error404, name='error404'),
    path('error500/', views.error500, name='error500'),
    path('formularioventas/', views.formularioventas, name='formularioventas'),
    path('home/', views.home, name='home'),
    path('loading/', views.loading, name='loading'),
    path('modificardom/', views.modificardom, name='modificardom'),
    path('recuperaremail', views.recuperaremail, name='recuperaremail'),
    path('registro/', views.registro, name='registro'),
    path('servicios/', views.servicios, name='servicios'),
    path('ventas/', views.ventas, name='ventas')
]
