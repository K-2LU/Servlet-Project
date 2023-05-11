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
                    
	                <form action="AdminRedirect" method="post">
                	<input type="hidden" name="uid" value= <%= ad.getID() %> >
                	<button><i class="glyphicon glyphicon-star"></i>&nbsp; Home</button>
				</form>
                
                <form action="AdminShowCourse" method="post">
                	<input type="hidden" name="uid" value= <%= ad.getID() %> >
                    <button ><i class="glyphicon glyphicon-folder-open"></i>&nbsp; Current Courses</button>
                </form>
				
				<form action="AdminShowStudent" method="post">
                	<input type="hidden" name="uid" value= <%= ad.getID() %> >
                    <button ><i class="glyphicon glyphicon-folder-open"></i>&nbsp; Current Students</button>
                </form>
                
                <hr>
                
                <form action="AddNewCourse" method="post">
                	<input type="hidden" name="uid" value= <%= ad.getID() %> >
                	<button><i class="glyphicon glyphicon-plus"></i>&nbsp; Add New course</button>
                 </form>
                 
                    <button class="active"><i class="glyphicon glyphicon-folder-open"></i>&nbsp; Add A Student</button>
                
                </div>
				<form action=index.jsp>
                	<button class="logout-button"><i class="glyphicon glyphicon-log-out"></i>&nbsp; Logout</button>
            	</form>
            </div>
            
            <div class="col-md-10">
                <div id="main-content">
                    <div class="form-container">
            <h2>Enter Credentials</h2>
            <form action="AdminAddStudent" method="post">
              <style>
                .form-inline {
                  padding-top: 3%;
                  padding-bottom: 3%;
                }

                .form-inline input {
                  padding-left: 10%;
                }
              </style>
              <div class="form-inline">
                <style>
                  .lb1 {
                    padding-right: 70px;
                  }
                </style>
                <label for="name" class="lb1">Registration:</label>
                <input type="text" id="courseID" name="registration" class="form-control" required>
              </div>

              <div class="form-inline">
                <style>
                  .lb2 {
                    padding-right: 47px;
                  }
                </style>
                <label for="courseName" class="lb2">Name:</label>
                <input type="text" id="courseName" name="name" class="form-control" required>
              </div>

              <div class="form-inline">
                <style>
                  .lb3 {
                    padding-right: 18px;
                  }
                </style>
                <label for="courseName" class="lb3">Department:</label>
                <input type="text" id="deptName" name="dept" class="form-control" required>
              </div>
              <div class="form-inline">
                <style>
                  .lb7 {
                    padding-right: 10px;
                  }
                </style>
                <label for="credit" class="lb7">Email:</label>
                <input type="text" id="credit" name="email" class="form-control" required>
              </div>
              
              <div class="form-inline">
                <style>
                  .lb4 {
                    padding-right: 97px;
                  }
                </style>
                <label for="credit" class="lb4">Phone:</label>
                <input type="text" id="credit" name="phone" class="form-control" required>
              </div>

				<div class="form-inline">
                <style>
                  .lb4 {
                    padding-right: 97px;
                  }
                </style>
                <label for="credit" class="lb4">Session:</label>
                <input type="text" id="credit" name="session" class="form-control" required>
              </div>
				<div class="form-inline">
                <style>
                  .lb4 {
                    padding-right: 97px;
                  }
                </style>
                <label for="credit" class="lb4">Password:</label>
                <input type="text" id="credit" name="password" class="form-control" required>
              </div>
				
              <style>
                .btnn {
                  width: 30%;
                  margin-left: 26%;
                }
              </style>
              <input type="hidden" name="uid" value=<%= ad.getID() %> >
              <button type="submit" class="btnn">Submit</button>
            </form>
          </div>

                </div>
            </div>
        </div>
</body>
