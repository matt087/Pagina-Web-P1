<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="css/stylesheet.css" rel="stylesheet" type="text/css"/>
	<title>Eco-Garden - Ingreso de Productos</title>
</head>
<body>
	<main>
		<%
			Producto pro = new Producto();
			String id = request.getParameter("txt_id");
			String cat = request.getParameter("cmbCategoria");
			String nombre = request.getParameter("txt_nombre");
			String cantidad = request.getParameter("txt_cantidad");
			String precio = request.getParameter("txt_precio");
			double valor = Math.round(Double.parseDouble(precio) * 100.0) / 100.0;
			String directorio = request.getParameter("imagen");
			directorio="C:/Users/USUARIO/eclipse-workspace/Practica_5/src/main/webapp/resources/planta2.jpg";
			String res = pro.ingresarProducto(Integer.parseInt(id), Integer.parseInt(cat), nombre, Integer.parseInt(cantidad), valor, directorio);

		    response.sendRedirect("productos_edicion.jsp?mensaje="+res);
		%>
		
	</main>
</body>
</html>