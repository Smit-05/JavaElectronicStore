<%@page import="com.electronics.entities.User"%>
<%@page import="com.electronics.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		out.println(FactoryProvider.getFactory());
	%>
</body>
</html>