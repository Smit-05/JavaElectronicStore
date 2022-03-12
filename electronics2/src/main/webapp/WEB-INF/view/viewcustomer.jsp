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
	<div align="center">
		<h1>Customer List</h1>
		
		<table border="1">

			<th>User Id</th>
			<th>Name</th>
			<th>Email</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Middle Name</th>
			<th>Phone no.</th>
			<th>Address</th>
			<th>D.O.B</th>

			<c:forEach var="customer" items="${customerList}">
				<tr>

					<td>${customer.uId}</td>
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