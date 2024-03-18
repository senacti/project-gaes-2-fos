"""import asyncio
import pytest
from django.contrib.auth import get_user_model
from django.db import sync_to_async
from django.test import Client


@pytest.mark.asyncio
async def test_login_stress(event_loop):
    async def make_login_request(username, password, client, loop):
        return await loop.run_in_executor(None, client.post, '/login/', {'username': username, 'password': password})

    # Configurar
    users_data = [
        {'username': 'user1', 'password': 'password1'},
        {'username': 'user2', 'password': 'password2'},
        # Añadir más usuarios si es necesario
    ]
    num_requests = 100  # Número de solicitudes simultáneas

    # Crear usuarios de forma asincrónica
    User = get_user_model()
    for data in users_data:
        await sync_to_async(User.objects.create_user)(username=data['username'], password=data['password'])

    # Iniciar solicitudes simultáneas
    client = Client()
    tasks = []
    for i in range(num_requests):
        user_data = users_data[i % len(users_data)]
        tasks.append(make_login_request(user_data['username'], user_data['password'], client, event_loop))

    # Esperar a que se completen todas las solicitudes
    responses = await asyncio.gather(*tasks)

    # Verificar respuestas
    for response in responses:
        assert response.status_code == 302
        # Agrega más verificaciones si es necesario"""