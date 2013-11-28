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
		$('#dateofpayment').datepicker({dateFormat : "dd/mm/yy",changeMonth : true,changeYear : true});
	});
		
	</script>


</head>
<body>
<h5>Update customer payments</h5>
	<form action="updatepayments" method="post">
	
	  <table>
	  <th><td>Date of payment</td><td>Amount</td><td>cash or checque</td></th>
	    <c:forEach var="payment" items="${payments}">
	    <input type="hidden" name="purchaseid" id="purchaseid" value="${payment.purchaseId}"/>
		  <tr><td>${payment.dateofPayment}</td>
		  <td>${payment.amount}</td>
		  <td>${payment.cashorcheck}</td>
		  <!-- <td><input type="text" value="${payment.checqueNo}"/></td></tr>-->
		  <tr><td></td></tr>
		</c:forEach>
	  
	  <tr><td><input type="text" name="dateofpayment" id="dateofpayment"/></td>
	  <td><input type="text" name="amount" id="amount"/></td>
	  <td><input type="text" name="cashorchek" id="cashorchek"/></td>
	  <!-- <td><input type="text" name="checqueno" id="checqueno"/></td></tr>-->
	  <input type="submit" value="Submit"/>
	  </table>
	</form>
</body>
</html>