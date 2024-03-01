"""
import pytest
from django.db.utils import IntegrityError
from fos.domicilios.models import City

@pytest.mark.django_db
def test_create_city():
    city = City.objects.create(cod_city=1, city='Example City')
    assert city.cod_city == 1
    assert city.city == 'Example City'

@pytest.mark.django_db
def test_city_str_representation():
    city = City.objects.create(cod_city=1, city='Example City')
    assert str(city) == '1 - Example City'"""

import pytest
from django.db import IntegrityError
from venta.models import Sale
from domicilios.models import City

@pytest.mark.django_db
def test_create_city():
    # Crea una instancia de City
    city = City.objects.create(
        cod_city=1,
        city="Example City"
    )

    # Verifica que la instancia se haya creado correctamente
    assert City.objects.count() == 1
    assert city.cod_city == 1
    assert city.city == "Example City"

    # Intenta crear otra ciudad con el mismo código (debería generar un error de integridad)
    with pytest.raises(IntegrityError):
        City.objects.create(
            cod_city=1,
            city="Another City"
        )

@pytest.mark.django_db
def test_city_str_method():
    # Crea una instancia de City
    city = City.objects.create(
        cod_city=1,
        city="Example City"
    )

    # Verifica que el método __str__ devuelve el formato esperado
    assert str(city) == "1 - Example City"
