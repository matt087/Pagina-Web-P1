<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="css/stylesheet.css" rel="stylesheet" type="text/css"/>
	<title>Eco-Garden - Afiliación</title>
</head>
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
		<form class='center' id="registro" action="respuesta.jsp" method="post">
	        <fieldset>
	            <h1>Registro de Cliente</h1>
	            	<label class="label">Cédula: : </label>
	                <input type="text" name="txt_cedula" class="input_izq" placeholder="Ingrese su Número de Cédula: " required oninvalid="this.setCustomValidity('Ingrese su número de cédula')" maxlength="10">
	            
	                <label class="label">Nombre:  </label>
	                <input type="text" placeholder="Ingrese su Nombre" class="input_izq" name="txt_nombre" required oninvalid="this.setCustomValidity('Ingrese sus nombres completos')">

	                <label class="label">Teléfono: </label>
	                <input type="text" placeholder="Ingrese su Teléfono" class="input_izq" name="txt_telefono" required oninvalid="this.setCustomValidity('Ingrese su número telefónico')" maxlength="10">

	                <label class="label">Correo: </label>
	                <input type="email" placeholder="Ingrese su Email" class="input_izq" name="txt_correo" required oninvalid="this.setCustomValidity('Ingrese un correo electrónico válido')">

	               <label class="label">Estado Civil: </label>
	               <select name="cmbEstadoCivil" required oninvalid="this.setCustomValidity('Seleccione una opción')" class='input_izq'>
	               		<option value="1">Soltero</option>
               			<option value="2">Casado</option>	
						<option value="3">Divorciado</option>
						<option value="4">Viudo</option>		
	               </select>

	                <label class="label">Contraseña: </label>
	                <input type="password" class="input_izq" name="txt_pass1" required oninvalid="this.setCustomValidity('Ingrese una contraseña válida')">
                	
                	<label class="label">Repetir Contraseña: </label>
	                <input type="password" class="input_izq" name="txt_pass2" required oninvalid="this.setCustomValidity('Ingrese una contraseña válida')">
                	
	            <div class="envio">
	                <input type="submit" class="boton" value="Enviar">
	                <input type="reset" class="boton">
	            </div>     
	        </fieldset>
            </form> 
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