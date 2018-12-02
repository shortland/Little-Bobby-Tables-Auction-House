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
	This is the Seller Details page
	This page displays the data for each Seller available in the database
	The details are fetched using the "sellers" field from the request object
-->


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width:device-width, initial-scale=1">
	<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
	<title>Seller Details</title>
</head>
<body>
	<div>
	<h1>The Seller Details are:</h1>
	<c:if test="${empty sellers}">
		<h3> Seller details not found! <h3/> 
	</c:if>
	<c:if test="${not empty sellers}">
		<table class="table table-striped">
		  <thead>
		    <tr>
		      <th>Seller ID</th>
		      <th>First Name</th>
		      <th>Last Name</th>
			  <th>Email</th>
			  <th>Rating</th>
			  <th></th>
		    </tr>
		  </thead>
		  <tbody>
		     <c:forEach items="${sellers}" var="cd">
		       <tr>
		         <td>${cd.customerID}</td>
		         <td>${cd.firstName}</td>
		         <td>${cd.lastName}</td>
		         <td>${cd.email}</td>
		         <td>${cd.rating}</td>
   		         <td>
		         	<form method="POST" action="getItemsBySeller">
						<div class="form-group">
			            	<input type="hidden" class="form-control" name="customerID" value=${cd.customerID}>
			        	</div>
						<input type="submit" value="View Items" class="btn btn-success"/>
					</form>
		         </td>		         
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