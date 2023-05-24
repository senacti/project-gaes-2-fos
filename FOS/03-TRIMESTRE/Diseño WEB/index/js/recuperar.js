let boton = document.getElementById("btn-enviar");
let resultado = document.querySelector(".resultado");


boton.addEventListener("click",(e)=>{
    e.preventDefault();
    const email = document.getElementById("correo").value;
    validarCorreo(email);
})

const validarCorreo = (correo)=>{
    let expReg = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/;
    let verificar = expReg.test(correo);
    if(verificar){
        resultado.innerHTML = "Notificacion enviada ✓";
    } else {
        resultado.innerHTML = "El correo NO es válido" ;
        style.color = "red"
    }
}

