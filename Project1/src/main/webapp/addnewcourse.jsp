<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%@ page import="com.project1.Admin" %> 
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %>
<%@	page import="java.sql.PreparedStatement" %>
<%@	page import="java.sql.ResultSet" %>
<%@	page import="java.sql.SQLException" %>

<%
	String uid = (String) request.getAttribute("uid");
	HttpSession hsession = request.getSession();
	//String uid = (String) hsession.getAttribute("uid");
	Admin ad = new Admin(uid);
	
	System.out.println(ad.getName());
%>

<head>
    <title>Add a new course</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="adstyle.css">
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2" id="left-sidebar">
                <!--  <div class="logo">Google Drive</div> -->
                <div class="logo">
                    <img src="./images/logo64px.png" alt="SUST Logo" style="max-width: 70%;">
                </div>
                <div class="user-info">
					
					<div class="user-name">
						<li><%= ad.getName() %></li>
                    </div>
                    
                    <li><%= ad.getID() %></li>
                    <li><%= ad.getEmail()%></li>
                    <li><%= ad.getPhone()%></li>
                    
                </div>
                
                <div class="buttons">
                    
	                <button class="active"><i class="glyphicon glyphicon-folder-open"></i>&nbsp; Current Courses</button>
	                <button><i class="glyphicon glyphicon-star"></i>&nbsp; Current Students</button>
	                <hr>
                <form action="AddNewCourse" method="post">
                	<input type="hidden" name="uid" value= <%= ad.getID() %> >
                	<button><i class="glyphicon glyphicon-plus"></i>&nbsp; Add New course</button>
                 </form>
	                <button><i class="glyphicon glyphicon-folder-close"></i>&nbsp; Add New Student</button>
                
				</div>
                <form action=index.jsp>
                <button class="logout-button"><i class="glyphicon glyphicon-log-out"></i>&nbsp; Logout</button>
            	</form>            
            </div>
            
            <div class="col-md-10">
                <div id="main-content">
                    <div class="form-container">
                        <h2>Enter Course Credentials</h2>
                        <form>
                          <div class="form-group">
                            <label for="name">Course ID:</label>
                            <input type="text" id="courseID" name="courseID" required>
                          </div>
                      
                          <div class="form-group">
                            <label for="courseName">Course Name:</label>
                            <input type="text" id="courseName" name="courseName" required>
                          </div>

                          <div class="form-group">
                            <label for="courseName">Department Name:</label>
                            <input type="text" id="deptName" name="dept" required>
                          </div>
                        
                          <div class="form-group">
                            <label for="credit">Credit:</label>
                            <input type="text" id="credit" name="credit" required>
                          </div>

                          <div class="form-group">
                            <label for="semester">Course Semester:</label>
                            <input type="text" id="semester" name="semester" required>
                          </div>

                          <div class="form-group">
                            <label for="courseName">Course Year:</label>
                            <input type="text" id="courseYear" name="year" required>
                          </div>
                      
                          <button type="submit">Send</button>
                        </form>
                      </div>
                      
                </div>
            </div>
        </div>
</body>
