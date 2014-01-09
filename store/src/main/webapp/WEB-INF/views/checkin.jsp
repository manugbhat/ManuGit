 <%@include file="common.jsp" %>
 
<html>
<head>
<script type="text/javascript">
$(function(){
	$('#dateofcheckin').datepicker({dateFormat : "mm/dd/yy",changeMonth : true,changeYear : true});
});
</script>

</head>
<body>
	<form:form action="checkinaction" commandName="form" method="post">
		<table>
			<tr><td><form:label path="date">Date</form:label></td><td><form:input id="dateofcheckin" path="date" type="date"/></td></tr>
			<tr><td><form:label path="producttype">Product Type</form:label></td><td><form:input path="producttype" type="text"/></td></tr>
			<tr><td><form:label path="consigneename">Consigner Name</form:label></td><td><form:input path="consigneename" type="text"/></td></tr>
			<tr><td><form:label path="ordernumber">Order Number</form:label></td><td><form:input path="ordernumber" type="text"/></td></tr>
			<tr><td><form:label path="productin">Product In</form:label></td><td><form:input path="productin" type="text"/></td></tr>
			<tr><td><form:label path="productbalance">Product Balance</form:label></td><td><form:input path="productbalance" type="text"/></td></tr>
			<tr><td><form:label path="carriername">Carrier Name</form:label></td><td><form:input path="carriername" type="text"/></td></tr>
			<tr><td><input type="submit" value="checkin"/>
		</table>
	</form:form>
</body>
</html>