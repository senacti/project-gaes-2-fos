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

#class SaleInvoicePdf(view):

 #   def get(self , request , *args , **kwargs):

#      return HttpResponse('Hello , word')
#//

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
