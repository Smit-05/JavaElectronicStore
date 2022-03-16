<%@page import="dao.CategoryDAOImpl"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="model.Category"%>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
// if (session.getAttribute("userName") == null) {
// 	String redirectURL = "/electronics2";
// 	response.sendRedirect(redirectURL);
// }
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="False"%>
<%@include file="../../resources/header/adminHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Item</title>
</head>
<body>

	<div class="container mt-2">

		<div class="card">
			<h5 class="card-header">Insert New Item</h5>
			<div class="card-body">
				<form autocomplete="off" method="POST" id="form_item"
					action="insert_product" enctype="multipart/form-data">
					<div class="input-group mb-3">
						<span class="input-group-text">Item Name:</span> <input
							type="text" class="form-control" id="i_name" name="pName"
							path="pName" onkeyup="i_nameValid()" value="">
					</div>
					<div class="row">
						<div class="input-group mb-3 col-md">
							<label class="input-group-text" for="">Price(Rs.)</label> <input
								type="text" class="form-control" id="i_price" name="pPrice"
								path="pPrice" onkeyup="i_priceValid()" value="">
						</div>
						<div class="input-group mb-3 col-md">
							<label class="input-group-text" for="">Discount</label> <input
								type="text" class="form-control" id="i_discount"
								name="pDiscount" path="pDiscount" onkeyup="i_discountValid()"
								placeholder="i.e. 5 , 15 (in %)" value="">
						</div>
						<div class="input-group mb-3 col-md">
							<label class="input-group-text" for="">Total Units</label> <input
								type="text" class="form-control" id="i_unit" name="pQuantity"
								path="pQuantity" onkeyup="i_unitValid()"
								placeholder="i.e. 10 / 200" value="">
						</div>
					</div>
					<div class="input-group mb-3 col-md">
						<span class="input-group-text">Description</span>
						<textarea class="form-control" aria-label="With textarea" rows="4"
							name="pDesc" path="pDesc"></textarea>
					</div>

					<div class="input-group mb-3 col-md">
						<div class="input-group">
							<input type="file" class="form-control" id="i_photo"
								name="photo" path="pPic"> <label
								class="input-group-text" for="inputGroupFile02">Choose
								photo of item...</label>
						</div>

						<img id="frame" src="" class="float-left mt-3" height="150px"
							width="150px" border="1" alt="Preview of Image" />
					</div>

					<div class="mb-3 col-md">
						<div class="input-group mb-3 col">
							<label class="input-group-text" for="item_cat">Select
								Category</label> <select name="cId" path="category_cId" form="form_item"
								class="form-select category" id="cId"
								onchange="set_reverse_cat(this)">
								<option selected>Choose a category</option>
								<%
								CategoryDAOImpl catWrapper = (CategoryDAOImpl) request.getAttribute("catWrapper");
								for (Category cat : catWrapper.categories) {
								%>
								<option value="<%=cat.getcId()%>"><%=cat.getcName()%></option>
								<%
								}
								%>
							</select>
						</div>
					</div>

					<button class="btn btn-info mt-5 mx-auto d-flex" id="add_item">Add
						Item</button>
				</form>
			</div>
		</div>

	</div>

	<script type="text/javascript">
		const i_photo = document.getElementById("i_photo");
		i_photo.addEventListener("change", handleFiles, false);

		const fileValue = document.querySelector('.form-file-text');

		function handleFiles() {
			console.log("handling files....");
			
			const fileList = i_photo.files;
			console.log(fileList);
			var fileName = fileList[0]['name'];
			
			
			console.log("handling files.... 2");
			var ext = fileName.substring(fileName.lastIndexOf(".") + 1);
			switch (ext) {
			case 'jpg':
			case 'jpeg':
			case 'png':
				break;
			default:
				i_photo.classList.add('is-invalid');
				alert('Type of photo should be jpg/jpeg or png');
				fileValue.innerText = 'Please choose valid format file';
				return;
			}
			console.log("handling files....3");
			if (fileList[0]['size'] > 400000) {
				i_photo.classList.add('is-invalid');
				alert('Size of photo should be <= 400Kb');
				return;
			}
			console.log("handling files....4");
			i_photo.classList.remove('is-invalid');
			const frame = document.getElementById('frame');
			frame.src = URL.createObjectURL(event.target.files[0]); // to display img
			console.log(URL.createObjectURL(event.target.files[0]));
		}
	</script>

</body>
</html>
