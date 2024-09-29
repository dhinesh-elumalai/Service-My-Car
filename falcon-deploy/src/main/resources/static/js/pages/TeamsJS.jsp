<script src="${pageContext.request.contextPath}/static/js/plugins/jquery.twbsPagination.min.js"></script>
<c:if test="${page.totalPages>1}">
<script>
$(document).ready(function(){
	console.log(${page.totalPages})
	 $('#pagination').twbsPagination({
	        totalPages: ${page.totalPages},
	        initiateStartPageClick:false,
	        visiblePages: 10,
	        startPage: ${page.number + 1},
	        onPageClick: function (event, page) {
	        	var num=0;num=page;
	        	window.location = "teams?page="+(num-1);
	        }
	    });
});
</script>
</c:if>
<script>
    $("#teamNameForSearch").on('keyup', function postinput(){	
        var matchvalue = $("#teamNameForSearch").val(); 
        if( !matchvalue == ""&&matchvalue.length>1)
        	{
        	$("#preloader").show();
        	$('#teamNameForSearch').addClass('loadinggif');
        	$('#pagination_div').css("display","none");
        $.ajax({ 
            url: 'teamSearchOntype',
            data: {name: matchvalue},
            type: 'get'
        }).done(function(responseData)
        		 {
        	$("#preloader").hide();
        	$('#jsp_loaded_data').css("display","none");
        	$('#Ajax_loaded_data').children('tr').remove();
        	var empty=responseData.length;
        	if(empty==0) {
        		 $('#teamNameForSearch').removeClass('loadinggif');
        		 $("#emptyDataajax").show();
        		 $("#thead").hide();
            }
        	else
        		{
        		$("#emptyDataajax").hide();
        		 $("#thead").show();
        	$.each(responseData, function(i, team) {        	
        		$("<tr><th style='font-weight:normal'><a href='edit-team?teamName="+$.trim(team.teamName)+"'> <span>"+$.trim(team.teamName)+"</span> </a></th><td class='text-capitalize'>"+$.trim(team.createdBy)+"</td><td class='text-capitalize'>"+$.trim(team.createdTimestamp)+"</td><td class='text-capitalize'>"+$.trim(team.updatedBy)+"</td><td class='text-capitalize'>"+$.trim(team.updatedTimestamp)+"</td></tr>").appendTo($('#Ajax_loaded_data'));
        		});
        	 $('#teamNameForSearch').removeClass('loadinggif');
        		} }).fail(function() {
        			$("#preloader").hide();
            console.log('Failed');
        });
    }
        else
        	{
        	$("#emptyDataajax").hide();
   		 $("#thead").show();
           	$('#Ajax_loaded_data').children('tr').remove();
          	$('#jsp_loaded_data').css("display","");    
        	$('#pagination_div').css("display","");
        	}
        });		
</script>  			
   	