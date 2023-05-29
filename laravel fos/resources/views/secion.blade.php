<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{asset ('CSS/style.css')}}">
    <link rel="stylesheet" href="{{asset ('CSS/stylemenu.css')}}">
    
    <title>FOS</title>
</head>
<body>
    <header class="header">
            
        <div class="logo"><a href="{{ url('/index')}}">☰ FOS</a> </div>
        <label for="toggle"><img src="{{ asset ('img/menu.png')}}" alt="" width="50px"></label>
        <input type="checkbox" id="toggle">
        

        <nav class="navigation">

            <ul>
                <li><a href="{{ url('/index')}}">Inicio</a></li>
                <li><a href="{{ url('/contacto')}}">Contactanos</a>
                    <ul>
                        <li><a href="{{ url('/contacto')}}">Contacta directamente</a></li>
                        <li><a href="{{ url('/lading')}}">Whatsapp</a></li>
                        <li><a href="{{ url('/lading')}}">Telegram</a></li>
                        <li><a href="{{ url('/lading')}}">Facebook</a></li>
                        <li><a href="{{ url('/lading')}}">Instagram</a></li>
                        <li><a href="{{ url('/lading')}}">Llamanos</a></li>


                    </ul>

                </li>
                <li><a href="{{ url('/servicios')}}">Nuestros Servicios</a>
                    
                </li>
                <li><a href="{{ url('/seción')}}">Inicia Sesion</a>
                    <ul>

                        <li><a href="{{ url('/registro')}}">Registrate</a></li>
                    </ul>
                </li>



            </ul>


        </nav>
    


</header>
<div class="hero">
    <div class="formulario" id="formulario">
        <h1>Inicia sesión en FOS</h1>
        <form  action="{{ url('/administrador')}}" id="form">
            <div class="username">
                <input type="email" name="" id="email" autocomplete="none" >
                <label for="">Nombre de Usuario</label>

            </div>
            <div class="username">
                <input type="password" name="" id="password" >
                <label for="password">contraseña</label>

            </div>
            <div class="recordar"><a href="{{ url('/recuperaremail')}}">¿Olvido Su contraseña?</a> </div>
                    
                    <input type="submit" value="Iniciar">
            
            <div class="registrarse">
                Quiero <a href="{{ url('/registro')}}">registrarme</a>
                <p class="warnings" id="warnings"></p>
            </div>
        </form>
        
    </div>
    <script src="{{asset ('js/inisiar.js')}}"></script>
</body>
</html>