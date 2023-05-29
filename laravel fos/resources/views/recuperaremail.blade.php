<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FOS</title>
    <link rel="stylesheet" href="{{ asset ('CSS/recucorreo.css')}}">
    <link rel="stylesheet" href="{{asset ('CSS/stylemenu.css')}}">
    <link rel="stylesheet" href="{{asser ('CSS/style.css')}}">
</head>
<body>
    <header class="header">
            
        <div class="logo"><a href="{{ url ('/index')}}">☰ FOS</a> </div>
        <label for="toggle"><img src="{{asset ('img/menu.png')}}" alt="" width="50px"></label>
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
<div class="container">
    <h1>RECUPERAR CORREO ELECTRÓNICO</h1>
    <form class="frm">
        <input type="email" placeholder="Verificar correo" id="correo">
        <input type="submit" value="Verificar" id="btn-enviar"> 
        <div class="resultado"></div>
        <div class="resultado2"></div>
    </form>
</div>
<script src="{{asset ('js/recuperar.js')}}"></script>
</body>
</html>