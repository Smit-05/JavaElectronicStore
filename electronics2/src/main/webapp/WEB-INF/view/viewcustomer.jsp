
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if (session.getAttribute("userName") != null) {
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="False"%>
<%@include file="../../resources/header/adminHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer List</title>
<style>
	body {
        background-color: #eee;
    }
</style>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
</head>
<body class="d-flex flex-column min-vh-100">
	<h1 class="text-center">Customer List</h1>
	<div class="container">
		<div class="m-3 table-responsive">

			<table class="table table-hover" id="myTable" class="display">
				<thead>
					<tr>
						<th scope="col">User Id</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">First Name</th>
						<th scope="col">Last Name</th>
						<th scope="col">Middle Name</th>
						<th scope="col">Phone no.</th>
						<th scope="col">Address</th>
						<th scope="col">D.O.B</th>
					</tr>
				</thead>
				<tbody>
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
				</tbody>
			</table>
		</div>
	</div>
	<<div class="mt-auto">
	<%@include file="../../resources/header/footer.jsp"%>	
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('#myTable').DataTable({
				"dom" : ' <"#length"l><"#search"f>rt<"info"i><"page"p>',
				"stateSave" : true
			});
		});
	</script>
</body>
</html>
<%
}
%>