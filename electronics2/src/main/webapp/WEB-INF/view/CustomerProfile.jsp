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

	<h2>-: Profile :-</h2>
	
	Name :- ${customer.uName}
	<br>
	E-mail :- ${customer.emailId}
	<br>
	First Name :- ${customer.fName}
	<br>
	Last Name :- ${customer.lname}
	<br>
	Middle Name :- ${customer.mName}
	<br>
	Phone no. :- ${customer.uPhoneNo}
	<br>
	Address :- ${customer.uAddress}
	<br>
	D.O.B :- ${customer.dob}
	<br>

	<a href="#">Update Profile</a>
	
</body>
</html>
<% 
	}
%>