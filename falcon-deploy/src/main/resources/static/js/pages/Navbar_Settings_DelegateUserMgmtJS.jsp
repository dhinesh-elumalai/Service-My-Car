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
        	window.location = "delegateUserList?page="+(num-1);
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
            url: 'searchDelegateUser',
            data: {searchOn: matchvalue},
            type: 'get'
        }).done(function(responseData) {
        	  $("#preloader").hide();
        	$('#jsp_datacard_id').css("display","none");
        	$('#restDataDisplay').css("display","");
        	var empty=responseData.length;
        	if(empty==0) {
        		$("#emptyDataajax").show();
        		$('#restDataDisplay').children('div').remove();
           		 $('#Search').removeClass('loadinggif');
           		$("#pagination_div").hide();
            }
        	else
        		{
        		$("#emptyDataajax").hide();
        		$("#pagination_div").show();
        		$('#restDataDisplay').children('div').remove();
        	$.each(responseData, function(i, priv) {
        		 $("<div class='block block-bordered'  id='card"+i+"' ><div class='block-header block-header-default'><h5 class='block-title font-w600'>"+priv.targetName
        		 +" <small style='font-size: 12px;font-style: italic;'>(Mapping)</small> "+(priv.enabled?" <span class='badge badge-success'>Active</span>":" <span class='badge badge-danger'>Inactive</span>")+"-&gt; "+priv.dbName+" <small style='font-size: 12px;font-style: italic;'>(Database)</small>"+(priv.dbEnabled?" <span class='badge badge-success'>Active</span>":" <span class='badge badge-danger'>Inactive</span>")+
        		 "</h5></div><div class='card-text card-block' > <div class='block-content'><div class='col-md-12' ><div class='row'><div class='table-responsive'><table class='table table-bordered table-striped' id='disp"+i+"'><thead><tr><th>USER NAME</th><th>USER (GRANTEE)</th>"

				 +(priv.enabled?"<th class='text-center'>ACTION</th>":"")+"</tr></thead></table></div></div></div></div>").appendTo($('#restDataDisplay'));        	
 		 $.each(priv.delPassDto, function(key,val)
    			{ 	    		
    			 $("<tbody><tr><td class='font-w400 p-10'>"+val.userName+"</td><td><span class='color-primary'><span class='text-capitalize'>"+val.fname+" "+val.lname+"</span> ("+val.email+") </td>"
    					 +(priv.enabled?"<td class='text-center'><div class='btn-group'><a href='deleteDelegate?delDb="+val.db+"' class='fa fa-trash btn btn-sm btn-alt-danger DeleteDialog'> </a></div></td>":"")+"</tr></tbody>").appendTo($('#disp'+i));
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
        	$('#jsp_datacard_id').css("display","");
        	$('#restDataDisplay').css("display","none");
        	}
        });
}); 
$(document).on('click', 'a.DeleteDialog', function(e) {
    var link = this;
    e.preventDefault(); 
    $('#textForDialog').text('Are you sure you want to delete this delegated database credential?'); 
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



