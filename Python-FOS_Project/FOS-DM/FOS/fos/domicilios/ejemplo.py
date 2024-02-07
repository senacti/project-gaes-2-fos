from domicilios.models import City

ciudad = [
    City("Bogotá", 102334),
    City("Bucaramanga", 1234435),
]

#funcion            #parametro
def agregar_ciudad(ciudad):
    City.append(ciudad)
        #añadir elemento al final de la lista
def mostrar_ciudad():
    for ciudad in City:
        print(ciudad)