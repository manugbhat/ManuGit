 <%@include file="common.jsp" %>
<html>
<head>
</head>
<body>
<table>
<thead style="background-color: red"><tr><td>Date</td><td>&nbsp;|&nbsp;</td><td>Product Type</td><td>&nbsp;|&nbsp;</td><td>Consignee Name</td>
<td>&nbsp;|&nbsp;</td><td>Order Number</td><td>&nbsp;|&nbsp;</td><td>Product In</td><td>&nbsp;|&nbsp;</td><td>Product Balance</td><td>&nbsp;|&nbsp;</td><td>Carrier Name</td></tr></thead>
 <c:forEach var="items" items="${storeitems}">
	<tr><td>${ items.date }</td><td>&nbsp;|&nbsp;</td><td>${ items.producttype }</td><td>&nbsp;|&nbsp;</td><td>${ items.consigneename }</td><td>&nbsp;|&nbsp;</td><td>${ items.ordernumber }</td>
	<td>&nbsp;|&nbsp;</td><td>${ items.productin }</td><td>&nbsp;|&nbsp;</td><td>${ items.productbalance }</td><td>&nbsp;|&nbsp;</td><td>${ items.carriername }</td>
	</tr> 	
 </c:forEach>
 </table>
</body>
</html>