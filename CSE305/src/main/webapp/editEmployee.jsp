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
	This is the Edit Employee page
	This page displays fields to edit an Employee 
	The details are sent to the UpdateEmployeeController class in resources package
-->

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Edit Employee</title>
	<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />	
	<script src="webjars/jquery/3.3.1-1/jquery.min.js"></script>
	<script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	
	<h1>Edit Employee:</h1>
	<c:if test="${empty editEmployee}">
		<h3> Employee details not found! <h3/> 
	</c:if>
	<c:if test="${not empty editEmployee}"> 	
	<form action="updateEmployee" method="POST">
	  <div class="form-group">
	    <label for="employeeEmail">Email address</label>
	    <input type="email" class="form-control" id="employeeEmail" name="employeeEmail" placeholder="Enter email" value="${editEmployee.email}" required>
	  </div>
	  <div class="form-group">
	    <label for="employeePassword">Password</label>
	    <input type="text" class="form-control" id="employeePassword" name="employeePassword" placeholder="Password" value="${editEmployee.password}" readonly>
	  </div>
  	  <div class="form-group">
	    <label for="employeeFirstName">First Name</label>
	    <input type="text" class="form-control" id="employeeFirstName" name="employeeFirstName" placeholder="First Name" value="${editEmployee.firstName}" required>
	  </div>
  	  <div class="form-group">
	    <label for="employeeLastName">Last Name</label>
	    <input type="text" class="form-control" id="employeeLastName" name="employeeLastName" placeholder="Last Name" value="${editEmployee.lastName}" required>
	  </div>
   	  <div class="form-group">
	    <label for="employeeAddress">Address</label>
	    <input type="text" class="form-control" id="employeeAddress" name="employeeAddress" placeholder="Address" value="${editEmployee.address}" required>
	  </div>
   	  <div class="form-group">
	    <label for="employeeCity">City</label>
	    <input type="text" class="form-control" id="employeeCity" name="employeeCity" placeholder="City" value="${editEmployee.city}" required>
	  </div>
   	  <div class="form-group">
	    <label for="employeeState">State</label>
	    <select id="employeeState" name="employeeState">
					<option value="${editEmployee.state}" selected>${editEmployee.state}</option>
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
	    <label for="employeeZipcode">Zipcode</label>
	    <input type="text" class="form-control" id="employeeZipcode" name="employeeZipcode" placeholder="Zipcode" value="${editEmployee.zipCode}" required>
	  </div>
   	  <div class="form-group">
	    <label for="employeeTelephone">Telephone</label>
	    <input type="text" class="form-control" id="employeeTelephone" name="employeeTelephone" placeholder="Telephone number" value="${editEmployee.telephone}" required>
	  </div>
   	  <div class="form-group">
	    <label for="employeeSSN">SSN (Employee ID)</label>
	    <input type="text" class="form-control" id="employeeSSN" name="employeeSSN" placeholder="XXXXXXXXX" value="${editEmployee.employeeID}" readonly>
	  </div>
   	  <div class="form-group">
	    <label for="employeeStartDate">Start Date</label>
	    <input type="text" class="form-control" id="employeeStartDate" name="employeeStartDate" placeholder="YYYY-MM-DD" value="${editEmployee.startDate}" required>
	  </div>
   	  <div class="form-group">
	    <label for="employeeHourlyRate">Hourly Rate</label>
	    <input type="text" class="form-control" id="employeeHourlyRate" name="employeeHourlyRate" placeholder="Hourly Rate" value="${editEmployee.hourlyRate}" required>
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