<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>Power Capital Systems - Customer Management</title>
		<link href="resources/fonts.css" rel="stylesheet" type="text/css" />
		<link href="resources/style.css" rel="stylesheet" type="text/css" media="screen" />
		<script type="text/javascript" 	src="/resources/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="/resources/jquery.simplyscroll.js"></script>
		<link rel="stylesheet" href="/resources/jquery.simplyscroll.css" media="all" type="text/css">
		<script type="text/javascript">
		 function checkEmpty(){
			var userName = document.getElementById("username").value;
			if(userName == "" || userName == null)
				{
					alert("Please enter user name");
					return false;
				}
			var password = document.getElementById("password").value;
			if(password == "" || password == null)
				{
					alert("Please enter password");
					return false;
				}
			
			
		}
		
		</script>
	</head>
	<body>
	<div id="wrapper">
	<div class="container">
		<h1>Power <font color="red">capital</font> systems</h1>
		<p>Brand with power , joy forever</p>
	</div>
	<c:choose>
		<c:when test="${error != null && error eq 'NoDB' }">
			<h4 align="center"><font color="red">Database is down or there is no connection !</font></h4>
		</c:when>
		<c:when test="${error !=null && error eq 'InvalidLogin' }">
			<h4 align="center"><font color="red">Invalid username or password!</font></h4> 
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose> 
	<table align="center">
	<tr><td>
	<form action="login" method="post" onsubmit="return checkEmpty()">
	<table>
		<tr><td>
		User Name</td><td> <input type="text" id="username" name="username"/>
		</td></tr>
		<tr><td>		
		Password</td><td><input type="password" id="password" name="password"/>
		</td></tr>
		<tr><td></td><td align="right"><input type="submit" class="button" value="login"/></td></tr>
	</table>
	</form></td></tr>
	</table>
	</div>
	</body>
</html>