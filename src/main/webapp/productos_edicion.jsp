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
	<title>Eco-Garden - Productos</title>
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
				<div class="center">
					<div class="down">
						<h2>Listado de Productos</h2>
						<%
							Producto pro = new Producto();
							String tabla = pro.consultarTodo();
							out.print(tabla);
						%>
					</div>
				</div>
				<div class='derecha'>
					<a href="ingreso_producto.jsp">Ingresar productos</a>
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
<script type="text/javascript">
    window.onload = function() 
    {
        var mensaje = '<%= request.getParameter("mensaje") %>';
        if (mensaje === "actualizado") 
        {
            alert("¡Producto actualizado exitosamente!");
        } 
        else if (mensaje === "error") 
        {
            alert("Error en la actualización del producto.");
        }
        else if (mensaje === "eliminado")
       	{
        	alert("¡Producto eliminado exitosamente!")
       	}
        else if (mensaje === "error2") 
        {
            alert("Error en la eliminación del producto.");
        }
        else if (mensaje === "correcto_ins")
       	{
            alert("¡Producto ingresado exitosamente!");
       	}
        else if (mensaje === "error_ins")
       	{
            alert("Error en la inserción del producto.");
       	}
    };
</script>
</html>