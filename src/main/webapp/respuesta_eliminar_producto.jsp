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
<title>Eliminar Producto</title>
</head>
<body>
<%
	int valor = Integer.parseInt(request.getParameter("valor"));
	String nombre_pro = request.getParameter("valor2");
	Producto pro = new Producto();
	
	boolean eliminado = pro.eliminarProducto(valor);
	if(eliminado)
	{
        response.sendRedirect("productos_edicion.jsp?mensaje=eliminado");
	}
	else
	{
        response.sendRedirect("productos_edicion.jsp?mensaje=error2");
	}
%>
</body>
</html>