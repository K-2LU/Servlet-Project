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
@WebServlet("/AdminAddNewCourse")
public class AdminAddNewCourse extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		String uid = (String) request.getParameter("uid");
		String courseID = (String) request.getParameter("courseID");
		String courseName = (String) request.getParameter("courseName");
		String dept = (String) request.getParameter("dept");
		String instructorID = (String) request.getParameter("instructorID");
		String c = request.getParameter("credit");
		System.out.println(c);
		int credit = Integer.valueOf(c);

		PreparedStatement ps;	
		Connection con;
		ResultSet rs;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "admin");
			
			String sql = "INSERT INTO course(course_id, course_name, dept, credit) VALUES(?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, courseID);
			ps.setString(2, courseName);
			ps.setString(3, dept);
			ps.setInt(4, credit);

			
			int rows = ps.executeUpdate();
	//		rs.next();
	
	//		String sql2 = "SELECT * FROM teacher WHERE id = ?)";
	//		ps = con.prepareStatement(sql2);
	//		ps.setString(1, uid);
	//		rs = ps.executeQuery();
	//		rs.next();
	//		
	//		
			
			String sql3 = "INSERT INTO teaches(teacher_id, course_id, semester, year) VALUES(?, ?, 'Summer', '2019')";
			ps = con.prepareStatement(sql3);
	
			ps.setString(1, instructorID);
			ps.setString(2, courseID);
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
		
		RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
		request.setAttribute("uid", uid);
		rd.forward(request, response);
	}

}
