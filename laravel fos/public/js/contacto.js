const email = document.getElementById("email")
const user = document.getElementById("user")
const form = document.getElementById("form")
const parrafo = document.getElementById("warnings")



form.addEventListener("submit", e => {
    
    let warnings = ""
    let entrar = false
    let regexEmail = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,4}$/i
    parrafo.innerHTML = ""
    if (!regexEmail.test(email.value)){
        warnings += `El correo no es valido </br>`
        entrar = true
    }
     
    if( pass.value.length < 8){
        warnings += `La contrasena no es valida </br>`
        entrar = true
    }
    if(entrar){
        parrafo.innerHTML = warnings
    }else{
        parrafo.innerHTML = "Enviado"
    }
})