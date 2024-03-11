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
# Importaciones PDF

# Fin importaciones PDF

# Importaciones domicilios
from .forms import DomicileForm
from domicilios.models import Domicile
from domicilios.models import Company_Transportation
# ///Importaciones domicilios

# importaciones correo
from django.core.mail import EmailMessage
from django.template.loader import render_to_string
from django.conf import settings
# ///Fin importaciones correo
# Cierre importaciones


# Todo principal
# Principal
def inicio(request):
    return render(request, 'ventas.html', {
        # context
    })
# //

# Login


def login_view(request):

    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user:
            login(request, user)
            messages.success(request, 'Bienvenido')
            return redirect('ventas')
        else:
            messages.error(request, 'Usuario o contraseña incorrectos')
    return render(request, 'login.html', {
    })
# //

# Logout


def salir(request):
    logout(request)
    messages.success(request, 'Sesión finalizada')
    return redirect('inicio')
# //
# Contactanos


def contactopg(request):
    return render(request, 'contactopg.html', {
        # context
    })

# contactanos correo


def contactanos(request):
    if request.method == "POST":
        try:
            name = request.POST['name']
            email = request.POST['email']
            subject = request.POST['subject']
            message = request.POST['message']

            template = render_to_string('email_template.html', {
                'name': name,
                'email': email,
                'message': message
            })

            email = EmailMessage(
                subject,
                template,
                settings.EMAIL_HOST_USER,
                ['jmaringutierrez851@gmail.com', 'osmansax15@gmail.com']
            )

            email.fail_silently = False
            email.send()

            messages.success(request, 'Se ha enviado correctamente')
            return redirect('contactopg')
        except Exception as e:

            messages.error(request, f'Error al enviar el mensaje: {e}')
            return redirect('contactanos')
# /// fin contactanos

# Servicios


def servicios(request):
    return render(request, 'servicios.html', {
        # contexto
    })
# //

# Loadings


def loading(request):
    return render(request, 'loadings/loading.html')


def loadingcontac(request):
    return render(request, 'loadings/loadingcontac.html')


def loadingrecuperar(request):
    return render(request, 'loadings/loadingrecuperar.html')


def reset_password_sent(request):
    return render(request, 'reset_password_sent.html')
# //

# Register


def signup(request):
    if request.method == 'POST':
        if request.POST['password1'] == request.POST['password2']:
            try:
                user = User.objects.create_user(
                    username=request.POST['username'],
                    password=request.POST['password1'],
                    first_name=request.POST['first_name'],
                    last_name=request.POST['last_name'],
                    email=request.POST['email']
                )
                authenticated_user = authenticate(
                    request, username=request.POST['username'], password=request.POST['password1'])
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


# INICIO PDF
def PDF (request):
    return render(request, 'PDF.html')

def pdfpg (request):
    return render(request, 'pdfpg.html')
# FIN PDF


# factura
def factura(request):
    return render(request, 'factura.html')
# Cierre todo principal


# Todo domicilios
def domicilios(request):
    return render(request, 'domicilios.html')

# /////consultas


def consultar_domicilios(request):
    if request.method == 'POST':
        fecha = request.POST.get('fecha')
        direccion = request.POST.get('direccion')

        # Realiza la consulta a la base de datos
        domicilios = Domicile.objects.filter(
            date=fecha,
            direction=direccion,

        )

        return render(request, 'consultasdom/consuldomi.html', {'domicilios': domicilios})


def consultar_empresa(request):
    if request.method == 'POST':
        nit = request.POST.get('nit')
        fechaen = request.POST.get('fechaen')
        domicilio = request.POST.get('domicilio')

        domicilios = Company_Transportation.objects.filter(
            company_nit=nit,
            date_domicile=fechaen,
            id_domicile=domicilio,
        )

        return render(request, 'consultasdom/consulem.html', {'domicilios': domicilios})


def agendar_consultar(request):
    if request.method == 'POST':
        nomusu = request.POST.get('nomusu')
        email = request.POST.get('email')
        fechadom = request.POST.get('fechadom')
        direccion = request.POST.get('direccion')

        domicilios = User.objects.filter(
            first_name=nomusu,
            email=email,

        )

        domicilios = Domicile.objects.filter(
            date=fechadom,
            direction=direccion,
        )
        return render(request, 'consultasdom/consuagen.html', {'domicilios': domicilios})


def agendar(request):
    if request.method == 'POST':
        form = DomicileForm(request.POST)
        if form.is_valid():
            form.save()
            # Puedes redirigir a la página que desees después de guardar el domicilio
            return redirect('domicilios.html')
    else:
        form = DomicileForm()

    return render(request, 'agendar.html', {'form': form})

# //// fin consultas
# loading domicilios


def domiciliosloa(request):
    return render(request, 'loadings/domiciliosloa.html')
# //
# Cierre todo domicilios

# Todo Ventas


def ventas(request):
    return render(request, 'ventas.html')
# Cierre todo ventas

# Todo Inventario
# Cierre todo Inventario


