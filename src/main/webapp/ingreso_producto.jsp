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
	 Producto pro = new Producto();
	 int nuevo = pro.getNewId()+1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/stylesheet.css" rel="stylesheet" type="text/css" />
<title>Eco-Garden - Ingreso de Productos</title>
</head>

<body>
	<main>
		<header>
			<h1>
				Eco-Garden <span>La mejor tienda de plantas del Ecuador</span>
			</h1>
		</header>
		<nav>
			<a href="menu_vendedor.jsp">Perfil</a>
			<a href="productos_edicion.jsp">Modificar Productos</a>
			<a href="categorias_sesion.jsp">Consultar Productos</a>
		</nav>
		<form class='center' id="registro" action="respuesta_productos.jsp" method="post">
			<fieldset>
				<h1>Registro de Productos</h1>
				<label class="label">ID: </label> 
				<input type="text" name="txt_id" class="input_izq" value=<%=nuevo%> readonly> 
				<label class="label">Categoría: </label>
				<%
			            Categoria categoria = new Categoria();
				        String opcionesCategoria = categoria.mostrarCategoria2();
				        out.println(opcionesCategoria);
					%>

				<label class="label">Nombre: </label> <input type=text
					placeholder="Ingrese el nombre del producto: " class="input_izq"
					name="txt_nombre" required
					oninvalid="this.setCustomValidity('Complete este campo')">

				<label class="label">Cantidad: </label> <input type="number"
					value="5" min="5" placeholder="Ingrese la cantidad: "
					class="input_izq" name="txt_cantidad" required
					oninvalid="this.setCustomValidity('Complete este campo')">

				<label class="label">Precio: </label> <input type="number"
					step="0.01" placeholder="Ingrese el precio: " class="input_izq"
					name="txt_precio" required
					oninvalid="this.setCustomValidity('Complete este campo')">

				<label class="label">Imagen: </label> <input type="file"
					accept=".jpg" class="input_izq" name="imagen" id="imagen">

				<div class="envio">
					<input type="submit" class="boton"> 
					<input type="reset" class="boton">
				</div>
			</fieldset>
		</form>
		<script>
	        function mostrarRuta() 
	        {
	            const input = document.getElementById('imagen');
	            const rutaArchivo = document.getElementById('rutaArchivo');
	            
	            if (input.files && input.files[0]) {
	                const archivo = input.files[0];
	                const ruta = URL.createObjectURL(archivo);
	                rutaArchivo.textContent = 'Ruta del archivo: ' + ruta;
	            }
	        }
	    </script>
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