"""from django.test import TestCase, Client
from django.contrib.auth import get_user_model
from django.contrib.auth import authenticate, login

class LoginViewTest(TestCase):

    def setUp(self):
        self.user = get_user_model().objects.create_user(
            username='daniel',
            password='Dark123456%'
        )
        self.client = Client()

    def test_login_successful(self):
        response = self.client.post('/login/', {
            'username': 'daniel',
            'password': 'Dark123456%',
        })
        self.assertEqual(response.status_code, 302)  
        self.assertRedirects(response, '/ventas/')  
        self.assertTrue(self.client.login(username='daniel', password='Dark123456%'))  # Verifica el inicio de sesión

    ""def test_login_unsuccessful(self):
        response = self.client.post('/login/', {
            'username': 'daniel',
        'password': 'Dark123456%',
        })

        self.assertEqual(response.status_code, 302)
        print(response.content)  # Imprime el contenido de la respuesta para inspeccionarlo
        self.assertContains(response, 'Usuario o contraseña incorrectos')  # Elimina el parámetro status_code""

    def test_login_view_rendered_correctly(self):
        response = self.client.get('/login/')
        self.assertEqual(response.status_code, 200)  
        self.assertTemplateUsed(response, 'login.html')
"""





