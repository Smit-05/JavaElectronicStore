<%@page import="java.io.File"%>
<%@page import="dao.CategoryDAOImpl"%>
<%@page import="model.Category"%>
<%@page import="service.CategoryServiceImpl"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="service.ProductServiceImpl"%>
<%@page import="service.ProductService"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if (session.getAttribute("userName") != null) {
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="False"%>
<%@include file="../../resources/header/customerHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
	body {
        background-color: #eee;
        overflow-x:hidden;
    }
</style>
<title>Insert title here</title>
</head>
<body class="d-flex flex-column min-vh-100" >

	<div class="modal fade" id="edit-modal" tabindex="-1" role="dialog"
		aria-labelledby="edit-modalTitle" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="edit-modalTitle">Product Detail</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div style="max-width: 50%" class="mx-auto d-flex">
						<img src="" class="card-img-top"
							alt="Soemthing went wrong while loding image" height="250px"
							 id="pro_img">
					</div>
					<h4>
						Name: <span id="pro_name"></span>
					</h4>
					<p>
						<b>Description: </b> <span id="pro_desc"></span>
					</p>
				</div>
				<div class="modal-footer">

					<form action="addCart" class="mt-1 mx-auto d-flex">
						<input type="hidden" name="pId" value="" id="pro_id"> <label
							for="quantity" class="form-label mx-2">Quantity</label>
						&nbsp;&nbsp; <input type="number" style="width: 40px"
							name="quantity" class="form-number-input" id="pro_quantity"
							min="1" max="" value="1"> &nbsp;&nbsp;
						<button type="submit" class="btn btn-outline-primary">Add
							to Cart</button>
						&nbsp;&nbsp;
						<button type="submit" class="btn btn-outline-primary"
							formaction="viewInvoiceForOneProduct">Buy Now</button>
					</form>

				</div>
			</div>
		</div>
	</div>

	<div class="row mt-3 ml-3">
		<div class="col-md-3">
			<div class="list-group">
				<a href="customerHome"
					class="list-group-item list-group-item-action <%if (request.getParameter("cid") == null) {
	out.print("active");
}%> "
					aria-current="true"> All Products </a>
				<%
				CategoryDAOImpl catWrapper = (CategoryDAOImpl) request.getAttribute("catWrapper");
				for (Category c : catWrapper.categories) {
				%>
				<a href="customerHome?cid=<%=c.getcId()%>"
					class="list-group-item list-group-item-action <%if (request.getParameter("cid") != null && c.getcId() == Integer.parseInt(request.getParameter("cid"))) {
	out.print("active");
}%>"><%=c.getcName()%></a>
				<%
				}
				%>

			</div>
		</div>

		<div class="col-md-9">
			<div class="container">
				<c:if test="${not empty error_message}">
					<svg class="bi flex-shrink-0 me-2" width="24" height="24"
						role="img" aria-label="Danger:">
						<use xlink:href="#exclamation-triangle-fill" /></svg>
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						${error_message}
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>
				<c:if test="${not empty success_message}">
					<svg class="bi flex-shrink-0 me-2" width="24" height="24"
						role="img" aria-label="Danger:">
						<use xlink:href="#exclamation-triangle-fill" /></svg>
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						${success_message}
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>
				<div class="row">
					<%
					ProductDAOImpl prodWrapper = (ProductDAOImpl) request.getAttribute("productsWrapper");
					for (Product prod : prodWrapper.products) {
					%>
					<div class="col-md-4">
						<div class="card mt-2 shadow-sm"
							>
							<img src="resources/images/products/<%=prod.getpPic()%>"
								class="card-img-top"
								alt="Soemthing went wrong while loding image" height="250px">
							<div class="card-body">
								<h5 class="card-title text-truncate product_detail"
									data-bs-toggle='modal' data-bs-target='#edit-modal' style="cursor:pointer;"><%=prod.getpName()%></h5>
								<p class="card-text text-truncate"><%=prod.getpDesc()%></p>
								<form action="addCart">
									<input type="hidden" name="pId" class="proF_id"
										value="<%=prod.getpId()%>"> <label for="quantity"
										class="form-label">Quantity</label> <input type="number"
										style="width: 40px" name="quantity"
										class="form-number-input proF_quantity" id="quantity" min="1"
										max="<%=prod.getpQuantity()%>" value="1"> <br>
									<button type="submit" class="btn btn-outline-primary">Add
										to Cart</button>
									<button type="submit" class="btn btn-outline-primary"
										formaction="viewInvoiceForOneProduct">Buy Now</button>
								</form>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>

		</div>
	</div>
	<div class="mt-5">
	<%@include file="../../resources/header/footer.jsp"%>	
	</div>
	<script>
	let product_detail = document.querySelectorAll(".product_detail");
    let proM_desc = document.getElementById("pro_desc");
    let proM_name = document.getElementById("pro_name");
    let proM_img = document.getElementById("pro_img");
    let proM_quantity = document.getElementById("pro_quantity");
    let proM_id = document.getElementById("pro_id");
	
    Array.from(product_detail).forEach((product_detail_bt) => {
        product_detail_bt.addEventListener('click', (data) => {
            let pro_name = data.target.innerText;
            let pro_desc = data.target.parentNode.querySelector("p").innerText;
            let pro_img = data.target.parentNode.parentNode.querySelector("img").src;
            let pro_id = data.target.parentNode.parentNode.querySelector("form").elements[0].value;
            let pro_max = data.target.parentNode.parentNode.querySelector("form").elements[1].max;
            
            proM_desc.innerText = pro_desc;
            proM_name.innerText = pro_name;
            proM_img.src = pro_img;
            
            proM_id.value = pro_id;
            proM_quantity.max = pro_max;
            
            console.log(pro_id,pro_max);
        })
    });
	</script>
</body>
</html>
<%
}
%>