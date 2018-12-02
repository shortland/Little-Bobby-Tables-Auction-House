<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
	This is the Bid Item page
	This page contains a text field where user can enter the bid and click on update
	This page also refreshes the value of highest bid periodically using AJAX query
	This page redirects to the Home page after clicking on Home button
-->

<html>	

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width:device-width, initial-scale=1">
		<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />

		<script src="webjars/jquery/3.3.1-1/jquery.min.js"></script>
		<script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		<script>
			$(document).ready(function() {
				function get_bid(){
				    var feedback = $.ajax({
				        type: "GET",
				        url: "getBid",
				        async: false
				    }).complete(function(){
				        setTimeout(function(){get_bid();}, 10000);
				    }).responseText;
		
				    $('#ajaxGetUserServletResponse').text(feedback);
				    out.println(responseText);
				}
			});
			
			$(document).on("click", "#somebutton", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
	            $.get("getBid", function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
	                $("#ajaxGetUserServletResponse").text(responseText);           // Locate HTML DOM element with ID "somediv" and set its text content with the response text.
	                console.log("hihi");
	            });
	        });
		</script>
		
	</head>
	<body>
		<div class="container">
			<h2>Bid Item</h2>
			<div class="jumbotron">
			  <h1 class="display-4">Item X</h1>
			  <p class="lead">This is a sample description of the item.</p>
			  <hr class="my-4">
			  <p>This is more description of the item.</p>
			  <p class="lead">
			  	<div id="ajaxGetUserServletResponse">Some Bid Value</div>
			    <button id="somebutton">Refresh Bid</button>
			  </p>
			</div>
		</div>
		
		<div class="container">
			<form action="home.jsp">
				<input type="submit" value="Home" class="btn btn-success"/>
			</form>
		</div>
		
		
		<script src="webjars/jquery/3.3.1/jquery.min.js"></script>
		<script src="webjars/bootstrap/4.1.3/bootstrap.min.js"></script>
	</body>
</html>
