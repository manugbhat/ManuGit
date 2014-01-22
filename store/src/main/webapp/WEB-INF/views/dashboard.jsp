 <%@include file="common.jsp" %>
<html>
<head>
<script type="text/javascript" src="resources/highcharts.js"></script>
<script type="text/javascript" src="resources/exporting.js"></script>
<script type="text/javascript">
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
		
		$.ajax({
			url : "data/charts",
		}).done(function(data, textStatus, jqXHR){
			
			renderCharts(data);
		});
				
	
	   function renderCharts(data) {
			var pieChart = $('#piecontainer').highcharts();
			var chartData = new Array();
			$(data).each(function(ind,val){
				/* console.log(ind);
				console.log(val); */
				chartData.push({name : val.producttype, y : val.productbal});
			});
			pieChart.series[0].setData(chartData,true);
			
		} 
});
</script>
</head>
<body>
	<div>
			<p>Dashboard View</p>
			<div id="piecontainer" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
			<div style="background: maroon; width: 1000px; height : 5 px"></div>
			<div id="columncontainer" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
	</div>
		
</body>
</html>