
 
  <%@include file="common.jsp" %> 
<html>
	<head>
		
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