 <%@include file="common.jsp" %>
<%@page import="com.powercap.customer.service.CustomerPurchase" %>
<%@page import="java.util.List" %>

<html>
<head>
	<script type="text/javascript">
	$(function(){
		$('#dateoforder').datepicker({dateFormat : "dd/mm/yy",changeMonth : true,changeYear : true});
		$('#dateofsupply').datepicker({dateFormat : "dd/mm/yy",changeMonth : true,changeYear : true});
		$('#dateofinstallation').datepicker({dateFormat : "dd/mm/yy",changeMonth : true,changeYear : true});
		$('[id$=dateofpayment]').datepicker({dateFormat : "dd/mm/yy",changeMonth : true,changeYear : true});
		GLOBAL = { "solarcapacity" : { nameCount : 0 },
				   "capitalwater" : { nameCount : 0 },
				   "capitalled" : { nameCount : 0 },
				   "capitalups" : { nameCount : 0 },
				   "gasgeyser" : { nameCount : 0 },
				   "solarlight" : { nameCount : 0 },
				   };
		$("[id$=estbalance]").on({
			click : function(e){
							$(this).parents().eq(3).prev().show();
						},
			
			});
		
		$(".advpmtsave").click(function(){
			parentid = $(this).parent().attr('id');
			  nameCount = 0;
			  $.each(GLOBAL,function(val,ind){
				  if(val == parentid) {
					  nameCount = ind.nameCount;
				  }
			  });
			  dop = $(this).prev().prev().prev().val();
			  amt = $(this).prev().prev().val();
			  cc = $(this).prev().val();
			  
			  dopid = $(this).prev().prev().prev().attr('id');
			  amtid = $(this).prev().prev().attr('id');
			  ccid = $(this).prev().attr('id');
			  
			  nameCount += 1;
			  dateOfPaymentName = dopid+nameCount;
			  amountName = amtid+nameCount;
			  cashorchekName = ccid+nameCount;
			  
			  $.each(GLOBAL,function(val,ind){
				  if(val == parentid) {
					  ind.nameCount = nameCount;
				  }
			  });
			  
			  formhtml = '<input type="hidden" name="'+dateOfPaymentName+'" value="'+dop+'"/>'+
				  		 '<input type="hidden" name="'+amountName+'" value="'+amt+'"/>'+
				  		 '<input type="hidden" name="'+cashorchekName+'" value="'+cc+'"/>';
			  html = '<div style="width: 190px ;float : left" >'+dop+'</div>'+
			  		 '<div style="width: 200px ;float : left" >'+amt+'</div>'+
			  		 '<div style="width: 200px ;float : left" >'+cc+'</div>'+
			  		'<div class="button deletepayment" style="margin-top : 0px">Delete</div>';
			  $(this).parent().append(html);
			  $(this).parent().append(formhtml);
			  finalbalance = $(this).parent().next().find('[id$=estbalance]').val();
			  if(finalbalance != "")
				  {
				   finalbalance -= amt;
				   finalbalance = (Math.round(finalbalance*100)/100);
				  }
			  
			  $(this).parent().next().find('[id$=estbalance]').val(finalbalance);
			 
		});
		
		$('[id^=ledquant]').on('keyup',function(){
			var all = $('[id^=ledquant]');
			var total = 0;
			for(var i=0 ; i < all.length ; i++) {
				if(isNaN($(all[i]).val())){ alert("Please enter valid number for quantity "); return;}
				total += +$(all[i]).val();
			}
			$('#capitalledestquantity').val(total);
			$('#capitalledfinalquantity').val(total);
		});
		
		$(".advpmtclose").click(function(){
			$(this).parent().hide();
		});
	});
	
	
	function checkProdSelection()
	{
		if($("[id$=prod]").is(":checked"))
			return true;
		else {
			alert("You have to select one of the products checkbox!");
			return false;
		}
		
	} 
	
	function openServiceDetails()
	{
		var customerid = $('#customerId').text();
		window.open('updateservice?customerId='+customerid , 'Service Update','height=1500,width=1400,resizable=true');
		return false;
	}
	</script>

</head>
<body>
	<form action="createcustomerpurchase" onsubmit="return checkProdSelection()"  method="post">
	<div class="containercreate">
	<h2 align="center" style="width : 500px ; background : none repeat scroll 0 0 #EE0000; border:2px solid #000000;color : #FFFFFF">Customer</h2>
	  <c:forEach var="purchase" items="${customerpurchases}">
	     
	  
	   <table class="customerinfo">
	   <input type="hidden" id="purchaseid" value="${purchase.purchaseid}"/>

	   <tr><td>Customer ID </td> <c:if test="${not empty purchase.customerId}"><td><label id="customerId">${purchase.customerId}</label></td></c:if>
	   <td>	   <button id="updateservice" name="Service details" onclick="return openServiceDetails()">Service details</button></td>
	   </tr>
	   <tr><td>Dealer Name</td></tr>
	   <tr><td><input type="text" name="dealer" id="dealer" value="<c:out value="${purchase.dealerName}"/>"/></td></tr>
	   <tr><td><font color="red" >Customer Name*</font></td></tr>
	   <tr><td><input type="text" name="custname" id="custname" value="<c:out value="${purchase.customerName}"/>"/> </td></tr>
	   <tr><td><img src="<c:url value="getImage?customerId=${purchase.customerId}"/>" height="130" width="130"/></td></tr>
	   <tr><td>Address</td></tr>
	   <tr><td><textarea name="custaddress" id="custaddress"><c:out value="${purchase.customerAddress}"/></textarea></td></tr>
	   <tr><td>Email Id <input type="text" name="custemail" id="custemail" value="<c:out value="${purchase.customerEmail}"/>"/></td></tr>
	   <tr><td>Phone number <input type="text" name="custphone" id="custphone" value="<c:out value="${purchase.customerPhone1}"/>"/></td></tr>
	   <tr><td>Date Of Order</td><td>Date Of Supply</td><td>Date Of Installation</td></tr>
	   <tr><td><input type="text" name="dateoforder" id="dateoforder" value="<c:out value="${purchase.dateofOrder}"/>"/></td><td><input type="text" name="dateofsupply" id="dateofsupply" value="<c:out value="${purchase.dateofSupply}"/>"/></td><td><input type="text" name="dateofinstallation" id="dateofinstallation" value="<c:out value="${purchase.dateofInstall}"/>"/></td></tr>
	   <tr><td>Bill no.</td><td>Order Form no.</td><td>Contact no.</td></tr>
	   <tr><td><input type="text" name="billno" id="billno" value="<c:out value="${purchase.billno}"/>"/></td><td><input type="text" name="orderformno" id="orderformno"  value="<c:out value="${purchase.orderformno}"/>"/></td><td><input type="text" name="contactno" id="contactno" value="<c:out value="${purchase.contactno}"/>"/></td></tr>
	   <tr><td></td></tr>
	   <tr><td></td></tr>
	   <tr><td></td></tr>
	   <tr><td></td></tr>
	   </table>
	    <h2 align="center" style="width : 950px ; background : none repeat scroll 0 0 #EE0000; border:2px solid #000000;color : #FFFFFF">Products</h2>
	   <table>
	   <tr>
	   <td><input type="checkbox" name="solarcapprod" id="solarcapprod"></td>
	   </tr>
	   <tr><td>${purchase.prodName}</td><td>Quantity</td>
	   <c:if test="${not empty purchase.prodmodel}" >
	   		<td>
	   			Model
	   		</td>
	   </c:if>
	   <c:if test="${not empty purchase.prodAttribute}" >
	       <td>
	   			${purchase.prodAttribute}
	   	   </td>
	   </c:if>
	   
	   <c:if test="${not empty purchase.battery}" >
	       <td>
	   			Battery
	   	   </td>
	   </c:if>
	  	   
	   <c:if test="${not empty purchase.warranty}" >
	       <td>
	   			Warranty
	   	   </td>
	   </c:if>
	   <c:if test="${not empty purchase.freeService}" >
	       <td>
	   			Free Service
	   	   </td>
	   </c:if>
	   </tr>
	   
	   <tr>
	   <c:if test="${not empty purchase.productType}">
	   	<td> 
	   	   <c:if test="${purchase.prodName == 'Solar Capacity'}">
	   		  <select name="solarcapacity" id="solarcapacity">
	   		  	<option selected="selected">${purchase.productType}</option>
		   		<option>100</option>
		   		<option>150</option>
		   		<option>200</option>
		   		<option>250</option>
		   		<option>300</option>
		   		<option>500</option>
		   		<option>1000</option>
		   		
		   	   </select>
		   </c:if>
		   <c:if test="${purchase.prodName == 'Capital LED Light'}">
		    
		  	 <%
				List<CustomerPurchase> purchases = (List<CustomerPurchase>)request.getAttribute("customerpurchases");
		  		String[] allWatts = new String[]{"3W","6W","9W","12W","15W","18W","21W","24W","27W","30W","36W","45W"};
				for ( CustomerPurchase purchase : purchases){
					if(purchase.getProdName().equalsIgnoreCase("Capital LED Light"))
					{
						String prodtype = purchase.getProductType();
						if(prodtype.indexOf("#") != -1)
						{
							String[] typeQuant = prodtype.split("#");
							String[] types = typeQuant[0].split(",");
							String[] quants = typeQuant[1].split(",");
							String[] restOfWatt = new String[12];
							for(int x=0; x < allWatts.length ;x++) {
								for(int ind=0; ind < types.length ; ind++) {
								
									if(types[ind].equals(allWatts[x])){
										allWatts[x]="";
									}
									
								}
								
							}
							System.out.println(allWatts.length);
							System.out.println(restOfWatt.length);
							%>
							<select multiple name="capitalled" id="capitalled">
							<%for(int i =0 ; i < types.length ; i++)
							{  String type = types[i];%>
								<option selected="selected"><%=type%></option>
							<%}
							System.out.println(types.length);
							  for(int j1=0 ; j1 < (allWatts.length) ; j1++ ) {
							     String watt = allWatts[j1];
							     if(!watt.equals("")){%>
								  <option><%=watt%></option>
							 <% }
							   }
							%>
							</select></td><td>
							<% for(int j =0 ; j < quants.length ; j++){
								String quantity = "ledquant"+types[j];
								String value = quants[j];
								%>
							
							<input type="text" id="<%=quantity%>" name="<%=quantity%>" value="<%=value%>"/>
							<%}
							System.out.println(quants.length);
							for(int j2=0; j2<(allWatts.length) ; j2++) {
								String wattInput = "";
								 if(!allWatts[j2].equals("")){
									 wattInput = "ledquant"+allWatts[j2];%>
									 <input type="text" id="<%=wattInput%>" name="<%=wattInput%>"/>
								<% }
							}
					}
				 }
				}
				%>
				
	   		 
		   </c:if>
		   <c:if test="${purchase.prodName == 'Capital UPS'}">
	   		  <select name="capitalups" id="capitalups">
	   		  	<option selected="selected">${purchase.productType}</option>
		   		<option>600 VA</option>
		   		<option>850 VA</option>
		   		<option>1 KVA</option>
		   		<option>1.5 KVA</option>
		   		<option>2 KVA</option>
		   		<option>2.5 KVA</option>
		   		<option>3 KVA</option>
		   		<option>3.5 KVA</option>
		   		<option>5 KVA</option>
		   		<option>7 KVA</option>
		   		<option>10 KVA</option>
		   	   </select>
		   </c:if>
		   
	   	      
	   	</td>
	   </c:if>
	   <c:if test="${not empty purchase.prodmodel}">
	   	<td>
	   		<c:if test="${purchase.prodName == 'Solar Capacity'}">
	   		  <select name="solarcapacitymodel" id="solarcapacitymodel">
	   		  	<option selected="selected">${purchase.prodmodel}</option>
		   		<option>ETC</option>
		   		<option>FPC</option>
		   		
		   	   </select>
		   </c:if>
		   <c:if test="${purchase.prodName == 'Capital Water Purifier'}">
	   		  <select name="capitalwaterpure" id="capitalwaterpure">
	   		  	<option selected="selected">${purchase.prodmodel}</option>
		   		<option>Ultra Pure</option>
		   		<option>Compaq UV</option>
		   		<option>UV 100LPH</option>
		   		<option>UV 100LPH with</option>
		   		<option>50ltrs SS Tank Storage</option>
		   		<option>RO Compaq</option>
		   		<option>RO Pure</option>
		   		<option>RO 30 LPH</option>
		   		<option>RO 50 LPH</option>
		   		<option>RO 50 LPH with</option>
		   		<option>SS Tank Storage</option>
		   		<option>RO 100 LPH</option>
		   		
		   	   </select>
		   </c:if>
		   <c:if test="${purchase.prodName == 'Capital LED Light'}">
	   		  <select name="capitalledmodel" id="capitalledmodel">
	   		  	<option selected="selected">${purchase.prodmodel}</option>
		   		<option>Indoor</option>
		   		<option>Outdoor</option>
		   	   </select>
		   </c:if>
		   <c:if test="${purchase.prodName == 'Capital UPS'}">
	   		  <select name="capitalupsmodel" id="capitalupsmodel">
	   		  	<option selected="selected">${purchase.prodmodel}</option>
		   		<option>SMF</option>
		   		<option>Automotive</option>
		   		<option>Flat tubular</option>
		   		<option>Hard tubular</option>
		   		<option>Tower tubular</option>
		   	   </select>
		   </c:if>
		    <c:if test="${purchase.prodName == 'Gas Geyser'}">
	   		  <select name="capitalgasgeyser" id="capitalgasgeyser">
	   		  	<option selected="selected">${purchase.prodmodel}</option>
		   		<option>DELUXE</option>
		   		<option>Gold</option>
		   		<option>Others</option>
		   	   </select>
		   </c:if>
	   	      
	   	</td>
	   </c:if>
	   <c:if test="${not empty purchase.prodAttribvalue}" >
	       <td>
		       <c:if test="${purchase.prodName == 'Solar Capacity'}">
		   		  <select name="solarcapacitycladding" id="solarcapacitycladding">
		   		  	<option selected="selected">${purchase.prodAttribvalue}</option>
			   		<option>SS</option>
		   			<option>PC</option>
			   	   </select>
			   </c:if>
			   <c:if test="${purchase.prodName == 'Capital UPS'}">
		   		  <select name="capitalupsbattery" id="capitalupsbattery">
		   		  	<option selected="selected">${purchase.prodAttribvalue}</option>
			   		<option>7.2 AH</option>
			   		<option>17 AH</option>
			   		<option>20 AH</option>
			   		<option>26 AH</option>
			   		<option>42 AH</option>
			   		<option>65 AH</option>
			   		<option>82 AH</option>
			   		<option>100 AH</option>
			   		<option>120 AH</option>
			   		<option>150 AH</option>
			   		<option>180 AH</option>
			   		<option>200 AH</option>
			   		<option>220 AH</option>
			   	   </select>
			   </c:if>
	   	   </td>
	   </c:if>
	    <c:if test="${not empty purchase.battery}" >
	       <td>
	   			${purchase.battery}
	   	   </td>
	   </c:if>
	  	   
	   <c:if test="${not empty purchase.warranty}" >
	       <td>
	   			<select>
	   			  	<option selected="selected">${purchase.warranty}</option>
	   			  	<option>1</option>
			   		<option>2</option>
			   		<option>3</option>
			   		<option>4</option>
			   		<option>5</option>
			   		<option>6</option>
			   		<option>7</option>
			   		<option>8</option>
			   		<option>9</option>
			   		<option>10</option>
	   			</select>
	   	   </td>
	   </c:if>
	   <c:if test="${not empty purchase.freeService}" >
	       <td>
	   			<select>
	   				<option selected="selected">${purchase.freeService}</option>
	   				<option>1</option>
			   		<option>2</option>
			   		<option>3</option>
			   		<option>4</option>
			   		<option>5</option>
			   		<option>6</option>
			   		<option>7</option>
			   		<option>8</option>
			   		<option>9</option>
			   		<option>10</option>
	   			</select>
	   	   </td>
	   </c:if>
	   </tr>
	   <tr><td>***************************</td><td>Estimated Bill</td><td>***************************</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
	   <tr>
	       <td>
	       <c:choose>
		       <c:when test="${purchase.prodName == 'Solar Capacity'}">
		       		<input type="text" name="solarestunitrate" id="solarestunitrate" value="${purchase.estimatedunitRate}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital Water Purifier'}">
		       		<input type="text" name="waterpurfinalunitrate" id="waterpurfinalunitrate" value="${purchase.estimatedunitRate}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital LED Light'}">
		       		<input type="text" name="capitalledestunitrate" id="capitalledestunitrate" value="${purchase.estimatedunitRate}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital UPS'}">
		       		<input type="text" name="capitalupsestunitrate" id="capitalupsestunitrate" value="${purchase.estimatedunitRate}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Gas Geyser'}">
		       		<input type="text" name="capitalgasgeyserestunitrate" id="capitalgasgeyserestunitrate" value="${purchase.estimatedunitRate}"/>
		       </c:when>
	       </c:choose>
	   			
	   	   </td>
	  	    <td>
	  	     <c:choose>
		       <c:when test="${purchase.prodName == 'Solar Capacity'}">
		       		<input type="text" name="solarestquantity" id="solarestquantity" value="${purchase.estimatedQuant}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital Water Purifier'}">
		       		<input type="text" name="waterpurestquantity" id="waterpurestquantity" value="${purchase.estimatedQuant}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital LED Light'}">
		       		<input type="text" name="capitalledestquantity" id="capitalledestquantity" value="${purchase.estimatedQuant}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital UPS'}">
		       		<input type="text" name="capitalupsestquantity" id="capitalupsestquantity" value="${purchase.estimatedQuant}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Gas Geyser'}">
		       		<input type="text" name="capitalgasgeyserestquantity" id="capitalgasgeyserestquantity" value="${purchase.estimatedQuant}"/>
		       </c:when>
	       </c:choose>
	   			
	   	   </td>
	   	    <td>
	   	    <c:choose>
		       <c:when test="${purchase.prodName == 'Solar Capacity'}">
		       		<input type="text" name="solarestquantity" id="solarestquantity" value="${purchase.estimatedvat}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital Water Purifier'}">
		       		<input type="text" name="waterpurestvat" id="waterpurestvat" value="${purchase.estimatedvat}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital LED Light'}">
		       		<input type="text" name="capitalledestvat" id="capitalledestvat" value="${purchase.estimatedvat}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital UPS'}">
		       		<input type="text" name="capitalupsestvat" id="capitalupsestvat" value="${purchase.estimatedvat}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Gas Geyser'}">
		       		<input type="text" name="capitalgasgeyserestvat" id="capitalgasgeyserestvat" value="${purchase.estimatedvat}"/>
		       </c:when>
	       </c:choose>
	   			
	   	   </td>
	   	    <td>
	   	    <c:choose>
		       <c:when test="${purchase.prodName == 'Solar Capacity'}">
		       		<input type="text" name="solarestdiscount" id="solarestdiscount" value="${purchase.estimateddiscount}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital Water Purifier'}">
		       		<input type="text" name="waterpurestdiscount" id="waterpurestdiscount" value="${purchase.estimateddiscount}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital LED Light'}">
		       		<input type="text" name="capitalledestdiscount" id="capitalledestdiscount" value="${purchase.estimateddiscount}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital UPS'}">
		       		<input type="text" name="capitalupsestdiscount" id="capitalupsestdiscount" value="${purchase.estimateddiscount}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Gas Geyser'}">
		       		<input type="text" name="capitalgasgeyserestdiscount" id="capitalgasgeyserestdiscount" value="${purchase.estimateddiscount}"/>
		       </c:when>
	       </c:choose>
	   			
	   	   </td>
	   	    <td>
	   	    <c:choose>
		       <c:when test="${purchase.prodName == 'Solar Capacity'}">
		       		<input type="text" name="solaresttotal" id="solaresttotal" value="${purchase.estimatedtotal}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital Water Purifier'}">
		       		<input type="text" name="waterpuresttotal" id="waterpuresttotal" value="${purchase.estimatedtotal}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital LED Light'}">
		       		<input type="text" name="capitalledesttotal" id="capitalledesttotal" value="${purchase.estimatedtotal}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital UPS'}">
		       		<input type="text" name="capitalupsesttotal" id="capitalupsesttotal" value="${purchase.estimatedtotal}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Gas Geyser'}">
		       		<input type="text" name="capitalgasgeyseresttotal" id="capitalgasgeyseresttotal" value="${purchase.estimatedtotal}"/>
		       </c:when>
	       </c:choose>
	   			
	   	   </td>
	   	   <td>
	   	    <c:choose>
		       <c:when test="${purchase.prodName == 'Solar Capacity'}">
		       		<input type="text" name="solarestbalance" id="solarestbalance" value="${purchase.estbalance}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital Water Purifier'}">
		       		<input type="text" name="waterpurestbalance" id="waterpurestbalance" value="${purchase.estbalance}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital LED Light'}">
		       		<input type="text" name="capitalledestbalance" id="capitalledestbalance" value="${purchase.estbalance}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital UPS'}">
		       		<input type="text" name="capitalupsestbalance" id="capitalupsestbalance" value="${purchase.estbalance}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Gas Geyser'}">
		       		<input type="text" name="capitalgasgeyserestbalance" id="capitalgasgeyserestbalance" value="${purchase.estbalance}"/>
		       </c:when>
	       </c:choose>
	   			
	   	   </td>
	   </tr>
	   	<tr><td>***************************</td><td>Final Bill</td><td>***************************</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
	   <tr>
	       <td>
	       	<c:choose>
		       <c:when test="${purchase.prodName == 'Solar Capacity'}">
		       		<input type="text" name="solarfinalunitrate" id="solarfinalunitrate" value="${purchase.finalunitRate}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital Water Purifier'}">
		       		<input type="text" name="waterpurfinalunitrate" id="waterpurfinalunitrate" value="${purchase.finalunitRate}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital LED Light'}">
		       		<input type="text" name="capitalledfinalunitrate" id="capitalledfinalunitrate" value="${purchase.finalunitRate}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital UPS'}">
		       		<input type="text" name="capitalupsfinalunitrate" id="capitalupsfinalunitrate" value="${purchase.finalunitRate}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Gas Geyser'}">
		       		<input type="text" name="capitalgasgeyserfinalunitrate" id="capitalgasgeyserfinalunitrate" value="${purchase.finalunitRate}"/>
		       </c:when>
	       </c:choose>
	   	   </td>
	  	    <td>
	  	    <c:choose>
		       <c:when test="${purchase.prodName == 'Solar Capacity'}">
		       		<input type="text" name="solarfinalquantity" id="solarfinalquantity" value="${purchase.finalQuant}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital Water Purifier'}">
		       		<input type="text" name="waterpurfinalquantity" id="waterpurfinalquantity" value="${purchase.finalQuant}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital LED Light'}">
		       		<input type="text" name="capitalledfinalquantity" id="capitalledfinalquantity" value="${purchase.finalQuant}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital UPS'}">
		       		<input type="text" name="capitalupsfinalquantity" id="capitalupsfinalquantity" value="${purchase.finalQuant}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Gas Geyser'}">
		       		<input type="text" name="capitalgasgeyserfinalquantity" id="capitalgasgeyserfinalquantity" value="${purchase.finalQuant}"/>
		       </c:when>
	       </c:choose>
	   	   </td>
	   	    <td>
	   	    <c:choose>
		       <c:when test="${purchase.prodName == 'Solar Capacity'}">
		       		<input type="text" name="solarfinalvat" id="solarfinalvat" value="${purchase.finalvat}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital Water Purifier'}">
		       		<input type="text" name="waterpurfinalvat" id="waterpurfinalvat" value="${purchase.finalvat}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital LED Light'}">
		       		<input type="text" name="capitalledfinalvat" id="capitalledfinalvat" value="${purchase.finalvat}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital UPS'}">
		       		<input type="text" name="capitalupsfinalvat" id="capitalupsfinalvat" value="${purchase.finalvat}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Gas Geyser'}">
		       		<input type="text" name="capitalgasgeyserfinalvat" id="capitalgasgeyserfinalvat" value="${purchase.finalvat}"/>
		       </c:when>
	       </c:choose>
	   	   </td>
	   	    <td>
	   	    <c:choose>
		       <c:when test="${purchase.prodName == 'Solar Capacity'}">
		       		<input type="text" name="solarfinaldiscount" id="solarfinaldiscount" value="${purchase.finaldiscount}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital Water Purifier'}">
		       		<input type="text" name="waterpurfinaldiscount" id="waterpurfinaldiscount" value="${purchase.finaldiscount}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital LED Light'}">
		       		<input type="text" name="capitalledfinaldiscount" id="capitalledfinaldiscount" value="${purchase.finaldiscount}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital UPS'}">
		       		<input type="text" name="capitalupsfinaldiscount" id="capitalupsfinaldiscount" value="${purchase.finaldiscount}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Gas Geyser'}">
		       		<input type="text" name="capitalgasgeyserfinaldiscount" id="capitalgasgeyserfinaldiscount" value="${purchase.finaldiscount}"/>
		       </c:when>
	       </c:choose>
	   	   </td>
	   	    <td>
	   	    <c:choose>
		       <c:when test="${purchase.prodName == 'Solar Capacity'}">
		       		<input type="text" name="solarfinaltotal" id="solarfinaltotal" value="${purchase.finaltotal}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital Water Purifier'}">
		       		<input type="text" name="waterpurfinaltotal" id="waterpurfinaltotal" value="${purchase.finaltotal}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital LED Light'}">
		       		<input type="text" name="capitalledfinaltotal" id="capitalledfinaltotal" value="${purchase.finaltotal}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital UPS'}">
		       		<input type="text" name="capitalupsfinaltotal" id="capitalupsfinaltotal" value="${purchase.finaltotal}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Gas Geyser'}">
		       		<input type="text" name="capitalgasgeyserfinaltotal" id="capitalgasgeyserfinaltotal" value="${purchase.finaltotal}"/>
		       </c:when>
	       </c:choose>
	   	   </td>
	   	    <td>
	   	    <c:choose>
		       <c:when test="${purchase.prodName == 'Solar Capacity'}">
		       		<input type="text" name="solarfinalbalance" id="solarfinalbalance" value="${purchase.finalbalance}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital Water Purifier'}">
		       		<input type="text" name="waterpurfinalbalance" id="waterpurfinalbalance" value="${purchase.finalbalance}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital LED Light'}">
		       		<input type="text" name="capitalledfinalbalance" id="capitalledfinalbalance" value="${purchase.finalbalance}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Capital UPS'}">
		       		<input type="text" name="capitalupsfinalbalance" id="capitalupsfinalbalance" value="${purchase.finalbalance}"/>
		       </c:when>
		       <c:when test="${purchase.prodName == 'Gas Geyser'}">
		       		<input type="text" name="capitalgasgeyserfinalbalance" id="capitalgasgeyserfinalbalance" value="${purchase.finalbalance}"/>
		       </c:when>
	       </c:choose>
	   	   </td>
	   	   
	   	    <div name="advancepayment" id="advancepayment" style="display:none ; width: 700px ; border : 2px solid;overflow : auto">
			
				  <h4>Update advance payments</h4>
				  <div style="width: 190px ;float : left">Date of payment</div><div style="width: 200px;float : left">Amount(INR)</div><div style="width: 200px;float : left">Cash or Checque</div></br>
				  <c:choose>
				       <c:when test="${purchase.prodName == 'Solar Capacity'}">
				       		<input type="text" name="solardateofpayment" id="solardateofpayment"/>
							<input type="text" name="solaramount" id="solaramount"/>
							<input type="text" name="solarcashorchek" id="solarcashorchek"/>
				       </c:when>
				       <c:when test="${purchase.prodName == 'Capital Water Purifier'}">
				       		  <input type="text" name="waterdateofpayment" id="waterdateofpayment"/>
							  <input type="text" name="wateramount" id="wateramount"/>
							  <input type="text" name="watercashorchek" id="watercashorchek"/>
				       </c:when>
				       <c:when test="${purchase.prodName == 'Capital LED Light'}">
				       		<input type="text" name="leddateofpayment" id="leddateofpayment"/>
							  <input type="text" name="ledamount" id="ledamount"/>
							  <input type="text" name="ledcashorchek" id="ledcashorchek"/>
				       </c:when>
				       <c:when test="${purchase.prodName == 'Capital UPS'}">
				       		<input type="text" name="upsdateofpayment" id="upsdateofpayment"/>
						   <input type="text" name="upsamount" id="upsamount"/>
						   <input type="text" name="upscashorchek" id="upscashorchek"/>
				       </c:when>
				       <c:when test="${purchase.prodName == 'Gas Geyser'}">
				       		<input type="text" name="lightdateofpayment" id="lightdateofpayment"/>
						  	<input type="text" name="lightamount" id="lightamount"/>
						 	<input type="text" name="lightcashorchek" id="lightcashorchek"/>
				       </c:when>
				  </c:choose>
				  <div class="button advpmtsave">Save</div> <div class="button advpmtclose">Close</div>
				 <c:forEach var="payment" items="${purchase.payments}">
				  	<div style="width: 190px ;float : left" >${ payment.dateofPayment }</div>
			  		<div style="width: 200px ;float : left" >${ payment.amount }</div>
			  		<div style="width: 200px ;float : left" >${ payment.cashorcheck }</div>
				  </c:forEach> 
				  
				  
			</div> 
	   </tr>
	   </table>
	</c:forEach>
	   
	   <br><br>
	   <table>
	   	<tr><td><button type="submit">Submit</button></td><td><button type="reset">Reset</button></td><td><button type="button" onclick="javascript:document.location.href = 'home';">Back</button></td></tr>
	   </table>
	</div>
	
	</form>
</body>
</html>