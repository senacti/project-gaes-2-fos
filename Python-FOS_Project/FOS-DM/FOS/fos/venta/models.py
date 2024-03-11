from django.db import models
from datetime import date
from django.core.validators import MinValueValidator, RegexValidator, MaxValueValidator

#Venta
class Sale(models.Model):
    
    sale_date = models.DateField(verbose_name="Fecha Venta", validators=[MinValueValidator(limit_value=date.today())])
    sale_amount = models.PositiveIntegerField(verbose_name="Cantidad Venta")
    sale_send = models.CharField(max_length=50, verbose_name="Envio Venta")
    unit_value = models.PositiveIntegerField(verbose_name="Valor Unitario")
    discount = models.PositiveIntegerField(verbose_name="Descuento",validators=[MinValueValidator(limit_value=0), MaxValueValidator(limit_value=100)])
    vat = models.PositiveIntegerField(verbose_name="IVA", validators=[MinValueValidator(limit_value=0), MaxValueValidator(limit_value=100)])
    subtotal = models.PositiveIntegerField(verbose_name="Subtotal", editable=False )
    total = models.PositiveIntegerField(verbose_name="Total", editable=False)

    def save(self, *args, **kwargs):
        discount_amount = (self.unit_value * self.discount / 100) * self.sale_amount
        vat_amount = (self.unit_value * self.vat / 100) * self.sale_amount

        self.subtotal = (self.unit_value * self.sale_amount) - discount_amount + vat_amount
        self.total = self.subtotal

        super().save(*args, **kwargs)

    def __srt__(self):
        return self.sale_date
    
    class Meta:
        verbose_name = "Venta"
        verbose_name_plural = "Ventas"
        db_table = "venta"
        ordering = ['id']

# Estado producto
class Product_Status(models.Model):
    status = models.CharField(max_length=20, verbose_name="Estado producto", validators=[RegexValidator(regex='^[a-zA-Z]*$', message='Solo se permiten letras.')])

    def __str__(self):
        return self.status
    
    class Meta:
        verbose_name = "Estado Producto"
        verbose_name_plural = "Estado productos"
        db_table = "estado_producto"
        ordering = ['id']

# Categoria producto
class Product_Category(models.Model):
    category = models.CharField(max_length=50, verbose_name="Categoria producto", validators=[RegexValidator(regex='^[a-zA-Z]*$', message='Solo se permiten letras.')])

    def __str__(self):
        return self.category
    
    class Meta:
        verbose_name = "Categoria Producto"
        verbose_name_plural = "Categoria Productos"
        db_table = "categoria_producto"
        ordering = ['id']

#Producto
class Product(models.Model):
    product_name = models.CharField(max_length=50, verbose_name="Nombre Producto", validators=[RegexValidator(regex='^[a-zA-Z]*$', message='Solo se permiten letras.')])
    product_brand = models.CharField(max_length=50, verbose_name="Marca Producto", validators=[RegexValidator(regex='^[a-zA-Z]*$', message='Solo se permiten letras.')])
    product_amount = models.PositiveIntegerField(verbose_name="Cantidad Producto")
    fabrication_date = models.DateField(verbose_name="Fecha Fabricación", validators=[MinValueValidator(limit_value=date.today())])
    product_color = models.CharField(max_length=50, verbose_name="Color Producto")
    promotion = models.CharField(max_length=50, verbose_name="Promoción")
    discount= models.PositiveIntegerField(verbose_name="Descuento")
    Status_p = models.ForeignKey(Product_Status, on_delete= models.CASCADE, verbose_name="Estado producto")
    category_p = models.ForeignKey(Product_Category, on_delete= models.CASCADE, verbose_name="Categoria producto")

    def __str__(self):
        return f"{self.product_name} - {self.product_brand} - {self.product_amount} - {self.fabrication_date} - {self.product_color} - {self.promotion} - {self.discount} - {self.Status_p} - {self.category_p}"
    
    class Meta:
        verbose_name = "Producto"
        verbose_name_plural = "Productos"
        db_table = "producto"
        ordering = ['id']



# Create your models here.
