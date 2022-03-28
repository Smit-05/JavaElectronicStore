<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	if(session.getAttribute("userName") != null){
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="False"%>
<%@include file="../../resources/header/customerHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	Orders
	
	<c:forEach var="orders" items="${olist}" varStatus="thecount">
		<br>	
		No. :- ${thecount.count}<br>
		
		Object[] row = (Object[]) orders.get(${thecount.count} - 1);
		
		Orders o = (Orders)row[0];
		OrderedItems oi = (OrderedItems)row[1];
		
		
	</c:forEach>

</body>
</html>
<%
	}
%>