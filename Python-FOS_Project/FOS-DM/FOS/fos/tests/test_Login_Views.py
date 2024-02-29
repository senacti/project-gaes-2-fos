from django.test import TestCase, Client
from django.contrib.auth import get_user_model
from django.contrib.auth import authenticate, login

class LoginViewTest(TestCase):

    def setUp(self):
        # Crear un usuario para usar en las pruebas
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

        user = self.client.session['_auth_user_id']
        self.assertEqual(int(user), self.user.id)

    def test_login_unsuccessful(self):
        response = self.client.post('/login/', {
            'username': 'daniel',
            'password': 'Dark123456%',
        })

    # Expecting a redirect status code
        self.assertEqual(response.status_code, 302)

    # Check for the presence of the correct error message in the response content
        self.assertContains(response, 'Usuario o contraseña incorrectos', status_code=302)

    # Check the URL of the redirect
        self.assertRedirects(response, expected_url='/expected/redirect/url/')

    # Ensure the session variable is not set
        self.assertNotIn('_auth_user_id', self.client.session)

    def test_login_view_rendered_correctly(self):
        response = self.client.get('/login/')
        self.assertEqual(response.status_code, 200)  
        self.assertTemplateUsed(response, 'login.html')






