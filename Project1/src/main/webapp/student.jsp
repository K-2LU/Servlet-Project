<!DOCTYPE html>
<html>

<%@ page import="com.project1.Student" %> 
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %>
<%@	page import="java.sql.PreparedStatement" %>
<%@	page import="java.sql.ResultSet" %>
<%@	page import="java.sql.SQLException" %>
<% 
	String uid = (String)request.getAttribute("uid");
	System.out.println(uid);
	Student ad = new Student(uid);
	
	HttpSession hsession = request.getSession();
	hsession.setAttribute("uid", ad.getID());
%>
	

<head>
    <title>Student Home Page</title>
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
                <form action="addnewcourse.jsp">
                <button><i class="glyphicon glyphicon-plus"></i>&nbsp; Register for a new course</button>
                 </form>

                
                </div>
                <button class="logout-button"><i class="glyphicon glyphicon-log-out"></i>&nbsp; Logout</button>
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
                    <p style="font-size: large;" class="par">Current Courses</p>
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
                        <table class="table table-striped table-hover table-bordered">
                            <thead>
                                <tr>
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
		
			        	String course_name;
			        	String course_id;
			        	String dept;
			        	String credit;
			        	
			    		try {
			    			Class.forName("com.mysql.cj.jdbc.Driver");
			    			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "admin");
			    			ps = con.prepareStatement("select * from takes, course where takes.course_id = course.course_id and student_id = ?");
			    			ps.setString(1, uid);
			    			
			    			rs = ps.executeQuery();
			    			while(rs.next())	{
			    			
				    			course_id = rs.getString("course.course_id");
				    			course_name = rs.getString("course.course_name");
				    			dept = rs.getString("course.dept");
				    			//credit = Integer.parseString(rs.getInt("course.credit"));
				    			
				    			%>
				    			<tr>
				    			<td><%= rs.getString("course.course_id") %> </td>
				    			<td><%= rs.getString("course.course_name")  %> </td>
				    			<td><%= rs.getString("course.dept")  %> </td>
				    			<td><%= rs.getInt("course.credit") %> </td>
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
                    </div>

                </div>
            </div>
        </div>
</body>

</html>