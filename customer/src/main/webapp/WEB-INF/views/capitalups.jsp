<html>
<head>

</head>
<body>
<table class="capitalups">
	   <tr><td class="product"><input type="checkbox" name="capitalupsprod" id="capitalupsprod">UPS</td><td>Battery</td><td>Model</td><td>Warranty</td><td>Free Service</td></tr>
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
		   <tr class="banner"><td colspan="6" align="center">Estimated Bill</td></tr>
		   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance(click inside the box below to update advance payments)</td></tr>
		   <tr><td><input type="text" name="capitalupsestunitrate" id="capitalupsestunitrate"/></td><td><input type="text" name="capitalupsestquantity" id="capitalupsstquantity"/></td><td><input type="text" name="capitalupsestvat" id="capitalupsestvat"/></td><td><input type="text" name="capitalupsestdiscount" id="capitalupsestdiscount" onblur="calculateTotalBalance('capitalupsestunitrate','capitalupsestquantity','capitalupsestvat','capitalupsestdiscount','capitalupsesttotal','capitalupsestbalance')"/></td><td><input type="text" name="capitalupsesttotal" id="capitalupsesttotal"/></td><td><input type="text" name="capitalupsestbalance" id="capitalupsestbalance"/></td></tr>
		   <tr class="banner"><td colspan="6" align="center">Final Bill</td></tr>
		   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
		   <tr><td><input type="text" name="capitalupsfinalunitrate" id="capitalupsfinalunitrate"/></td><td><input type="text" name="capitalupsfinalquantity" id="capitalupsfinalquantity"/></td><td><input type="text" name="capitalupsfinalvat" id="capitalupsfinalvat"/></td><td><input type="text" name="capitalupsfinaldiscount" id="capitalupsfinaldiscount" onblur="calculateTotalBalance('capitalupsfinalunitrate','capitalupsfinalquantity','capitalupsfinalvat','capitalupsfinaldiscount','capitalupsfinaltotal','capitalupsfinalbalance')"/></td><td><input type="text" name="capitalupsfinaltotal" id="capitalupsfinaltotal"/></td><td><input type="text" name="capitalupsfinalbalance" id="capitalupsfinalbalance"/></td>
		   <div name="advancepaymentups" id="advancepaymentups" style="display:none ; width: 700px ; border : 2px solid;overflow : auto">
			
				  <h4>Update advance payments</h4>
				  <div style="width: 190px ;float : left">Date of payment</div><div style="width: 200px;float : left">Amount(INR)</div><div style="width: 200px;float : left">Cash or Checque</div></br>
				  <input type="text" name="upsdateofpayment" id="upsdateofpayment"/>
				  <input type="text" name="upsamount" id="upsamount"/>
				  <input type="text" name="upscashorchek" id="upscashorchek"/>
				  <div class="button advpmtsave">Save</div> <div class="button advpmtclose">Close</div>
			</div>
		   </tr>
		</table>
</body>
</html>