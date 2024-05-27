<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/stylesheet.css" rel="stylesheet" type="text/css" />
<title>Eco-Garden - Registro de Usuarios</title>
</head>

<body>
	<main>
		<header>
			<h1>
				Eco-Garden <span>La mejor tienda de plantas del Ecuador</span>
			</h1>
		</header>
		<nav>
			<a href="index.jsp">Home</a> 
			<a href="productos.jsp">Listado de Productos</a> 
			<a href="categorias.jsp">Categorías</a> 
			<a href="login.jsp">Log-In</a>
		</nav>
		<h1>Resultados del registro</h1>
		<%
			String cedula = request.getParameter("txt_cedula");
			String nombre = request.getParameter("txt_nombre");
			String telefono = request.getParameter("txt_telefono");
			String correo = request.getParameter("txt_correo");
			String estado_c = request.getParameter("cmbEstadoCivil");
			String contraseña = request.getParameter("txt_pass1");
			String contraseña2 = request.getParameter("txt_pass2");	
			
			
			Usuario user = new Usuario();
			int id = user.getUsuarios();
			user.setId(id+1);
			user.setCedula(cedula);
			user.setCorreo(correo);
			user.setEstado_civil(Integer.parseInt(estado_c));
			user.setNombre(nombre);
			user.setTelefono(telefono);
			if(contraseña.equals(contraseña2))
			{
				user.setClave(contraseña);
				String resultado = user.ingresarCliente();
				out.print(resultado);
			}
			else
			{
				out.print("<p>Las contraseñas no coinciden</p>");
				out.print("<p>Inténtelo nuevamente</p>");
			}
			
		%>
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