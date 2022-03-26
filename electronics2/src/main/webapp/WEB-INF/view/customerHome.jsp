<%@page import="dao.CategoryDAOImpl"%>
<%@page import="model.Category"%>
<%@page import="service.CategoryServiceImpl"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="service.ProductServiceImpl"%>
<%@page import="service.ProductService"%>
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
				<a href="customerHome?cid=0" class="list-group-item list-group-item-action active"  aria-current="true">
    				All Products
  				</a>
				<%
					CategoryDAOImpl catWrapper = (CategoryDAOImpl) request.getAttribute("catWrapper");
					for(Category c : catWrapper.categories){
						%>
							<a href="customerHome?cid=<%=c.getcId() %>" class="list-group-item list-group-item-action"><%=c.getcName() %></a>
						<% 
					}
				%>
  				
			</div>
		</div>
		
		<div class="col-md-9">
			<div class="container">
				<div class="row">
					<%
						ProductDAOImpl prodWrapper = (ProductDAOImpl) request.getAttribute("productsWrapper");
						for (Product prod : prodWrapper.products) {
					%>
					<div class="col-md-4">
						<div class="card mt-2">
                			<img src="<%=prod.getpPic() %>" class="card-img-top" alt="...">
                			<div class="card-body">
                    			<h5 class="card-title"><%= prod.getpName() %></h5>
                    			<p class="card-text"><%=prod.getpDesc() %></p>
                    			<a href="#" class="btn btn-outline-primary">Go somewhere</a>
                			</div>
            			</div>
					</div>
					<%} %>
				</div>
			</div>
	
		</div>	
	</div>
</body>
</html>
<% 
	}
%>