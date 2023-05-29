<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('CSS/style.css') }}">
    <link rel="stylesheet" href="{{ asset('CSS/stylemenu.css') }}">
    <link rel="stylesheet" href="{{ asset('CSS/stylecontacto.css') }}">
    <title>FOS</title>
</head>
<body>
    <header class="header">
            
        <div class="logo"><a href="{{ url ('/index')}}">☰ FOS</a> </div>
        <label for="toggle"><img src="{{asset ('img/menu.png')}}" alt="" width="50px"></label>
        <input type="checkbox" id="toggle">
        

        <nav class="navigation">

            <ul>
                <li><a href="{{ url  ('/index')}}">Inicio</a></li>
                <li><a href="{{ url  ('/contacto')}}">Contactanos</a>
                    <ul>
                        <li><a href="{{ url  ('/contacto')}}">Contacta directamente</a></li>
                        <li><a href="{{ url  ('/lading')}}">Whatsapp</a></li>
                        <li><a href="{{ url  ('/lading')}}">Telegram</a></li>
                        <li><a href="{{ url  ('/lading')}}">Facebook</a></li>
                        <li><a href="{{ url  ('/lading')}}">Instagram</a></li>
                        <li><a href="{{ url  ('/lading')}}">Llamanos</a></li>


                    </ul>

                </li>
                <li><a href="{{ url  ('/servicios')}}">Nuestros Servicios</a>
                    
                </li>
                <li><a href="{{ url  ('/secion')}}">Inicia Sesion</a>
                    <ul>

                        <li><a href="{{ url  ('/registro')}}">Registrate</a></li>
                    </ul>
                </li>



            </ul>


        </nav>
    


</header>

    <div class="container-form">
        <div class="info-form">
            <h2>Contáctanos</h2>
            <p>Puedes contactarnos directamente o dejarnos un mensaje</p>
            <a href="#"><i class="fa fa-phone"></i> 57 350 595 2493</a>
            <a href="#"><i class="fa fa-envelope"></i> mlbbdaniel30@gmail.com</a>
            <a href="#"><i class="fa fa-map-marked"></i> Bogota, Colombia</a>
        </div>
        <form  action="{{ url  ('/lading')}}" id="form">
            <div class="campo">
                <input type="text" name="" id="user" placeholder="Tu nombre" >
                <label for=""></label>

            </div>
            <div class="campo">
                <input type="email" name="" id="email" placeholder="Tu correo" >
                <label for=""></label>

            </div>
            
            <textarea name="mensaje" placeholder="Tu Mensaje..."></textarea>
            <input type="submit" name="enviar" value="Enviar Mensaje" class="btn-enviar">
        </form>
    </div>

<div class="hero">
<script src="{{ asset('js/contacto.js')}}"></script>
</body>
</html>