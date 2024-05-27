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
<meta charset="ISO-8859-1">
<title>Ingreso de Usuarios</title>
</head>
<body>
	<%
		String cedula = request.getParameter("txt_cedula");
		String nombre = request.getParameter("txt_nombre");
		String telefono = request.getParameter("txt_telefono");
		String correo = request.getParameter("txt_correo");
		String estado_c = request.getParameter("cmbEstadoCivil");		
		String perfil2 = request.getParameter("cmbTipo");
		Usuario user = new Usuario();
		int id = user.getUsuarios()+1;
		user.setId(id);
		user.setPerfil(Integer.parseInt(perfil2));
		user.setCedula(cedula);
		user.setCorreo(correo);
		user.setEstado_civil(Integer.parseInt(estado_c));
		user.setNombre(nombre);
		user.setTelefono(telefono);
		user.setClave("654321");
		String msg = user.ingresarCliente();	
		response.sendRedirect("menu_ad.jsp?mensaje="+msg);
	%>
</body>
</html>