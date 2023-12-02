# Importaciones
from django.shortcuts import render
from django.shortcuts import redirect
from django.contrib.auth import login
from django.contrib.auth import logout
from django.contrib.auth import authenticate, login as auth_login
from django.contrib import messages
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.db import IntegrityError
from django.http import HttpResponse
from django.views import View
#Importaciones PDF
import os
from django.conf import settings
from django.http import HttpResponse
from django.template.loader import get_template
from xhtml2pdf import pisa
from django.contrib.staticfiles import finders

#Fin importaciones PDF


# Cierre importaciones

# Todo principal

# Principal
def inicio(request):
    return render(request, 'inicio.html', {
        # context
    })
#//

# Login
def login_view(request):

    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user:
            login(request, user)
            messages.success(request, 'Bienvenido')
            return redirect('inicio')
        else:
            messages.error(request, 'Usuario o contraseña incorrectos')
    return render(request, 'login.html', {
    })
#//

#Logout
def salir(request):
    logout(request)
    messages.success(request, 'Sesión finalizada')
    return redirect('inicio')
#//

#Contactanos
def contactanos(request):
    return render(request, 'contactanos.html', {
        # contexto
    })
#//

#Servicios
def servicios(request):
    return render(request, 'servicios.html', {
        # contexto
    })
#//

#Loadings
def loading(request):
    return render(request,'loadings/loading.html')

def loadingcontac(request):
    return render(request,'loadings/loadingcontac.html')
#//

#Register
def signup(request):
    if request.method == 'POST':
        if request.POST['password1'] == request.POST['password2']:
            try:
                user = User.objects.create_user(username=request.POST['username'], password=request.POST['password1'])
                authenticated_user = authenticate(request, username=request.POST['username'], password=request.POST['password1'])
                if authenticated_user:
                    auth_login(request, user)
                    return redirect('inicio')
                else:
                    return render(request, 'signup.html', {'form': UserCreationForm(), 'error': 'Error de autenticación'})
            except IntegrityError:
                return render(request, 'signup.html', {'form': UserCreationForm(), 'error': 'El nombre de usuario ya existe'})
        else:
            return render(request, 'signup.html', {'form': UserCreationForm(), 'error': 'Las contraseñas no coinciden'})

    return render(request, 'signup.html', {'form': UserCreationForm()})


#INICIO PDF
class CustomSaleInvoicePdf(View):
    def get(self, request, *args, **kwargs):
        try:  
            template = get_template('PDF.html')
            context = {'TITULO': '1° | PDF'}
            html = template.render(context)
            response = HttpResponse(content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="FOS | Report.pdf"'
            pisa_status = pisa.CreatePDF(
            html, dest=response)
            if pisa_status.err:
                return HttpResponse('Error al generar PDF')
            return response
        except Exception as e:
            return HttpResponse(f'Error: {str(e)}', status=500)

#FIN PDF



#Cierre todo principal
# Cierre todo principal

# Todo domicilios
def domicilios(request):
    return render(request, 'domicilios.html')

#loading domicilios
def domiciliosloa(request):
    return render(request, 'loadings/domiciliosloa.html')
#//
# Cierre todo domicilios

# Todo Ventas
# Cierre todo ventas

# Todo Inventario
# Cierre todo Inventario
