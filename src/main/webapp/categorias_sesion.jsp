<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*" session="true"%>
<%
	int perfil = 0;
	String usuario = "";
	HttpSession sesion = request.getSession();
	 if (sesion.getAttribute("usuario") == null || (Integer)sesion.getAttribute("perfil") != 3) //Se verifica si existe la variable
	 {
		 %>
			<jsp:forward page="login.jsp">
			<jsp:param name="error" value="Debe registrarse en el sistema." />
			</jsp:forward>
		<%
	 }
	 else
	 {
		 usuario=(String)sesion.getAttribute("usuario"); //Se devuelve los valores de atributos
		 perfil=(Integer)sesion.getAttribute("perfil");
	 }
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="css/stylesheet.css" rel="stylesheet" type="text/css"/>
	<title>Eco-Garden - Categorías</title>
</head>
<body>
	<main>
		<header>
			<h1>Eco-Garden <span>La mejor tienda de plantas del Ecuador</span></h1>
		</header>
		<nav>
			<a href="menu_vendedor.jsp">Perfil</a>
			<a href="productos_edicion.jsp">Modificar Productos</a>
			<a href="categorias_sesion.jsp">Consultar Productos</a>
		</nav>
		<div class="container_cat">
				<form id="consulta-cat" action="consulta_categoria.jsp" method="post">
					<div class="busqueda_categoria">
						<label>Categoría: </label>
						<% 
					        Categoria categoria = new Categoria();
					        String opcionesCategoria = categoria.mostrarCategoria();
					        out.println(opcionesCategoria);
					    %>
					</div>
					<aside>
						<input type="submit" class="boton_c">	
					</aside>
				</form>				
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