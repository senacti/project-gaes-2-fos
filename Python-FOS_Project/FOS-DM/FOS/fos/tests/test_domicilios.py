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
