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
	<title>Eco-Garden - Registro de Usuarios</title>
</head>
<body>
	<header>
		<h1>Eco-Garden <span>La mejor tienda de plantas del Ecuador</span></h1>
	</header>
	<nav>
		<a href="menu_ad.jsp">Perfil</a>
		<a href='registro_admin.jsp'>Registro de Usuarios</a>
	</nav>
	<main>
		<form class='center' id="registro" action="respuesta_registro.jsp" method="post">
	        <fieldset>
	            <h1>Registro de Usuarios</h1>
	            	<label class="label">Cédula: : </label>
	                <input type="text" name="txt_cedula" class="input_izq" placeholder="Ingrese su Número de Cédula: " required oninvalid="this.setCustomValidity('Ingrese su número de cédula')" maxlength="10">
	      
	                <label class="label">Nombre:  </label>
	                <input type="text" placeholder="Ingrese su Nombre" class="input_izq" name="txt_nombre" required oninvalid="this.setCustomValidity('Ingrese sus nombres completos')">
	
	                <label class="label">Teléfono: </label>
	                <input type="text" placeholder="Ingrese su Teléfono" class="input_izq" name="txt_telefono" required oninvalid="this.setCustomValidity('Ingrese su número telefónico')" maxlength="10">
	
	                <label class="label">Correo: </label>
	                <input type="email" placeholder="Ingrese su Email" class="input_izq" name="txt_correo" required oninvalid="this.setCustomValidity('Ingrese un correo electrónico válido')">

					<label class= "label">Tipo:</label>
					<select name="cmbTipo" required oninvalid="this.setCustomValidity('Seleccione una opción')" class='input_izq'>
						<option value="1">Administrador</option>
						<option value="3">Vendedor</option>
					</select>

	                <label class="label">Estado Civil: </label>
	                <select name="cmbEstadoCivil" required oninvalid="this.setCustomValidity('Seleccione una opción')" class='input_izq'>
	               		<option value="1">Soltero</option>
	              		<option value="2">Casado</option>	
						<option value="3">Divorciado</option>
						<option value="4">Viudo</option>		
	                </select>                            	
		            <div class="envio">
		                <input type="submit" class="boton" value="Enviar">
		                <input type="reset" class="boton">
		            </div>     
	        </fieldset>
         </form> 
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