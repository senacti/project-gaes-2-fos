"""from django.test import TestCase
import pytest
from datetime import date
from domicilios.models import Domicile, City, Domicile_Status, Sale

@pytest.mark.django_db
def test_domicile_creation():
    # Crea objetos City, Domicile_Status y Sale necesarios para el test
    city = City.objects.create(name="Ciudad de Prueba")
    status_domicile = Domicile_Status.objects.create(status_d="En tránsito")
    sale = Sale.objects.create(total=100)

    # Crea un objeto Domicile
    domicile = Domicile.objects.create(
        date=date.today(),
        direction="Calle de Prueba",
        city=city,
        cod_status_domicile=status_domicile,
        sale=sale
    )

    # Verifica que el objeto Domicile se haya creado correctamente
    assert domicile.date == date.today()
    assert domicile.direction == "Calle de Prueba"
    assert domicile.city == city
    assert domicile.cod_status_domicile == status_domicile
    assert domicile.sale == sale

    # Verifica el método __str__
    expected_str = f"{date.today()} - {status_domicile}"
    assert str(domicile) == expected_str



# Create your tests here."""
