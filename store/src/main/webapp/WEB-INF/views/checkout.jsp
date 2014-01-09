 <%@include file="common.jsp" %>
<html>
<head>
<script type="text/javascript">
$(function(){
	$('#dateofcheckout').datepicker({dateFormat : "mm/dd/yy",changeMonth : true,changeYear : true});
	
	$('#skidin').datepicker({dateFormat : "mm/dd/yy",changeMonth : true,changeYear : true});
	
	$('#skidout').datepicker({dateFormat : "mm/dd/yy",changeMonth : true,changeYear : true});
	
	$('#productout').blur(function(){
		productin = $('#productin').val();
		
		productout = $(this).val();
		if(!validateNumber(productin) || !validateNumber(productout))
			{
				alert("Please enter a valid number ");
			}
		balance =  (+productin) - (+productout) ;
			
			$('#productbalance').val(balance);
		
	});
	
	$('#misccharge').blur(function(){
		skidwrapcharge = $('#skidwrapcharge').val();
		skidcharge = $('#skidcharge').val();
		storagecharge = $('#storagecharge').val();
		misccharge = $(this).val();
		if(!validateNumber(skidwrapcharge) || !validateNumber(skidcharge)
			|| !validateNumber(storagecharge) || !validateNumber(misccharge))
			{
				alert("Please enter a valid number ");
			}
		totalcharges =  (+skidwrapcharge) + (+skidcharge) + (+storagecharge) + (+misccharge);
			
			$('#totalcharge').val(totalcharges);
		
	});
});

function validateNumber(value) {
	if (isNaN(value)) {
		alert("Please enter a valid number");
		return false;
	}
	return true;
}
</script>
</head>
<body>
<form:form action="checkoutaction" commandName="form" method="post">
		<table>
			<tr><td><form:label path="date">Date</form:label></td><td><form:input id="dateofcheckout" path="date" type="date"/></td></tr>
			<tr><td><form:label path="producttype">Product Type</form:label></td><td><form:input path="producttype" type="text"/></td></tr>
			<tr><td><form:label path="consigneename">Consigner Name</form:label></td><td><form:input path="consigneename" type="text"/></td></tr>
			<tr><td><form:label path="ponumber">PO Number</form:label></td><td><form:input path="ponumber" type="text"/></td></tr>
			<tr><td><form:label path="productin">Product In</form:label></td><td><form:input path="productin" type="text"/></td></tr>
			<tr><td><form:label path="productout">Product Out</form:label></td><td><form:input path="productout" id="productout" type="text"/></td></tr>
			<tr><td><form:label path="productbalance">Account Balance</form:label></td><td><form:input path="productbalance" id="productbalance" type="text"/></td></tr>
			<tr><td><form:label path="carriername">Carrier Name</form:label></td><td><form:input path="carriername" type="text"/></td></tr>
			<tr><td><form:label path="skidwrapping">Skid wrapping</form:label></td><td><form:input path="skidwrapping" id="skidwrapcharge" type="text"/></td></tr>
			<tr><td><form:label path="skidcharge">Skid Charge</form:label></td><td><form:input path="skidcharge" id="skidcharge" type="text"/></td></tr>
			<tr><td><form:label path="skidin">Skid In</form:label></td><td><form:input path="skidin" id="skidin" type="date"/></td></tr>
			<tr><td><form:label path="skidout">Skid Out</form:label></td><td><form:input path="skidout" id="skidout" type="date"/></td></tr>
			<tr><td><form:label path="storagecharge">Storage Charges</form:label></td><td><form:input path="storagecharge" id="storagecharge" type="text"/></td></tr>
			<tr><td><form:label path="misccharge">Misc Charges</form:label></td><td><form:input path="misccharge" id="misccharge" type="text"/></td></tr>
			<tr><td><form:label path="totalcharge">Total Charges</form:label></td><td><form:input path="totalcharge" id="totalcharge" type="text"/></td></tr>
			<tr><td><input type="submit" value="checkout"/>
		</table>
	</form:form>
</body>
</html>