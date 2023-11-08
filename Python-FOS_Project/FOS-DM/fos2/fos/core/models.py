from django.db import models

##Sin foraneas 

# cliente
class Client(models.Model):
    id = models.PositiveIntegerField(verbose_name="Id Cliente", primary_key=True)

    def __str__(self):
        return (self.id)
    
    class Meta:
        verbose_name = "Cliente"
        verbose_name_plural = "Clientes"
        db_table = "cliente"
        ordering = ['id']

#Ciudad
class City(models.Model):
    cod_city = models.PositiveIntegerField(verbose_name="Cod Ciudad")
    city = models.CharField(max_length=50, verbose_name="Ciudad")

    def __str__(self):
        return f"{self.cod_city} - {self.city}"
    
    class Meta:
        verbose_name = "Ciudad"
        verbose_name_plural = "Ciudades"
        db_table = "ciudad"
        ordering = ['id']

# Estado proveedor
class Supplier_Status(models.Model):
    cod_status = models.PositiveIntegerField(verbose_name="Cod Proveedor")
    status_s = models.CharField(max_length=50, verbose_name="Estado P")

    def __str__(self):
        return f"{self.cod_status} - {self.status_s}"
    
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

# Estado domicilio
class Domicile_Status(models.Model):
    cod_status_d = models.PositiveIntegerField(verbose_name="Cod Estado D")
    statud_d = models.CharField(max_length=20, verbose_name="Estado D")

    def __str__(self):
        return f"{self.cod_status_d} - {self.statud_d}"
    
    class Meta:
        verbose_name = "Estado Domicilio"
        verbose_name_plural = "Estado Domicilios"
        db_table = "estado_domicilio"
        ordering = ['id']

# Estado producto
class Product_Status(models.Model):
    cod_status_p = models.PositiveIntegerField(verbose_name="Cod Estado P")
    status = models.CharField(max_length=20, verbose_name="Estado")

    def __str__(self):
        return f"{self.cod_status_p} - {self.status}"
    
    class Meta:
        verbose_name = "Estado Producto"
        verbose_name_plural = "Estado productos"
        db_table = "estado_producto"
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

# Categoria producto
class Product_Category(models.Model):
    cod_category_p = models.PositiveIntegerField(verbose_name="Cod Categoria P")
    category = models.CharField(max_length=50, verbose_name="Categoria")

    def __str__(self):
        return f"{self.cod_category_p} - {self.category}"
    
    class Meta:
        verbose_name = "Categoria Producto"
        verbose_name_plural = "Categoria Productos"
        db_table = "categoria_producto"
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


#Con foraneas

#Producto
class Product(models.Model):
    id_product = models.PositiveIntegerField(verbose_name="Id_Producto")
    product_name = models.CharField(max_length=50, verbose_name="Nombre Producto")
    product_brand = models.CharField(max_length=50, verbose_name="Marca Producto")
    product_amount = models.PositiveIntegerField(verbose_name="Cantidad Producto")
    fabrication_date = models.DateField(verbose_name="Fecha Fabricación")
    product_color = models.CharField(max_length=50, verbose_name="Color Producto")
    promotion = models.CharField(max_length=50, verbose_name="Promoción")
    discount= models.PositiveIntegerField(verbose_name="Descuento")
    cod_Status_p = models.ForeignKey(Product_Status, on_delete= models.CASCADE)
    cod_category_p = models.ForeignKey(Product_Category, on_delete= models.CASCADE)

    def __str__(self):
        return f"{self.id_product} - {self.product_name} - {self.product_brand} - {self.product_amount} - {self.fabrication_date} - {self.product_color} - {self.promotion} - {self.discount} - {self.cod_Status_p} - {self.cod_category_p}"
    
    class Meta:
        verbose_name = "Producto"
        verbose_name_plural = "Productos"
        db_table = "producto"
        ordering = ['id']

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
    id_product = models.ForeignKey(Product, on_delete= models.CASCADE)
    id_cliente = models.ForeignKey(Client, on_delete= models.CASCADE)

    def __str__(self):
        return f"{self.id_sale} - {self.sale_date} - {self.sale_amount} - {self.sale_send} - {self.unit_value} - {self.discount} - {self.vat} - {self.subtotal} - {self.total} - {self.id_product} - {self.id_cliente}"
    
    class Meta: 
        verbose_name = "Venta"
        verbose_name_plural = "Ventas"
        db_table = "venta"
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

#Inventario
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

#Domicilio
class Domicile(models.Model):
    id_domicile = models.PositiveIntegerField(verbose_name="Id Domicilio")
    guide_number = models.PositiveIntegerField(verbose_name="Numero Guia")
    date = models.DateField(verbose_name="Fecha")
    direction = models.CharField(max_length=50, verbose_name="Dirección")
    cod_status_domicile = models.ForeignKey(Domicile_Status, on_delete= models.CASCADE)
    id_sale = models.ForeignKey(Sale, on_delete= models.CASCADE)
    id_client = models.ForeignKey(Client, on_delete= models.CASCADE)

    def __str__(self):
        return f"{self.id_domicile} - {self.guide_number} - {self.date} - {self.direction} - {self.cod_status_domicile} - {self.id_sale} - {self.id_client}"
    
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

#Actividades
class Activities(models.Model):
    cod_activities = models.PositiveIntegerField(verbose_name="Cod_Actividades")
    name = models.CharField(max_length=20, verbose_name="Nombre")
    state = models.CharField(max_length=50, verbose_name="Estado")
    time_dt = models.DateTimeField(verbose_name="Tiempo Dt")
    cod_t_e = models.ForeignKey(Employee_Type, on_delete= models.CASCADE)

    def __str__(self):
        return f"{self.cod_activities} - {self.name} - {self.state} - {self.time_dt} - {self.cod_t_e}"
    
    class Meta:
        verbose_name = "Actividades"
        verbose_name_plural = "Actividades"
        db_table = "actividades"
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

#Tipo CLiente
class Client_Type(models.Model):
    cod_client_type = models.PositiveIntegerField(verbose_name="Cod Tipo Cliente")
    client_type = models.CharField(max_length=50, verbose_name="Tipo Cliente")
    id_client = models.ForeignKey(Client, on_delete= models.CASCADE)

    def __str__(self):
        return f"{self.cod_client_type} - {self.client_type} - {self.id_client}"
    
    class Meta:
        verbose_name = "Cliente"
        verbose_name_plural = "Clientes"
        db_table = "Cliente"
        ordering = ['id']
