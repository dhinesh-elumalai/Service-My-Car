<script src="static/js/plugins/jquery.twbsPagination.min.js"></script>
 <c:choose>
 <c:when test="${not empty modelStatus}">
 <script>
 $(window).on('load',function(){
    $('#memberModal').modal('show');
});

</script>

</c:when>
</c:choose>
<c:if test="${page.totalPages>1}">
 <script>
$(document).ready(function(){
	 $('#pagination').twbsPagination({
	        totalPages: ${page.totalPages},
	        initiateStartPageClick:false,
	        visiblePages: 10,
	        startPage: ${page.number + 1},
	        onPageClick: function (event, page) {
	        	var num=0;num=page;
	        	window.location = "databases?page="+(num-1);
	        }
	    });
});
</script>
</c:if>
<script>
    $("#TNSsearchkey").on('keyup', function postinput(){	
    	 var searchType= $('#TNSSearchBasedOn').val();
        var matchvalue = $("#TNSsearchkey").val(); 
        if( !matchvalue == ""&&matchvalue.length>1)
        	{
        	  $("#preloader").show();
        	$('#TNSsearchkey').addClass('loadinggif');       	
        	$('#jsp_pagination').css("display","none");
        $.ajax({ 
            url: 'search_Tns_basedon_type',
            data: {name: matchvalue,searchType:searchType},
            type: 'get'
        }).done(function(responseData) {
        	  $("#preloader").hide();
        	$('#table_card_id').css("display","none");
        	$('#table_card_id1').css("display","");
        	$('#table_body').children('tr').remove();
        	var empty=responseData.length;
        	
        	if(empty==0) {         
           		 $('#TNSsearchkey').removeClass('loadinggif');
           		 $("#thead").hide();
           		 $("#emptyData").show();
            }
        	else
        		{
        		 $("#thead").show();
           		 $("#emptyData").hide();
        	$.each(responseData, function(i, logs) {
     
        		$("<tr>"+
        				"<td>"+$.trim(logs.aliasName)+
        				"</td>  <td>"+$.trim(logs.hostName)+
        				"</td><td class='text-center' style='width: 5%;'>"+$.trim(logs.port)+
        				"</td><td>"+$.trim(logs.service)+
        				"</td><td style='width: 10%;'>"+$.trim(logs.sid)+
        				"</td><td style='width: 30%;'><textarea class='col-md-12'  readonly >"+$.trim(logs.descriptor)+"</textarea></td>"+
        				
        				"<td style='width:10%' class='text-center'>"+(logs.dbType=='MYSQL'?"<span class='badge badge-success MYSQLbTN'>MySQL</span>":"<span class='badge badge-danger OracleBTN'>ORACLE</span>")+"</td>"+
        				
        				"<td style='width:10%'>"+(logs.databaseEnvironment!=null?logs.databaseEnvironment.environmentName:"")+"</td>"+
        				"<td style='width:10%' class='text-center'>"+(logs.enableStatus?"<span class='badge badge-success'>Active</span>":"<span class='badge badge-danger'>Inactive</span>")+"</td>"+
        				"<td style='width:10%' class='text-center'>"+(logs.autonomous?"<span class='badge badge-success'>Yes</span>":"<span class='badge badge-danger'>No</span>")+"</td>"+ 
       " <td class='text-center' style='width:5%'><a "+(!logs.autonomous?"href='update-databases-tns?tns_id="+$.trim(logs.id)+"'":"href='update-databases-autonomous?tns_id="+$.trim(logs.id)+"'")+"><span  class='fa fa-pencil-square-o'></span></a></td></tr>").appendTo($('#table_body'));
  
        		});
        	 $('#TNSsearchkey').removeClass('loadinggif');
        		} }).fail(function() {
        			  $("#preloader").hide();
            console.log('Failed');
        });
    }
        else
        	{
   		 $("#thead").show();
   		 $("#emptyData").hide();
        	$('#table_body').children('tr').remove();
          	$('#table_card_id').css("display","");
        	$('#table_card_id1').css("display","none");
        	$('#jsp_pagination').css("display","");
        	}
        }); 
</script>