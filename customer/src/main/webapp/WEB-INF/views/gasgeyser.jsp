<html>
<head>

</head>
<body>
 <table class="gasgeyser">
	   <tr><td class="product"><input type="checkbox" name="gasgeyserpprod" id="gasgeyserprod">Gas Geyser Model</td><td>Warranty</td><td>Free Service</td></tr>
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
	    <tr class="banner"><td colspan="6" align="center">Estimated Bill</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance(click inside the box below to update advance payments)</td></tr>
	   <tr><td><input type="text" name="capitalgasgeyserestunitrate" id="capitalgasgeyserestunitrate"/></td><td><input type="text" name="capitalgasgeyserestquantity" id="capitalgasgeyserstquantity"/></td><td><input type="text" name="capitalgasgeyserestvat" id="capitalgasgeyserestvat"/></td><td><input type="text" name="capitalgasgeyserestdiscount" id="capitalgasgeyserestdiscount" onblur="calculateTotalBalance('capitalgasgeyserestunitrate','capitalgasgeyserestquantity','capitalgasgeyserestvat','capitalgasgeyserestdiscount','capitalgasgeyseresttotal','capitalgasgeyserestbalance')"/></td><td><input type="text" name="capitalgasgeyseresttotal" id="capitalgasgeyseresttotal"/></td><td><input type="text" name="capitalgasgeyserestbalance" id="capitalgasgeyserestbalance"/></td></tr>
	   <tr class="banner"><td colspan="6" align="center">Final Bill</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
	   <tr><td><input type="text" name="capitalgasgeyserfinalunitrate" id="capitalgasgeyserfinalunitrate"/></td><td><input type="text" name="capitalgasgeyserfinalquantity" id="capitalgasgeyserfinalquantity"/></td><td><input type="text" name="capitalgasgeyserfinalvat" id="capitalgasgeyserfinalvat"/></td><td><input type="text" name="capitalgasgeyserfinaldiscount" id="capitalgasgeyserfinaldiscount" onblur="calculateTotalBalance('capitalgasgeyserfinalunitrate','capitalgasgeyserfinalquantity','capitalgasgeyserfinalvat','capitalgasgeyserfinaldiscount','capitalgasgeyserfinaltotal','capitalgasgeyserfinalbalance')"/></td><td><input type="text" name="capitalgasgeyserfinaltotal" id="capitalgasgeyserfinaltotal"/></td><td><input type="text" name="capitalgasgeyserfinalbalance" id="capitalgasgeyserfinalbalance"/></td>
	   <div name="advancepaymentgeyser" id="advancepaymentgeyser" style="display:none ; width: 700px ; border : 2px solid;overflow : auto">
			
				  <h4>Update advance payments</h4>
				  <div style="width: 190px ;float : left">Date of payment</div><div style="width: 200px;float : left">Amount(INR)</div><div style="width: 200px;float : left">Cash or Checque</div></br>
				  <input type="text" name="geyserdateofpayment" id="geyserdateofpayment"/>
				  <input type="text" name="geyseramount" id="geyseramount"/>
				  <input type="text" name="geysercashorchek" id="geysercashorchek"/>
				  <div class="button advpmtsave">Save</div> <div class="button advpmtclose">Close</div>
		</div>
	   </tr>
	   </table>
</body>
</html>