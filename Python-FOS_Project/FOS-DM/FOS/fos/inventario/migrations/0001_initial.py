# Generated by Django 4.2.7 on 2023-11-29 01:14

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('venta', '0001_initial'),
        ('domicilios', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Employee',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('employee', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='Empleado')),
            ],
            options={
                'verbose_name': 'Empleado',
                'verbose_name_plural': 'Empleados',
                'db_table': 'empleado',
                'ordering': ['id'],
            },
        ),
        migrations.CreateModel(
            name='Employee_Type',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('employee_type', models.CharField(max_length=20, verbose_name='Tipo Empleado')),
            ],
            options={
                'verbose_name': 'Tipo Empleado',
                'verbose_name_plural': 'Tipo Empleados',
                'db_table': 'tipo_empleado',
                'ordering': ['id'],
            },
        ),
        migrations.CreateModel(
            name='Entry',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('amount', models.PositiveIntegerField(verbose_name='Cantidad')),
                ('detail', models.CharField(max_length=50, verbose_name='Detalle')),
                ('entry_date', models.DateField(verbose_name='Fecha Entrada')),
            ],
            options={
                'verbose_name': 'Entrada',
                'verbose_name_plural': 'Entradas',
                'db_table': 'entrada',
                'ordering': ['id'],
            },
        ),
        migrations.CreateModel(
            name='Product_Request',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('price_deliver', models.PositiveIntegerField(verbose_name='Precio Pedido')),
                ('deliver_date', models.DateTimeField(verbose_name='Fecha Entrega')),
            ],
            options={
                'verbose_name': 'Solicitud Producto',
                'verbose_name_plural': 'Solicitudes Productos',
                'db_table': 'solicitud_producto',
                'ordering': ['id'],
            },
        ),
        migrations.CreateModel(
            name='Request_Status',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(max_length=20, verbose_name='Estado de soliciutd')),
            ],
            options={
                'verbose_name': 'Estado Solicitud',
                'verbose_name_plural': 'Estado Solicitudes',
                'db_table': 'estado_solicitud',
                'ordering': ['id'],
            },
        ),
        migrations.CreateModel(
            name='Supplier_Status',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status_s', models.CharField(max_length=50, verbose_name='Estado Proveedor')),
            ],
            options={
                'verbose_name': 'Estado Proveedor',
                'verbose_name_plural': 'Estado Proveedores',
                'db_table': 'estado_proveedor',
                'ordering': ['id'],
            },
        ),
        migrations.CreateModel(
            name='Work_Time',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timetable', models.CharField(max_length=20, verbose_name='Horario')),
                ('days', models.CharField(max_length=20, verbose_name='Dias')),
            ],
            options={
                'verbose_name': 'Tiempo Trabajo',
                'verbose_name_plural': 'Tiempos Trabajo',
                'db_table': 'tiempo_trabajo',
                'ordering': ['id'],
            },
        ),
        migrations.CreateModel(
            name='Suplier',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nit', models.PositiveIntegerField(verbose_name='Nit')),
                ('legal_representative_name', models.CharField(max_length=50, verbose_name='Nombre Representante Legal')),
                ('phone', models.PositiveIntegerField(verbose_name='Telefono')),
                ('cod_city', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='domicilios.city', verbose_name='Ciudad')),
                ('cod_status', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='inventario.supplier_status', verbose_name='Estado')),
                ('id_solicitud_p', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='inventario.product_request', verbose_name='Solicitud producto')),
            ],
            options={
                'verbose_name': 'Proveedor',
                'verbose_name_plural': 'Proveedores',
                'db_table': 'proveedor',
                'ordering': ['id'],
            },
        ),
        migrations.AddField(
            model_name='product_request',
            name='cod_status_s',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='inventario.request_status', verbose_name='Estado'),
        ),
        migrations.AddField(
            model_name='product_request',
            name='id_employee',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='inventario.employee', verbose_name='Empleado'),
        ),
        migrations.CreateModel(
            name='Output',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('output_amount', models.IntegerField(verbose_name='Cantidad Salida')),
                ('detail', models.CharField(max_length=50, verbose_name='Detalle')),
                ('output_date', models.DateTimeField(verbose_name='Fecha Salida')),
                ('id_product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='venta.product', verbose_name='Producto')),
            ],
            options={
                'verbose_name': 'Salida',
                'verbose_name_plural': 'Salidas',
                'db_table': 'salida',
                'ordering': ['id'],
            },
        ),
        migrations.CreateModel(
            name='Inventory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('stock', models.CharField(max_length=50, verbose_name='Stock')),
                ('inventory_amount', models.PositiveIntegerField(verbose_name='Cantidad Inventario')),
                ('minimum_amount', models.PositiveIntegerField(verbose_name='Cantidad Minima')),
                ('cod_entry', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='inventario.entry', verbose_name='Entrada')),
                ('cod_output', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='inventario.output', verbose_name='Salida')),
                ('id_employee', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='inventario.employee', verbose_name='Empleado')),
                ('id_product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='venta.product', verbose_name='Producto')),
            ],
            options={
                'verbose_name': 'Inventario',
                'verbose_name_plural': 'Inventarios',
                'db_table': 'inventario',
                'ordering': ['id'],
            },
        ),
    ]
