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
	This is the Edit Customer page
	This page displays fields to edit a Customer 
	The details are sent to the UpdateCustomerController class in resources package
-->

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Edit Customer</title>
	<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />	
	<script src="webjars/jquery/3.3.1-1/jquery.min.js"></script>
	<script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	
	<h1>Edit Customer:</h1>
	<c:if test="${empty editCustomer}">
		<h3> Customer details not found! <h3/> 
	</c:if>
	<c:if test="${not empty editCustomer}"> 	
	<form action="updateCustomer" method="POST">
	  <div class="form-group">
	    <label for="customerEmail">Email address</label>
	    <input type="email" class="form-control" id="customerEmail" name="customerEmail" placeholder="Enter email" value="${editCustomer.email}" required>
	  </div>
  	  <div class="form-group">
	    <label for="customerFirstName">First Name</label>
	    <input type="text" class="form-control" id="customerFirstName" name="customerFirstName" placeholder="First Name" value="${editCustomer.firstName}" required>
	  </div>
  	  <div class="form-group">
	    <label for="customerLastName">Last Name</label>
	    <input type="text" class="form-control" id="customerLastName" name="customerLastName" placeholder="Last Name" value="${editCustomer.lastName}" required>
	  </div>
   	  <div class="form-group">
	    <label for="customerAddress">Address</label>
	    <input type="text" class="form-control" id="customerAddress" name="customerAddress" placeholder="Address" value="${editCustomer.address}" required>
	  </div>
   	  <div class="form-group">
	    <label for="customerCity">City</label>
	    <input type="text" class="form-control" id="customerCity" name="customerCity" placeholder="City" value="${editCustomer.city}" required>
	  </div>
   	  <div class="form-group">
	    <label for="customerState">State</label>
			<select id="customerState" name="customerState">
				<option value="${editCustomer.state}" selected>${editCustomer.state}</option>
				<option value="AL">Alabama</option>
				<option value="AK">Alaska</option>
				<option value="AZ">Arizona</option>
				<option value="AR">Arkansas</option>
				<option value="CA">California</option>
				<option value="CO">Colorado</option>
				<option value="CT">Connecticut</option>
				<option value="DE">Delaware</option>
				<option value="FL">Florida</option>
				<option value="GA">Georgia</option>
				<option value="HI">Hawaii</option>
				<option value="ID">Idaho</option>
				<option value="IL">Illinois</option>
				<option value="IN">Indiana</option>
				<option value="IA">Iowa</option>
				<option value="KS">Kansas</option>
				<option value="KY">Kentucky</option>
				<option value="LA">Louisiana</option>
				<option value="ME">Maine</option>
				<option value="MD">Maryland</option>
				<option value="MA">Massachusetts</option>
				<option value="MI">Michigan</option>
				<option value="MN">Minnesota</option>
				<option value="MS">Mississippi</option>
				<option value="MO">Missouri</option>
				<option value="MT">Montana</option>
				<option value="NE">Nebraska</option>
				<option value="NV">Nevada</option>
				<option value="NH">New Hampshire</option>
				<option value="NJ">New Jersey</option>
				<option value="NM">New Mexico</option>
				<option value="NY">New York</option>
				<option value="NC">North Carolina</option>
				<option value="ND">North Dakota</option>
				<option value="OH">Ohio</option>
				<option value="OK">Oklahoma</option>
				<option value="OR">Oregon</option>
				<option value="PA">Pennsylvania</option>
				<option value="RI">Rhode Island</option>
				<option value="SC">South Carolina</option>
				<option value="SD">South Dakota</option>
				<option value="TN">Tennessee</option>
				<option value="TX">Texas</option>
				<option value="UT">Utah</option>
				<option value="VT">Vermont</option>
				<option value="VA">Virginia</option>
				<option value="WA">Washington</option>
				<option value="WV">West Virginia</option>
				<option value="WI">Wisconsin</option>
				<option value="WY">Wyoming</option>
			</select>
		</div>
   	  <div class="form-group">
	    <label for="customerZipcode">Zipcode</label>
	    <input type="text" class="form-control" id="customerZipcode" name="customerZipcode" placeholder="Zipcode" value="${editCustomer.zipCode}" required>
	  </div>
   	  <div class="form-group">
	    <label for="customerTelephone">Telephone</label>
	    <input type="text" class="form-control" id="customerTelephone" name="customerTelephone" placeholder="Telephone number" value="${editCustomer.telephone}" required>
	  </div>
   	  <div class="form-group">
	    <label for="customerSSN">SSN (Customer ID)</label>
	    <input type="text" class="form-control" id="customerSSN" name="customerSSN" placeholder="XXXXXXXXX" value="${editCustomer.customerID}" readonly>
	  </div>
   	  <div class="form-group">
	    <label for="customerCreditCard">Credit Card Number</label>
	    <input type="text" class="form-control" id="customerCreditCard" name="customerCreditCard" placeholder="XXXXXXXXXXXX" value="${editCustomer.creditCard}" required>
	  </div>
   	  <div class="form-group">
	    <label for="customerRating">Rating</label>
	    <input type="text" class="form-control" id="customerRating" name="customerRating" placeholder="Hourly Rate" value="${editCustomer.rating}" required>
	  </div>
	  
	  <button type="submit" class="btn btn-primary">Submit</button>
	</form>
	</c:if>
	</div>
	<div class="container pt-1">
		<form action="home.jsp">
			<input type="submit" value="Home" class="btn btn-success"/>
		</form>
	</div>
	

</body>
</html>