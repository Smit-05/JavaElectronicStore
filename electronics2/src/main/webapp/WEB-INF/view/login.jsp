<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="False"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    
    <center><h3 style="padding:20px">${message}</h3></center>
    
    <div align="center">
	    <form action="validateUser" method="POST">
	    	User Name: <input type="text" name="uName" id="uName" required><br><br>
	    	Password: <input type="password" name="password" id="password" required><br><br>
	    	<center><input type="submit" value="Login"></center>
	    	<br>
	    	New User Register<a href="register">Sign Up</a>
	    </form>
	</div>

</body>
</html>