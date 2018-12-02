<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!--
	This is the Employee Details page
	This page displays the data for each Employee object in the ArrayList from the getEmployees method in dao.EmployeeDao class
	The details are fetched using the "employees" field from the request object
-->

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width:device-width, initial-scale=1">
	<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
	<title>Employee Details</title>
</head>
<body>

	<h1>The Employee Details are:</h1>
	<div class="container">
	<c:if test="${empty employees}">
		<h3> Employee details not found! <h3/> 
	</c:if>
	<c:if test="${not empty employees}">
		<table class="table table-striped">
		  <thead>
		    <tr>
		      <th>Employee ID</th>
		      <th>First Name</th>
		      <th>Last Name</th>
		      <th>Address</th>
		      <th>City</th>
		      <th>State</th>
		      <th>Zip Code</th>
			  <th>Telephone</th>
			  <th>Email</th>
			  <th>Start Date</th>
			  <th>Hourly Rate</th>
			  <th></th>
			  <th></th>
		    </tr>
		  </thead>
		  <tbody>
		     <c:forEach items="${employees}" var="cd">
		       <tr>
		         <td>${cd.employeeID}</td>
		         <td>${cd.firstName}</td>
		         <td>${cd.lastName}</td>
		         <td>${cd.address}</td>
		         <td>${cd.city}</td>
		         <td>${cd.state}</td>
		         <td>${cd.zipCode}</td>
		         <td>${cd.telephone}</td>
		         <td>${cd.email}</td>
		         <td>${cd.startDate}</td>
		         <td>${cd.hourlyRate}</td>
		         <td>
		         	<form method="POST" action="editEmployee">
						<div class="form-group">
			            	<input type="hidden" class="form-control" name="employeeID" value=${cd.employeeID}>
			        	</div>
						<input type="submit" value="Edit" class="btn btn-success"/>
					</form>
		         </td>
   		         <td>
		         	<form method="POST" action="deleteEmployee">
						<div class="form-group">
			            	<input type="hidden" class="form-control" name="employeeID" value=${cd.employeeID}>
			        	</div>
						<input type="submit" value="Delete" class="btn btn-success"/>
					</form>
		         </td>
		         
		         <td></td>
		       </tr>
		     </c:forEach>
		  </tbody>
		</table>
	</c:if>
	</div>
	
	<div class="container pt-1">
		<form action="home.jsp">
			<input type="submit" value="Home" class="btn btn-success"/>
		</form>
	</div>

	<script src="webjars/jquery/3.3.1-1/jquery.min.js"></script>
	<script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	
</body>
</html>