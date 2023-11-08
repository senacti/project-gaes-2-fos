from django.shortcuts import render

def inicio(request):
    return render(request,'inicio.html',{
        #context
    })
def administrador(request):
    return render(request,' administrador.html ', {
        #context
    })
def agendarenvios(request):
    return render(request,'agendarenvios.html', {
        #context
    })
def contacto(request):
    return render(request,'contacto.html', {
        #context
    })
def domiciliosprinci(request):
    return render(request, 'domiciliosprinci.html', {
        #context
    })
def error404(request):
    return render(request,'error404.html',{
        #context
    })
def error500(request):
    return render(request,'error500.html',{
        #context
    })
def formularioventas(request):
    return render(request, 'formularioventas.html',{
        #context
    })
def home(request):
    return render(request,'home.html',{
        #context
    })
def loading(request):
    return render(request,'loading.html',{
        #context
    })
def modificardom(request):
    return render(request,'modificardom.html',{
        #context
    })
def recuperaremail(request):
    return render(request,'recuperaremail.html',{
        #context
    })
def registro(request):
    return render(request, 'registro.html',{
        #context
    })
def servicios(request):
    return render(request,'servicios.html',{
        #context
    })
def servicios(request):
    return render(request,'servicios.html',{
        #context
    })
def ventas(request):
    return render(request,'ventas.html',{
        #context
    })