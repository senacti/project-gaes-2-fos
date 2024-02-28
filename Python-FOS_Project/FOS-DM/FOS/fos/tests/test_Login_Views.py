from django.test import TestCase, Client
from django.contrib.auth import get_user_model
from django.contrib.auth import authenticate, login

class LoginViewTest(TestCase):

    def setUp(self):
        # Crear un usuario para usar en las pruebas
        self.user = get_user_model().objects.create_user(
            username='testuser',
            password='testpassword'
        )
        self.client = Client()

    def test_login_successful(self):
        # Prueba de inicio de sesión exitoso
        response = self.client.post('/login/', {
            'username': 'testuser',
            'password': 'testpassword',
        })
        self.assertEqual(response.status_code, 302)  # Redirección después del inicio de sesión
        self.assertRedirects(response, '/ventas/')  # Ajusta esto según tu configuración de URL

        # Verifica si el usuario está autenticado
        user = self.client.session['_auth_user_id']
        self.assertEqual(int(user), self.user.id)

    def test_login_unsuccessful(self):
        # Prueba de inicio de sesión sin éxito
        response = self.client.post('/login/', {
            'username': 'testuser',
            'password': 'wrongpassword',
        })
        self.assertEqual(response.status_code, 200)  # La página de inicio de sesión debería volver a cargar
        self.assertContains(response, 'Usuario o contraseña incorrectos')

        # Verifica si el usuario no está autenticado
        self.assertNotIn('_auth_user_id', self.client.session)

    def test_login_view_rendered_correctly(self):
        # Prueba de que la vista se renderiza correctamente
        response = self.client.get('/login/')
        self.assertEqual(response.status_code, 200)  # La página de inicio de sesión debería cargar
        self.assertTemplateUsed(response, 'login.html')

    # Puedes agregar más pruebas según sea necesario





