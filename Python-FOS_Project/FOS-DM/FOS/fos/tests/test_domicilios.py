import pytest
from datetime import date
from venta.models import Sale
from domicilios.models import *

#//////////// test modelo ciudad///////////////////////

@pytest.mark.django_db
def test_create_city():
    # Crea una instancia de City
    city = City.objects.create(
        cod_city='8',
        city="Example City"
        )

    #Verifica que la instancia se haya creado correctamente
    assert City.objects.count() == 1
    assert city.cod_city == '8'
    assert city.city == "Example City"

@pytest.mark.django_db
def test_city_str_method():
    # Crea una instancia de City
    city = City.objects.create(
        cod_city=1,
        city="Example City"
    )

    # Verifica que el método __str__ devuelve el formato esperado
    assert str(city) == "1 - Example City"

@pytest.mark.django_db
def test_edit_city():
    # Crea una instancia de City
    city = City.objects.create(
        cod_city='8',
        city="Example City"
    )

    # Modifica la instancia de City
    city.cod_city = 9  
    city.city = "Updated City"
    city.save()

    # Verifica que la instancia se haya editado correctamente
    edited_city = City.objects.get(id=city.id)
    assert edited_city.cod_city == 9  
    assert edited_city.city == "Updated City"

@pytest.mark.django_db
def test_delete_city():
    # Crea una instancia de City
    city = City.objects.create(
        cod_city='8',
        city="Example City"
    )

    # Elimina la instancia de City
    city.delete()

    # Verifica que la instancia se haya eliminado correctamente
    assert City.objects.count() == 0

#//////////// fin test modelo ciudad///////////////////////

#/////////// test modelo estado domicilio ////////////////

@pytest.mark.django_db
def test_create_domicile_estatus():
    #crea una instancia de domicilio estado
    domicile = Domicile_Status.objects.create(
        status_d = "Entregado"
    )

    #verifica que la instancia se haya creado correctamente
    assert Domicile_Status.objects.count() == 1
    assert domicile.status_d == "Entregado"

@pytest.mark.django_db
def test_edit_domicile_status():
    #crea una instancia

    domicile = Domicile_Status.objects.create(
        status_d = "Entregado"
    )

    #modifica la instancia
    domicile.status_d = "Cancelado"
    domicile.save()

    #Verifica que se haya editado correctamente
    edited_status = Domicile_Status.objects.get(id=domicile.id)
    assert edited_status.status_d == "Cancelado"

@pytest.mark.django_db
def test_delete_domicile_status():
    #crea una instancia

    domicile = Domicile_Status.objects.create(
        status_d = "Entregado"
    )

    #Elimina la instancia
    domicile.delete()

    #Verifica que se haya eliminado correctamente
    assert Domicile_Status.objects.count() == 0

#/////////// fin test modelo estado domicilio ////////////////
    
#///////////  test modelo domicilio ////////////////
    
@pytest.mark.django_db
def test_create_domicile():
    # Crea instancias de modelos relacionados
    city = City.objects.create(cod_city=1, city="Ciudad Ejemplo")
    status_domicile = Domicile_Status.objects.create(status_d="Entregado")
    
    # Crear una instancia de Sale con un valor para sale_amount
    sale = Sale.objects.create(
        sale_date="2024-03-07",  
        sale_amount=100,  
        sale_send="Envio venta",  
        unit_value="21000",
        discount="15",
        vat="19",
        subtotal="21241",
        total="21241"
    )

    # Crea una instancia de Domicile con valores específicos
    domicile = Domicile.objects.create(
        date=date.today(),
        direction="Dirección de ejemplo",
        city=city,
        cod_status_domicile=status_domicile,
        sale=sale  
    )

    # Verifica que la instancia se haya creado correctamente
    assert Domicile.objects.exists(), "No se creó la instancia de Domicile"
    assert domicile.date == date.today(), f"La fecha es {domicile.date}, se esperaba {date.today()}"
    assert domicile.direction == "Dirección de ejemplo", "La dirección no coincide"
    assert domicile.city == city, "La ciudad no coincide"
    assert domicile.cod_status_domicile == status_domicile, "El estado del domicilio no coincide"
    assert domicile.sale == sale, "La venta no coincide"



#/////////////////Test modelo domicilio///////////////////////////////////////
    


#/////////////////Test modelo Empresa transportadora//////////////////////////
@pytest.mark.django_db
def test_create_empresa_transportadora():
    #crear instancia
    company = Company_Transportation.objects.create(
        company_nit = '233344556',
        date_domicile = '2024-03-07',
        id_domicile = ''
    )

"""@pytest.mark.django_db
def test_create_city():
    # Crea una instancia de City
    city = City.objects.create(
        cod_city='8',
        city="Example City"
        )

    #Verifica que la instancia se haya creado correctamente
    assert City.objects.count() == 1
    assert city.cod_city == '8'
    assert city.city == "Example City"

@pytest.mark.django_db
def test_city_str_method():
    # Crea una instancia de City
    city = City.objects.create(
        cod_city=1,
        city="Example City"
    )"""




