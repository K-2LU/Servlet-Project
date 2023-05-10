package com.project1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddNewCourse
 */
@WebServlet("/TeacherViewStudents")
public class TeacherViewStudents extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String uid = request.getParameter("uid");
		String courseID = request.getParameter("courseID");
		
		RequestDispatcher rd = request.getRequestDispatcher("teacherViewStudents.jsp");
		request.setAttribute("uid", uid);
		request.setAttribute("courseID", courseID);
		rd.forward(request, response);
	}

}
