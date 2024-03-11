from django.db import models
from venta.models import Sale
from datetime import date
from django.core.validators import MinValueValidator, RegexValidator

#Ciudad
class City(models.Model):
    cod_city = models.PositiveIntegerField( verbose_name="Codigo de Ciudad")
    city = models.CharField(max_length=50, verbose_name="Ciudad", validators=[RegexValidator(regex='^[a-zA-Z]*$', message='Solo se permiten letras.')])

    def __str__(self):
        return f"{self.cod_city} - {self.city}"
    
    class Meta:
        verbose_name = "Ciudad"
        verbose_name_plural = "Ciudades"
        db_table = "ciudad"
        ordering = ['id']

# Estado domicilio
class Domicile_Status(models.Model):
    status_d = models.CharField(max_length=20, verbose_name="Estado Domicilio")

    def __str__(self):
        return self.status_d
    
    class Meta:
        verbose_name = "Estado Domicilio"
        verbose_name_plural = "Estado Domicilios"
        db_table = "estado_domicilio"
        ordering = ['id']

#Domicilio
class Domicile(models.Model):
    date = models.DateField(verbose_name="Fecha", validators=[MinValueValidator(limit_value=date.today())])
    direction = models.CharField(max_length=50, verbose_name="Dirección")
    city = models.ForeignKey(City, on_delete=models.CASCADE, related_name='domiciles', verbose_name="Ciudad")
    cod_status_domicile = models.ForeignKey(Domicile_Status, on_delete=models.CASCADE, related_name='domiciles', verbose_name="Estado del domicilio")
    sale = models.ForeignKey(Sale, on_delete= models.CASCADE, verbose_name="Venta")
    def __str__(self):
        return f"{self.date} - {self.cod_status_domicile} " #- {self.id_client}"

    class Meta:
        verbose_name = "Domicilio"
        verbose_name_plural = "Domicilios"
        db_table = "domicilio"
        ordering = ['id']

#Empresa transportadora
class Company_Transportation(models.Model):
    company_nit = models.PositiveIntegerField(verbose_name="Nit Empresa")
    date_domicile = models.DateField( verbose_name="Fecha Entrega", validators=[MinValueValidator(limit_value=date.today())])
    id_domicile = models.ForeignKey(Domicile, on_delete= models.CASCADE, verbose_name="Domicilio")

    def __str__(self):
        return f"{self.company_nit} - {self.date_domicile} , {self.id_domicile}"
    
    class Meta: 
        verbose_name = "Empresa Trasportadora"
        verbose_name_plural = "Empresas Transportadoras"
        db_table = "empresa_transportadora"
        ordering = ['id']





# Create your models here.
        





