 <%@include file="common.jsp" %>
<html>
<head>
	

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
	window.open('updateservice?customerId='+none , 'Service Update','height=400,width=400');
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
		<button id="updateservice" name="Service details" onclick="return openServiceDetails()">Service details</button> -->
		
	</div>
	
	<div id="three-column" class="container">
		<div class="tbox1">
			<div class="box-style box-style01">
				<div class="content">
					<h2>Payment Due Reminders</h2>
					<ul id="scroller">
						<c:forEach var="customer" items="${dues}">
						    <c:if test="${customer.key == 'duepayments'}">
							<c:forEach var="custid" items="${customer.value}">
								<li>${custid}</li>
							</c:forEach>
							</c:if>
													
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
