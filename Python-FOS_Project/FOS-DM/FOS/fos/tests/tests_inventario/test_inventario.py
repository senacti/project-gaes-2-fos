import pytest
from inventario.models import *


#Test modelo estado proveedor
@pytest.mark.django_db
def test_create_supplier_status():
    #Crea una instancia
    supplier = Supplier_Status.objects.create(
        status_s = 'Activo'
    )

    #verifica que se haya creado correctamente
    assert Supplier_Status.objects.count() == 1
    assert supplier.status_s == 'Activo'

@pytest.mark.django_db
def test_edit_supplier_status():
    #Crea una instancia
    supplier = Supplier_Status.objects.create(
        status_s = 'Activo'
    )

    #modifica la instancia
    supplier.status_s = 'Inactivo'
    supplier.save()

    #verifica que se haya editado corectamente
    edited_supplier = Supplier_Status.objects.get(id=supplier.id)
    assert edited_supplier.status_s == 'Inactivo'

@pytest.mark.django_db
def test_delete_supplier_status():
    #crea una instancia
    supplier = Supplier_Status.objects.create(
        status_s = 'Activo'
    )

    #Elimina la instancia
    supplier.delete()

    #Verifica que se haya eliminado 
    assert Supplier_Status.objects.count() == 0

#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



#Test modelo Entrada
@pytest.mark.django_db
def test_create_entry():
    #crea instancia
    entry = Entry.objects.create(
        amount = '20',
        detail = 'detalle de ejemplo',
        entry_date='2024-03-18'
    )

    #verifica que se haya creado correctamente
    assert Entry.objects.count() == 1
    assert entry.amount == '20'
    assert entry.detail == 'detalle de ejemplo'
    assert entry.entry_date == '2024-03-18'

@pytest.mark.django_db
def test_edit_entry():
    # Crea una instancia de entrada
    entry = Entry.objects.create(
        amount='20',
        detail='detalle de ejemplo',
        entry_date='2024-03-18'
    )

    # Modifica la instancia
    entry.amount = '50'
    entry.detail = 'detalle de ejemplo 2'
    entry.entry_date = '2024-03-30'
    entry.save()

    # Verifica que se haya editado correctamente
    edited_entry = Entry.objects.get(id=entry.id)
    assert edited_entry.amount == 50
    assert edited_entry.detail == 'detalle de ejemplo 2'

    # Convierte la cadena '2024-03-30' a un objeto datetime.date
    expected_date = datetime.strptime('2024-03-30', '%Y-%m-%d').date()
    assert edited_entry.entry_date == expected_date


@pytest.mark.django_db
def test_delete_entry():
    # Crea una instancia de entrada
    entry = Entry.objects.create(
        amount='20',
        detail='detalle de ejemplo',
        entry_date='2024-03-18'
    )

    #Elimina la instancia
    entry.delete()

    #Verifica que se haya eliminado 
    assert Entry.objects.count() == 0


#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////