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
 * Servlet implementation class StudentNewCourse
 */
@WebServlet("/StudentNewCourse")
public class StudentNewCourse extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		String uid = (String) request.getParameter("uid");
		String[] courses = request.getParameterValues("tick");
		
		Student st = new Student(uid);
		System.out.println(st.getID() + " cr " + uid);
		for(String i: courses)	{
			System.out.println(i);
		}
		
		PreparedStatement ps;	
		Connection con;
		ResultSet rs;
		
		int success = 0;
		for(int i=0; i < courses.length; i++) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "admin");
				
				String courseID = courses[i];
				String sql = "INSERT INTO takes(student_id, course_id, semester, year) VALUES(?, ?, 'Summer', '2019')";
				ps = con.prepareStatement("INSERT INTO takes(student_id, course_id, semester, year) VALUES(?, ?, 'Summer', '2019')");
				
				ps.setString(1, st.getID());
				ps.setString(2, courseID);
				
				int rows = ps.executeUpdate();
//				rs.next();
				
				success++;
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		if(success == courses.length) {
			
		}	else	{
			
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("registerNewCourse.jsp");
		request.setAttribute("uid", uid);
		rd.forward(request, response);
	}

}
