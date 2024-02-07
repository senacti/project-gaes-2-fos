from inventario import Supplier_Status

estado = [
    Supplier_Status("Cancelado"),
    Supplier_Status("Unificao"),
]


def agregar_estado(estado):
    Supplier_Status.append(estado)

def mostrar_estado():
    for estado in Supplier_Status:
        print(estado)