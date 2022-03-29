<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	if(session.getAttribute("userName") != null){
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="False"%> 

<%@include file="../../resources/header/adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<section style="background-color: #eee; height: 92vh">
  <div class="container py-5">
 
    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
            <h5 class="my-3">${admin.uName}</h5>
            <div class="d-flex justify-content-center mb-2">
              <a href="updateUser"><button type="button" class="btn btn-outline-primary ms-1">Update profile</button></a>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Username</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${admin.uName}</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${admin.emailId}</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">First name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${admin.fName}</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Middle name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${admin.mName}</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Last name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${admin.lname}</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Phone no.</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${admin.uPhoneNo}</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Address</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${admin.uAddress}</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Date of Birth</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${admin.dob}</p>
              </div>
            </div>
          </div>
        </div>
        
      </div>
    </div>
  </div>
</section>
</body>
</html>
<% 
	}
%>