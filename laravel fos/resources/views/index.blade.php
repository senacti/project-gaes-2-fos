<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset ('CSS/style.css')}}">
    <link rel="stylesheet" href="{{ asset ('CSS/stylemenu.css')}}">
    <link rel="stylesheet" href="{{ asset ('CSS/carrusel.css')}}">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
   
    <title>FOS</title>
</head>

<body>
    <header class="header">

        <div class="logo"><a href="{{ url ('/index')}}">☰ FOS</a> </div>
        <label for="toggle"><img src="{{ asset ('img/menu.png')}}" alt="" ></label>
        <input type="checkbox" id="toggle">


        <nav class="navigation">

            <ul>
                <li><a href="{{ url ('/index')}}">Inicio</a></li>
                <li><a href="{{ url ('/contacto')}}">Contactanos</a>
                    <ul>
                        <li><a href="{{ url ('/contacto')}}">Contacta directamente</a></li>
                        <li><a href="{{ url ('/lading')}}">Whatsapp</a></li>
                        <li><a href="{{ url ('/lading')}}">Telegram</a></li>
                        <li><a href="{{ url ('/lading')}}">Facebook</a></li>
                        <li><a href="{{ url ('/lading')}}">Instagram</a></li>
                        <li><a href="{{ url ('/lading')}}">Llamanos</a></li>


                    </ul>

                </li>
                <li><a href="{{ url ('/servicios')}}">Nuestros Servicios</a>
                    
                </li>
                <li><a href="{{ url ('/secion')}}">Inicia Sesion</a>
                    <ul>

                        <li><a href="{{ url ('/registro')}}">Registrate</a></li>
                    </ul>
                </li>



            </ul>


        </nav>



    </header>
    <div class="hero">

    </div>



    <body>

        
           

            <div class="carrousel">
                
                <div class="grande">
                    <img src="{{ asset ('img/imagen1-removebg-preview.png')}}" alt="Imagen 1" class="img">
                    <img src="{{ asset ('img/imagen2-removebg-preview.png')}}" alt="Imagen 2" class="img">
                    <img src="{{ asset ('img/imagen3-removebg-preview.png')}}" alt="Imagen 1" class="img">
                    <img src="{{ asset ('img/imagen4-removebg-preview.png')}}" alt="Imagen 2" class="img">
                    <img src="{{ asset ('img/imagen5-removebg-preview.png')}}" alt="Imagen 1" class="img">
                    <img src="{{ asset ('img/imagen6-removebg-preview.png')}}" alt="Imagen 2" class="img">
                </div>
        
                <ul class="puntos">
                    <li class="punto activo"></li>
                    <li class="punto"></li>
                </ul>
                <div class="contenedorbien">
                    <div class="bienvenida">
                        <h2>Hola de Nuevo</h2>
                    </div>
                    <div class="prom">
                        <p>Crea tu cuenta fos y comienza a administrar tu negocio</p>
                        <button class="boton1"><a href="{{ url ('\secion')}}">comenzar</a> </button>
                </div>
            </div>
           
    <script defer src="{{ asset ('js/carrusel.js')}}" ></script>
            
    </body>
    

</html>