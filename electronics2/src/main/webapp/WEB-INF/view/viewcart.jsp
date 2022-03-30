<%@page import="model.Cart"%>
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
<style type="text/css">
	@media (min-width: 1025px) {
  	.h-custom {
    	height: 100vh !important;
  	}
}
</style>
<title>Insert title here</title>
</head>
<body class="d-flex flex-column min-vh-100">
	<% int orderTotal=0;%> 
	
	<section class="p-4" style="background-color: #fdccbc;">
  	<div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <p><span class="h2">Shopping Cart </span></p>

        <div class="card mb-4">
          <div class="card-body p-4">
			<c:forEach var="cart" items="${cartList}" varStatus="thecount">
            <div class="row align-items-center mt-2">
              <div class="col-md-2">
                <img src="resources/images/products/${cart.product.pPic }" class="img-fluid" alt="Generic placeholder image">
              </div>
              <div class="col-md-2 d-flex justify-content-center">
                <div>
                  <p class="small text-muted mb-4 pb-2">Name</p>
                  <p class="lead fw-normal mb-0">${cart.product.pName}</p>
                </div>
              </div>
              <div class="col-md-2 d-flex justify-content-center">
                <div>
                  <p class="small text-muted mb-4 pb-2">Discount</p>
                  <p class="lead fw-normal mb-0">${cart.product.pDiscount }</p>
                </div>
              </div>
              <div class="col-md-1 d-flex justify-content-center">
                <div>
                  <p class="small text-muted mb-4 pb-2">Quantity</p>
                  <p class="lead fw-normal mb-0"><form action="updateCart" method="POST">
				<input type="hidden" name="cartId" value="${cart.cartId}">
				<input type="number" style="width: 40px" name="quantity" value="${cart.quantity}" min="1" max="${cart.product.pQuantity}">
			</p>
                </div>
              </div>
              <div class="col-md-1 d-flex justify-content-center">
                <div>
                  <p class="small text-muted mb-4 pb-2">Price</p>
                  <p class="lead fw-normal mb-0">$${cart.product.pPrice}</p>
                </div>
              </div>
              <div class="col-md-2 d-flex justify-content-center">
                <div>
                  <p class="small text-muted mb-4 pb-2">Total</p>
                  <p class="lead fw-normal mb-0">$${cart.cartPrice}</p>
                </div>
              </div>
              <div class="col-md-2 d-flex justify-content-center">
              	<div>
              		<p class="lead fw-normal mb-0 mt-4"><button class="btn btn-outline-primary mt-1" type="submit">Update Item</button>
					</form><br><form action="deleteCart" method="POST">
					<input type="hidden" name="cartId" value="${cart.cartId}">
					<button class="btn btn-outline-danger mt-1" type="submit">Delete Item</button>
				</form></p>
              	</div>
              </div>
            </div>
            <%
            	Cart ca = (Cart) pageContext.getAttribute("cart");
				orderTotal+=ca.getCartPrice();
				
            %>
            <hr>
	</c:forEach>
	
          </div>
        </div>

        <div class="card mb-5">
          <div class="card-body p-4">

            <div class="float-end">
              <p class="mb-0 me-5 d-flex align-items-center">
                <span class="small text-muted me-2">Order total:</span> <span class="lead fw-normal">$<%=orderTotal %></span>
              </p>
            </div>

          </div>
        </div>

        <div class="d-flex justify-content-end">
        <c:if test="${not empty cartList}">
		<!-- <a href="invoicePage">Place Order</a> -->
		<form action="invoicePage">
			<button type="submit" class="btn btn-primary btn-lg">Place Order</button>
		</form>
		</c:if>
          
        </div>

      </div>
    </div>
  </div>
</section>
<div class="mt-auto">
	<%@include file="../../resources/header/footer.jsp"%>	
	</div>
</body>
</html>
<%
	}
%>