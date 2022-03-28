<%@page import="model.Product"%>
<%@page import="dao.ProductDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="False"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>

<%@include file="../../resources/header/adminHeader.jsp"%>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
	
</head>
<body>
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
					<td class="text-truncate" style="max-width:150px"><%=prod.getpName()%></td>
					<td class="text-truncate" style="max-width:200px"><%=prod.getpDesc()%></td>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
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
	</script>
</body>
</html>


