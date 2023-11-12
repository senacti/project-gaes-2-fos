from django.db import models

#Venta
class Sale(models.Model):
    id_sale = models.PositiveIntegerField(verbose_name="Id Venta")
    sale_date = models.DateField(verbose_name="Fecha Venta")
    sale_amount = models.PositiveIntegerField(verbose_name="Cantidad Venta")
    sale_send = models.CharField(max_length=50, verbose_name="Envio Venta")
    unit_value = models.PositiveIntegerField(verbose_name="Valor Unitario")
    discount = models.PositiveIntegerField(verbose_name="Descuento")
    vat = models.PositiveIntegerField(verbose_name="IVA")
    subtotal = models.PositiveIntegerField(verbose_name="Subtotal" )
    total = models.PositiveIntegerField(verbose_name="Total")

# Create your models here.
