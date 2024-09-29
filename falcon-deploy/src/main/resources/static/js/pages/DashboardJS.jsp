	<script src="static/js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<c:choose>
	<c:when
		test="${!FilesResoterdList.isEmpty()||!FolderRestoredList.isEmpty()}">
		<script>
 $(window).on('load',function(){
    $('#memberModal').modal('show');
});

</script>
	</c:when>
</c:choose>
<c:if test="${selected}">	
	<script>
	$(document).ready(function(){
		var edate = new Date(${currentDate});
		var sdate = new Date(${startdate});
		
		sdate.setDate(sdate.getDate() - ${purgeDeleteDays}); 
		initialize(sdate,edate);
	});
	</script>
</c:if>
<c:if test="${!selected}">	
	<script>
	$(document).ready(function(){
		var edate = new Date(${currentDate});
		var sdate = new Date(${startdate});

		initialize(sdate,edate);	
	});
	</script>
</c:if>
<script>		
		function initialize(sdate,edate)
		{
			console.log(sdate);
			console.log(edate);
			console.log(${purgeDeleteDays});
		$('#date').datepicker({ 
			startDate: sdate,
			endDate: edate,
		    todayHighlight: true,
		    autoclose: true,
		    format: 'mm-dd-yyyy',
		    orientation: "bottom" , 
		});
		$('#date1').datepicker({ 
			startDate:sdate,
			endDate: edate,
		    todayHighlight: true,
		    autoclose: true,
		    format: 'mm-dd-yyyy',
		    orientation: "bottom" ,
		});

		}
		
		
		$("#history").change(function() {
			var edate = new Date(${currentDate});
			var sdate = new Date(${startdate});
			
			sdate.setDate(sdate.getDate() - ${purgeDeleteDays}); 
			var stdate = new Date(${startdate});

		    if(this.checked) {
		    	$('#date').datepicker('destroy');
				$('#date1').datepicker('destroy');
		    	initialize(sdate,edate);
		    	
		    }
		    else
		    	{
		    	$('#date').datepicker('destroy');
				$('#date1').datepicker('destroy');
		    	initialize(stdate,edate);
		    	}
		});
	</script>

<script>

var BePagesDashboard = function() {
    // Chart.js Charts, for more examples you can check out http://www.chartjs.org/docs
    var initDashboardChartJS = function () {
        // Set Global Chart.js configuration
        Chart.defaults.global.defaultFontColor              = '#555555';
        Chart.defaults.scale.gridLines.color                = "rgba(0,0,0,.04)";
        Chart.defaults.scale.gridLines.zeroLineColor        = "rgba(0,0,0,.1)";
        Chart.defaults.scale.ticks.beginAtZero              = true;
        Chart.defaults.global.elements.line.borderWidth     = 2;
        Chart.defaults.global.elements.point.radius         = 5;
        Chart.defaults.global.elements.point.hoverRadius    = 7;
        Chart.defaults.global.tooltips.cornerRadius         = 3;
        Chart.defaults.global.legend.labels.boxWidth        = 12;
        Chart.defaults.global.legend.display                = false;


        // Chart Containers
        var chartDashboardLinesCon  = jQuery('.js-chartjs-dashboard-lines');
        var chartDashboardLinesCon2 = jQuery('.js-chartjs-dashboard-lines2');

        // Chart Variables
        var chartDashboardLines, chartDashboardLines2;

        // Lines Charts Data
        var chartDashboardLinesData = {
            labels: [],
            datasets: [
                {
                    label: 'Script Count',
                    fill: true,
                    backgroundColor: 'rgba(66,165,245,.25)',
                    borderColor: 'rgba(66,165,245,1)',
                    pointBackgroundColor: 'rgba(66,165,245,1)',
                    pointBorderColor: '#fff',
                    pointHoverBackgroundColor: '#fff',
                    pointHoverBorderColor: 'rgba(66,165,245,1)',
                    data: []
                }
            ]
        };


 <c:forEach var="user" items="${dashboardData.top10Requestor}">
   chartDashboardLinesData.labels.push('${user.userName}');  
   chartDashboardLinesData.datasets[0].data.push('${user.scriptCount}');
 </c:forEach>
  


        var chartDashboardLinesOptions = {
        		layout: {
        	        padding: {
        	            left: 10,
        	            right: 10,
        	            top: 10,
        	            bottom: 10
        	        }
        	    },      		
            scales: {
                yAxes: [{
                    ticks: {
                        suggestedMax: 10
                    }
                }], 
                xAxes: [{
                    display: false
                }]
            },
            tooltips: {
                callbacks: {
                    label: function(tooltipItems, data) {
                        return ' ' + tooltipItems.yLabel + ' Script';
                    }
                }
            }
        };

        var chartDashboardLinesData2 = {
            labels: [],
            datasets: [
                {
                    label: 'Script Count',
                    fill: true,
                    backgroundColor: 'rgba(156,204,101,.25)',
                    borderColor: 'rgba(156,204,101,1)',
                    pointBackgroundColor: 'rgba(156,204,101,1)',
                    pointBorderColor: '#fff',
                    pointHoverBackgroundColor: '#fff',
                    pointHoverBorderColor: 'rgba(156,204,101,1)',
                    data: []
                }
            ]
        };
 <c:forEach var="app" items="${dashboardData.top10Application}">
        chartDashboardLinesData2.labels.push('${app.repoName}');  
        chartDashboardLinesData2.datasets[0].data.push('${app.scriptCount}');
   </c:forEach>
        
        var chartDashboardLinesOptions2 = {
        	layout: {
        	        padding: {
        	            left: 10,
        	            right: 10,
        	            top: 10,
        	            bottom: 10
        	        }
        	    }, 
            scales: {
                yAxes: [{
                    ticks: {
                        suggestedMax: 10
                    }
                }],
                xAxes: [{
                    display: false
                }]
            },
            tooltips: {
                callbacks: {
                    label: function(tooltipItems, data) {
                    	 return ' ' + tooltipItems.yLabel + ' Script';
                    }
                }
            }
        };

        // Init Charts
        if ( chartDashboardLinesCon.length ) {
            chartDashboardLines  = new Chart(chartDashboardLinesCon, { type: 'line', data: chartDashboardLinesData, options: chartDashboardLinesOptions });
        }

        if ( chartDashboardLinesCon2.length ) {
            chartDashboardLines2 = new Chart(chartDashboardLinesCon2, { type: 'line', data: chartDashboardLinesData2, options: chartDashboardLinesOptions2 });
        }
    };

    return {
        init: function () {
            // Init Chart.js Charts
            initDashboardChartJS();
        }
    };
}();

// Initialize when page loads
jQuery(function(){ BePagesDashboard.init();
});
$(document).ready(function(){
	checkandUpdatePreference();
});
function checkandUpdatePreference()
{
		 $.ajax({ 
	          url: '${pageContext.request.contextPath}/userPreferences',
	          data: {},
	          type: 'get'
	      }).done(function(responseData)
	    	{
	    	  console.log(responseData)
	    	 	$.each(responseData, function(i, data) {
	    	 		localStorage.setItem(data.prop, data.propValue);
	    	 		});
	    	}).fail(function() {
	    	    console.log('Failed');
	    	});		 
}

</script>