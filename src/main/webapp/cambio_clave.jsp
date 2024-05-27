<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
<%
	int perfil = 0;
	String usuario = "";
	HttpSession sesion = request.getSession();
	 if (sesion.getAttribute("usuario") == null || (Integer)sesion.getAttribute("perfil") == 2) //Se verifica si existe la variable
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
	<title>Eco-Garden - Cambio de Clave</title>
</head>
<script type="text/javascript">
    window.onload = function() 
    {
        var mensaje = '<%= request.getParameter("error") %>';
        if(mensaje==="La contraseña es incorrecta")
       		alert(mensaje);
        else if(mensaje==="Las contraseñas no coinciden")
       		alert(mensaje);
    };
</script>
<body>
	<header>
		<h1>Eco-Garden <span>La mejor tienda de plantas del Ecuador</span></h1>
	</header>
	<form class='center' id="registro" action="respuesta_cambio.jsp" method="post">
        <fieldset>
            <h1>Cambio de Clave</h1>
            	<label class="label">Ingrese la clave actual: </label>
                <input type="password" name="clave_a" class="input_izq" placeholder="Ingrese la clave actual:" required>
            
                <label class="label">Ingrese la nueva clave: </label>
                <input type="password" name="clave_1" class="input_izq" placeholder="Ingrese la nueva clave:  " required>
                
                <label class="label">Repita la nueva clave: </label>
                <input type="password" name="clave_2" class="input_izq" placeholder="Repita la nueva clave: " required>
            <div class="envio">
                <input type="submit" class="boton" value="Enviar">
                <input type="reset" class="boton">
            </div>     
        </fieldset>
     </form> 
</body>
</html>