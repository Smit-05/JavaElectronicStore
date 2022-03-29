<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="False"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<link href="<c:url value="/resources/css/registerForm.css"/>" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div class="container col-md-8 mt-4 p-5">
	
		 <c:if test = "${not empty message}">
			<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
		    <div class="alert alert-danger alert-dismissible fade show" role="alert">
				${message}
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
	    </c:if>
	    
		<form action="update_user" method="post" class="row g-3 needs-validation" novalidate="novalidate">
		<input type="hidden" name="uId" value="${user.uId }">
		<input type="hidden" name="role" value="${user.role }">
		<input type="hidden" name="password" value="${user.password }">
			<div class="col-md-4">
	                <label for="validationCustomUsername" class="form-label">Username</label>
	                <div class="input-group has-validation">
	                    <span class="input-group-text" id="inputGroupPrepend">@</span>
	                    <input type="text" class="form-control" id="validationCustomUsername"
	                        aria-describedby="inputGroupPrepend" name="uName" required="required" value="${user.uName }" />
	                    <div class="invalid-feedback">Please choose a username.</div>
	                    <div class="valid-feedback">Nice Username!</div>
	                </div>
	            </div>
            <div class="col-md-4">
                <label for="validationCustom02" class="form-label">Email</label>
                <input type="email" class="form-control" id="validationCustom02" name="emailId"
                    required="required" value="${user.emailId }"/>
                <div class="invalid-feedback">Please choose a Email!</div>
                <div class="valid-feedback">Fine!</div>
            </div>

            <div class="col-md-4">
                <label for="validationCustomFirstname" class="form-label">First Name</label>
                <div class="input-group has-validation">
                    <input type="text" class="form-control" id="validationCustomFirstname"
                        aria-describedby="inputGroupPrepend" name="fName" required="required" value="${user.fName }"/>
                    <div class="invalid-feedback">Please choose a firstname.</div>
                    <div class="valid-feedback">Nice FirstName!</div>
                </div>
            </div>
            <div class="col-md-4">
                <label for="validationCustomLastname" class="form-label">Last Name</label>
                <div class="input-group has-validation">
                    <input type="text" class="form-control" id="validationCustomLastname"
                        aria-describedby="inputGroupPrepend" name="lname" required="required" value="${user.lname }" />
                    <div class="invalid-feedback">Please choose a lastname.</div>
                    <div class="valid-feedback">Nice LastName!</div>
                </div>
            </div>
            <div class="col-md-4">
                <label for="validationCustomMiddlename" class="form-label">Middle Name</label>
                <div class="input-group has-validation">
                    <input type="text" class="form-control" id="validationCustomMiddlename"
                        aria-describedby="inputGroupPrepend" name="mName" required="required" value="${user.mName }"/>
                    <div class="invalid-feedback">Please choose a middletname.</div>
                    <div class="valid-feedback">Nice MiddleName!</div>
                </div>
            </div>

			
            <div class="col-md-6">
                <label for="validationCustom03" class="form-label">Phone
                    Number</label>
                <input type="text" class="form-control" id="validationCustom03" name="uPhoneNo"
                    required="required" value="${user.uPhoneNo }"/>
                <div class="invalid-feedback">Please provide a valid Phone Number!</div>
            </div>
            <div class="col-md-6">
                <label for="validationCustom05" class="form-label">Date Of
                    Birth</label>
                <input type="date" class="form-control" id="validationCustom05" name="dob"
                    required="required" value="${user.dob }"/>
                <div class="invalid-feedback">Please provide a valid dob.</div>
            </div>
            
            <div class="col-md-8">
                <label for="floatingTextarea2">Billing Address</label>
                <textarea class="form-control" id="floatingTextarea2"
                    style="height: 100px" name="uAddress" required="required">${user.uAddress }</textarea>
            </div>
    
    		
		    <div class="col-12">
		        <button class="btn btn-primary" type="submit">Submit form</button>
		    </div>
		</form>
	</div>
	 <script>

        (function () {
            'use strict'

            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.querySelectorAll('.needs-validation')

            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }

                        form.classList.add('was-validated')
                    }, false)
                })
        })()

    </script>
</body>
</html>