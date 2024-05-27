<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.productos.seguridad.*"
	session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	Usuario usuario = new Usuario();
	String nlogin = request.getParameter("usuario");
	String nclave = request.getParameter("clave");
	HttpSession sesion = request.getSession(); //Se crea la variable de sesión
	boolean respuesta = usuario.verificarUsuario(nlogin, nclave);
	if (respuesta) 
	{
		sesion.setAttribute("usuario", usuario.getNombre()); //Se añade atributos
		sesion.setAttribute("perfil", usuario.getPerfil()); //Se añade atributos
		if(usuario.getPerfil()==3)
			response.sendRedirect("menu_vendedor.jsp"); 
		if(usuario.getPerfil()==2)
		{
			response.sendRedirect("menu.jsp"); //Se redirecciona a una página específica
			sesion.setAttribute("precio", 0.0); //Se añade atributos
		}	
		if(usuario.getPerfil()==1)
			response.sendRedirect("menu_ad.jsp"); 
	} 
	else 
	{
		%>
		<jsp:forward page="login.jsp">
			<jsp:param name="error"
				value="Datos incorrectos" />
		</jsp:forward>
		<%
	}
	%>
</body>
</html>