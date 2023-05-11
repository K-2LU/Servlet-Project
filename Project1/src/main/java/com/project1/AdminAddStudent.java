package com.project1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminAddNewCourse
 */
@WebServlet("/AdminAddStudent")
public class AdminAddStudent extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		String uid = (String) request.getParameter("uid");
		String registration = (String) request.getParameter("registration");
		String name = (String) request.getParameter("name");
		String dept = (String) request.getParameter("dept");
		String phone = (String) request.getParameter("phone");
		String email = (String) request.getParameter("email");
		String session = (String) request.getParameter("session");
		String password = (String) request.getParameter("password");
		
		PreparedStatement ps;	
		Connection con;
		ResultSet rs;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "admin");
			
			String sql = "INSERT INTO student(registration, name, email, phone, session, dept, password) VALUES(?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, registration);
			ps.setString(2, name);
			ps.setString(3, email);
			ps.setString(4, phone);
			ps.setString(5, session);
			ps.setString(6, dept);
			ps.setString(7, password);

			
			int rows = ps.executeUpdate();
			
			String sql3 = "INSERT INTO login(id, password, user_type) VALUES(?, ?, 'student')";
			ps = con.prepareStatement(sql3);
	
			ps.setString(1, registration);
			ps.setString(2, password);
			rows = ps.executeUpdate();
			
			System.out.println("INSERT COMPLETE");
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(uid);
		
		RequestDispatcher rd = request.getRequestDispatcher("adminShowStudent.jsp");
		request.setAttribute("uid", uid);
		rd.forward(request, response);
	}

}
