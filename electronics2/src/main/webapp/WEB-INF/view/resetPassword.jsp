<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="False"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link href="<c:url value="/resources/css/registerForm.css"/>" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container col-md-4 mt-4 p-5">
	
		<center>
            <h2 style="margin-bottom:45px!important">Set New Password</h2>
        </center>
		
		<form  action="newPassword" method="post">
			<input type="text" value="${UserName}" name="uname" hidden="true">
			
			<div class="col-md-12">
                <label for="validationCustom01" class="form-label">New Password</label>
                <input type="password" class="form-control" id="validationCustom01" name="newPassword" required />
            </div>
            <br>
            <div class="col-md-12">
                <label for="validationCustom01" class="form-label">Confirm New Password</label>
                <input type="password" class="form-control" id="validationCustom01" name="cNewPassword" required />
            </div>
            <br>
            <div class="col-md-12">
            	<center><button type="submit" class="btn btn-primary mb-3">update</button></center>
            </div>
		
		</form>
	</div>

</body>
</html>