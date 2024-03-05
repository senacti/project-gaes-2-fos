import os
import pymysql
pymysql.install_as_MySQLdb()


BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

SQLITE = {
    'default':{
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3')
    }
}




PYMYSQL = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'fosdef',
        'USER': 'fos_admin',
        'PASSWORD': 'Daniel.Marin.12',
        'HOST': 'fosdb.mysql.database.azure.com',  
        'PORT': '3306',
        'OPTIONS': {'init_command': "SET sql_mode='STRICT_TRANS_TABLES'"},
    }
}

PYMYSQLAZU = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'fosdef',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',  
        'PORT': '3306',
    }
}