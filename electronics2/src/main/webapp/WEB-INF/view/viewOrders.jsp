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
<body class="d-flex flex-column min-vh-100">
	
	<div class="container mt-5">
        <div class="accordion accordion-flush" id="accordionFlushExample">
        
        	<c:forEach var="o" items="${orders}" varStatus="thecount">
	            <div class="accordion-item">
	                <h2 class="accordion-header" id="flush-headingOne">
	                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
	                        data-bs-target="#divIDNo${thecount.index}" aria-expanded="false" aria-controls="divIDNo${thecount.index}">
	                        Order - ${thecount.count}
	                    </button>
	                </h2>
	                <div id="divIDNo${thecount.index}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
	                    data-bs-parent="#accordionFlushExample">
	                    <div class="accordion-body">
	                    	
	                    	<div class="container">
								<div class="m-3 table-responsive">
						
									<table class="table table-hover" id="myTable" class="display">
										<thead>
											<tr>
												<th scope="col">Order Id</th>
												<th scope="col">Order Date</th>
												<th scope="col">Shipping Address</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">${o.key.oId}</th>
												<td>${o.key.oDate}</td>
												<td>${o.key.shippingAddress}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
								<div class="container">
									<div class="m-3 table-responsive">
							
										<table class="table table-hover" id="myTable" class="display">
											<thead>
												<tr>
													<th scope="col">OrderItem Id</th>
													<th scope="col">Product Name</th>
													<th scope="col">Product price</th>
													<th scope="col">Discount</th>
													<th scope="col">Quantity</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${o.value}" varStatus="thecount1">				
													<tr>
														<th scope="row">${thecount1.count}</th>
														<td>${item.product.pName}</td>
														<td>${item.pPrice}</td>
														<td>${item.pDisc}</td>
														<td>${item.pQuantity}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
	                    </div>
	                </div>
	            </div>
            </c:forEach>
            
        </div>
    </div>
<div class="mt-auto">
	<%@include file="../../resources/header/footer.jsp"%>	
	</div>
</body>
</html>
<%
	}
%>