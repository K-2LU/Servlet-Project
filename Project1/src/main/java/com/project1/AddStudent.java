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
@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String uid = request.getParameter("uid");
		RequestDispatcher rd = request.getRequestDispatcher("addstudent.jsp");
		request.setAttribute("uid", uid);
		rd.forward(request, response);
	}

}
