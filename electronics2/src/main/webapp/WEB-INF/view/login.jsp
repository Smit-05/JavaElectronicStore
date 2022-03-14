<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="False"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%-- <center><h3 style="padding:20px">${message}</h3></center> --%>
	
	
        
    <%-- <c:if test = "${not empty success_msg}">
        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
	        <div class="alert alert-success alert-dismissible fade show" role="alert">
				  ${success_msg}
		    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
   </c:if> --%>
	
	<!-- <div align="center">
	    <form action="validateUser" method="POST">
	    	User Name: <input type="text" name="uName" id="uName" required><br><br>
	    	Password: <input type="password" name="password" id="password" required><br><br>
	    	<center><input type="submit" value="Login"></center>
	    	<br>
	    	New User Register<a href="register">Sign Up</a>
	    </form>
	</div> -->
	
	
	<div class="container col-md-4 mt-4 p-5"">
		
	
		<center>
            <h2 style="margin-bottom:45px!important">Login Form</h2>
        </center>
		
		<c:if test = "${not empty message}">
			<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
		    <div class="alert alert-danger alert-dismissible fade show" role="alert">
				${message}
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
	    </c:if>
	    
	    <c:if test = "${not empty success_message}">
	        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
		        <div class="alert alert-success alert-dismissible fade show" role="alert">
					  ${success_message}
			    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
	   </c:if>
		
		<form  action="validateUser" method="post">
		
			<!-- <div class="form-control mb-3">
			  <label for="Name">Username</label>
			  <input type="text" class="form-control" id="Name" name="uName" placeholder="Enter Your Username" required>
			</div>
			<div class="form-control">
			  <label for="Password">Password</label>
			  <input type="password" class="form-control" id="Password" name="password" placeholder="Password" required>
			</div> -->
			
			<div class="col-md-12">
                <label for="validationCustomUsername" class="form-label">Username</label>
                <div class="input-group has-validation">
                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                    <input type="text" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" name="uName" required />
                </div>
            </div>
            <br>
            <div class="col-md-12">
                <label for="validationCustom01" class="form-label">Password</label>
                <input type="password" class="form-control" id="validationCustom01" name="password" required />
            </div>
            <br>
            <div class="col-md-12">
            	<center><button type="submit" class="btn btn-primary mb-3">Login</button></center>
            </div>

			<center>New User <a href="register">Register</a></center>
            
			<!-- <div class="row">
			
				<div class="col-md-3">
					<div class="col mt-4">
				    	<button type="submit" class="btn btn-primary mb-3">Login</button>
				    </div>
				</div>
				<div class="col-md-3">
					<div class="col mt-4">
				    	<a href="register" class="btn btn-primary">Register</a>
				    </div>
				</div>
			
			</div> -->
		
		</form>
	</div>

</body>
</html>