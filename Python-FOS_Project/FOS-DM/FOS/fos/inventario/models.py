from django.contrib.auth.models import User
from django.db import models
from venta.models import Product
from domicilios.models import City
from datetime import date
from django.core.validators import MinValueValidator, RegexValidator


# Estado proveedor
class Supplier_Status(models.Model):
    status_s = models.CharField(max_length=50, verbose_name="Estado Proveedor", validators=[RegexValidator(regex='^[a-zA-Z]*$', message='Solo se permiten letras.')])

    def __str__(self):
        return self.status_s
    
    class Meta:
        verbose_name = "Estado Proveedor"
        verbose_name_plural = "Estado Proveedores"
        db_table = "estado_proveedor"
        ordering = ['id']

# Entrada
class Entry(models.Model):
    amount = models.PositiveIntegerField(verbose_name="Cantidad")
    detail = models.CharField(max_length=50, verbose_name="Detalle")
    entry_date = models.DateField(verbose_name="Fecha Entrada", validators=[MinValueValidator(limit_value=date.today())])

    def __str__(self):
        return f"{self.amount}  - {self.detail} - {self.entry_date}"
    
    class Meta:
        verbose_name = "Entrada"
        verbose_name_plural = "Entradas"
        db_table = "entrada"
        ordering = ['id']

# Estado solicitud
class Request_Status(models.Model):
    status = models.CharField(max_length=20, verbose_name="Estado de soliciutd",  validators=[RegexValidator(regex='^[a-zA-Z]*$', message='Solo se permiten letras.')])

    def __str__(self):
        return self.status
    
    class Meta:
        verbose_name = "Estado Solicitud"
        verbose_name_plural = "Estado Solicitudes"
        db_table = "estado_solicitud"
        ordering = ['id']

# Empleado
class Employee(models.Model):
    employee = models.OneToOneField(User, on_delete=models.CASCADE, verbose_name="Empleado")

    def __str__(self):
        return self.employee.username
    
    class Meta:
        verbose_name = "Empleado"
        verbose_name_plural = "Empleados"
        db_table = "empleado"
        ordering =['id']

# Tipo empleado
class Employee_Type(models.Model):
    employee_type = models.CharField(max_length=20, verbose_name="Tipo Empleado",  validators=[RegexValidator(regex='^[a-zA-Z]*$', message='Solo se permiten letras.')])

    def __str__(self):
        return self.employee_type
    
    class Meta:
        verbose_name = "Tipo Empleado"
        verbose_name_plural = "Tipo Empleados"
        db_table = "tipo_empleado"
        ordering = ['id']

# Tiempo trabajo
class Work_Time(models.Model):
    timetable = models.CharField(max_length=20, verbose_name="Horario")
    days = models.CharField(max_length=20, verbose_name="Dias")

    def __str__(self):
        return f"{self.timetable} - {self.days}"
    
    class Meta:
        verbose_name = "Tiempo Trabajo"
        verbose_name_plural = "Tiempos Trabajo"
        db_table = "tiempo_trabajo"
        ordering = ['id']

#Salida
class Output(models.Model):
    output_amount = models.IntegerField(verbose_name="Cantidad Salida")
    detail = models.CharField(max_length=50, verbose_name="Detalle")
    output_date = models.DateTimeField(verbose_name="Fecha Salida", validators=[MinValueValidator(limit_value=date.today())])
    id_product = models.ForeignKey(Product, on_delete= models.CASCADE, verbose_name="Producto")

    def __str__(self):
        return f"{self.output_amount} - {self.detail} - {self.output_date} - {self.id_product}"
    
    class Meta: 
        verbose_name = "Salida"
        verbose_name_plural = "Salidas"
        db_table = "salida"
        ordering = ['id']

class Inventory(models.Model):
    stock = models.CharField(max_length=50, verbose_name="Stock")
    inventory_amount = models.PositiveIntegerField(verbose_name="Cantidad Inventario")
    minimum_amount = models.PositiveIntegerField(verbose_name="Cantidad Minima")
    cod_entry = models.ForeignKey(Entry, on_delete= models.CASCADE, verbose_name="Entrada")
    id_employee = models.ForeignKey(Employee, on_delete= models.CASCADE, verbose_name="Empleado")
    cod_output = models.ForeignKey(Output, on_delete= models.CASCADE, verbose_name="Salida")
    id_product = models.ForeignKey(Product, on_delete= models.CASCADE, verbose_name="Producto")

    def __str__(self):
        return f"{self.stock} - {self.inventory_amount} - {self.minimum_amount} - {self.cod_entry} - {self.id_employee} - {self.cod_output} - {self.id_product}"
    
    class Meta:
        verbose_name = "Inventario"
        verbose_name_plural = "Inventarios"
        db_table = "inventario"
        ordering = ['id']

#Solicitud producto
class Product_Request (models.Model):
    price_deliver = models.PositiveIntegerField(verbose_name="Precio Pedido")
    deliver_date = models.DateTimeField(verbose_name="Fecha Entrega", validators=[MinValueValidator(limit_value=date.today())])
    cod_status_s = models.ForeignKey(Request_Status, on_delete= models.CASCADE, verbose_name="Estado")
    id_employee = models.ForeignKey(Employee, on_delete= models.CASCADE, verbose_name="Empleado")

    def __str__(self):
        return f"{self.price_deliver} - {self.deliver_date} - {self.cod_status_s} - {self.id_employee}"
    
    class Meta:
        verbose_name = "Solicitud Producto"
        verbose_name_plural = "Solicitudes Productos"
        db_table = "solicitud_producto"
        ordering = ['id']

#proveedor
class Suplier(models.Model):
    nit = models.PositiveIntegerField(verbose_name="Nit")
    legal_representative_name = models.CharField(max_length=50, verbose_name="Nombre Representante Legal")
    phone = models.PositiveIntegerField(verbose_name="Telefono",
        validators=[RegexValidator(
            regex='^[0-9]{10,15}$',  
            message='Formato de teléfono no válido. Debe tener entre 10 y 15 dígitos.'
        )])
    id_solicitud_p = models.ForeignKey(Product_Request, on_delete= models.CASCADE, verbose_name="Solicitud producto")
    cod_status = models.ForeignKey(Supplier_Status, on_delete= models.CASCADE, verbose_name="Estado")
    cod_city = models.ForeignKey(City, on_delete= models.CASCADE, verbose_name="Ciudad")

    def __str__(self):
        return f"{self.nit} - {self.legal_representative_name} - {self.phone} - {self.id_solicitud_p} - {self.cod_status} - {self.cod_city}"
    
    class Meta:
        verbose_name = "Proveedor"
        verbose_name_plural = "Proveedores"
        db_table = "proveedor"
        ordering = ['id']
# Create your models here.



