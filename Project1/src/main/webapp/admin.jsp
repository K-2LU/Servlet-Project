<!DOCTYPE html>
<html>
<%@ page import="com.project1.Admin" %> 
<% 
	String uid = (String)request.getAttribute("uid");
	Admin ad = new Admin(uid);
%>

<head>
    <title>My Web Page</title>
    <link rel="stylesheet" href="adstyle.css">
</head>

<body>
    <div id="sidebar">
        <h2>My Web Page</h2>
        <div class="admininfo">
            <ul>
                <li> 00101 </li>
                <li style="font-size: larger;"> <strong> <%= ad.getName() %>  </strong>  </li>
                <li><%= ad.getEmail() %></li>
                <li><%= ad.getPhone() %></li>
            </ul>
        </div>
        <div class="logout">
            <form action="logOutServlet">
                <button>logout</button>
            </form>
        </div>

    </div>
    <div id="content">
        <h1>Welcome to my web page</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet urna id nulla consectetur vestibulum a
            vel purus. Praesent nec enim vel velit euismod aliquam eu eget sapien. Vestibulum quis ipsum nec nibh
            pharetra malesuada. Aenean blandit diam ipsum, in ultricies ipsum bibendum sit amet. Suspendisse potenti.
            Morbi consectetur fermentum elit eget feugiat. Fusce euismod elementum velit et volutpat. Praesent nec
            rutrum justo. Donec eleifend urna lectus, at lobortis justo congue id. Vivamus malesuada tristique nunc, non
            posuere risus venenatis vel.</p>
    </div>
    
</body>

</html>