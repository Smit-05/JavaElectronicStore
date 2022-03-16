<% 

	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	if(session.getAttribute("userName") != null){
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="False"%>
<%@include file="../../resources/header/customerHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h2>Customer Home page</h2>

	<a href="displayCart">View Cart</a>

	<div class="row">
		<div class=col-md-3>
			<div class="list-group">
  				<a href="#" class="list-group-item list-group-item-action active" aria-current="true">
    				The current link item
  				</a>
  				<a href="#" class="list-group-item list-group-item-action">A second link item</a>
				<a href="#" class="list-group-item list-group-item-action">A third link item</a>
				<a href="#" class="list-group-item list-group-item-action">A fourth link item</a>
			</div>
		</div>
		<div class="col-md-9">
			<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="card">
  						<div class="card-body">
    						This is some text within a card body.
  						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
  						<div class="card-body">
    						This is some text within a card body.
  						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
  						<div class="card-body">
    						This is some text within a card body.
  						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
  						<div class="card-body">
    						This is some text within a card body.
  						</div>
					</div>
				</div>
			</div>
		</div>
	
		</div>	
	</div>
</body>
</html>
<% 
	}
%>