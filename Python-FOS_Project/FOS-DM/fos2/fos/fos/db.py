import os
import mysql.connector


BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

SQLITE = {
    'default':{
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3')
    }
}


conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='',
    database='fosdef'
)

MySQL =  {
    'default': {
        'ENGINE': 'mysql.connector.django',
        'HOST': 'localhost',
        'USER': 'root',
        'PASSWORD': '',
        'NAME': 'fosdef',
    }
}
