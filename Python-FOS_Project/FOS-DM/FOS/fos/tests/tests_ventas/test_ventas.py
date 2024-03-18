import pytest
from venta.models import *
from datetime import date,datetime


#Test modelo venta
@pytest.mark.django_db
def test_create_sale():
    # Crea una instancia de sale
    sale = Sale.objects.create(
        sale_date=date.today(),
        sale_amount=20,  
        sale_send='Hoy',
        unit_value=20000,  
        discount=5,  
        vat=15,  
        subtotal=380000,  
        total=437000  
    )

    # Verifica que la venta se haya creado correctamente
    assert sale is not None

@pytest.mark.django_db
def test_edit_sale():
    # Crea una instancia de sale
    sale = Sale.objects.create(
        sale_date=date.today(),
        sale_amount=20,
        sale_send='Hoy',
        unit_value=20000,
        discount=5,
        vat=15,
        subtotal=380000,
        total=437000
    )

    # Modifica la instancia de sale
    sale.sale_date = datetime.strptime('2024-03-30', '%Y-%m-%d').date()
    sale.sale_amount = 25
    sale.sale_send = 'Mañana'
    sale.unit_value = 30000
    sale.discount = 5
    sale.vat = 15
    sale.subtotal = 712500
    sale.total = 819375
    sale.save()

    # Verifica que la instancia se haya editado correctamente
    edited_sale = Sale.objects.get(id=sale.id)
    assert edited_sale.sale_date == datetime.strptime('2024-03-30', '%Y-%m-%d').date()


@pytest.mark.django_db
def test_delete_sale():
    # Crea una instancia de sale
    sale = Sale.objects.create(
        sale_date=date.today(),
        sale_amount=20,
        sale_send='Hoy',
        unit_value=20000,
        discount=5,
        vat=15,
        subtotal=380000,
        total=437000
    )

    # Elimina la instancia de City
    sale.delete()

    # Verifica que la instancia se haya eliminado correctamente
    assert Sale.objects.count() == 0
#/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



#Test estado producto
@pytest.mark.django_db
def test_create_product_status():
    # Crea una instancia
    status_p = Product_Status.objects.create(
        status = 'Estado ejemplo'
    )

    #Verifica que la instancia se haya creado correctamente
    assert Product_Status.objects.count() == 1
    assert status_p.status == 'Estado ejemplo'

@pytest.mark.django_db
def test_edit_product_status():
    # Crea una instancia
    status_p = Product_Status.objects.create(
        status = 'Estado ejemplo'
    )

    # Modifica la instancia de City
    status_p.status = 'Estado ejemplo 2'  
    status_p.save()

    # Verifica que la instancia se haya editado correctamente
    edited_status_p = Product_Status.objects.get(id=status_p.id)
    assert edited_status_p.status == 'Estado ejemplo 2'

@pytest.mark.django_db
def test_delete_product_status():
    # Crea una instancia
    status_p = Product_Status.objects.create(
        status = 'Estado ejemplo'
    )

    # Elimina la instancia de City
    status_p.delete()

    # Verifica que la instancia se haya eliminado correctamente
    assert Product_Status.objects.count() == 0

#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

