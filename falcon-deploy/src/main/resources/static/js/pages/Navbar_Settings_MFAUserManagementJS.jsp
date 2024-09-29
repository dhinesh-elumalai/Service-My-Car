<script src="${pageContext.request.contextPath}/static/js/plugins/jquery.twbsPagination.min.js"></script>
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
        	window.location = "MFA_User_management?page="+(num-1);
        }
    });
});
</script>
</c:if>
<script>
    $("#SearchUserName").on('keyup', function SearchUser(){	
        var matchvalue = $("#SearchUserName").val(); 
        if( !matchvalue == ""&&matchvalue.length>1)
        	{
      	   displaySpinner();
    	   $("#data-loader").show();
        	$('#SearchUserName').addClass('loadinggif');
        	$('#pagination_div').css("display","none");
        $.ajax({ 
            url: 'MFA_user_Search',
            data: {key: matchvalue},
            type: 'get'
        }).done(function(responseData) {
        	 $("#preloader").hide();
        	$('#jsp_loaded_data').css("display","none");
        	$('#Ajax_loaded_data').children('tr').remove();
        	var empty=responseData.length;	
        	if(empty==0) {	
        			$('#SearchUserName').removeClass('loadinggif');
        			$('#thead').hide();
        			$('#emptyDataajax').show();
              	  $("#data-loader").hide();
            }
        	else
        		{
        		$('#thead').show();
    			$('#emptyDataajax').hide();
        	$.each(responseData, function(i, u) {		
        	$("<tr><td>"+u.firstName+"</td><td>"+u.lastName+"</td><td>"+u.email+"</td><td class='text-center'>"+u.role1+"</td><td>"+u.role+"</td><td class='text-center'><a href='/edit-mfa-user?id="+u.id+"'><span class='fa fa-pencil-square-o' style='font-size:18px;'></span></a></td></tr>").appendTo($('#Ajax_loaded_data'));
        	displaySpinner();
        		});
        	  $("#data-loader").hide();
        	$('#SearchUserName').removeClass('loadinggif');
        		} }).fail(function() {
        			 $("#preloader").hide();
        });
    }
        else
        	{
        	$('#thead').show();
			$('#emptyDataajax').hide();
        	$('#Ajax_loaded_data').children('tr').remove();
          	$('#jsp_loaded_data').css("display","");    
        	$('#pagination_div').css("display","");
        	}
        });


</script>

<script>
function deleteFunction(ele)
{
    var link = ele;
    $('#textForDialog').text('Are you sure you want to delete this user?'); 
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

    }); return false;
    
	}
	
$('a.DeleteUserDialog').on("click", function (e) {

    var link = this;
    $('#textForDialog').text('Are you sure you want to delete this user?'); 

    e.preventDefault();
   
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

$(window).resize(function () {
    fluidDialog();
});
$(document).on("dialogopen", ".ui-dialog", function (event, ui) {
    fluidDialog();
});

function fluidDialog() {
    var $visible = $(".ui-dialog:visible");
    // each open dialog
    $visible.each(function () {
        var $this = $(this);
        var dialog = $this.find(".ui-dialog-content").data("ui-dialog");
        // if fluid option == true
        if (dialog.options.fluid) {
            var wWidth = $(window).width();
            // check window width against dialog width
            if (wWidth < (parseInt(dialog.options.maxWidth) + 50))  {
                // keep dialog from filling entire screen
                $this.css("max-width", "90%");
            } else {
                // fix maxWidth bug
                $this.css("max-width", dialog.options.maxWidth + "px");
            }
            //reposition dialog
            dialog.option("position", dialog.options.position);
        }
    });

}
</script>

 <c:choose>
 <c:when test="${not empty updateStatus||not empty deleteStatus||not empty signup_status||not empty MFAlockReleaseStatus}">
 <script>
 $(window).on('load',function(){
    $('#memberModal').modal('show');
});

</script>

</c:when>
</c:choose>
