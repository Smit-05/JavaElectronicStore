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
</head>
<body>

	<h2>-:Admin Profile :-</h2>
	
	Name :- ${admin.uName}
	<br>
	E-mail :- ${admin.emailId}
	<br>
	First Name :- ${admin.fName}
	<br>
	Last Name :- ${admin.lname}
	<br>
	Middle Name :- ${admin.mName}
	<br>
	Phone no. :- ${admin.uPhoneNo}
	<br>
	Address :- ${admin.uAddress}
	<br>
	D.O.B :- ${admin.dob}
	<br>

	<a href="#">Update Profile</a>

</body>
</html>
<% 
	}
%>