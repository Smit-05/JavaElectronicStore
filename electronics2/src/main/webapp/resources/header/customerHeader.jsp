<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<style>
.navbar {
	background-color: #990033 !important;
}
</style>
<title>Document</title>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
</head>
<body>
	<%
	String name = (String) session.getAttribute("userName");
	%>
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Electronic Store</a>
			<div class="collapse navbar-collapse" id="navbarScroll">
				<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
					style="-bs-scroll-height: 100px;">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="customerHome">Home</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="customerProfile">My Profile</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="viewOrders">View Orders</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="displayCart">View Cart</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="contactUs">Contact Us</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="aboutUs">About Us</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="logout">Logout</a></li>
				</ul>
			</div>
			<div class="navbar-text">
				Welcome
				<%=name%>
			</div>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarScroll"
				aria-controls="navbarScroll" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
	</nav>
	<br>
	<br>
</body>
</html>