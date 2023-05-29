<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset ('css/styleadm.css')}}">	
    <title>FOS</title>
</head>
<body>

	<header class="header">
		<div class="container">
		<div class="btn-menu">
			<label for="btn-menu">☰</label>
		</div>
			<div class="logo">
				<h1>FOS</h1>	
			</div>
			<nav class="menu">
				<a href="{{ url ('/index')}}">Inicio</a>
				<a href="{{ url ('/contacto')}}">Contactanos</a>
				<a href="{{ url ('/servicios')}}">Nuestros servicios</a>
				<a href="{{ url ('/secion')}}">Inicia sesion</a>
			</nav>
		</div>
	</header>
	<div class="capa"></div>

<input type="checkbox" id="btn-menu">
<div class="container-menu">
	<div class="cont-menu">
		<nav style="margin-top: 20px;">
			<a href="#">Graficas</a>
			<a href="#">Ventas</a>
			<a href="#">Inventario</a>
			<a href="#">Domicilios</a>
			<a href="#">Youtube</a>
			<a href="#">Instagram</a>
		</nav>
		<label for="btn-menu">✖️</label>
	</div>
</div>
</body>
</html>
</body>
</html>