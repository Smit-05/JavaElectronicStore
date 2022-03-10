<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="False"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<center><h2 style="padding:20px">${message}</h2></center>
	
	<div align="center">
        <h1>Register User</h1>
        <form:form action="saveUser" method="post" modelAttribute="user">
        <table>
            <form:hidden path="uId"/>
            <tr>
                <td>User Name:</td>
                <td><form:input path="uName" /></td>
            </tr>
            <tr>
            	<td>Password:</td>
            	<td><form:password path="password" /></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><form:input type="email" path="emailId" /></td>
            </tr>
            <tr>
                <td>First Name:</td>
                <td><form:input path="fName" /></td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td><form:input path="lname" /></td>
            </tr>
            <tr>
                <td>Middle Name:</td>
                <td><form:input path="mName" /></td>
            </tr>
            <tr>
                <td>Phone no:</td>
                <td><form:input path="uPhoneNo" /></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><form:input path="uAddress" /></td>
            </tr>
            <tr>
                <td>D.O.B:</td>
                <td><form:input type="date" path="dob" /></td>
            </tr>
            <tr>
                <td>Role:</td>
                <td><form:radiobutton path="role" value="Customer" />Customer
                &nbsp;&nbsp;&nbsp;&nbsp;<form:radiobutton path="role" value="Admin" />Admin
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"></td>
            </tr>
        </table>
        </form:form>
    </div>

</body>
</html>