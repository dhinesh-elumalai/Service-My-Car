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
	        	window.location = "wrapperConfiguration?page="+(num-1);
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
            url: 'search_wrapper',
            data: {searchOn: matchvalue},
            type: 'get'
        }).done(function(responseData) {
        	 $("#preloader").hide();
        	$('#jsp_datacard_id').css("display","none");
        	$('#restDataDisplay').css("display","");
        	var empty=responseData.length;
    
        	if(empty==0) {
        		$("#emptyDataajax").show();
        		$('#pagination_div').hide();
        		$('#restDataDisplay').children('div').remove();
           		 $('#Search').removeClass('loadinggif');
            }
        	else
        		{
        		$("#emptyDataajax").hide();
        		$('#pagination_div').hide();
        		$('#restDataDisplay').children('div').remove();
        	$.each(responseData, function(i, priv) {
        		 $("<div class='block block-bordered'  id='card"+i+"'><div class='block-header block-header-default'><h5 class='block-title font-w600'>"+priv.mapName+" <small style='font-size: 12px;font-style: italic;'>(Mapping)</small>"+(priv.enabled?" <span class='badge badge-success'>Active</span>":" <span class='badge badge-danger'>Inactive</span>")+"</h5><div class='block-option'>"
        		 +(priv.enabled?"<a href='editWrapper?mapping="+priv.mapName+"' class='btn btn-sm btn-primary'><i class='fa fa-pencil'></i> Edit</a>":"")
        				 +"</div></div><div class='' id='disp"+i+"'><h6 class='list-head' style='font-weight:normal;color:#646464'>Database <small style='font-size: 14px; color:#336eb9'>(Wrapper file)</small></h6> <ul class='mapping-list' id='list"+i+"'>").appendTo($('#restDataDisplay'));        	
 		 $.each(priv.dbAndFile, function(key,val)
    			{ 	    		
    			 $("<li>"+val.dbName+" (<span class='color-primary'> "+val.fileName+" </span>) "+(val.dbEnabled?"<span class='badge badge-success'>Active</span>":"<span class='badge badge-danger'>Inactive</span>")+"</li>").appendTo($('#list'+i));
    		    }); 
    			$('#card'+i).after($("</div> </div></div> "));
        		});
        	 $('#Search').removeClass('loadinggif');
        		} }).fail(function() {
        			 $("#preloader").hide();
        });
    }
        else
        	{
        	$("#emptyDataajax").hide();
        	$('#restDataDisplay').children('div').remove();
        	$('#pagination_div').css("display","");
        	$('#jsp_datacard_id').css("display","");
        	$('#restDataDisplay').css("display","none");
        	}
        });
}); 
</script>



