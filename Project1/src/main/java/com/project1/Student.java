package com.project1;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Student {
	
	String name;
	String registration;
	String email;
	String phone;
	String session;
	String dept;
	String password;
	
	PreparedStatement ps;	
	Connection con;
	ResultSet rs;
	
	Student(String id)	{

		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "admin");
			ps = con.prepareStatement("SELECT * from student where registration = ?");
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			registration = rs.getString("registration");
			name = rs.getString("name");
			email = rs.getString("email");
			phone = rs.getString("phone");
			session = rs.getString("session");
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

}
