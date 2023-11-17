from django.db import models

#Venta
class Sale(models.Model):
    
    #Sale = models.PositiveIntegerField(verbose_name="Venta")
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

# Estado producto
class Product_Status(models.Model):
    status = models.CharField(max_length=20, verbose_name="Estado")

    def __str__(self):
        return self.status
    
    class Meta:
        verbose_name = "Estado Producto"
        verbose_name_plural = "Estado productos"
        db_table = "estado_producto"
        ordering = ['id']

# Categoria producto
class Product_Category(models.Model):
    category = models.CharField(max_length=50, verbose_name="Categoria")

    def __str__(self):
        return self.category
    
    class Meta:
        verbose_name = "Categoria Producto"
        verbose_name_plural = "Categoria Productos"
        db_table = "categoria_producto"
        ordering = ['id']

#Producto
class Product(models.Model):
    product_name = models.CharField(max_length=50, verbose_name="Nombre Producto")
    product_brand = models.CharField(max_length=50, verbose_name="Marca Producto")
    product_amount = models.PositiveIntegerField(verbose_name="Cantidad Producto")
    fabrication_date = models.DateField(verbose_name="Fecha Fabricación")
    product_color = models.CharField(max_length=50, verbose_name="Color Producto")
    promotion = models.CharField(max_length=50, verbose_name="Promoción")
    discount= models.PositiveIntegerField(verbose_name="Descuento")
    Status_p = models.ForeignKey(Product_Status, on_delete= models.CASCADE)
    category_p = models.ForeignKey(Product_Category, on_delete= models.CASCADE)

    def __str__(self):
        return f"{self.product_name} - {self.product_brand} - {self.product_amount} - {self.fabrication_date} - {self.product_color} - {self.promotion} - {self.discount} - {self.cod_Status_p} - {self.cod_category_p}"
    
    class Meta:
        verbose_name = "Producto"
        verbose_name_plural = "Productos"
        db_table = "producto"
        ordering = ['id']



# Create your models here.
