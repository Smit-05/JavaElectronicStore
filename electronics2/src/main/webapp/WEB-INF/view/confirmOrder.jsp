<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	if(session.getAttribute("userName") != null){
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="False"%>
<%@include file="../../resources/header/customerHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<link href="<c:url value="/resources/css/confirmOrder.css"/>" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

	<div class="container mt-5 mb-5">
        <div class="d-flex justify-content-center row">
            <div class="col-md-10">
                <div class="receipt bg-white p-3 rounded">
                    <h4 class="mt-2 mb-3">Your order is confirmed!</h4>
                    <h6 class="name">Hello <%=session.getAttribute("userName") %>,</h6><span class="fs-12 text-black-50">your order has been confirmed and will be shipped in two days</span>
                    <hr>
                    <div class="d-flex flex-row justify-content-between align-items-center order-details">
                        <div><span class="d-block fs-12">Order date</span><span class="font-weight-bold">${order.oDate}</span></div>
                        <div><span class="d-block fs-12">Order number</span><span class="font-weight-bold">ORDER_${order.oId}</span></div>
                        <div><span class="d-block fs-12">Shipping Address</span><span class="font-weight-bold text-success">${order.shippingAddress}</span></div>
                    </div>
                    <hr>
                    
                    <c:forEach var="cart" items="${cartList}" varStatus="thecount">
	                    <div class="d-flex justify-content-between align-items-center product-details">
	                        <div class="d-flex flex-row product-name-image"><img class="rounded" src="resources/images/products/${cart.product.pPic}" width="80">
	                            <div class="d-flex flex-column justify-content-between ml-2">
	                                <div><span class="d-block font-weight-bold p-name">${cart.product.pName}</span><span>Discount: ${cart.product.pDiscount}%</span></div><span class="fs-12">Qty: ${cart.quantity}pcs</span>
	                            </div>
	                        </div>
	                        <div class="product-price">
	                            <h5>$${cart.product.pPrice}</h5>
	                        </div>
	                    </div>
                    </c:forEach>
                    
                    <div class="mt-5 amount row">
                        <div class="col-md-6"></div>
                        <div class="col-md-6">
                            <div class="billing">
                                <div class="d-flex justify-content-between"><span>Subtotal</span><span class="font-weight-bold">$${totalWithoutDisc}</span></div>
                                <div class="d-flex justify-content-between mt-2"><span>Shipping fee</span><span class="font-weight-bold">$0</span></div>
                                <div class="d-flex justify-content-between mt-2"><span class="text-success">Discount</span><span class="font-weight-bold text-success">$${totalDisc}</span></div>
                                <hr>
                                <div class="d-flex justify-content-between mt-1"><span class="font-weight-bold">Total</span><span class="font-weight-bold text-success">$${totalAmount}</span></div>
                            </div>
                        </div>
                    </div><span class="d-block">Expected delivery date</span><span class="font-weight-bold text-success">12 March 2020</span><span class="d-block mt-3 text-black-50 fs-15">We will be sending a shipping confirmation email when the item is shipped!</span>
                    <hr>
                    <div class="d-flex justify-content-between align-items-center footer">
                        <div class="thanks"><span class="d-block font-weight-bold">Thanks for shopping</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-3"></div>
    <div class="container mt-5 mb-5 col-6">
    	<form action="customerHome">
        	<center><button class="btn btn-success" data-abc="true">
            <i class="fa fa-usd"></i>Okay</button></center>
        </form>
    </div>
	<div class="col-3"></div>
</body>
</html>
<%
	}
%>