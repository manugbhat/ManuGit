 <%@include file="common.jsp" %>


<html>
    <head>
    	 <script>
						$(function(){	
								$("#tabs")
										.tabs(
												{
													/* show: function(event, ui) {
														$('#dateofcheckin').datepicker("refresh");
												        $('#dateofcheckout').datepicker("refresh");
												        $('#skidin').datepicker("refresh");
												        $('#skidout').datepicker("refresh");
												    }, */
													beforeLoad : function(
															event, ui) {
														ui.jqXHR.done(function(data, textStatus, jqXHR){
																	var tab = ui.tab;
																	
																})
																.error(function() {
																	ui.panel
																			.html("Couldn't load this tab. We'll try to fix this as soon as possible. "
																					+ "If this wouldn't be a demo.");
																});
													}
												});
								
								   
								});
							
							
						
						</script>
    </head>
    <body>
	<div id="tabs">
		<ul>
			<li><a href="data/dashboard">Dashboard</a></li>
			<li><a href="data/checkin">Checkin</a></li>
			<li><a href="data/store">Store</a></li>
			<li><a href="data/checkout">Checkout</a></li>
			<li><a href="data/clienthistory">History</a></li>
		</ul>
		
	</div>
</body>
</html>
