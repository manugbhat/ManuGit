<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>Power Capital Systems - Customer Management</title>
	<link href="resources/fonts.css" rel="stylesheet" type="text/css" />
	<link href="resources/style.css" rel="stylesheet" type="text/css" media="screen" />
	<script type="text/javascript" 	src="resources/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="resources/jquery.simplyscroll.js"></script>
	<link rel="stylesheet" href="resources/jquery.simplyscroll.css" media="all" type="text/css">

<script type="text/javascript">
(function($) {
	$(function() { //on DOM ready
		$("#scroller").simplyScroll({
			customClass: 'vert',
			orientation: 'vertical',
            auto: true,
           // manualMode: 'loop',
			frameRate: 20,
			speed: 2
		});
	
		$("#scroller1").simplyScroll({
			customClass: 'vert',
			orientation: 'vertical',
            auto: true,
           // manualMode: 'loop',
			frameRate: 20,
			speed: 2
		});
	});
})(jQuery);

function checkEmpty(){
	var customerId = document.getElementById("customerId").value;
	if(customerId == "" || customerId == null)
		{
			alert("Please enter customer Id");
			return false;
		}
	
	
}

function openServiceDetails()
{
	//var customerid = $('#customerId').text();
	window.open('updateservice?customerId='+0 , 'Service Update','height=1500,width=400,resizable=true');
	return false;
}
</script>
</head>
<body>


<div id="wrapper">
	<div class="container">
		<h1>Power <font color="red">capital</font> systems</h1>
		<p>Brand with power , joy forever </p>
	</div>
	<div id="menu-wrapper">
		<div id="menu" class="container">
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">Product maintenance</a></li>
				<li><a href="#">Administration</a></li>
				<li><a href="logout">LogOut</a></li>
			</ul>
			
		</div>
	</div>
	<h4 align="center">Total Number Of Customers In The System - ${customerCount}</h4>
	<div id="search">
		<form action="customeredit" onsubmit="return checkEmpty()" method="POST">
			Enter customer ID <input type="text" name="customerId" id="customerId"></input> &nbsp;	<button type="submit" >Find</button>
			
		</form>
		<strong>----OR-----</strong>
		<br>
		<form action="customercreate">
	    	<button type="submit" >Create Customer</button>
		</form>
		<!-- <strong>----OR-----</strong>
		<br>
		<button id="updateservice" name="Enter Service details" onclick="return openServiceDetails()">Enter Service details</button>
		 -->
	</div>
	
	<div id="three-column" class="container">
		
		<div class="tbox1">
			<div class="box-style box-style01">
				<div class="content">
					<h2>Payment Due Reminders</h2>
					<ul id="scroller">
						<c:forEach var="customer" items="${duepayments}">
								<li><a href="customeredit?customerId=${customer.customerId}">${customer.customerName}</a></li>
								<!--li>${custid}</li-->
													
						</c:forEach>
						<!-- <li><a href="customercreate">Customer 1 Name </a></li>
						<li><a href="customercreate">Customer 2 Name</a></li>
						<li><a href="customercreate"><strong><font color="red">Customer 3 Name</font></strong></a></li>
						<li><a href="customercreate">Customer 4 Name</a></li>
						<li><a href="customercreate">Customer 5 Name</a></li>
						<li><a href="customercreate">Customer 6 Name</a></li>
						<li><a href="customercreate">Customer 7 Name</a></li>
						<li><a href="customercreate">Customer 8 Name</a></li>
						<li><a href="customercreate">Customer 9 Name</a></li>-->
						
					</ul>
					
					
				</div>
			</div>
		</div>
		<div class="tbox2">
			<div class="box-style box-style02">
				<div class="content">
					<h2>Service Due Reminders</h2>
					<ul id="scroller1">
						<c:forEach var="customer" items="${dues}">
						<c:if test="${customer.key == 'dueservices'}">
							<c:forEach var="custid" items="${customer.value}">
								<li>${custid}</li>
							</c:forEach>
						</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		
	</div>
</body>

</html>
