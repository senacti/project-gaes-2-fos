from django.db import models

#Ciudad
class City(models.Model):
    cod_city = models.PositiveIntegerField(verbose_name="Codigo de Ciudad")
    city = models.CharField(max_length=50, verbose_name="Ciudad")

    def __str__(self):
        return f"{self.cod_city} - {self.city}"
    
    class Meta:
        verbose_name = "Ciudad"
        verbose_name_plural = "Ciudades"
        db_table = "ciudad"
        ordering = ['id']

# Estado domicilio
class Domicile_Status(models.Model):
    statud_d = models.CharField(max_length=20, verbose_name="Estado D")

    def __str__(self):
        return self.statud_d
    
    class Meta:
        verbose_name = "Estado Domicilio"
        verbose_name_plural = "Estado Domicilios"
        db_table = "estado_domicilio"
        ordering = ['id']

#Domicilio
class Domicile(models.Model):
    guide_number = models.PositiveIntegerField(verbose_name="Numero Guia")
    date = models.DateField(verbose_name="Fecha")
    direction = models.CharField(max_length=50, verbose_name="Dirección")
    city = models.ForeignKey(City, on_delete=models.CASCADE, related_name='domiciles')
    cod_status_domicile = models.ForeignKey(Domicile_Status, on_delete=models.CASCADE, related_name='domiciles')

    def __str__(self):
        return f"{self.guide_number} - {self.date} - {self.direction} - {self.city} - {self.cod_status_domicile}" #- {self.id_sale} - {self.id_client}"

    class Meta:
        verbose_name = "Domicilio"
        verbose_name_plural = "Domicilios"
        db_table = "domicilio"
        ordering = ['id']

#Empresa transportadora
class Company_Transportation(models.Model):
    company_nit = models.PositiveIntegerField(verbose_name="Nit Empresa")
    date_domicile = models.DateField( verbose_name="Fecha Entrega")
    id_domicile = models.ForeignKey(Domicile, on_delete= models.CASCADE)

    def __str__(self):
        return f"{self.company_nit} - {self.date_domicile} , {self.id_domicile}"
    
    class Meta: 
        verbose_name = "Empresa Trasportadora"
        verbose_name_plural = "Empresas Transportadoras"
        db_table = "empresa_transportadora"
        ordering = ['id']
# Create your models here.
