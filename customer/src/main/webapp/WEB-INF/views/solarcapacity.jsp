<html>
<head>

</head>
<body>
	<table class="solarcapacity">
	   <tr><td class="product"><input type="checkbox" name="solarcapprod" id="solarcapprod">Solar Capacity</td><td>Model</td><td>O Cladding</td><td>Warranty</td><td>Free Service</td></tr>
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
	   <tr class="banner"><td colspan="6" align="center">Estimated Bill</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance(click inside the box below to update advance payments)</td></tr>
	   <tr><td><input type="text" name="solarestunitrate" id="solarestunitrate"/></td><td><input type="text" name="solarestquantity" id="solarestquantity"/></td><td><input type="text" name="solarestvat" id="solarestvat"/></td><td><input type="text" name="solarestdiscount" id="solarestdiscount" onblur="calculateTotalBalance('solarestunitrate','solarestquantity','solarestvat','solarestdiscount','solaresttotal','solarestbalance')"/></td><td><input type="text" name="solaresttotal" id="solaresttotal"/></td><td><input type="text" name="solarestbalance" id="solarestbalance"/></td></tr>
	   <tr class="banner"><td colspan="6" align="center">Final Bill</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
	   <tr><td><input type="text" name="solarfinalunitrate" id="solarfinalunitrate"/></td><td><input type="text" name="solarfinalquantity" id="solarfinalquantity"/></td><td><input type="text" name="solarfinalvat" id="solarfinalvat"/></td><td><input type="text" name="solarfinaldiscount" id="solarfinaldiscount" onblur="calculateTotalBalance('solarfinalunitrate','solarfinalquantity','solarfinalvat','solarfinaldiscount','solarfinaltotal','solarfinalbalance')"/></td><td><input type="text" name="solarfinaltotal" id="solarfinaltotal"/></td><td><input type="text" name="solarfinalbalance" id="solarfinalbalance"/></td>
	  	<div name="advancepaymentsolar" id="advancepaymentsolar" style="display:none ; width: 700px ; border : 2px solid;overflow : auto">
			
				  <h4>Update advance payments</h4>
				  <div style="width: 190px ;float : left">Date of payment</div><div style="width: 200px;float : left">Amount(INR)</div><div style="width: 200px;float : left">Cash or Checque</div></br>
				  <input type="text" name="solardateofpayment" id="solardateofpayment"/>
				  <input type="text" name="solaramount" id="solaramount"/>
				  <input type="text" name="solarcashorchek" id="solarcashorchek"/>
				  <div class="button advpmtsave">Save</div> <div class="button advpmtclose">Close</div><br>
		</div>
		</tr>	   
	   </table>
</body>
</html>