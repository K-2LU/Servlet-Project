<!DOCTYPE html>
<html>

<%@ page import="com.project1.*" %> 
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %>
<%@	page import="java.sql.PreparedStatement" %>
<%@	page import="java.sql.ResultSet" %>
<%@	page import="java.sql.SQLException" %>
<% 		
	String uid = request.getParameter("uid");
	
	System.out.println(uid + " student course registration");
	
	Student ad = new Student(uid);
	System.out.println(ad.getID());
%>
	

<head>
    <title>Course Registration</title>
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
                <hr>
                </div>
                <form action=index.jsp>
                <button class="logout-button"><i class="glyphicon glyphicon-log-out"></i>&nbsp; Logout</button>
            	</form>
            </div>
            <div class="col-md-10">
                <div id="main-content">
                    <style>
                        p {
                            padding-top: 20px;
                            padding-bottom: 10px;
                            padding-left: 10px;
                        }
                    </style>
                    <p style="font-size: large;" class="par"> Course Registration</p>
                    <style>
                        table {
                            width: 100%;
                            border-collapse: collapse;
                            margin-top: 0%;
                        }

                        th,
                        td {
                            padding: 8px;
                            text-align: center;
                            border-bottom: 1px solid #ddd;
                        }

                        tr : hover {
                            background-color: #f5f5f5;
                        }


                        thead {
                            background-color: #c0afde;
                            color: #fff;
                        }

                        .table-responsive {
                            max-height: 70vh;
                            overflow-y: auto;
                        }
                    </style>
                    <div class="table-responsive">
                        <style>
                            .table-responsive {
                                padding: 10px;
                            }
                        </style>
                       <form action="StudentNewCourse" method="post">
                        <table class="table table-striped table-hover table-bordered">
                            <thead>
                        <tr>		
                        			<th> </th>
                                    <th>Course ID</th>
                                    <th>Course Name</th>
                                    <th>Department</th>
                                    <th>Credit</th>
                                </tr>
                            </thead>
                            <tbody>
					<% 
			        	PreparedStatement ps;	
			        	Connection con;
			        	ResultSet rs;
		
			        	String courseID;
			        	
			    		try {
			    			String first = "select * from course where course.course_id not in ";
			    			String second = "(select course.course_id from student, takes, course where student.registration= ? ";
			    			String third = "and student.registration = takes.student_id and takes.course_id = course.course_id)";
			    			
			    			Class.forName("com.mysql.cj.jdbc.Driver");
			    			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "admin");
			    			ps = con.prepareStatement(first + second + third);
			    			ps.setString(1, ad.getID());
			    			rs = ps.executeQuery();
			    			
			    			while(rs.next())	{
			    				courseID = rs.getString("course_id");
				    			%>
				    			<tr>
				    				<td> <input type="checkbox" name="tick" value=<%= courseID %>>
									<label for="vehicle1"></label><br> </td>
					    			<td><%= rs.getString("course_id") %> </td>
					    			<td><%= rs.getString("course_name")  %> </td>
					    			<td><%= rs.getString("dept")  %> </td>
					    			<td><%= rs.getString("credit") %></td>
				    			</tr>
			    			<%}
			    			
			    		} catch (ClassNotFoundException e) {
			    			// TODO Auto-generated catch block
			    			e.printStackTrace();
			    		} catch (SQLException e) {
			    			// TODO Auto-generated catch block
			    			e.printStackTrace();
			    		}
		            %>
			
                            </tbody>
                        </table>
                        <input type="hidden" name="uid" value=<%= ad.getID()%>>
                        <button type="submit">Submit</button>
                       </form>
                    </div>

                </div>
            </div>
        </div>
</body>

</html>