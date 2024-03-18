import pytest
from datetime import date, timezone
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
def test_create_domicile_status():
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

@pytest.fixture
def create_city():
    # Crear un objeto de ciudad para usarlo en las pruebas
    city = City.objects.create(cod_city=1, city="Ciudad Ejemplo")
    yield city
    # Limpiar después de las pruebas
    city.delete()

@pytest.fixture
def create_domicile_status():
    # Crear un objeto de estado de domicilio para usarlo en las pruebas
    domicile_status = Domicile_Status.objects.create(status_d="Entregado")
    yield domicile_status
    # Limpiar después de las pruebas
    domicile_status.delete()

@pytest.fixture
def create_sale():
    # Crear un objeto de venta para usarlo en las pruebas
    sale = Sale.objects.create(sale_date=date.today(),
        sale_amount=100,
        sale_send="Envio Venta",
        unit_value=21000,
        discount=15,
        vat=19)
    yield sale
    # Limpiar después de las pruebas
    sale.delete()

@pytest.mark.django_db
def test_create_domicile(create_city, create_domicile_status, create_sale):
    # Crear una instancia de Domicile
    domicile = Domicile.objects.create(
        date=date.today(),
        direction="Dirección de ejemplo",
        city=create_city,
        cod_status_domicile=create_domicile_status,
        sale=create_sale
    )

    # Verificar que se haya creado correctamente
    assert domicile is not None

@pytest.mark.django_db
def test_edit_domicile(create_city, create_domicile_status, create_sale):
    # Crear una instancia de Domicile
    domicile = Domicile.objects.create(
        date=date.today(),
        direction="Dirección de ejemplo",
        city=create_city,
        cod_status_domicile=create_domicile_status,
        sale=create_sale
    )

    # Modificar la dirección del domicilio
    new_direction = "Nueva Dirección"
    domicile.direction = new_direction
    domicile.save()

    # Verificar que la edición se realizó correctamente
    updated_domicile = Domicile.objects.get(pk=domicile.pk)
    assert updated_domicile.direction == new_direction

@pytest.mark.django_db
def test_delete_domicile(create_city, create_domicile_status, create_sale):
    # Crear una instancia de Domicile
    domicile = Domicile.objects.create(
        date=date.today(),
        direction="Dirección de ejemplo",
        city=create_city,
        cod_status_domicile=create_domicile_status,
        sale=create_sale
    )

    # Eliminar la instancia de Domicile
    domicile.delete()

    # Verificar que se haya eliminado correctamente
    with pytest.raises(Domicile.DoesNotExist):
        Domicile.objects.get(pk=domicile.pk)



#/////////////////Fin Test modelo domicilio///////////////////////////////////////
    


#/////////////////Test modelo Empresa transportadora//////////////////////////


@pytest.fixture
def create_domicile(create_city, create_domicile_status, create_sale):
    # Crear un objeto de domicilio para usarlo en las pruebas
    domicile = Domicile.objects.create(
        date=date.today(),
        direction="Dirección de ejemplo",
        city=create_city,  # Aquí se invoca la función para obtener una instancia de City
        cod_status_domicile=create_domicile_status,
        sale=create_sale
    )
    yield domicile
    # Limpiar después de las pruebas
    domicile.delete()

@pytest.fixture
def create_company_transportation(create_domicile):
    # Crear una instancia de Company_Transportation para usarlo en las pruebas
    company_transportation = Company_Transportation.objects.create(
        company_nit=1234567890,
        company_name="Nombre Empresa",
        date_domicile=date.today(),
        id_domicile=create_domicile
    )
    yield company_transportation
    # Limpiar después de las pruebas
    company_transportation.delete()

@pytest.mark.django_db
def test_edit_company_transportation(create_company_transportation, create_domicile):
    # Editar la instancia de Company_Transportation
    company_transportation = create_company_transportation
    new_company_name = "Nuevo Nombre"
    company_transportation.company_name = new_company_name
    company_transportation.save()

    # Verificar que la edición se realizó correctamente
    updated_company_transportation = Company_Transportation.objects.get(pk=company_transportation.pk)
    assert updated_company_transportation.company_name == new_company_name




