<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	if(session.getAttribute("userName") != null){
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="False"%>
<%@include file="../../resources/header/customerHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${not empty cartList}">
		<!-- <a href="invoicePage">Place Order</a> -->
		<form:form action="invoicePage" modelAttribute="cartList">
			<input type="submit" value="Place Order">
		</form:form>
	</c:if>
	
	
	<c:forEach var="cart" items="${cartList}" varStatus="thecount">
		<br>	
		No. :- ${thecount.count}<br>
		Cart Price :- ${cart.cartPrice}<br>
		Product Name :- ${cart.product.pName}<br>
		Product Price :- ${cart.product.pPrice}<br>
		<form action="updateCart" method="POST">
			<input type="hidden" name="cartId" value="${cart.cartId}">
			Quantity :- <input type="number" name="quantity" value="${cart.quantity}" min="1" max="${cart.product.pQuantity}">
			<button type="submit">Update Cart</button>
		</form>
		<br>
		<form action="deleteCart" method="POST">
			<input type="hidden" name="cartId" value="${cart.cartId}">
			<button type="submit">Delete Cart</button>
		</form>
	</c:forEach>
	

</body>
</html>
<%
	}
%>