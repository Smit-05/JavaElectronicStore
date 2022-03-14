<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	if(session.getAttribute("userName") != null){
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="False"%> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@include file="../../resources/header/adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h2>-:Admin Profile :-</h2>

	<c:if test = "${not empty success_message}">
	        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
		        <div class="alert alert-success alert-dismissible fade show" role="alert">
					  ${success_message}
			    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
	</c:if>
	
	<br>
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

	<a href="updateProfile">Update Profile</a>

</body>
</html>
<% 
	}
%>