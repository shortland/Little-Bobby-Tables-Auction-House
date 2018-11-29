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
	This is the Search Sales Report page
	This page displays fields to search a sale by month and year 
	This page redirects to the Show Sales Report page
-->

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width:device-width, initial-scale=1">
		<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
	</head>
	<body>
		<h1>Sales Report</h1>
		<div class="container">
			<h2>Select Month and Year</h2>
			<form action="getSalesReport">
				<div class="form-group">
				    <label for="month">Month</label>
				    <select class="form-control" name="month">
				      <option value="1">1</option>
				      <option value="2">2</option>
				      <option value="3">3</option>
				      <option value="4">4</option>
				      <option value="5">5</option>
				      <option value="6">6</option>
				      <option value="7">7</option>
				      <option value="8">8</option>
				      <option value="9">9</option>
				      <option value="10">10</option>
				      <option value="11">11</option>
				      <option value="12">12</option>
				    </select>
				    <label for="year">Year</label>
   				    <select class="form-control" name="year">
						<c:forEach var = "i" begin = "1900" end = "2018">
							<option value="${i}"> <c:out value = "${i}"/></option>
						</c:forEach>
				    </select>
				</div>
				<input type="submit" value="Search" class="btn btn-success"/>
			</form>
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
