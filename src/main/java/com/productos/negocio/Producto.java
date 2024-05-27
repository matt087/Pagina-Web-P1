package com.productos.negocio;

//import java.io.File;
//import java.io.FileInputStream;
import java.sql.*;
import com.productos.datos.Conexion;

public class Producto {

	private int id_producto;
	private int id_categoria;
	private String nombre;
	private int cantidad;
	private double precio;
	private byte foto;

	public Producto() {}

	public Producto(int id_producto, int id_categoria, String nombre, int cantidad, double precio, byte foto) {
		this.id_producto = id_producto;
		this.id_categoria = id_categoria;
		this.nombre = nombre;
		this.cantidad = cantidad;
		this.precio = precio;
		this.foto = foto;
	}

	public Producto(int id_producto, int id_categoria, String nombre, int cantidad, double precio) {
		this.id_producto = id_producto;
		this.id_categoria = id_categoria;
		this.nombre = nombre;
		this.cantidad = cantidad;
		this.precio = precio;
		this.foto=0;
	}

	public int getId_producto() {
		return id_producto;
	}

	public void setId_producto(int id_producto) {
		this.id_producto = id_producto;
	}

	public int getId_categoria() {
		return id_categoria;
	}

	public void setId_categoria(int id_categoria) {
		this.id_categoria = id_categoria;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public byte getFoto() {
		return foto;
	}

	public void setFoto(byte foto) {
		this.foto = foto;
	}

	public String consultarProductos()
	{
		String sql="SELECT * FROM tb_producto GROUP BY id_pro";
		Conexion con=new Conexion();
		String tabla="<table class=carrito><th>Producto</th><th>Añadir al carrito</th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{
				tabla+="<tr><td>"+rs.getString(3)+"</td>"
						+ "<td><input clas='rdbtn_carro' type=checkbox name=productos value="+rs.getInt(1)+"></td>"
						+ "</tr>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		tabla+="</table>";
		return tabla;
	}

	public String consultarTodo2()
	{
		String sentencia="SELECT * FROM tb_producto ORDER BY id_pro";
		Conexion con=new Conexion();
		ResultSet rs=null;
		String tabla="<table class=\"table\"><thead><tr><th scope=\"col\">ID</th><th scope=\"col\">Producto</th><th scope=\"col\">Cantidad</th><th scope=\"col\">Precio</th></tr></thead><tbody><tr>";
		try 
		{
			rs=con.Consulta(sentencia);
			if(rs==null)
			{
				tabla="<p>No hay productos ingresados</p>";
			}
			else 
			{
				while(rs.next())
				{
					tabla+="<th scope=\"row\">"+rs.getInt(1)+"</th>"
							+ "<td>"+rs.getString(3)+"</td>"
							+ "<td>"+rs.getString(4)+"</td>"
							+ "<td>"+rs.getDouble(5)+"</td></tr>";
				}
				tabla+="</tbody></table>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
		}
		return tabla;
	}

	public String consultarTodo()
	{
		String sentencia="SELECT * FROM tb_producto ORDER BY id_pro";
		Conexion con=new Conexion();
		ResultSet rs=null;
		String tabla="<table class=\"table\"><thead><tr><th scope=\"col\">ID</th><th scope=\"col\">Producto</th><th scope=\"col\">Cantidad</th><th scope=\"col\">Precio</th></tr></thead><tbody><tr>";
		try 
		{
			rs=con.Consulta(sentencia);
			while(rs.next())
			{
				int cod = rs.getInt(1);
				String nombre = rs.getString(3);
				tabla+="<th scope=\"row\">"+rs.getInt(1)+"</th>"
						+ "<td>"+rs.getString(3)+"</td>"
						+ "<td>"+rs.getString(4)+"</td>"
						+ "<td>"+rs.getDouble(5)+"</td>"
						+"<td><a href=\"modificar_productos.jsp?valor="+cod+"&valor2="+nombre+"\">Modificar</a></td>"
						+"<td><a href=\"respuesta_eliminar_producto.jsp?valor="+cod+"&valor2="+nombre+"\">Eliminar</a></td></tr>";
			}
			tabla+="</tbody></table>";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
		}
		return tabla;
	}

	public String getProductoById(String id)
	{
		String sentencia="SELECT nombre_pr FROM tb_producto WHERE id_pro="+id;
		Conexion con=new Conexion();
		ResultSet rs=null;
		String nombre="";
		try 
		{
			rs=con.Consulta(sentencia);
			while(rs.next())
			{
				 nombre = rs.getString(1);						
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
		}
		return nombre;
	}
	public double getPrecioById(String id)
	{
		String sentencia="SELECT precio_pr FROM tb_producto WHERE id_pro="+id;
		Conexion con=new Conexion();
		ResultSet rs=null;
		double precio=0;
		try 
		{
			rs=con.Consulta(sentencia);
			while(rs.next())
			{
				precio = rs.getDouble(1);						
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
		}
		return precio;
	}

	public String ingresarProducto(int id, int cat,String nombre, int cantidad, double precio,
			String directorio)
	{
		String result="";
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_producto (id_pro,id_cat,"
				+ "nombre_pr,cantidad_pr,precio_pr,foto_pr) "
				+ "VALUES(?,?,?,?,?,?)";
		try{
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,id);
			pr.setInt(2,cat);
			pr.setString(3, nombre);
			pr.setInt(4, cantidad);
			pr.setDouble(5, precio);
			pr.setBinaryStream(6, null);
			if(pr.executeUpdate()==1)
			{
				result="correcto_ins";
			}
			else
			{
				result="error_ins";
			}
		}
		catch(Exception ex)
		{
			result=ex.getMessage();
		}
		finally
		{
			try
			{
				pr.close();
				con.getConexion().close();
			}
			catch(Exception ex)
			{
				System.out.print(ex.getMessage());
			}
		}
		return result;
	}



	public String buscarProductoCategoria(int cat)
	{
		String sentencia="SELECT nombre_pr, precio_pr FROM tb_producto WHERE id_cat="+cat;
		Conexion con=new Conexion();
		ResultSet rs=null;
		String resultado="<table class=\"table\"><thead><tr><th scope=\"col\">NOMBRE</th><th scope=\"col\">PRECIO</th></tr></thead><tbody><tr>";
		try
		{
			rs=con.Consulta(sentencia);
			if(rs==null)
			{
				resultado = "<p>No hay productos ingresados</p>";
			}
			else
			{
				while(rs.next())
				{
					resultado+="<td>"+ rs.getString(1)+"</td>"
							+ "<td>"+rs.getDouble(2)+"</td></tr>";
				}
				resultado+="</tbody></table>";
			}

		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return resultado;
	}

	public void modificarProductos(int codigo)
	{
		Conexion con=new Conexion();
		ResultSet rs = null;
		String sql = "SELECT id_pro, id_cat, nombre_pr, precio_pr, cantidad_pr FROM tb_producto WHERE id_pro="+codigo;
		try 
		{
			rs=con.Consulta(sql);
			while(rs.next()) 
			{
				this.setId_producto(rs.getInt(1));
				this.setId_categoria(rs.getInt(2));
				this.setNombre(rs.getString(3));
				this.setCantidad(rs.getInt(4));
				this.setPrecio(rs.getDouble(5));
			}
		} 
		catch (SQLException e) 
		{
			System.out.print(e.getMessage());

		}
	}

	public boolean editarInfo(Producto p)
	{
		boolean ingresado = false;
		Conexion con=new Conexion();
		String sql = "UPDATE tb_producto SET id_cat="+p.getId_categoria()+", nombre_pr='"+p.getNombre()+"', cantidad_pr="
				+p.getCantidad()+", precio_pr="+p.getPrecio()+" WHERE id_pro="+p.getId_producto();
		try 
		{
			con.Ejecutar(sql);
			ingresado = true;
		} 
		catch (Exception e) 
		{
			ingresado = false;
			System.out.print(e.getMessage());
		}
		return ingresado;
	}

	public boolean eliminarProducto(int codigo)
	{
		boolean eliminado = false;
		Conexion con=new Conexion();
		String sql = "DELETE FROM tb_producto WHERE id_pro="+codigo;
		try 	
		{
			con.Ejecutar(sql);
			eliminado = true;
		} 
		catch (Exception e) 
		{
			eliminado=false;
			System.out.print(e.getMessage());
		}
		return eliminado;
	}
	
	public int getNewId()
	{
		Conexion con=new Conexion();
		ResultSet rs = null;
		String sql = "SELECT id_pro FROM tb_producto";
		int aux = 0, valorComparar=0;
		try 
		{
			rs=con.Consulta(sql);
			while(rs.next()) 
			{
				valorComparar = rs.getInt(1);
				if(rs.getInt(1)>aux)
				{
					aux=valorComparar;
				}
			}
		} 
		catch (SQLException e) 
		{
			System.out.print(e.getMessage());

		}
		return aux;
	}
}
