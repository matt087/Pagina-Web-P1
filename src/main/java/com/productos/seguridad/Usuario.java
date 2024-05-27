package com.productos.seguridad;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.productos.datos.*;
import com.productos.negocio.Producto;

public class Usuario {

	private int id;
	private int perfil;
	private int estado_civil;
	private String cedula;
	private String nombre;
	private String correo;	//importante
	private String clave;	//importante
	private String telefono;

	public int getId() 
	{
		return id;
	}

	public void setId(int id) 
	{
		this.id = id;
	}

	public int getPerfil() 
	{
		return perfil;
	}

	public void setPerfil(int perfil) 
	{
		this.perfil = perfil;
	}

	public int getEstado_civil() 
	{
		return estado_civil;
	}

	public void setEstado_civil(int estado_civil) 
	{
		this.estado_civil = estado_civil;
	}

	public String getCedula() 
	{
		return cedula;
	}

	public void setCedula(String cedula) 
	{
		this.cedula = cedula;
	}

	public String getNombre() 
	{
		return nombre;
	}

	public void setNombre(String nombre) 
	{
		this.nombre = nombre;
	}

	public String getCorreo() 
	{
		return correo;
	}

	public void setCorreo(String correo) 
	{
		this.correo = correo;
	}

	public String getClave() 
	{
		return clave;
	}

	public void setClave(String clave) 
	{
		this.clave = clave;
	}

	public String getTelefono() 
	{
		return telefono;
	}

	public void setTelefono(String telefono) 
	{
		this.telefono = telefono;
	}

	public String ingresarCliente()
	{
		String result="";

		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_usuario (id_us, id_per, id_est, nombre_us,"
				+ "cedula_us,correo_us,clave_us, telefono_us) "
				+ "VALUES(?,?,?,?,?,?,?,?)";
		try{
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,this.getId());
			pr.setInt(2,2);
			pr.setInt(3, this.getEstado_civil());
			pr.setString(4, this.getNombre());
			pr.setString(5, this.getCedula());
			pr.setString(6, this.getCorreo());
			pr.setString(7, this.getClave());
			pr.setString(8, this.getTelefono());

			if(pr.executeUpdate()==1)
			{
				result="Insercion correcta";
			}
			else
			{
				result="Error en insercion";
			}
		}
		catch(Exception ex)
		{
			result=ex.getMessage();
			System.out.print(result);
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


	//modificar este método
	public int getUsuarios()
	{
		String sql="SELECT id_us FROM tb_usuario";
		ResultSet rs=null;
		int aux=0, valor=0;
		Conexion con=new Conexion();
		try
		{
			rs=con.Consulta(sql);
			while(rs.next())
			{
				valor=rs.getInt(1);
				if(valor>aux)
				{
					aux=valor;
				}
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return aux;
	}

	public boolean verificarUsuario(String nlogin, String nclave)
	{
		boolean respuesta=false;
		String sentencia= "Select * from tb_usuario where correo_us='"+nlogin+
				"' and clave_us='"+nclave+"';";
		//System.out.print(sentencia);
		try
		{
			ResultSet rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Consulta(sentencia);
			if(rs.next())
			{
				respuesta=true;
				this.setCorreo(rs.getString(6));
				this.setClave(rs.getString(7));
				this.setPerfil(rs.getInt(2));
				this.setNombre(rs.getString(1));
			}
			else
			{
				respuesta=false;
				rs.close();
			}
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return respuesta;
	}
	public String getUserbyId(String id)
	{
		String sql="SELECT nombre_us FROM tb_usuario WHERE id_us="+id;
		ResultSet rs=null;
		Conexion con=new Conexion();
		String usuario="";
		try
		{
			rs=con.Consulta(sql);
			while(rs.next())
			{
				usuario=String.valueOf(rs.getString(1));
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return usuario;	}
	
	public String getPass(String id)
	{
		String sql="SELECT clave_us FROM tb_usuario WHERE id_us="+id;
		ResultSet rs=null;
		Conexion con=new Conexion();
		String pass="";
		try
		{
			rs=con.Consulta(sql);
			while(rs.next())
			{
				pass=rs.getString(1);
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return pass;
	}
	
	public void modificarUser(int codigo)
	{
		Conexion con=new Conexion();
		ResultSet rs = null;
		String sql = "SELECT * FROM tb_usuario WHERE id_us="+codigo;
		try 
		{
			rs=con.Consulta(sql);
			while(rs.next()) 
			{
				this.setId(rs.getInt(1));
				this.setPerfil(rs.getInt(2));
				this.setEstado_civil(rs.getInt(3));
				this.setNombre(rs.getString(4));
				this.setCedula(rs.getString(5));
				this.setCorreo(rs.getString(6));
				this.setClave(rs.getString(7));
				this.setTelefono(rs.getString(8));
			}
		} 
		catch (SQLException e) 
		{
			System.out.print(e.getMessage());

		}
	}
	
	public boolean editarInfo(String clave)
	{
		boolean ingresado = false;
		Conexion con=new Conexion();
		String sql = "UPDATE tb_usuario SET clave_us='"+clave+"' WHERE id_us="+this.getId();
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
}


