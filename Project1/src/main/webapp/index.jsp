<!DOCTYPE html>
<html>

<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="container">
        <div class="left">      
        </div>
        <div class="right">
	        
            <form action="loginRedirect" method="post">
                <h2>Welcome to Servlet Project</h2>
                <input type="text" placeholder="Username" align="center" name="txtName">
                <input type="password" placeholder="Password" name="txtPass">
           
				
                <div>
                    <button type="submit">Login</button>
                </div>
                     <br>
                <div class="message">
                <% if (request.getAttribute("errorMessage") != null) { %>
				<div style="color:red"> <%= request.getAttribute("errorMessage") %> </div>
				<% } %>	
            </div>
            </form>
        </div>
    </div>
</body>

</html>