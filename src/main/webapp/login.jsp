<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link href="css/stylesheet.css" rel="stylesheet" type="text/css"/>
	<title>Log-In</title>
</head>
<script type="text/javascript">
    window.onload = function() 
    {
        var mensaje = '<%= request.getParameter("error") %>';
        if(mensaje==="El cambio de clave ha sido exitoso")
       		alert(mensaje);
        if(mensaje==="Datos incorrectos")
       		alert(mensaje);
    };
</script>
<body>
	<main>
		<header>
			<h1>Eco-Garden <span>La mejor tienda de plantas del Ecuador</span></h1>
		</header>
		<nav>
			<a href="index.jsp">Home</a>
			<a href="productos.jsp">Listado de Productos</a>
			<a href="categorias.jsp">Categorías</a>
			<a href="login.jsp">Log-In</a>
		</nav>
		<div class="center_all">
			<div class="agrupacion">
				<form action="validar_login.jsp">
					<h1>Inicio de Sesión</h1>
					<div class="input-box">
						<input type="text" placeholder="Usuario" name="usuario" required>
						<i class='bx bx-user' ></i>
					</div>
					<div class="input-box">
						<input type="password" placeholder="Contraseña" name="clave" required>
						<i class='bx bx-lock-alt' ></i>
					</div>
					<div class="recordar">
						<label>
							<input type="checkbox">Recordar contraseña
						</label>
						<a href="#">Olvidé mi contraseña</a>
					</div>
					<button class="btn_login" type="submit">Iniciar Sesión</button>
					<div class="registro">
						<p>¿No tienes una cuenta?
							<a href="afiliacion.jsp">Regístrate</a>
						</p>
					</div>
				</form>
			</div>
		</div>
		
		<footer>
			 <ul>
				 <li>Facebook</li>
				 <li>Instagram</li>
				 <li>Twitter</li>
			 </ul>
 		</footer>
	</main>
</body>
</html>