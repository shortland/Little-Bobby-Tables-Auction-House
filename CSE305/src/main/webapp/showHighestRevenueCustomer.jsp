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
	This is the Highest Revenue Customer Details page
	This page displays the data for the customer who generated the highest revenue
	The details are fetched using the "customer" field from the request object
-->

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width:device-width, initial-scale=1">
	<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
	<title>Highest Revenue Customer Details</title>
</head>
<body>

	
	<div class="container">
	<h3>The Customer that generated the highest revenue is:</h3>
	<c:if test="${empty customer}">
		<h3> Customer details not found! <h3/> 
	</c:if>
	<c:if test="${not empty customer}">
		<table class="table table-striped">
		  <thead>
		    <tr>
		      <th>Customer ID</th>
		      <th>First Name</th>
		      <th>Last Name</th>
			  <th>Email</th>
		    </tr>
		  </thead>
		  <tbody>
		       <tr>
		         <td>${customer.customerID}</td>
		         <td>${customer.firstName}</td>
		         <td>${customer.lastName}</td>
		         <td>${customer.email}</td>
		       </tr>
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