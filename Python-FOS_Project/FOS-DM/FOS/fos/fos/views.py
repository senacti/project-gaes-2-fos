# Importaciones
from django.shortcuts import render
from django.shortcuts import redirect
from django.contrib.auth import login
from django.contrib.auth import logout
from django.contrib.auth import authenticate
from django.contrib import messages
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.http import HttpResponse
from django import forms
# Cierre importaciones

# Todo principal


def inicio(request):
    return render(request, 'inicio.html', {
        # context
    })


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


def salir(request):
    logout(request)
    messages.success(request, 'Sesión finalizada')
    return redirect('inicio')


def contactanos(request):
    return render(request, 'contactanos.html', {
        # contexto
    })


def servicios(request):
    return render(request, 'servicios.html', {
        # contexto
    })


def register(request):
    if request.method == 'GET':
        return render(request, 'registro.html', {
            'form': UserCreationForm()
        })
    elif request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']

            try:
                user = User.objects.create_user(
                    username=username, password=password)
                user.save()
                return HttpResponse('Usuario creado exitosamente')
            except:
                return HttpResponse('Error al crear el usuario')
        else:
            return HttpResponse('Los Password no coinciden')
    else:
        return HttpResponse('Método de solicitud no permitido')

def loading(request):
    return render(request,'loadings/loading.html')

def loadingcontac(request):
    return render(request,'loadings/loadingcontac.html')


#Cierre todo principal
# Cierre todo principal

# Todo domicilios
# Cierre todo domicilios

# Todo Ventas
# Cierre todo ventas

# Todo Inventario
# Cierre todo Inventario
