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
	This is the Seller-Item Details page
	This page displays the data for items sold by a given seller
	The details are fetched using the "items" field from the request object
-->

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width:device-width, initial-scale=1">
	<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
	<title>Seller-Item Details</title>
</head>
<body>

	<h1>The Seller-wise Item Details are:</h1>
	<div class="container">
	<c:if test="${empty items}">
		<h3> Items not found! <h3/> 
	</c:if>
	<c:if test="${not empty items}">
		<table class="table table-striped">
		  <thead>
		    <tr>
		      <th>Item ID</th>
		      <th>Name</th>
		      <th>Description</th>
		      <th>Type</th>
		      <th>Sold Price</th>
		      <th>Customer ID</th>
		      <th>Minimum Bid</th>
		      <th>Bid Increment</th>
		      <th></th>
		    </tr>
		  </thead>
		  <tbody>
		     <c:forEach items="${items}" varStatus="loop">
		       <tr>
		         <td>${items[loop.index].itemID}</td>
		         <td>${items[loop.index].name}</td>		         
		         <td>${items[loop.index].description}</td>
		         <td>${items[loop.index].type}</td>		         
		         <td>${bids[loop.index].bidPrice}</td>
		         <td>${bids[loop.index].customerID}</td>
		         <td>${auctions[loop.index].minimumBid}</td>
		         <td>${auctions[loop.index].bidIncrement}</td>
		         <td>
    	         	<form method="POST" action="bidInAuction">
						<div class="form-group">
			            	<input type="hidden" class="form-control" name="auctionID" value=${auctions[loop.index].auctionID}>
			            	<input type="hidden" class="form-control" name="itemID" value=${items[loop.index].itemID}>
			        	</div>
						<input type="submit" value="Bid" class="btn btn-success"/>
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