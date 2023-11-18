

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('venta', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cod_city', models.PositiveIntegerField(verbose_name='Codigo de Ciudad')),
                ('city', models.CharField(max_length=50, verbose_name='Ciudad')),
            ],
            options={
                'verbose_name': 'Ciudad',
                'verbose_name_plural': 'Ciudades',
                'db_table': 'ciudad',
                'ordering': ['id'],
            },
        ),
        migrations.CreateModel(
            name='Domicile_Status',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('statud_d', models.CharField(max_length=20, verbose_name='Estado Domicilio')),
            ],
            options={
                'verbose_name': 'Estado Domicilio',
                'verbose_name_plural': 'Estado Domicilios',
                'db_table': 'estado_domicilio',
                'ordering': ['id'],
            },
        ),
        migrations.CreateModel(
            name='Domicile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('guide_number', models.PositiveIntegerField(verbose_name='Numero Guia')),
                ('date', models.DateField(verbose_name='Fecha')),
                ('direction', models.CharField(max_length=50, verbose_name='Dirección')),
                ('city', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='domiciles', to='domicilios.city', verbose_name='Ciudad')),
                ('cod_status_domicile', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='domiciles', to='domicilios.domicile_status', verbose_name='Estado del domicilio')),
                ('sale', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='venta.sale', verbose_name='Venta')),
            ],
            options={
                'verbose_name': 'Domicilio',
                'verbose_name_plural': 'Domicilios',
                'db_table': 'domicilio',
                'ordering': ['id'],
            },
        ),
        migrations.CreateModel(
            name='Company_Transportation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('company_nit', models.PositiveIntegerField(verbose_name='Nit Empresa')),
                ('date_domicile', models.DateField(verbose_name='Fecha Entrega')),
                ('id_domicile', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='domicilios.domicile', verbose_name='Domicilio')),
            ],
            options={
                'verbose_name': 'Empresa Trasportadora',
                'verbose_name_plural': 'Empresas Transportadoras',
                'db_table': 'empresa_transportadora',
                'ordering': ['id'],
            },
        ),
    ]
