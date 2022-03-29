<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="False"%>
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
    <style>
        .card {
            margin-bottom: 1.5rem
        }
        
        .card {
            position: relative;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-direction: column;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 1px solid #c8ced3;
            border-radius: .25rem;
            margin-top: 20px;
        }
        
        .card-header:first-child {
            border-radius: calc(0.25rem - 1px) calc(0.25rem - 1px) 0 0
        }
        
        .card-header {
            padding: .75rem 1.25rem;
            margin-bottom: 0;
            background-color: #f0f3f5;
            border-bottom: 1px solid #c8ced3
        }
    </style>
<title>Insert title here</title>
</head>
<body>


	<div class="container">
        <div id="ui-view" data-select2-id="ui-view">
            <div>
                <div class="card">
                    <div class="card-header">Invoice</div>
                    <div class="card-body">
                        <!-- <div class="row mb-4">
                            <div class="col-sm-4">
                                <h6 class="mb-3">From:</h6>
                                <div>
                                    <strong>BBBootstrap.com</strong>
                                </div>
                                <div>42, Awesome Enclave</div>
                                <div>New York City, New york, 10394</div>
                                <div>Email: admin@bbbootstrap.com</div>
                                <div>Phone: +48 123 456 789</div>
                            </div>
                            <div class="col-sm-4">
                                <h6 class="mb-3">To:</h6>
                                <div>
                                    <strong>BBBootstrap.com</strong>
                                </div>
                                <div>42, Awesome Enclave</div>
                                <div>New York City, New york, 10394</div>
                                <div>Email: admin@bbbootstrap.com</div>
                                <div>Phone: +48 123 456 789</div>
                            </div>
                            <div class="col-sm-4">
                                <h6 class="mb-3">Details:</h6>
                                <div>Invoice
                                    <strong>#BBB-10010110101938</strong>
                                </div>
                                <div>April 30, 2019</div>
                                <div>VAT: NYC09090390</div>
                                <div>Account Name: BBBootstrap Inc</div>
                                <div>
                                    <strong>SWIFT code: 99 8888 7777 6666 5555</strong>
                                </div>
                            </div>
                        </div> -->
                        <div class="table-responsive-sm">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th class="center">#</th>
                                        <th>Item</th>
                                        <th>Discount</th>
                                        <th class="center">Quantity</th>
                                        <th class="right">Unit Cost</th>
                                        <th class="right">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="cart" items="${cartList}" varStatus="thecount">
	                                    <tr>
	                                        <td class="center">${thecount.count}</td>
	                                        <td class="left">${cart.product.pName}</td>
	                                        <!-- <td class="left">Apple iphoe 10 with extended warranty</td> -->
	                                        <td class="left">${cart.product.pDiscount}%</td>
	                                        <td class="center">${cart.quantity}</td>
	                                        <td class="right">${cart.product.pPrice}</td>
	                                        <td class="right">${cart.cartPrice}</td>
	                                    </tr>
	                                 </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-sm-5"></div>
                            <div class="col-lg-6 col-sm-5 ml-auto">
                                <table class="table table-clear">
                                    <tbody>
                                        <tr>
                                            <td class="left">
                                                <strong>Total</strong>
                                            </td>
                                            <td class="right">
                                                <strong>$${totalAmount}</strong>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <form action="makePayment">
                                	<center><button class="btn btn-success" data-abc="true">
                                    <i class="fa fa-usd"></i> Proceed to Payment</button></center>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	

</body>
</html>