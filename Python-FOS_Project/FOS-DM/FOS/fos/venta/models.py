from django.db import models

#Venta
class Sale(models.Model):
    sale_date = models.DateField(verbose_name="Fecha Venta")
    sale_amount = models.PositiveIntegerField(verbose_name="Cantidad Venta")
    sale_send = models.CharField(max_length=50, verbose_name="Envio Venta")
    unit_value = models.PositiveIntegerField(verbose_name="Valor Unitario")
    discount = models.PositiveIntegerField(verbose_name="Descuento")
    vat = models.PositiveIntegerField(verbose_name="IVA")
    subtotal = models.PositiveIntegerField(verbose_name="Subtotal" )
    total = models.PositiveIntegerField(verbose_name="Total")

    def __srt__(self):
        return f'{self.sale_date} - {self.sale_amount} - {self.sale_send} - {self.unit_value} - {self.discount} - {self.vat} - {self.subtotal} - {self.total}'
    
    class Meta:
        verbose_name = "Venta"
        verbose_name_plural = "Ventas"
        db_table = "venta"
        ordering = ['id']

# Create your models here.
