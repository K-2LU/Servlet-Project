package com.project1;

import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginRedirect
 */
@WebServlet("/loginRedirect")
public class loginRedirect extends HttpServlet {
	
	PreparedStatement ps;	
	Connection con;
	ResultSet rs;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		try {
					
					PrintWriter out = response.getWriter();
					Class.forName("com.mysql.cj.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "admin");
					
					String n = request.getParameter("txtName");
					String p = request.getParameter("txtPass");
					
					
					ps = con.prepareStatement("SELECT * FROM login where id = ? AND password = ?");
					ps.setString(1, n);
					ps.setString(2, p);
					rs = ps.executeQuery();
					
					if(rs.next())	{

						String t = rs.getString(3);
						System.out.println(t);
												
						if (t.equals("admin"))	{
								RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
								rd.forward(request, response);
						}else if(t.equals("student")){
							RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
							rd.forward(request, response);
						}
					
					}	else	{			
						request.setAttribute("errorMessage", "Wrong password!");
						RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
						dispatcher.forward(request, response);
					}
					
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
