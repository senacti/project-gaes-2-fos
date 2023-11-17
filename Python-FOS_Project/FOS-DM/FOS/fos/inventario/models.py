from django.db import models
from venta.models import Product
from domicilios.models import City

# Estado proveedor
class Supplier_Status(models.Model):
    status_s = models.CharField(max_length=50, verbose_name="Estado P")

    def __str__(self):
        return self.status_s
    
    class Meta:
        verbose_name = "Estado Proveedor"
        verbose_name_plural = "Estado Proveedores"
        db_table = "estado_proveedor"
        ordering = ['id']

# Entrada
class Entry(models.Model):
    cod_entry = models.PositiveIntegerField(verbose_name="Codigo Entrada")
    amount = models.PositiveIntegerField(verbose_name="Cantidad")
    detail = models.CharField(max_length=50, verbose_name="Detalle")
    entry_date = models.DateField(verbose_name="Fecha Entrada")

    def __str__(self):
        return f"{self.cod_entry} - {self.amount}  - {self.detail} - {self.entry_date}"
    
    class Meta:
        verbose_name = "Entrada"
        verbose_name_plural = "Entradas"
        db_table = "entrada"
        ordering = ['id']

# Estado solicitud
class Request_Status(models.Model):
    cod_status_s = models.PositiveIntegerField(verbose_name="Cod Estado S")
    status = models.CharField(max_length=20, verbose_name="Estado")

    def __str__(self):
        return f"{self.cod_status_s} - {self.status}"
    
    class Meta:
        verbose_name = "Estado Solicitud"
        verbose_name_plural = "Estado Solicitudes"
        db_table = "estado_solicitud"
        ordering = ['id']

# Empleado
class Employee(models.Model):
    id_employee = models.PositiveIntegerField(verbose_name="Id Empleado")
    employee = models.CharField(max_length=50, verbose_name="Empleado")

    def __str__(self):
        return f"{self.id_employee} - {self.employee}"
    
    class Meta:
        verbose_name = "Empleado"
        verbose_name_plural = "Empleados"
        db_table = "empleado"
        ordering =['id']

# Tipo empleado
class Employee_Type(models.Model):
    cod_t_e = models.PositiveIntegerField(verbose_name="Cod Tipo Empleado")
    employee_type = models.CharField(max_length=20, verbose_name="Tipo Empleado")

    def __str__(self):
        return f"{self.cod_t_e} - {self.employee_type}"
    
    class Meta:
        verbose_name = "Tipo Empleado"
        verbose_name_plural = "Tipo Empleados"
        db_table = "tipo_empleado"
        ordering = ['id']

# Tiempo trabajo
class Work_Time(models.Model):
    cod_work_time = models.PositiveIntegerField(verbose_name="Cod Tiempo Trabajo")
    timetable = models.CharField(max_length=20, verbose_name="Horario")
    days = models.CharField(max_length=20, verbose_name="Dias")

    def __str__(self):
        return f"{self.cod_work_time} - {self.timetable} - {self.days}"
    
    class Meta:
        verbose_name = "Tiempo Trabajo"
        verbose_name_plural = "Tiempos Trabajo"
        db_table = "tiempo_trabajo"
        ordering = ['id']

#Salida
class Output(models.Model):
    cod_output = models.PositiveIntegerField(verbose_name="Cod Salida")
    output_amount = models.IntegerField(verbose_name="Cantidad Salida")
    detail = models.CharField(max_length=50, verbose_name="Detalle")
    output_date = models.DateTimeField(verbose_name="Fecha Salida")
    id_product = models.ForeignKey(Product, on_delete= models.CASCADE)

    def __str__(self):
        return f"{self.cod_output} - {self.output_amount} - {self.detail} - {self.output_date} - {self.id_product}"
    
    class Meta: 
        verbose_name = "Salida"
        verbose_name_plural = "Salidas"
        db_table = "salida"
        ordering = ['id']

class Inventory(models.Model):
    id_inventory = models.PositiveIntegerField(verbose_name="Id Inventario")
    stock = models.CharField(max_length=50, verbose_name="Stock")
    inventory_amount = models.PositiveIntegerField(verbose_name="Cantidad Inventario")
    minimum_amount = models.PositiveIntegerField(verbose_name="Cantidad Minima")
    cod_entry = models.ForeignKey(Entry, on_delete= models.CASCADE)
    id_employee = models.ForeignKey(Employee, on_delete= models.CASCADE)
    cod_output = models.ForeignKey(Output, on_delete= models.CASCADE)
    id_product = models.ForeignKey(Product, on_delete= models.CASCADE)

    def __str__(self):
        return f"{self.id_inventory} - {self.stock} - {self.inventory_amount} - {self.minimum_amount} - {self.cod_entry} - {self.id_employee} - {self.cod_output} - {self.id_product}"
    
    class Meta:
        verbose_name = "Inventario"
        verbose_name_plural = "Inventarios"
        db_table = "inventario"
        ordering = ['id']

#Solicitud producto
class Product_Request (models.Model):
    id_request_p = models.PositiveIntegerField(verbose_name="Id Solicitud P")
    price_deliver = models.PositiveIntegerField(verbose_name="Precio Pedido")
    deliver_date = models.DateTimeField(verbose_name="Fecha Entrega")
    cod_status_s = models.ForeignKey(Request_Status, on_delete= models.CASCADE)
    id_employee = models.ForeignKey(Employee, on_delete= models.CASCADE)

    def __str__(self):
        return f"{self.id_request_p} - {self.price_deliver} - {self.deliver_date} - {self.cod_status_s} - {self.id_employee}"
    
    class Meta:
        verbose_name = "Solicitud Producto"
        verbose_name_plural = "Solicitudes Productos"
        db_table = "solicitud_producto"
        ordering = ['id']

#proveedor
class Suplier(models.Model):
    id_supplier = models.PositiveIntegerField(verbose_name="Id Proveedor")
    nit = models.PositiveIntegerField(verbose_name="Nit")
    legal_representative_name = models.CharField(max_length=50, verbose_name="Nombre Representante Legal")
    phone = models.PositiveIntegerField(verbose_name="Telefono")
    id_solicitud_p = models.ForeignKey(Product_Request, on_delete= models.CASCADE)
    cod_status = models.ForeignKey(Supplier_Status, on_delete= models.CASCADE)
    cod_city = models.ForeignKey(City, on_delete= models.CASCADE)

    def __str__(self):
        return f"{self.id_supplier} - {self.nit} - {self.legal_representative_name} - {self.phone} - {self.id_solicitud_p} - {self.cod_status} - {self.cod_city}"
    
    class Meta:
        verbose_name = "Proveedor"
        verbose_name_plural = "Proveedores"
        db_table = "proveedor"
        ordering = ['id']
# Create your models here.
