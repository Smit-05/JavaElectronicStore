<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	if(session.getAttribute("userName") != null){
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="False"%>
<%@include file="../../resources/header/adminHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>Customer List</h1>
		
		<table class="table">

			<th scope="col">User Id</th>
			<th scope="col">Name</th>
			<th scope="col">Email</th>
			<th scope="col">First Name</th>
			<th scope="col">Last Name</th>
			<th scope="col">Middle Name</th>
			<th scope="col">Phone no.</th>
			<th scope="col">Address</th>
			<th scope="col">D.O.B</th>

			<c:forEach var="customer" items="${customerList}">
				<tr>

					<th scope="row">${customer.uId}</th>
					<td>${customer.uName}</td>
					<td>${customer.emailId}</td>
					<td>${customer.fName}</td>
					<td>${customer.lname}</td>
					<td>${customer.mName}</td>
					<td>${customer.uPhoneNo}</td>
					<td>${customer.uAddress}</td>
					<td>${customer.dob}</td>

				</tr>
			</c:forEach>
		</table>
	</div>
	</body>
</html>
<% 
	}
%>