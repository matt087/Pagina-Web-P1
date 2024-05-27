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
<title>Modificar productos</title>
</head>
<body>
<%
	int cod = Integer.parseInt(request.getParameter("cod_pr"));
	int cod_cat = Integer.parseInt(request.getParameter("cmbCategoria"));
	String nombre = request.getParameter("nombre_pr");
	double precio = Double.parseDouble(request.getParameter("precio_pr"));
	double valor = Math.round(precio * 100.0) / 100.0;
	int cantidad = Integer.parseInt(request.getParameter("cantidad_pr"));
	Producto pro = new Producto(cod, cod_cat, nombre, cantidad, valor);
	boolean actualizado = pro.editarInfo(pro);
	if(actualizado)
	{
        response.sendRedirect("productos_edicion.jsp?mensaje=actualizado");
	}
	else
	{
        response.sendRedirect("productos_edicion.jsp?mensaje=error");
	}
%>
</body>
</html>