<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.productos.seguridad.*"
	session="true"%>
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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String pa=request.getParameter("clave_a");
	String p1=request.getParameter("clave_1");
	String p2=request.getParameter("clave_2");
	Usuario us = new Usuario();
	if(!us.getPass(usuario).equals(pa))
	{
		%>
			<jsp:forward page="cambio_clave.jsp">
			<jsp:param name="error" value="La contrase�a actual es incorrecta" />
			</jsp:forward>
		<%
	}
	else
	{
		if(p1.equals(p2))
		{
			us.modificarUser(Integer.parseInt(usuario));
			us.editarInfo(p2);
			%>
				<jsp:forward page="login.jsp">
				<jsp:param name="error" value="El cambio de clave ha sido exitoso" />
				</jsp:forward>
			<%
		}
		else
		{
			%>
				<jsp:forward page="cambio_clave.jsp">
				<jsp:param name="error" value="Las contrase�as no coinciden" />
				</jsp:forward>
			<%
		}
	}
	%>
</body>
</html>