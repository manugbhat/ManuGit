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
</head>
<body>
<ul>
<c:forEach var="purchase" items="${customerpurchases}">

	<li><a href="customeredit?customerId=${purchase.customerId}">${purchase.customerName}</a></li>


</c:forEach>
</ul>

</body>
</html>