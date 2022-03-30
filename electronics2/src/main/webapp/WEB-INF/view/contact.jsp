
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if (session.getAttribute("userName") != null) {
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="../../resources/header/customerHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="<c:url value="/resources/css/contact.css"/>"
	rel="stylesheet">
<title>Contact</title>
</head>
<body class="d-flex flex-column min-vh-100">

	<div class="container mt-5 mb-5" style="min-width:100vh;">
		<div class="wrapper">
			<div class="overlay">
				<div class="row d-flex justify-content-center align-items-center">
					<div class="col-md-9">
						<div class="contact-us text-center">
							<h3>Contact Us</h3>

							<div class="row">
								<div class="col-md-6">
									<div class="mt-5 text-center px-3">
										<div class="d-flex flex-row align-items-center">
											<span class="icons"><i class="fa fa-map-marker"></i></span>

											<div class="address text-left">
												<span id="address">Address</span>
												<p>461, Sugar camp, San jose, California, USA</p>
											</div>
										</div>
										<div class="d-flex flex-row align-items-center mt-3">
											<span class="icons"><i class="fa fa-phone"></i></span>
											<div class="address text-left">
												<span id="phone">Phone</span>
												<p>501 205 2929</p>
											</div>
										</div>
										<div class="d-flex flex-row align-items-center mt-3">
											<span class="icons"><i class="fa fa-envelope-o"></i></span>
											<div class="address text-left">
												<span id="email">E-mail Address</span>
												<p>contact@bbbootstrap.com</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="text-center px-1">
										<div class="forms p-4 py-5 bg-white">
											<h5>Send Message</h5>
											<form action="contact">
												<div class="mt-4 inputs">
													<input type="text" class="form-control" name="name"
														placeholder="Name"> <input type="text"
														class="form-control" name="email" placeholder="Email">
													<textarea class="form-control" name="message"
														placeholder="Type your message"></textarea>
												</div>
												<div class="button mt-4 text-left">
													<input type="submit" class="btn btn-dark" value="Send">
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 	<div class="mt-auto"> -->
<%-- 		<%@include file="../../resources/header/footer.jsp"%> --%>
<!-- 	</div> -->

</body>
</html>
<%
}
%>