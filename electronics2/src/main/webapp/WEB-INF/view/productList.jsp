<%@page import="model.Product"%>
<%@page import="dao.ProductDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="False"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Product List</title>

<%@include file="../../resources/header/adminHeader.jsp"%>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">

<style>
body {
	background-color: #eee !important;
}

.a-msg {
	position: fixed;
	z-index: 1000;
	left: 50%;
	top: 10%;
	transform: translate(-50%, 0);
	text-align: center;
}
</style>
</head>
<body class="d-flex flex-column min-vh-100">

	<c:if test="${not empty message}">
		<div class="alert alert-danger shadow a-msg" role="alert"
			id="logedin-alert">${message}</div>
	</c:if>

	<c:if test="${not empty success_message}">
		<div class="alert alert-success shadow a-msg" role="alert"
			id="logedin-alert">
			<b>${success_message}</b>
		</div>
	</c:if>

	<div class="container">
		<div class="m-3 table-responsive">

			<table class="table table-hover" id="myTable" class="display">
				<thead>
					<tr>
						<th>Edit</th>
						<th>Name</th>
						<th>Description</th>
						<th>Price</th>
						<th>Discount</th>
						<th>Category</th>
						<th>Units</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>

					<%
					ProductDAOImpl prodWrapper = (ProductDAOImpl) request.getAttribute("productsWrapper");
					for (Product prod : prodWrapper.products) {
					%>

					<tr id="<%=prod.getpId()%>">
						<td><a type='button'
							href='i_update?update=<%=prod.getpId()%>'
							class='btn btn-outline-primary edit'>Edit</a></td>
						<td class="text-truncate" style="max-width: 150px"><%=prod.getpName()%></td>
						<td class="text-truncate" style="max-width: 200px"><%=prod.getpDesc()%></td>
						<td><%=prod.getpPrice()%></td>
						<td><%=prod.getpDiscount()%></td>
						<td><%=prod.getCategory().getcName()%></td>
						<td><%=prod.getpQuantity()%></td>
						<td><a type='button' onclick='return delete_confirm()'
							href='i_delete?delete=<%=prod.getpId()%>'
							class='btn btn-outline-danger'>Delete</a></td>
					</tr>


					<%
					}
					%>

				</tbody>
			</table>

		</div>
	</div>
	<div class="mt-auto">
		<%@include file="../../resources/header/footer.jsp"%>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"
		integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"
		integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD"
		crossorigin="anonymous"></script>


	<script>
		function delete_confirm() {
			if (confirm("Are you sure to delete it.")) {
				return true;
			} else {
				return false;
			}
		}
		/* Initialise the table with the required column ordering data types */

		$(document).ready(function() {
			$('#myTable').DataTable({
				"dom" : ' <"#length"l><"#search"f>rt<"info"i><"page"p>',
				"stateSave" : true
			});
		});
		
	    function destroyalert() {
	        setTimeout(() => {
	            var myAlert = document.getElementById("logedin-alert");
	            var bsAlert = new bootstrap.Alert(myAlert);
	            bsAlert.close();
	        }, 5000);
	    }
	    

	    
	</script>

	<c:if test="${not empty message || not empty success_message}">
		<script>	
		destroyalert();
		</script>
	</c:if>

</body>
</html>


