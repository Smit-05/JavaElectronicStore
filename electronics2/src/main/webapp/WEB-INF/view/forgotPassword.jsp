<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
<title>Insert title here</title>
</head>
<body>

	<div class="container col-md-4 mt-4 p-5"">
	
		<center>
            <h2 style="margin-bottom:45px!important">Forgot Password</h2>
        </center>
		
		<form  action="resetValidate" method="post">
			
			<div class="col-md-12">
                <label for="validationCustomUsername" class="form-label">E-mail</label>
                <div class="input-group has-validation">
                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                    <input type="email" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" name="email" required />
                </div>
            </div>
            <br>
            <div class="col-md-12">
            	<center><button type="submit" class="btn btn-primary mb-3">Submit</button></center>
            </div>
		
		</form>
	</div>

</body>
</html>