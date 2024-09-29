<script src="static/js/plugins/jquery.twbsPagination.min.js"></script>
<script>
$(document).ready(function(){
	 $('#pagination').twbsPagination({
	        totalPages: ${page.totalPages},
	        initiateStartPageClick:false,
	        visiblePages: 10,
	        startPage: ${page.number + 1},
	        onPageClick: function (event, page) {
	        	var num=0;num=page;
	        	window.location = "deployPrivilegeManagement?page="+(num-1);
	        }
	    });
	
	
	
    $("#Search").on('keyup', function postinput(){	
        var matchvalue = $("#Search").val(); 
        if( !matchvalue == ""&&matchvalue.length>1)
        	{
        	 $("#preloader").show();
        	$('#Search').addClass('loadinggif');
        	$('#paginationDiv').css("display","none");
        $.ajax({ 
            url: 'search_deploy_privilege',
            data: {searchOn: matchvalue},
            type: 'get'
        }).done(function(responseData) {
        	 $("#preloader").hide();
        	$('#jsp_datacard_id').css("display","none");
        	$('#restDataDisplay').css("display","");
        	var empty=responseData.dto.length;
    
        	if(empty==0) {
        		$("#emptyDataajax").show();
        		$("#pagination_div").hide();
        		$('#restDataDisplay').children('div').remove();
           		 $('#Search').removeClass('loadinggif');
            }
        	else
        		{
        		$("#pagination_div").show();
        		$("#emptyDataajax").hide();
        		$('#restDataDisplay').children('div').remove();

        	$.each(responseData.dto, function(i, priv) {
        		 $("<div class='block block-bordered' id='card"+i+"' ><div class='block-header block-header-default'><h5 class='block-title font-w600'><span>"
        		 +priv.map+" <small style='font-size: 12px;font-style: italic;'> (Mapping)</small>"+(priv.enabled?" <span class='badge badge-success'>Active</span>":" <span class='badge badge-danger'>Inactive</span>")+" -&gt;"
        		 +(priv.enabled?" <a href='update-databases-tns?tns_id="
        				 +priv.dbid+"'>":"")+priv.db+" <small style='font-size: 12px;font-style: italic;'> (Database)</small></a></span>"+(priv.dbEnabled?" <span class='badge badge-success'>Active</span>":" <span class='badge badge-danger'>Inactive</span>")
        				 +(priv.enabled?"<a href='editDeployPrivilege?mapping="+priv.map+"&dbid="+priv.dbid+"' class='btn btn-sm btn-primary' style='float: right'><i class='fa fa-pencil'></i> Edit</a>":"")
        						+"</h5></div><div class='card-text card-block' id='disp"+i+"'> <h6 class='list-head'>Privilages List</h6><ul class='mapping-list'><div class='custom-control-description' id='list"+i+"'>").appendTo($('#restDataDisplay'));
        		 
 		 $.each(priv.bu, function(key,val)
    			{ 	    		
    			 $("<li class='mb-10'><span class='text-capitalize'>"+val.firstName+' '+val.lastName+'</span>-'+' '+ val.email+"</li> ").appendTo($('#list'+i));
    		    }); 
 		
    			$('#card'+i).after($("</div></div>"));
        		});
        	 $('#Search').removeClass('loadinggif');
        		} }).fail(function() {
        			 $("#preloader").hide();
                     
        });
    }
        else
        	{
        	$("#pagination_div").show();
        	$("#emptyDataajax").hide();
        	$('#restDataDisplay').children('div').remove();
        	$('#paginationDiv').css("display","");
        	$('#jsp_datacard_id').css("display","");
        	$('#restDataDisplay').css("display","none");
        	}
        });
}); 
</script>



