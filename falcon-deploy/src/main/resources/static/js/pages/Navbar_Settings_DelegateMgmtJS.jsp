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
        	window.location = "delegateList?page="+(num-1);
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
            url: 'search_delegate',
            data: {searchOn: matchvalue},
            type: 'get'
        }).done(function(responseData) {
        	  $("#preloader").hide();
        	$('#jsp_datacard_id').css("display","none");
        	$('#restDataDisplay').css("display","");
        	var empty=responseData.delegatedList.length;
        	if(empty==0) {
        		$('#restDataDisplay').children('div').remove();
           		 $('#Search').removeClass('loadinggif');
           		 $("#emptyDataajax").show();
           		$("#pagination_div").hide();
            }
        	else
        		{
        		$("#pagination_div").show();
        		$("#emptyDataajax").hide();
        		$('#restDataDisplay').children('div').remove();
        	$.each(responseData.delegatedList, function(i, priv) {

        		 $("<div class='block block-bordered'  id='card"+i+"'><div class='block-header block-header-default'><h5 class='block-title color-primary font-w600' >"+priv.username+" <small style='font-size: 12px;font-style: italic;'> (Mapping)</small>"+(priv.enabled?" <span class='badge badge-success'>Active</span>":" <span class='badge badge-danger'>Inactive</span>")+"</h5></div><div class='card-text card-block' id='disp"+i+"'><div class='block-content'><div class='col-md-12 mt-10' ><div class='row'><div class='table-responsive'><table class='table table-bordered table-striped'><thead><tr><th>DATABASE</th><th>USERNAME</th><th>STATUS</th>"+(priv.enabled?"<th class='text-center'>ACTION</th>":"")+"</tr></thead><tbody id='tbody'> </tbody></table></div></div>").appendTo($('#restDataDisplay'));        	
 		 $.each(priv.dbandunForUser, function(key,val)
    			{ 	    		
    			 $("<tr><th class='font-w400'>"+val.link+"</th><td>"+val.dbUN+"</td>"+(val.dbEnabled?"<td><span class='badge badge-success'>Active</span></td>":"<td><span class='badge badge-danger'>Inactive</span></td>")+
    					 (priv.enabled?"<td class='text-center'><div class='btn-group'><a href='editDelegateMgmt?target="+priv.username+"&dbUN="+val.dbUN+"&dbid="+val.id+"' class=' fa fa-pencil btn btn-sm btn-alt-primary' style='font-size='16px''> </a> <a href='deleteDatabasePasword?delDb="+val.dbId+"' class='fa fa-trash btn btn-sm btn-alt-danger DeleteDialog' style='font-size:18px'> </a></div></td>":"")+"</tr>").appendTo($('#tbody'));
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
        	$("#pagination_div").show();
        	$("#emptyDataajax").hide();
        	$('#restDataDisplay').children('div').remove();
        	$('#paginationDiv').css("display","");
        	$('#jsp_datacard_id').css("display","");
        	$('#restDataDisplay').css("display","none");
        	}
        });
}); 
$(document).on('click', 'a.DeleteDialog', function(e) {
    var link = this;
    e.preventDefault(); 
    $('#textForDialog').text('Are you sure you want to delete this database credential?'); 
    $('#deleteRepo').modal('hide');

    $('#dialog-confirm').dialog({
    	resizable: false,
        height: 200,
        width: 400,
        fluid: true,
        modal: true,
        open: function() {
            $('.ui-widget-overlay').addClass('custom-overlay');
        	                $('.ui-widget-header').css({ 'background-color': 'rgb(245, 245, 245)' });
              	            $('.ui-dialog-titlebar').css({ 'background-color': 'rgb(245, 245, 245)' });
        },
        close: function() {
            $('.ui-widget-overlay').removeClass('custom-overlay');
        },     
    	 buttons: [
    	           {
    	               text: "Ok",
    	               "class": ' btn btn-sm btn-alt-success',
    	               click: function() {
    	            	   window.location = link.href;
    	                    $(this).dialog("close");
    	               }
    	           },
    	           {
    	               text: "Cancel",
    	               "class": ' btn btn-sm btn-alt-danger',
    	               click: function() {
    	            	   $(this).dialog("close");
    	               }
    	           }
    	 ]	
    }); 
});
</script>



