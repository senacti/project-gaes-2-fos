<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="{{ asset ('CSS/style.css')}}">
        <link rel="stylesheet" href="{{ asset ('CSS/stylemenu.css')}}">
        <link rel="stylesheet" href="{{ asset ('CSS/servicios.css')}}">
        <script src="https://kit.fontawesome.com/37a7d1d6c8.js" crossorigin="anonymous"></script>
        <title>FOS</title>
    </head>
    <body>
        <header class="header">
            
            <div class="logo"><a href="{{ url ('/index')}}">☰ FOS</a> </div>
            <label for="toggle"><img src="{{ asset ('img/menu.png')}}" alt="" width="50px"></label>
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
        <div class="containerser">
            <h1 style="color: white;">Nuestros servicios</h1>
            <div class="row">
                <div class="service">
                    
                    <i class="fa-solid fa-warehouse"></i>
                    <h2>Inventario</h2>
                    <p >Permitir tener una planeación y visión más clara sobre el inventario en aspectos como proveedores, referencias que más salen, cantidades, anticipación a escasez también con el reemplazo del kardex físico se optimizará tiempo y espacio.</p>
                    <a href="{{ url ('/lading')}}">
                        <button class="botonservi2">Saber mas</button>
                    </a>
                </div>
                <div class="service">
                    <i class="fa-solid fa-store"></i>
                    <h2>Ventas</h2>
                    <p>Acceder a los registros de ventas de manera más rápida evitando confusión e incertidumbre sobre datos que no están claros o se perdieron, para tener una información precisa y concisa.</p>
                    <a href="{{ url ('/ventas')}}">
                        <button class="botonservi2">Saber mas</button>
                    </a>
                </div>
                <div class="service">
                    <i class="fa-sharp fa-solid fa-truck"></i>
                    <h2>Domicilios</h2>
                    <p>Gestionar y mantener un registro, edición, supervisión y manejo completo de los domicilios realizados en la empresa, así manteniendo un control preciso de estos.</p>
                    <a href="{{ url ('/lading')}}">
                        <button class="botonservi2">Saber mas</button>
                    </a>
                </div>
            </div>
        </div>
        

        </body>
    </html>