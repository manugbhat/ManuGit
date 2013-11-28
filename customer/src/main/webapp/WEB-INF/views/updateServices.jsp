<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Power Capital Systems - Customer Management</title>
<link href="resources/fonts.css" rel="stylesheet" type="text/css" />
<link href="resources/app.css" rel="stylesheet" type="text/css" />
<link href="resources/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="resources/ui-lightness/jquery-ui-1.10.1.custom.css" rel="stylesheet">
	<script src="resources/jquery-1.9.1.js"></script>
	<script src="resources/jquery-ui-1.10.1.custom.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#servicedate').datepicker({dateFormat : "dd/mm/yy",changeMonth : true,changeYear : true});
		$('#nextservicedate').datepicker({dateFormat : "dd/mm/yy",changeMonth : true,changeYear : true});
	});
		
	function checkServCharge(){
		var serviceCharge = $('#servicecharge').val();
		if(serviceCharge == null || serviceCharge == undefined || serviceCharge=="" )
			{
				$('#servicecharge').val(0);
			}
		return true;
	}
	</script>


</head>
<body>
<h5>Update customer service details</h5>
	<form action="updateservices" method="post" onsubmit="return checkServCharge()">
	
	  <table>
	  <tr style="background : none repeat scroll 0 0 #EE0000; border:2px solid #000000;color : #FFFFFF"><td>Type of Service</td><td>Date</td><td>Service Charge</td><td>Due in months</td><td>Next due date</td></tr>
	    <c:forEach var="service" items="${services}">
	    <input type="hidden" name="customerid" id="customerid" value="${service.customerId}"/>
		  <tr><td>${service.serviceName}</td>
		  <td>${service.dateofService}</td>
		  <td>${service.serviceCharge}</td>
		  <td>${service.dueinmonths}</td>
		  <td>${service.dateofNextService}</td></tr>
		  <tr><td></td></tr>
		</c:forEach>
	  
	  <tr><td><input type="text" name="servicename" id="servicename"/></td>
	  <td><input type="text" name="servicedate" id="servicedate"/></td>
	  <td><input type="text" name="servicecharge" id="servicecharge"/></td>
	  <td><input type="text" name="dueinmonths" id="dueinmonths" value="3"/></td>
	  <td><input type="text" name="nextservicedate" id="nextservicedate"/></td></tr>
	  <input type="submit" value="Submit"/>
	  </table>
	</form>
</body>
</html>