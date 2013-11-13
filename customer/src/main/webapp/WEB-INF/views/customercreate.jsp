<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Power Capital Systems - Customer Management</title>
<link href="resources/fonts.css" rel="stylesheet" type="text/css" />
<link href="resources/app.css" rel="stylesheet" type="text/css" />
<link href="resources/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="resources/ui-lightness/jquery-ui-1.10.1.custom.css" rel="stylesheet">
	<script src="resources/jquery-1.9.1.js"></script>
	<script src="resources/jquery-ui-1.10.1.custom.js"></script>
	<script type="text/javascript">
	$(function(){

		$('#dateoforder').datepicker({dateFormat : "dd/mm/yy"});
		$('#dateofsupply').datepicker({dateFormat : "dd/mm/yy"});
		$('#dateofinstallation').datepicker({dateFormat : "dd/mm/yy"});
		
		/* $("[id$=finalbalance]").click(function(){
			window.open('updatepayment','Payment update','height=200,width=400');
		}); */
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
	
	function calculateTotalBalance(unitrate,quantity,vat,discount,total,balance)
	{
		
		unitrateval = $('#'+unitrate).val();
		quantval = $('#'+quantity).val();
		vatval = $('#'+vat).val();
		discval = $('#'+discount).val();
		totalval = $('#'+total).val();
		balanceval = $('#'+balance).val();
		
		if (!validateNumber(unitrateval)) {
				$('#' + unitrate).val(0);
			}
			if (!validateNumber(quantval)) {
				$('#' + quantity).val(0);
			}
			if (!validateNumber(vatval)) {
				$('#' + vat).val(0);
			}
			if (!validateNumber(discval)) {
				$('#' + discount).val(0);
			}

			if (unitrateval != null && quantval != null && vatval != null
					&& discval != null) {
				prodrate = unitrateval * quantval;
				prodrate += prodrate * (vatval / 100);
				prodrate -= discval;
				$('#' + total).val(prodrate);
				$('#' + balance).val(prodrate);
			}
		}
		function validateNumber(value) {
			if (isNaN(value)) {
				alert("Please enter a valid number");
				return false;
			}
			return true;
		}
		
		function getInputEleName(selected){
  			return "ledquant"+selected;
  		}
	</script>

</head>
<body>
	
	<div id="customerform" class="containercreate">
	<form action="createcustomerpurchase" method="post" onsubmit="return checkProdSelection()">
	<h2 align="center" style="width : 550px ; background : none repeat scroll 0 0 #EE0000; border:2px solid #000000;color : #FFFFFF">Customer</h2>
	</br>
	   <table class="customerinfo">
	   <tr><td>Dealer Name</td></tr>
	   <tr><td><input type="text" name="dealer" id="dealer"/></td></tr>
	   <tr><td><font color="red" >Customer Name*</font></td></tr>
	   <tr><td><input type="text" name="custname" id="custname"/></td></tr>
	   <!-- tr><td>Upload Photo</td><td><input type="file" name="customerphoto"/></td></tr-->
	   <tr><td>Address</td></tr>
	   <tr><td><textarea name="custaddress" id="custaddress"></textarea></td></tr>
	   <tr><td>Email Id <input type="text" name="custemail" id="custemail"/></td></tr>
	   <tr><td>Phone number <input type="text" name="custphone" id="custphone"/></td></tr>
	   <tr><td>Date Of Order</td><td>Date Of Supply</td><td>Date Of Installation</td></tr>
	   <tr><td><input type="text" name="dateoforder" id="dateoforder"/></td><td><input type="text" name="dateofsupply" id="dateofsupply"/></td><td><input type="text" name="dateofinstallation" id="dateofinstallation"/></td></tr>
	   <tr><td>Bill no.</td><td>Order Form no.</td><td>Contact no.</td></tr>
	   <tr><td><input type="text" name="billno" id="billno"/></td><td><input type="text" name="orderformno" id="orderformno"/></td><td><input type="text" name="contactno" id="contactno"/></td></tr>
	   <tr><td></td></tr>
	   <tr><td></td></tr>
	   
	   
	   <tr><td></td></tr>
	   <tr><td></td></tr>
	   </table>
	   </br>
	  <h2 align="center" style="width : 1050px ; background : none repeat scroll 0 0 #EE0000; border:2px solid #000000;color : #FFFFFF">Products</h2>
	   </br>
	   <table class="solarcapacity">
	   <tr><td><input type="checkbox" name="solarcapprod" id="solarcapprod">Solar Capacity</td><td>Model</td><td>O Cladding</td><td>Warranty</td><td>Free Service</td></tr>
	   <tr>
		   <td><select name="solarcapacity" id="solarcapacity">
		   		<option selected="selected">Choose one..</option>
		   		<option>100</option>
		   		<option>150</option>
		   		<option>200</option>
		   		<option>250</option>
		   		<option>300</option>
		   		<option>500</option>
		   		<option>1000</option>
		   	   </select>
		   </td>
		   <td><select name="solarcapacitymodel" id="solarcapacitymodel">
		  		<option selected="selected">Choose one..</option>
		   		<option>ETC</option>
		   		<option>FPC</option>
		   		
		   	   </select>
		   </td>
		   <td><select name="solarcapacitycladding" id="solarcapacitycladding">
		   		<option selected="selected">Choose one..</option>
		   		<option>SS</option>
		   		<option>PC</option>
		   		
		   	   </select>
		   </td>
		   <td><select name="solarcapacitywarranty" id="solarcapacitywarranty">
		   		<option selected="selected">Choose one..</option>
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
		   <td><select name="solarcapacityfreeserv" id="solarcapacityfreeserv">
		   		<option selected="selected">Choose one..</option>
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
		   
	   </tr>
	   <tr><td>***************************</td><td>Estimated Bill</td><td>***************************</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
	   <tr><td><input type="text" name="solarestunitrate" id="solarestunitrate"/></td><td><input type="text" name="solarestquantity" id="solarestquantity"/></td><td><input type="text" name="solarestvat" id="solarestvat"/></td><td><input type="text" name="solarestdiscount" id="solarestdiscount" onblur="calculateTotalBalance('solarestunitrate','solarestquantity','solarestvat','solarestdiscount','solaresttotal','solarestbalance')"/></td><td><input type="text" name="solaresttotal" id="solaresttotal"/></td><td><input type="text" name="solarestbalance" id="solarestbalance"/></td></tr>
	   <tr><td>***************************</td><td>Final Bill</td><td>***************************</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
	   <tr><td><input type="text" name="solarfinalunitrate" id="solarfinalunitrate"/></td><td><input type="text" name="solarfinalquantity" id="solarfinalquantity"/></td><td><input type="text" name="solarfinalvat" id="solarfinalvat"/></td><td><input type="text" name="solarfinaldiscount" id="solarfinaldiscount" onblur="calculateTotalBalance('solarfinalunitrate','solarfinalquantity','solarfinalvat','solarfinaldiscount','solarfinaltotal','solarfinalbalance')"/></td><td><input type="text" name="solarfinaltotal" id="solarfinaltotal"/></td><td><input type="text" name="solarfinalbalance" id="solarfinalbalance"/></td></tr>
	   </table>
	   </br>
	   <table class="capitalwater">
	   <tr><td><input type="checkbox" name="capitwaterpurpprod" id="capitwaterpurpprod">Capital water purifiers</td><td>Warranty</td><td>Free Service</td></tr>
	   <tr>
		   <td><select name="capitalwaterpure" id="capitalwaterpure">
		   		<option selected="selected">Choose one..</option>
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
		   </td>
		    <td><select name="capitalwaterpurewarranty" id="capitalwaterpurewarranty">
		    	<option selected="selected">Choose one..</option>
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
		   <td><select name="capitalwaterpurefreeserv" id="capitalwaterpurefreeserv">
		   		<option selected="selected">Choose one..</option>
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
		   </tr>
	   <tr><td>***************************</td><td>Estimated Bill</td><td>***************************</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
	   <tr><td><input type="text" name="waterpurestunitrate" id="waterpurestunitrate"/></td><td><input type="text" name="waterpurestquantity" id="waterpurestquantity"/></td><td><input type="text" name="waterpurestvat" id="waterpurestvat"/></td><td><input type="text" name="waterpurestdiscount" id="waterpurestdiscount" onblur="calculateTotalBalance('waterpurestunitrate','waterpurestquantity','waterpurestvat','waterpurestdiscount','waterpuresttotal','waterpurestbalance')"/></td><td><input type="text" name="waterpuresttotal" id="waterpuresttotal"/></td><td><input type="text" name="waterpurestbalance" id="waterpurestbalance"/></td></tr>
	   <tr><td>***************************</td><td>Final Bill</td><td>***************************</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
	   <tr><td><input type="text" name="waterpurfinalunitrate" id="waterpurfinalunitrate"/></td><td><input type="text" name="waterpurfinalquantity" id="waterpurfinalquantity"/></td><td><input type="text" name="waterpurfinalvat" id="waterpurfinalvat"/></td><td><input type="text" name="waterpurfinaldiscount" id="waterpurfinaldiscount" onblur="calculateTotalBalance('waterpurfinalunitrate','waterpurfinalquantity','waterpurfinalvat','waterpurfinaldiscount','waterpurfinaltotal','waterpurfinalbalance')"/></td><td><input type="text" name="waterpurfinaltotal" id="waterpurfinaltotal"/></td><td><input type="text" name="waterpurfinalbalance" id="waterpurfinalbalance"/></td></tr>
		</table>
		</br>
		<table class="capitalled"> 
	   <tr><td><input type="checkbox" name="capitledlightpprod" id="capitledlightpprod">Capital LED Light</td><td>Quantity</td><td>Model</td><td>Warranty</td><td>Free Service</td></tr>
	   <tr>
		   <td><select multiple name="capitalled" id="capitalled">
		   		<option>3W</option>
		   		<option>6W</option>
		   		<option>9W</option>
		   		<option>12W</option>
		   		<option>15W</option>
		   		<option>18W</option>
		   		<option>21W</option>
		   		<option>24W</option>
		   		<option>27W</option>
		   		<option>30W</option>
		   		<option>36W</option>
		   		<option>45W</option>
		   	   </select>
		   	   </td>
		   	   <td>
		   	    		
			   </td>
		  
		   
		  <script type="text/javascript">
		  	$(
		  		function(){
		  			var	alloptions = [] ;
		  			$('#capitalled option').each(
		  				function(i,v){
		  					alloptions[i]= $(this).val();
		  				}		
		  			);
		  			
					$('#capitalled').change(
						function(){
							that = this;
							var selectedvals = $(this).val();
							$('#capitalled option').each(
					  				function(i,v){
					  					alloptions[i]= $(this).val();
					  				}		
					  			);

							$.each(selectedvals,function(ind,val){
								if(val != 'Choose one..')
									{
									 var paramname = getInputEleName(val);
									for(var i=0;i<alloptions.length;i++){
										if(alloptions[i] == val) {
											alloptions[i] = '';
										}
									 }
									for(var j=0;j<alloptions.length;j++){
										var unselectedval = alloptions[j];
										if(unselectedval != '')
											{
												var unselparamname = getInputEleName(unselectedval);
												$('#'+unselparamname).remove();
											}
									}
									
									 if($('#'+paramname).length == 0 ){
										 var input = '<input type="text" id="'+paramname+'" name="'+paramname+'" style="width : 40px;"/></br>';
										 $(that).parent().next().append(input);
									 }
									
									}
								
							});
						}		
					);
					$('body').on('keyup','[id^=ledquant]',function(){
						var all = $('[id^=ledquant]');
						var total = 0;
						for(var i=0 ; i < all.length ; i++) {
							if(isNaN($(all[i]).val())){ alert("Please enter valid number for quantity "); return;}
							total += +$(all[i]).val();
						}
						$('#capitalledestquantity').val(total);
						$('#capitalledfinalquantity').val(total);
					});
					
		  		}
		  	);
		  	
		  	
		  </script> 
		   <td><select name="capitalledmodel" id="capitalledmodel">
		   		<option selected="selected">Choose one..</option>
		   		<option>Indoor</option>
		   		<option>Outdoor</option>
		   		
		   	   </select>
		   </td>
			<td><select name="capitalledwarranty" id="capitalledwarranty">
				<option selected="selected">Choose one..</option>
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
		   <td><select name="capitalledfreeserv" id="capitalledfreeserv">
		   		<option selected="selected">Choose one..</option>
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
		   </tr>
	   <tr><td>***************************</td><td>Estimated Bill</td><td>***************************</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
	   <tr><td><input type="text" name="capitalledestunitrate" id="capitalledestunitrate"/></td><td><input type="text" name="capitalledestquantity" id="capitalledestquantity"/></td><td><input type="text" name="capitalledestvat" id="capitalledestvat"/></td><td><input type="text" name="capitalledestdiscount" id="capitalledestdiscount" onblur="calculateTotalBalance('capitalledestunitrate','capitalledestquantity','capitalledestvat','capitalledestdiscount','capitalledesttotal','capitalledestbalance')"/></td><td><input type="text" name="capitalledesttotal" id="capitalledesttotal"/></td><td><input type="text" name="capitalledestbalance" id="capitalledestbalance"/></td></tr>
	   <tr><td>***************************</td><td>Final Bill</td><td>***************************</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
	   <tr><td><input type="text" name="capitalledfinalunitrate" id="capitalledfinalunitrate"/></td><td><input type="text" name="capitalledfinalquantity" id="capitalledfinalquantity"/></td><td><input type="text" name="capitalledfinalvat" id="capitalledfinalvat"/></td><td><input type="text" name="capitalledfinaldiscount" id="capitalledfinaldiscount" onblur="calculateTotalBalance('capitalledfinalunitrate','capitalledfinalquantity','capitalledfinalvat','capitalledfinaldiscount','capitalledfinaltotal','capitalledfinalbalance')"/></td><td><input type="text" name="capitalledfinaltotal" id="capitalledfinaltotal"/></td><td><input type="text" name="capitalledfinalbalance" id="capitalledfinalbalance"/></td></tr>
	   </table>
	   </br>
	   <table class="capitalups">
	   <tr><td><input type="checkbox" name="capitalupsprod" id="capitalupsprod">UPS</td><td>Battery</td><td>Model</td><td>Warranty</td><td>Free Service</td></tr>
	   <tr>
		   <td><select name="capitalups" id="capitalups">
		   		<option selected="selected">Choose one..</option>
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
		   </td>
		   <td><select name="capitalupsbattery" id="capitalupsbattery">
		   		<option selected="selected">Choose one..</option>
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
		   </td>
		   <td><select name="capitalupsmodel" id="capitalupsmodel">
		   		<option selected="selected">Choose one..</option>
		   		<option>SMF</option>
		   		<option>Automotive</option>
		   		<option>Flat tubular</option>
		   		<option>Hard tubular</option>
		   		<option>Tower tubular</option>
		   		
		   	   </select>
		   </td>
			<td><select name="capitalupswarranty" id="capitalupswarranty">
				<option selected="selected">Choose one..</option>
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
		   <td><select name="capitalupsfreeserv" id="capitalupsfreeserv">
		   		<option selected="selected">Choose one..</option>
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
		   </tr>
		   <tr><td>***************************</td><td>Estimated Bill</td><td>***************************</td></tr>
		   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
		   <tr><td><input type="text" name="capitalupsestunitrate" id="capitalupsestunitrate"/></td><td><input type="text" name="capitalupsestquantity" id="capitalupsstquantity"/></td><td><input type="text" name="capitalupsestvat" id="capitalupsestvat"/></td><td><input type="text" name="capitalupsestdiscount" id="capitalupsestdiscount" onblur="calculateTotalBalance('capitalupsestunitrate','capitalupsestquantity','capitalupsestvat','capitalupsestdiscount','capitalupsesttotal','capitalupsestbalance')"/></td><td><input type="text" name="capitalupsesttotal" id="capitalupsesttotal"/></td><td><input type="text" name="capitalupsestbalance" id="capitalupsestbalance"/></td></tr>
		   <tr><td>***************************</td><td>Final Bill</td><td>***************************</td></tr>
		   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
		   <tr><td><input type="text" name="capitalupsfinalunitrate" id="capitalupsfinalunitrate"/></td><td><input type="text" name="capitalupsfinalquantity" id="capitalupsfinalquantity"/></td><td><input type="text" name="capitalupsfinalvat" id="capitalupsfinalvat"/></td><td><input type="text" name="capitalupsfinaldiscount" id="capitalupsfinaldiscount" onblur="calculateTotalBalance('capitalupsfinalunitrate','capitalupsfinalquantity','capitalupsfinalvat','capitalupsfinaldiscount','capitalupsfinaltotal','capitalupsfinalbalance')"/></td><td><input type="text" name="capitalupsfinaltotal" id="capitalupsfinaltotal"/></td><td><input type="text" name="capitalupsfinalbalance" id="capitalupsfinalbalance"/></td></tr>
		</table>
	   </br>
	   <table class="gasgeyser">
	   <tr><td><input type="checkbox" name="gasgeyserpprod" id="gasgeyserprod">Gas Geyser Model</td><td>Warranty</td><td>Free Service</td></tr>
	   <tr>
	   	<td><select name="capitalgasgeyser" id="capitalgasgeyser">
	   			<option selected="selected">Choose one..</option>
		   		<option>DELUXE</option>
		   		<option>Gold</option>
		   		<option>Others</option>
		   	   </select>
		   </td>
		   <td><select name="capitalgasgeyserwarranty" id="capitalgasgeyserwarranty">
		   		<option selected="selected">Choose one..</option>
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
		   <td><select name="capitalgasgeyserfreeserv" id="capitalgasgeyserfreeserv">
		   		<option selected="selected">Choose one..</option>
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
	   </tr>
	    <tr><td>***************************</td><td>Estimated Bill</td><td>***************************</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
	   <tr><td><input type="text" name="capitalgasgeyserestunitrate" id="capitalgasgeyserestunitrate"/></td><td><input type="text" name="capitalgasgeyserestquantity" id="capitalgasgeyserstquantity"/></td><td><input type="text" name="capitalgasgeyserestvat" id="capitalgasgeyserestvat"/></td><td><input type="text" name="capitalgasgeyserestdiscount" id="capitalgasgeyserestdiscount" onblur="calculateTotalBalance('capitalgasgeyserestunitrate','capitalgasgeyserestquantity','capitalgasgeyserestvat','capitalgasgeyserestdiscount','capitalgasgeyseresttotal','capitalgasgeyserestbalance')"/></td><td><input type="text" name="capitalgasgeyseresttotal" id="capitalgasgeyseresttotal"/></td><td><input type="text" name="capitalgasgeyserestbalance" id="capitalgasgeyserestbalance"/></td></tr>
	   <tr><td>***************************</td><td>Final Bill</td><td>***************************</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
	   <tr><td><input type="text" name="capitalgasgeyserfinalunitrate" id="capitalgasgeyserfinalunitrate"/></td><td><input type="text" name="capitalgasgeyserfinalquantity" id="capitalgasgeyserfinalquantity"/></td><td><input type="text" name="capitalgasgeyserfinalvat" id="capitalgasgeyserfinalvat"/></td><td><input type="text" name="capitalgasgeyserfinaldiscount" id="capitalgasgeyserfinaldiscount" onblur="calculateTotalBalance('capitalgasgeyserfinalunitrate','capitalgasgeyserfinalquantity','capitalgasgeyserfinalvat','capitalgasgeyserfinaldiscount','capitalgasgeyserfinaltotal','capitalgasgeyserfinalbalance')"/></td><td><input type="text" name="capitalgasgeyserfinaltotal" id="capitalgasgeyserfinaltotal"/></td><td><input type="text" name="capitalgasgeyserfinalbalance" id="capitalgasgeyserfinalbalance"/></td></tr>
	   </table>
	   </br>
	   <table class="solarlight">
	   <tr><td><input type="checkbox" name="solarlightprod" id="solarlightprod">Solar Light</td><td>Battery</td><td>Battery Model</td><td>Quantity</td><td>LED lights</td><td>Quantity</td><td>Backup</td><td>Warranty</td><td>Free Service</td></tr>
	   <tr>
		   <td><select name="capitalsolarlight" id="capitalsolarlight">
		   		<option selected="selected">Choose one..</option>
		   		<option>2 Light Kit</option>
		   		<option>5 Light Kit</option>
		   		<option>7 Light Kit</option>
		   		<option>10 Light Kit</option>
		   		<option>12 Light Kit</option>
		   		<option>15 Light Kit</option>
		   		<option>Street Light</option>
		   		<option>AC Light</option>
		   		<option>200W Power Pack</option>
		   		<option>500W Power Pack</option>
		   		<option>800W Power Pack</option>
		   		<option>1000W Power Pack</option>
		   		<option>1500W Power Pack</option>
		   		<option>2000W Power Pack</option>
		   	   </select>
		   </td>
		   <td><select name="capitalsolarlightbattery" id="capitalsolarlightbattery">
		   		<option selected="selected">Choose one..</option>
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
		   </td>
		   <td><select name="capitalsolarlightmodel" id="capitalsolarlightmodel">
		   		<option selected="selected">Choose one..</option>
		   		<option>SMF</option>
		   		<option>Automotive</option>
		   		<option>Flat tubular</option>
		   		<option>Hard tubular</option>
		   		<option>Tower tubular</option>
		   		
		   	   </select>
		   </td>
		   <td>
		   	<select name="capitalsolarlightquant" id="capitalsolarlightquant">
		   		<option selected="selected">Choose one..</option>
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
		   		<option>11</option>
		   		<option>12</option>
		   		<option>13</option>
		   		<option>14</option>
		   		<option>15</option>
		   		<option>16</option>
		   		<option>17</option>
		   		<option>18</option>
		   		<option>19</option>
		   		<option>20</option>
		   		<option>21</option>
		   		<option>22</option>
		   		<option>23</option>
		   		<option>24</option>
		   	   </select>
		   </td>
		    <td><select name="capitalsolarlightled" id="capitalsolarlightled">
		    	<option selected="selected">Choose one..</option>
		   		<option>3W</option>
		   		<option>6W</option>
		   		<option>9W</option>
		   		<option>12W</option>
		   		<option>15W</option>
		   		<option>18W</option>
		   		<option>21W</option>
		   		<option>24W</option>
		   		<option>27W</option>
		   		<option>30W</option>
		   		<option>36W</option>
		   		<option>45W</option>
		   	   </select>
		   </td>
		   <td><input type="text" width="10px" maxlength="4" name="capitalsolarlightledquant" id="capitalsolarlightledquant"/></td>
		     <td>
		   	<select name="capitalsolarlightledbackup" id="capitalsolarlightledbackup">
		   		<option selected="selected">Choose one..</option>
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
		   		<option>11</option>
		   		<option>12</option>
		   		<option>13</option>
		   		<option>14</option>
		   		<option>15</option>
		   		<option>16</option>
		   		<option>17</option>
		   		<option>18</option>
		   		<option>19</option>
		   		<option>20</option>
		   		<option>21</option>
		   		<option>22</option>
		   		<option>23</option>
		   		<option>24</option>
		   	   </select>
		   </td>
			<td><select name="capitalsolarlightledwarranty" id="capitalsolarlightledwarranty">
				<option selected="selected">Choose one..</option>
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
		   <td><select name="capitalsolarlightledfreeserv" id="capitalsolarlightledfreeserv">
		   		<option selected="selected">Choose one..</option>
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
		   </tr>
	   <tr><td>***************************</td><td>Estimated Bill</td><td>***************************</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
	   <tr><td><input type="text" name="capitalsolarlightestunitrate" id="capitalsolarlightestunitrate"/></td><td><input type="text" name="capitalsolarlightestquantity" id="ecapitalsolarlightstquantity"/></td><td><input type="text" name="capitalsolarlightestvat" id="capitalsolarlightestvat"/></td><td><input type="text" name="capitalsolarlightestdiscount" id="capitalsolarlightestdiscount" onblur="calculateTotalBalance('capitalsolarlightestunitrate','capitalsolarlightestquantity','capitalsolarlightestvat','capitalsolarlightestdiscount','capitalsolarlightesttotal','capitalsolarlightestbalance')"/></td><td><input type="text" name="capitalsolarlightesttotal" id="capitalsolarlightesttotal"/></td><td><input type="text" name="capitalsolarlightestbalance" id="capitalsolarlightestbalance"/></td></tr>
	   <tr><td>***************************</td><td>Final Bill</td><td>***************************</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
	   <tr><td><input type="text" name="capitalsolarlightfinalunitrate" id="capitalsolarlightfinalunitrate"/></td><td><input type="text" name="capitalsolarlightfinalquantity" id="capitalsolarlightfinalquantity"/></td><td><input type="text" name="capitalsolarlightfinalvat" id="capitalsolarlightfinalvat"/></td><td><input type="text" name="capitalsolarlightfinaldiscount" id="capitalsolarlightfinaldiscount" onblur="calculateTotalBalance('capitalsolarlightfinalunitrate','capitalsolarlightfinalquantity','capitalsolarlightfinalvat','capitalsolarlightfinaldiscount','capitalsolarlightfinaltotal','capitalsolarlightfinalbalance')"/></td><td><input type="text" name="capitalsolarlightfinaltotal" id="capitalsolarlightfinaltotal"/></td><td><input type="text" name="capitalsolarlightfinalbalance" id="capitalsolarlightfinalbalance"/></td></tr>
	
	   </table>
	   <br><br>
	   <table>
	   <tr><td><button type="submit">Submit</button></td><td><button type="reset">Reset</button></td><td><button type="button" onclick="javascript:document.location.href = 'home';">Back</button></td></tr>
	   </table>
	   </form>
	</div>
	
	
</body>
</html>