package com.project1;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class sqlCount {
	
	PreparedStatement ps;	
	static Connection con;
	ResultSet rs;
	
	public  String count(String table)	{
		
		String data = "";
		try {		
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "admin");
			ps = con.prepareStatement("SELECT count(*) FROM ?");
			ps.setString(1, table);
			rs = ps.executeQuery();
			rs.next();
			
			int c = rs.getInt(1);
			data = String.valueOf(c);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return data;
	}
}
