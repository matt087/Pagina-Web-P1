<%@page import="org.apache.catalina.LifecycleState"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.productos.seguridad.*"
	session="true" import="com.productos.negocio.*" import="java.util.List" import="java.util.ArrayList"
	%>
<%
	int perfil = 0;
	double precio;
	String usuario = "";
	HttpSession sesion = request.getSession();
	 if (sesion.getAttribute("usuario") == null || (Integer)sesion.getAttribute("perfil") != 2) //Se verifica si existe la variable
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
	 if((double)sesion.getAttribute("precio")==0.0)
	 {
		 precio=0;
	 }
	 else
	 {
		 precio = (double)sesion.getAttribute("precio");
	 }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/stylesheet.css" rel="stylesheet" type="text/css"/>
<title>Carrito de Compras</title>
</head>
<body>
	<header>
			<h1>Eco-Garden <span>La mejor tienda de plantas del Ecuador</span></h1>
	</header>
	<nav>
		<a href="menu.jsp">Perfil</a>
		<a href='carro.jsp'>Carro de Compras</a>
	</nav>
	<main>
		<h2 class='titulo_carro'>Tu Carrito de compras</h2>
		<div class='center_all'>
			<div class='lista_pro'>
				<h3>Listado de Productos</h3>
				<form name="listadoProductos"action="carro.jsp" class='formulario'>
					<% Producto producto=new Producto();
					 String tabla=producto.consultarProductos();
					 out.print(tabla);
					%>
					<p class='enviar_carro'>
						<input type="submit" name="button" id="button" value="Enviar" class='boton_c'/>
					</p>
				</form>
			</div>
			<div  class='lista_pro'>
				<h3>Productos Comprados</h3>
				<div  class='productos_comprados'>
				<%
					List<String> listaElementos=(List<String>)session.getAttribute("carro");
					List<Double> listaPrecios = (List<Double>)session.getAttribute("precios");
					if(listaElementos == null)
					{
					listaElementos =new ArrayList<String>();
					listaPrecios = new ArrayList<Double>();
					session.setAttribute("carro", listaElementos);
					session.setAttribute("precios", listaPrecios);
					}
					String[] elementos=request.getParameterValues("productos");
					int i=0;
					double aux = 0;
					if (elementos!=null)
					{
						while(i<elementos.length)
						{
							listaElementos.add(producto.getProductoById(elementos[i]));
							listaPrecios.add(producto.getPrecioById(elementos[i]));
							i++;
						}
					}	
					String sentencia = "<table class=tabla_pro><thead><tr><th scope=\"col\">#</th><th scope=\"col\">Nombre</th><th scope=\"col\">Precio</th>"
			  		+"</tr></thead><tbody><tr>";
					for (int j=0; j<listaElementos.size(); j++)
					{
						sentencia+="<th scope=\"row\">"+(j+1)+"</th>"
								+"<td>"+listaElementos.get(j)+"</td>"
								+"<td>"+"$"+listaPrecios.get(j)+"</td></tr>";
					}
					for (Double a:listaPrecios)
					{
						aux+=a;
					}
					session.setAttribute("precio", aux);
					precio=aux;
					sentencia+="</tbody></table>";
					out.println(sentencia);
				%>
				</div>
				<div class='precio'>
					<h3>Total: <span>$<%=precio %></span></h3>
				</div>
			</div>
							
		</div>
		
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