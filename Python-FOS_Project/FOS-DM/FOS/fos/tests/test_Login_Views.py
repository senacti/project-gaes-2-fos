import pytest



from django.test import TestCase, Client
from django.urls import reverse
from django.contrib.auth.models import User

class LoginViewTest(TestCase):
    def setUp(self):
        self.client = Client()
        self.login_url = reverse('login')
        self.user_data = {
            'username': 'testuser',
            'password': 'testpassword',
        }
        self.user = User.objects.create_user(**self.user_data)

    def test_login_successful(self):
        response = self.client.post(self.login_url, self.user_data, follow=True)
        self.assertTrue(response.context['user'].is_authenticated)
        self.assertRedirects(response, reverse('ventas'))
        self.assertContains(response, 'Bienvenido')

    def test_login_unsuccessful(self):
        # Intenta iniciar sesión con credenciales incorrectas
        response = self.client.post(self.login_url, {'username': 'incorrect', 'password': 'incorrect'})
        self.assertFalse(response.context['user'].is_authenticated)
        self.assertContains(response, 'Usuario o contraseña incorrectos')

    def test_login_view_rendered_correctly(self):
        response = self.client.get(self.login_url)
        self.assertEqual(response.status_code, 200)  # 200: OK
        self.assertTemplateUsed(response, 'login.html')



