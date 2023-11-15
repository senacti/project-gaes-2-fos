#Importaciones
from django.shortcuts import render 
from django.shortcuts import redirect
from django.contrib.auth import login
from django.contrib.auth import logout
from django.contrib.auth import authenticate
from django.contrib import messages
from .forms import CustomUserCreationForm

#Cierre importaciones

#Todo principal
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
            messages.success(request, 'Bienvenido')
            return redirect('inicio')
        else: 
            messages.error(request, 'Usuario o contraseña incorrectos')
    return render(request, 'login.html',{

        
    })

def salir(request):
    logout(request)
    messages.success(request, 'Sesión finalizada')
    return redirect('inicio')

def contactanos(request):
    return render(request,'contactanos.html',{
        #contexto
    })

def servicios(request):
    return render(request,'servicios.html',{
        #contexto
    })

def register(request):

    data = {
        'form': CustomUserCreationForm()
    }

    if request.method == 'POST':
        user_creation_form = CustomUserCreationForm(data=request.POST)

        if user_creation_form.is_valid():
            user_creation_form.save()
            
            user = authenticate(user_creation_form.cleaned_data['username'], password=user_creation_form.cleaned_data['password'])
            login(request, user)
            return redirect('inicio')
        
    return render(request,'registro.html', data)


#Cierre todo principal

#Todo domicilios
#Cierre todo domicilios

#Todo Ventas
#Cierre todo ventas

#Todo Inventario
#Cierre todo Inventario