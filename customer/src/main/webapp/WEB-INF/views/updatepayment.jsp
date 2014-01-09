 <%@include file="common.jsp" %> 
<html>
<head>

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