document.addEventListener('DOMContentLoaded', function () {
    var form = document.getElementById('formulario');

    form.addEventListener('submit', function (event) {
        var nombreInput = document.getElementById('nombre');
        var correoInput = document.getElementById('correo');
        var password1Input = document.getElementsByName('password1')[0];
        var password2Input = document.getElementsByName('password2')[0];

        // Validación del nombre (solo letras)
        var nombreRegex = /^[A-Za-z]+$/;
        if (!nombreRegex.test(nombreInput.value.trim())) {
            alert('Por favor, ingresa un nombre válido (solo letras).');
            event.preventDefault();
            return;
        }

        // Validación del correo electrónico y dominio
        var correoValue = correoInput.value.trim();
        if (correoValue === '') {
            alert('Por favor, ingresa un correo electrónico.');
            event.preventDefault();
            return;
        }

        var dominiosPermitidos = ['gmail.com', 'outlook.com', 'yahoo.com'];
        var dominioRegex = new RegExp('@(' + dominiosPermitidos.join('|') + ')$', 'i');
        if (!dominioRegex.test(correoValue)) {
            alert('Por favor, utiliza un correo electrónico con uno de los siguientes dominios: ' + dominiosPermitidos.join(', '));
            event.preventDefault();
            return;
        }

        // Validación de la coincidencia de contraseñas
        if (password1Input.value !== password2Input.value) {
            alert('Las contraseñas no coinciden. Por favor, inténtalo de nuevo.');
            event.preventDefault();
            return;
        }

        // Validación del mínimo de caracteres en la contraseña
        var minLength = 8;
        if (password1Input.value.length < minLength) {
            alert('La contraseña debe tener al menos ' + minLength + ' caracteres.');
            event.preventDefault();
            return;
        }

        // Validación de la fortaleza de la contraseña (mayúsculas, minúsculas, números y símbolos)
        var passwordStrengthRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$/;
        if (!passwordStrengthRegex.test(password1Input.value)) {
            alert('La contraseña debe contener al menos una mayúscula, una minúscula, un número y un símbolo.');
            event.preventDefault();
            return;
        }
    });
});
