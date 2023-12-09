document.addEventListener('DOMContentLoaded', function () {
    // Obtenemos el formulario y los campos
    var form = document.querySelector('form');
    var usernameInput = document.querySelector('input[name="username"]');
    var passwordInput = document.querySelector('input[name="password"]');

    // Agregamos un event listener al formulario para la validación
    form.addEventListener('submit', function (event) {
        // Validación del nombre de usuario
        var usernameValue = usernameInput.value.trim();
        if (usernameValue === '') {
            alert('Por favor, ingresa un nombre de usuario.');
            event.preventDefault(); // Evita que el formulario se envíe
            return;
        }

        // Validación básica del formato del nombre de usuario (solo letras y números)
        var usernameRegex = /^[a-zA-Z0-9]+$/;
        if (!usernameRegex.test(usernameValue)) {
            alert('El nombre de usuario solo puede contener letras y números.');
            event.preventDefault(); // Evita que el formulario se envíe
            return;
        }

        // Validación de la contraseña
        var passwordValue = passwordInput.value.trim();
        if (passwordValue === '') {
            alert('Por favor, ingresa una contraseña.');
            event.preventDefault(); // Evita que el formulario se envíe
            return;
        }

        // Validación de la complejidad de la contraseña (mayúsculas, minúsculas, números y signos de puntuación)
        var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~])[A-Za-z\d!"#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~]+$/;
        if (!passwordRegex.test(passwordValue)) {
            alert('La contraseña debe contener al menos una mayúscula, una minúscula, un número y un signo de puntuación.');
            event.preventDefault(); // Evita que el formulario se envíe
            return;
        }

        // Validación de que todos los campos estén llenos
        var allFieldsFilled = usernameValue !== '' && passwordValue !== '';
        if (!allFieldsFilled) {
            alert('Por favor, completa todos los campos.');
            event.preventDefault(); // Evita que el formulario se envíe
            return;
        }
    });
});

