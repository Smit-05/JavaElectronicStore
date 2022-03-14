<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	if(session.getAttribute("userName") != null){
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="False"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

	
	<div class="container col-md-4 mt-4 p-5">
		
	
		<center>
            <h2 style="margin-bottom:45px!important">Add Category</h2>
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
		
		<form:form action="saveCategory" method="post" modelAttribute="category">
		
			
			<div class="col-md-12">
                <label for="validationCustomUsername" class="form-label">Category Name</label>
                <div class="input-group has-validation">
                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                    <form:input type="text" path="cName" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" name="cName"/>
                </div>
            </div>
            <br>
            <div class="col-md-12">
            	<center><button type="submit" class="btn btn-primary mb-3">Add</button></center>
            </div>


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
		
		</form:form>
	</div>

</body>
</html>
<% 
	}
%>