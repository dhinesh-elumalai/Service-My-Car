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
        	window.location = "fileConfiguration?page="+(num-1);
        }
    });
	
    $("#Search").on('keyup', function postinput(){	
        var matchvalue = $("#Search").val(); 
        if( !matchvalue == ""&&matchvalue.length>1)
        	{
        	 $("#preloader").show();
        	$('#Search').addClass('loadinggif');
        	$('#pagination_div').css("display","none");
        $.ajax({ 
            url: 'fileTypeSearch',
            data: {name: matchvalue},
            type: 'get'
        }).done(function(responseData)
        		 {
        	 $("#preloader").hide();
        	$('#jsp_loaded_data').css("display","none");
        	$('#Ajax_loaded_data').children('tr').remove();
        	var empty=responseData.length;
 
        	if(empty=='0') {
        		 $('#Search').removeClass('loadinggif');
            }
        	else
        		{
        	$.each(responseData, function(i, fType) {

        	
        		$("<tr><th class='font-w400'>"+$.trim(fType.fileTypeName)+"</th>"+((fType.defaultFileType)?"<td></td>":"<td class='text-center'><div class='btn-group'><a href='fTypeConfigEdit?fTypeId="+fType.fileTypeId+"'><span class='fa fa-pencil-square-o  btn btn-sm btn-alt-primary'></span></a><a href='deletefType?fTypeId="+fType.fileTypeId+"' class='DeleteFiletypDialog'><span class='fa fa-trash btn btn-sm btn-alt-danger'></span></a></div></td>")+"</tr>").appendTo($('#Ajax_loaded_data'));
        		});
        	 $('#Search').removeClass('loadinggif');
        		} }).fail(function() {
            console.log('Failed');
            $("#preloader").hide();
        });
    }
        else
        	{
           	$('#Ajax_loaded_data').children('tr').remove();
          	$('#jsp_loaded_data').css("display","");    
        	$('#pagination_div').css("display","");
        	}
        });
}); 
$(document).on('click', 'a.DeleteFiletypDialog', function(e) {
    var link = this;
    e.preventDefault(); 
    $('#textForDialog').text('Are you sure you want to delete this file type?'); 
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
   	