const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input');

const expresiones = {
	//  idusuario: /^[a-zA-Z0-9\_\-]{4,16}$/, // Letras, numeros, guion y guion_bajo
	nombre: /^[a-zA-ZÀ-ÿ\s]{1,40}$/, // Letras y espacios, pueden llevar acentos.
	usuario: /^.{4,12}$/, // 4 a 12 digitos.
	correo: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
	telefono: /^\d{7,14}$/, // 7 a 14 numeros.
    idusuario: /^.{10}$/ // 4 a 12 digitos.
}

const campos = {
	usuaruio: false,
	idusuario: false,
	correo: false,
    correo2: false

}

const validarFormulario = (e) => {
	switch (e.target.name) {
		case "usuario":
			validarCampo(expresiones.usuario, e.target, 'usuario');
		break;
		case "idusuario":
			validarCampo(expresiones.idusuario, e.target, 'idusuario');
		break;
		case "correo":
			validarCampo(expresiones.correo, e.target, 'correo');
			validarcorreo2();
		break;
		case "correo2":
			validarcorreo2();
		break;
		case "fechadomicilio":
			validarCampo(expresiones.fechadomicilio, e.target, 'fechadomicilio');
		break;
		case "horadomicilio":
			validarCampo(expresiones.horadomicilio, e.target, 'horadomicilio');
		break;
        case"tipotransporte":
            validarCampo(expresiones.tipotransporte, e.target, 'horadomicilio');
	}
}

const validarCampo = (expresion, input, campo) => {
	if(expresion.test(input.value)){
		document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-incorrecto');
		document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-correcto');
		document.querySelector(`#grupo__${campo} i`).classList.add('fa-check-circle');
		document.querySelector(`#grupo__${campo} i`).classList.remove('fa-times-circle');
		document.querySelector(`#grupo__${campo} .formulario__input-error`).classList.remove('formulario__input-error-activo');
		campos[campo] = true;
	} else {
		document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-incorrecto');
		document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-correcto');
		document.querySelector(`#grupo__${campo} i`).classList.add('fa-times-circle');
		document.querySelector(`#grupo__${campo} i`).classList.remove('fa-check-circle');
		document.querySelector(`#grupo__${campo} .formulario__input-error`).classList.add('formulario__input-error-activo');
		campos[campo] = false;
	}
}

const validarcorreo2 = () => {
	const inputcorreo1 = document.getElementById('correo');
	const inputcorreo2 = document.getElementById('correo2');

	if(inputcorreo1.value !== inputcorreo2.value){
		document.getElementById(`grupo__correo2`).classList.add('formulario__grupo-incorrecto');
		document.getElementById(`grupo__correo2`).classList.remove('formulario__grupo-correcto');
		document.querySelector(`#grupo__correo2 i`).classList.add('fa-times-circle');
		document.querySelector(`#grupo__correo2 i`).classList.remove('fa-check-circle');
		document.querySelector(`#grupo__correo2 .formulario__input-error`).classList.add('formulario__input-error-activo');
		campos['correo'] = false;
	} else {
		document.getElementById(`grupo__correo2`).classList.remove('formulario__grupo-incorrecto');
		document.getElementById(`grupo__correo2`).classList.add('formulario__grupo-correcto');
		document.querySelector(`#grupo__correo2 i`).classList.remove('fa-times-circle');
		document.querySelector(`#grupo__correo2 i`).classList.add('fa-check-circle');
		document.querySelector(`#grupo__correo2 .formulario__input-error`).classList.remove('formulario__input-error-activo');
		campos['correo'] = true;
	}
}

inputs.forEach((input) => {
	input.addEventListener('keyup', validarFormulario);
	input.addEventListener('blur', validarFormulario);
});

formulario.addEventListener('submit', (e) => {
	e.preventDefault();

	const terminos = document.getElementById('terminos');
	if(campos.usuario && campos.idusuario && campos.correo && campos.correo2  ){
		formulario.reset();

		document.getElementById('formulario__mensaje-exito').classList.add('formulario__mensaje-exito-activo');
		setTimeout(() => {
			document.getElementById('formulario__mensaje-exito').classList.remove('formulario__mensaje-exito-activo');
		}, 5000);

		document.querySelectorAll('.formulario__grupo-correcto').forEach((icono) => {
			icono.classList.remove('formulario__grupo-correcto');
		});
	} else {
		document.getElementById('formulario__mensaje').classList.add('formulario__mensaje-activo');
	}
});