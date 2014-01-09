 <%@include file="common.jsp" %>


<html>
    <head>
    	 <script>

							$(function() {
								var pieChart = new Highcharts.Chart({
							        chart: {
							            plotBackgroundColor: null,
							            plotBorderWidth: null,
							            plotShadow: false,
							            renderTo : piecontainer
							        },
							        title: {
							            text: 'Store product types'
							        },
							        tooltip: {
							    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
							        },
							        plotOptions: {
							            pie: {
							                allowPointSelect: true,
							                cursor: 'pointer',
							                dataLabels: {
							                    enabled: true,
							                    color: '#000000',
							                    connectorColor: '#000000',
							                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
							                }
							            }
							        },
							        series: [{
							            type: 'pie',
							            name: 'Store Products',
							            data: []
							        }]
							        }
							    );
								
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
																	if(tab[0].innerText == 'Dashboard') {
																		console.log(data);
																		renderCharts(data);
																	}
																})
																.error(function() {
																	ui.panel
																			.html("Couldn't load this tab. We'll try to fix this as soon as possible. "
																					+ "If this wouldn't be a demo.");
																});
													}
												});
								
								   
								});
							
							function renderCharts(data) {
								var pieChart = $('#piecontainer').highcharts();
								var chartData = new Array();
								$(data).each(function(ind,val){
									console.log(ind);
									console.log(val);
									chartData.push({name : val.producttype, y : val.productbalance});
								});
								pieChart.series[0].setData(chartData,true);
								
							}
						
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
		<div id="tabs-1">
			<p>Dashboard View</p>
			<div id="piecontainer" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
			<div style="background: maroon; width: 1000px; height : 5 px"></div>
			<div id="columncontainer" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		</div>
		
	</div>
</body>
</html>
