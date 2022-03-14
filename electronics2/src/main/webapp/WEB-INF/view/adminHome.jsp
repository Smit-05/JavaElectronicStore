<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	if(session.getAttribute("userName") != null){
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="False"%>
<%@include file="../../resources/header/adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
a{text-decoration: none; }
</style>
</head>
<body>

	<div class="container mt-4 text-center">
		<div class="row p-2">
		
			<div class="col-md-6">
				<a href="viewCustomer">
					<div class="card m-3" style="height: 25vh">
					<div class="card-body">
					<img class="m-4" alt="" src="resources/images/plus-circle.svg" style="height: 50px;width: 50px;"/><br>
					<h4>Add Product</h4> </div>
				</div>
				</a>
			</div>
			
			<div class="col-md-6">
				<a href="viewCustomer">
					<div class="card m-3" style="height: 25vh">
					<div class="card-body">
					<img class="m-4" alt="" src="resources/images/folder-plus.svg" style="height: 50px;width: 50px;"/><br>
					<h4>Add Category</h4></div>
				</div>
				</a>
			</div>
			
		</div>
		
		<div class="row p-2">
		
			<div class="col-md-4">
				<a href="viewCustomer">
					<div class="card m-3" style="height: 25vh;">
						
						<div class="card-body">
							<img class="m-4" alt="" src="resources/images/users.svg" style="height: 50px;width: 50px;"/><br>
							<h4>View Customers</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="viewCustomer">
					<div class="card m-3" style="height: 25vh">
					<div class="card-body"><img class="m-4" alt="" src="resources/images/package.svg" style="height: 50px;width: 50px;"/><br>
					<h4>View Products</h4>
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="viewCustomer">
					<div class="card m-3" style="height: 25vh">
					<div class="card-body"><img class="m-4" alt="" src="resources/images/truck.svg" style="height: 50px;width: 50px;"/><br>
					<h4>View Orders</h4>
					</div>
				</div>
				</a>
			</div>
			
		</div>
	</div>
	
</body>
</html>
<% 
	}
%>