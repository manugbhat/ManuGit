
 <%@include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<script type="text/javascript">
	$(function(){
		GLOBAL = { "advancepaymentsolar" : { nameCount : 0 },
				   "advancepaymentwater" : { nameCount : 0 },
				   "advancepaymentled" : { nameCount : 0 },
				   "advancepaymentups" : { nameCount : 0 },
				   "advancepaymentgeyser" : { nameCount : 0 },
				   "advancepaymentlight" : { nameCount : 0 },
				   };
		$('#dateoforder').datepicker({dateFormat : "dd/mm/yy",changeMonth : true,changeYear : true});
		$('#dateofsupply').datepicker({dateFormat : "dd/mm/yy",changeMonth : true,changeYear : true});
		$('#dateofinstallation').datepicker({dateFormat : "dd/mm/yy",changeMonth : true,changeYear : true});
		$('[id$=dateofpayment]').datepicker({dateFormat : "dd/mm/yy",changeMonth : true,changeYear : true});
		/* $("[id$=finalbalance]").click(function(){
			window.open('updatepayment','Payment update','height=200,width=400');
		}); */
		$("[id$=estbalance]").on({
			click : function(e){
							//$(this).parent().parent().parent().parent().prev().show();
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
				  		 '<input type="hidden" name="'+cashorchekName+'" value="'+cc+'"/></br>';
			  html = '<div style="width: 150px ;float : left" >'+dop+'</div>'+
			  		 '<div style="width: 150px ;float : left" >'+amt+'</div>'+
			  		 '<div style="width: 150px ;float : left" >'+cc+'</div>'+
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
			  $(this).prev().prev().prev().val("");
			  $(this).prev().prev().val("");
			  $(this).prev().val("");
			 
		});
		
		$(document).on('click','.deletepayment' , function(e){
											$(this).prev().prev().prev().remove();
											$(this).prev().prev().remove();
											$(this).prev().remove();
											$(this).next().next().next().remove();
											$(this).next().next().remove();
											$(this).next().remove();
											$(this).remove();
										} 
						);
		
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
	<form:form action="createcustomerpurchase" method="post" onsubmit="return checkProdSelection()" enctype="multipart/form-data" modelAttribute="uploadedFile">
	<h2 align="center" style="width : 500px ; background : none repeat scroll 0 0 #EE0000; border:2px solid #000000;color : #FFFFFF">Customer</h2>
	</br>
	   <table class="customerinfo">
	   <tr><td>Dealer Name</td></tr>
	   <tr><td><input type="text" name="dealer" id="dealer"/></td></tr>
	   <tr><td><font color="red" >Customer Name*</font></td></tr>
	   <tr><td><input type="text" name="custname" id="custname"/></td></tr>
	   <tr><td>Upload Photo</td><td><input type="file" name="customerphoto"/></td></tr>
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
	  <h2 align="center" style="width : 950px ; background : none repeat scroll 0 0 #EE0000; border:2px solid #000000;color : #FFFFFF">Products</h2>
	   </br>
	   <jsp:include page="solarcapacity.jsp" flush="true"/>
	  
	   </br>
	   <jsp:include page="capitalwater.jsp" flush="true"/>
	   
		</br>
		<jsp:include page="capitalled.jsp" flush="true"/>
		
	   </br>
	   <jsp:include page="capitalups.jsp" flush="true"/>
	  
	   </br>
	   <jsp:include page="gasgeyser.jsp" flush="true"/>

	   </br>
	    <jsp:include page="solarlight.jsp" flush="true"/>
	   
	   <br><br>
	   <table>
	   <tr><td><button type="submit">Submit</button></td><td><button type="reset">Reset</button></td><td><button type="button" onclick="javascript:document.location.href = 'home';">Back</button></td></tr>
	   </table>
	   
	   </form:form>
	</div>
	
	
</body>
</html>