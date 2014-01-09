<html>
<head>

</head>
<body>
<table class="capitalled"> 
	   <tr><td class="product"><input type="checkbox" name="capitledlightpprod" id="capitledlightpprod">Capital LED Light</td><td>Quantity</td><td>Model</td><td>Warranty</td><td>Free Service</td></tr>
	   <tr>
		   <td><select multiple name="capitalled" id="capitalled" style="height : 250px">
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
		   	    	<input type="text" id="ledquant3W" name="ledquant3W" style="width : 40px;"/><br/>
		   	    	<input type="text" id="ledquant6W" name="ledquant6W" style="width : 40px;"/><br/>
		   	    	<input type="text" id="ledquant9W" name="ledquant9W" style="width : 40px;"/><br/>
		   	    	<input type="text" id="ledquant12W" name="ledquant12W" style="width : 40px;"/><br/>
		   	    	<input type="text" id="ledquant15W" name="ledquant15W" style="width : 40px;"/><br/>
		   	    	<input type="text" id="ledquant18W" name="ledquant18W" style="width : 40px;"/><br/>
		   	    	<input type="text" id="ledquant21W" name="ledquant21W" style="width : 40px;"/><br/>
		   	    	<input type="text" id="ledquant24W" name="ledquant24W" style="width : 40px;"/><br/>
		   	    	<input type="text" id="ledquant27W" name="ledquant27W" style="width : 40px;"/><br/>
		   	    	<input type="text" id="ledquant30W" name="ledquant30W" style="width : 40px;"/><br/>
		   	    	<input type="text" id="ledquant36W" name="ledquant36W" style="width : 40px;"/><br/>
		   	    	<input type="text" id="ledquant45W" name="ledquant45W" style="width : 40px;"/><br/>
		   	    		
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
		  			
					/*$('#capitalled').change(
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
					);*/
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
	   <tr class="banner"><td colspan="6" align="center">Estimated Bill</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance(click inside the box below to update advance payments)</td></tr>
	   <tr><td><input type="text" name="capitalledestunitrate" id="capitalledestunitrate"/></td><td><input type="text" name="capitalledestquantity" id="capitalledestquantity"/></td><td><input type="text" name="capitalledestvat" id="capitalledestvat"/></td><td><input type="text" name="capitalledestdiscount" id="capitalledestdiscount" onblur="calculateTotalBalance('capitalledestunitrate','capitalledestquantity','capitalledestvat','capitalledestdiscount','capitalledesttotal','capitalledestbalance')"/></td><td><input type="text" name="capitalledesttotal" id="capitalledesttotal"/></td><td><input type="text" name="capitalledestbalance" id="capitalledestbalance"/></td></tr>
	   <tr class="banner"><td colspan="6" align="center">Final Bill</td></tr>
	   <tr><td>Unit Rate</td><td>Quantity</td><td>VAT%</td><td>Discount</td><td>Total</td><td>Balance</td></tr>
	   <tr><td><input type="text" name="capitalledfinalunitrate" id="capitalledfinalunitrate"/></td><td><input type="text" name="capitalledfinalquantity" id="capitalledfinalquantity"/></td><td><input type="text" name="capitalledfinalvat" id="capitalledfinalvat"/></td><td><input type="text" name="capitalledfinaldiscount" id="capitalledfinaldiscount" onblur="calculateTotalBalance('capitalledfinalunitrate','capitalledfinalquantity','capitalledfinalvat','capitalledfinaldiscount','capitalledfinaltotal','capitalledfinalbalance')"/></td><td><input type="text" name="capitalledfinaltotal" id="capitalledfinaltotal"/></td><td><input type="text" name="capitalledfinalbalance" id="capitalledfinalbalance"/></td>
	   <div name="advancepaymentled" id="advancepaymentled" style="display:none ; width: 700px ; border : 2px solid;overflow : auto">
			
				  <h4>Update advance payments</h4>
				  <div style="width: 190px ;float : left">Date of payment</div><div style="width: 200px;float : left">Amount(INR)</div><div style="width: 200px;float : left">Cash or Checque</div></br>
				  <input type="text" name="leddateofpayment" id="leddateofpayment"/>
				  <input type="text" name="ledamount" id="ledamount"/>
				  <input type="text" name="ledcashorchek" id="ledcashorchek"/>
				  <div class="button advpmtsave">Save</div> <div class="button advpmtclose">Close</div>
		</div>
	   </tr>
	   </table>
</body>
</html>