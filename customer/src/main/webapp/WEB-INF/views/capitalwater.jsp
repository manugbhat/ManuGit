<html>
<head>

</head>
<body>
<table class="capitalwater">
	   <tr><td class="product"><input type="checkbox" name="capitwaterpurpprod" id="capitwaterpurpprod">Capital water purifiers</td><td>Warranty</td><td>Free Service</td></tr>
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
	   <tr class="banner"><td colspan="6" align="center">Estimated Bill</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance(click inside the box below to update advance payments)</td></tr>
	   <tr><td><input type="text" name="waterpurestunitrate" id="waterpurestunitrate"/></td><td><input type="text" name="waterpurestquantity" id="waterpurestquantity"/></td><td><input type="text" name="waterpurestvat" id="waterpurestvat"/></td><td><input type="text" name="waterpurestdiscount" id="waterpurestdiscount" onblur="calculateTotalBalance('waterpurestunitrate','waterpurestquantity','waterpurestvat','waterpurestdiscount','waterpuresttotal','waterpurestbalance')"/></td><td><input type="text" name="waterpuresttotal" id="waterpuresttotal"/></td><td><input type="text" name="waterpurestbalance" id="waterpurestbalance"/></td></tr>
	   <tr class="banner"><td colspan="6" align="center">Final Bill</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
	   <tr><td><input type="text" name="waterpurfinalunitrate" id="waterpurfinalunitrate"/></td><td><input type="text" name="waterpurfinalquantity" id="waterpurfinalquantity"/></td><td><input type="text" name="waterpurfinalvat" id="waterpurfinalvat"/></td><td><input type="text" name="waterpurfinaldiscount" id="waterpurfinaldiscount" onblur="calculateTotalBalance('waterpurfinalunitrate','waterpurfinalquantity','waterpurfinalvat','waterpurfinaldiscount','waterpurfinaltotal','waterpurfinalbalance')"/></td><td><input type="text" name="waterpurfinaltotal" id="waterpurfinaltotal"/></td><td><input type="text" name="waterpurfinalbalance" id="waterpurfinalbalance"/></td>
	   <div name="advancepaymentwater" id="advancepaymentwater" style="display:none ; width: 700px ; border : 2px solid;overflow : auto">
			
				  <h4>Update advance payments</h4>
				  <div style="width: 190px ;float : left">Date of payment</div><div style="width: 200px;float : left">Amount(INR)</div><div style="width: 200px;float : left">Cash or Checque</div></br>
				  <input type="text" name="waterdateofpayment" id="waterdateofpayment"/>
				  <input type="text" name="wateramount" id="wateramount"/>
				  <input type="text" name="watercashorchek" id="watercashorchek"/>
				  <div class="button advpmtsave">Save</div> <div class="button advpmtclose">Close</div>
		</div>
	   </tr>
		</table>
</body>
</html>