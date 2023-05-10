package com.project1;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Teacher {
	
	String name;
	String id;
	String email;
	String phone;
	String dept;
	String password;
	
	PreparedStatement ps;	
	Connection con;
	ResultSet rs;
	
	public Teacher(String id)	{

		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "admin");
			ps = con.prepareStatement("SELECT * from teacher where id = ?");
			ps.setString(1, id);
			rs = ps.executeQuery();
			rs.next();
			
			this.id = rs.getString("id");
			name = rs.getString("name");
			email = rs.getString("email");
			phone = rs.getString("phone");
			dept = rs.getString("dept");
			password = rs.getString("password");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	finally {
			
		    if (rs != null) {
		        try {
		            rs.close();
		        } catch (SQLException e) { /* Ignored */}
		    }
		    
		    if (ps != null) {
		        try {
		            ps.close();
		        } catch (SQLException e) { /* Ignored */}
		    }
		    
		    if (con != null) {
		        try {
		            con.close();
		        } catch (SQLException e) { /* Ignored */}
		    }
		}
		
		
	}

	public String getID()	{
		return id;
	}
	
	public String getName() {
		return name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public String getDept()	{
		return dept;
	}

	public String getPass() {
		return password;
	}

}
