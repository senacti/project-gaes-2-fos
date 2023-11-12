from django.shortcuts import render 
from django.shortcuts import redirect
from django.contrib.auth import login
from django.contrib.auth import logout
from django.contrib.auth import authenticate
from django.contrib import messages

def inicio(request):
    return render(request,'inicio.html',{
        #context
    })


def login_view(request):
    
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user:
            login(request, user)
            messages.success(request, 'Bienvenido {}'.format(user.username))
            return redirect('admin:index')
        else: 
            messages.error(request, 'Usuario o contraseña incorrectos')
    return render(request, 'login.html',{

        
    })

def salir(request):
    logout(request)
    messages.success(request, 'Sesión finalizada')
    return redirect('inicio.html')