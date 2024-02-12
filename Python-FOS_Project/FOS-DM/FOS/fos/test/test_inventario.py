import pytest

from inventario.models import Entry

@pytest.mark.django_db
def test_add_product():
    amount =  "10"
    detail = "Rojos"
    entry_date = "1544"