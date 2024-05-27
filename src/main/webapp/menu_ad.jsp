<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.productos.seguridad.*"
	session="true"%>
<%
	int perfil = 0;
	String usuario = "";
	HttpSession sesion = request.getSession();
	 if (sesion.getAttribute("usuario") == null || (Integer)sesion.getAttribute("perfil") != 1) //Se verifica si existe la variable
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
	<title>Eco-Garden - Menú</title>
</head>
<script type="text/javascript">
    window.onload = function() 
    {
        var mensaje = '<%= request.getParameter("mensaje") %>';
        if(mensaje==="Insercion correcta")
       		alert(mensaje);
    };
</script>
<body>
	<header>
		<h1>Eco-Garden <span>La mejor tienda de plantas del Ecuador</span></h1>
	</header>
	<nav>
			<a href="menu_ad.jsp">Perfil</a>
			<a href='registro_admin.jsp'>Registro de Usuarios</a>
		</nav>
	<main>
		<div  class='center_all'>
			<section class='menu_user'>
				<h1>Menú de Administrador</h1>
				<h4>
					Bienvenido/a:
					<span>
						<%
						Usuario us = new Usuario();
						us.getUserbyId(usuario);
						out.println(us.getUserbyId(usuario));
						%>
					</span>
				</h4>
				<%
					Pagina pag=new Pagina();
					String menu=pag.mostrarMenu(perfil);
					out.print(menu);
				%>	
				<div class='derecha_c'>
					<a class='cerrar' href="cerrar_sesion.jsp">Cerrar Sesión</a>	
				</div>
			</section> 	
		</div>
	</main>
	<footer>
			 <ul>
				 <li>Facebook</li>
				 <li>Instagram</li>
				 <li>Twitter</li>
			 </ul>
 		</footer>
</body>
</html>