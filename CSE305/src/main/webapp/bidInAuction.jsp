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
	This is the Bid page
	This page displays the data of an auction and customer can bid in the auction
	The details are fetched using the "auction", "item" and "winningCustomer" fields from the request object
-->

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width:device-width, initial-scale=1">
	<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
	<title>Auction Details</title>
</head>
<body>

	<h1>Auction Details:</h1>
	<div class="container">
	<c:if test="${empty auction}">
		<h3> The auction has already ended! </h3> 
	</c:if>
	<c:if test="${not empty auction}">
		<div class="jumbotron">
		  <h1 class="display-4">Auction ID: ${auction.auctionID}</h1>
		  <p class="lead">Item Details:</p>
		  <hr class="my-4">
		  <p>ID: ${item.itemID}</p>
		  <p>Name: ${item.name}</p>
		  <p>${item.description}</p>
		  <p class="lead">
		    <p>Current High Bid: ${auction.currentHighBid}</p>
		    <p>Bid Increment: ${auction.bidIncrement}</p>
		    <p>Current Winner: ${winningCustomer.firstName} ${winningCustomer.lastName}</p>
		  </p>
		</div>
	</c:if>
	</div>
	<div class="container pt-1">
		<form method="POST" action="submitBid">
			<div class="form-group">
			  <label for="maxBid">Maximum Bid:</label>
			  <input type="text" class="form-control" id="maxBid" name="maxBid" placeholder="Maximum Bid" required>
			</div>
			<input type="hidden" class="form-control" name="currentBid" value=${auction.currentHighBid + auction.bidIncrement}>
			<input type="hidden" class="form-control" name="auctionID" value=${auction.auctionID}>
			<input type="hidden" class="form-control" name="itemID" value=${item.itemID}>
			<input type="submit" value="Submit Bid" class="btn btn-primary"/>
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