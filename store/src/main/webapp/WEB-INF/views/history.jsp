 <%@include file="common.jsp" %>
<html>
<head>

</head>
<body>
	<table>
	<thead style="background-color: red"><tr><td>Client Name</td><td>Total In </td><td>Total Out</td></tr></thead>
		<c:forEach var="item" items="${historyItems}">
			<tr><td>${item.clientName}</td><td>${item.totalIn}</td><td></td></tr>
		</c:forEach>
	
	</table>
</body>
</html>