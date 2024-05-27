package com.productos.seguridad;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.productos.datos.Conexion;
public class Pagina {
	private String nombre;
	private String path;

	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}

	public String mostrarMenu(int perfil)
	{
		String menu="<ul style='list-style-type: none;'>";

		String sql="SELECT * FROM tb_pagina pag, tb_perfil per, \"tb_perfilPagina\" pper "
				+ "WHERE pag.id_pag=pper.id_pag AND pper.id_per=per.id_per AND pper.id_per= "+perfil
				+" ORDER BY pag.id_pag desc";
		Conexion con = new Conexion();
		ResultSet rs=null;
		try
		{
			rs=con.Consulta(sql);
			while(rs.next())
			{
				menu+="<li><a href="+rs.getString(3)+" accesskey="+rs.getInt(1)+">"+rs.getString(2)+
				"</A></li>";
			}
			menu+="</ul>";
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return menu;
	}

}
