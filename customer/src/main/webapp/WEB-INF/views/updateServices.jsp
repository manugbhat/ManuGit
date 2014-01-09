 <%@include file="common.jsp" %> 

<html>
<head>

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