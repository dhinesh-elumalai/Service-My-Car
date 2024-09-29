<script src="${pageContext.request.contextPath}/static/js/plugins/jquery.twbsPagination.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
    	displaySpinner();
    });
    function displaySpinner()
    {
        var divHeight = $('.table-responsive').height(); 
        $('.loader-height').css('height', divHeight+'px');
        
        var divWidth = $('.table-responsive').width(); 
        $('.loader-height').css('width', divWidth+'px');
    }

function changeEventHandle(ele,reponame) {
    if($(ele).is(":checked")) {
        changeEvent($(ele),reponame);
    }
    else
    	{
    	changeEvent($(ele),reponame);
    	}
}
function changeEvent(ele,reponame)
{
    
    	                    if(ele.is(":checked")) 
    	                    	 changeStatus(false,reponame,ele);
      	                    else
      	                    	 changeStatus(true,reponame,ele); 
    	             
	}
function changeStatus(ischecked,reponame,ele)
{
	$.ajax({ 
        url: 'saveEmailPrecedence',
        data: {reponame:reponame,enabled:ischecked,'${_csrf.parameterName}':'${_csrf.token}'},
        type: 'post'
    }).done(function(responseData1)
 		   {
    	if(responseData1=='success')
    	location.reload();
    	else
    		{
    		$('#textForDialog').text(responseData1);
    		errorStatus();
    		}
 		   }).fail(function() {
 			  $('#textForDialog').text("Something went wrong!");
 			 errorStatus(ele);
 			 });
}

function errorStatus(ele)
{
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
	    	               text: "Cancel",
	    	               "class": ' btn btn-sm btn-alt-danger',
	    	               click: function() {
	    	        			if(ele.is(":checked")) 
	    	                      	ele.prop('checked', false);
	    	                      else
	    	                      	ele.prop('checked', true);
	    	            	   $(this).dialog("close");
	    	               }
	    	           }
	    	 ]	

	    });
	}

$('#SearchRepoName').on('input',function(e){
	var isAdmin="${isAdmin}";
	if(isAdmin=='false')
		tableFilter();
	else
		adminTableFilter();
});
	
function tableFilter() {
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("SearchRepoName");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("tableData");
	  tr = table.getElementsByTagName("tr");


	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[0];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }
	  }
	}
	
function adminTableFilter() {
	 var matchvalue = $("#SearchRepoName").val(); 
     if( !matchvalue == ""&&matchvalue.length>1)
     	{
   	   displaySpinner();
 	   $("#data-loader").show();
     	$('#SearchRepoName').addClass('loadinggif');
     	$('#pagination_div').css("display","none");
     $.ajax({ 
         url: 'EmailManagementSearch',
         data: {searchValue: matchvalue},
         type: 'get'
     }).done(function(responseData) {
    	 console.log(responseData)
     	 $("#preloader").hide();
     	$('#jsp_loaded_data').css("display","none");
     	$('#Ajax_loaded_data').children('tr').remove();
     	var empty=responseData.length;	
     	if(empty==0) {	
     			$('#SearchRepoName').removeClass('loadinggif');
     			$('#thead').hide();
     			$('#emptyDataajax').show();
           	  $("#data-loader").hide();
         }
     	else
     		{
     		$('#thead').show();
 			$('#emptyDataajax').hide();
     	var myRole=responseData.myRole;
     	$.each(responseData, function(i, data) {
     		var checked="";
     		if(!data.selected)
     			checked="checked";
     		$("<tr><td class='text-center'>"+data.repoName+"</td><td class='text-right'>"+data.updatedTime+"</td><td class='text-center'><label class='css-control css-control-sm  css-control-primary css-switch'><input type='checkbox' class='css-control-input changeForm' "+checked+" onchange=\"changeEventHandle(this,\'"+data.repoName+"\');\"><span class='css-control-indicator'></span><span id='toggleForm'></span></label></td></tr>").appendTo($('#Ajax_loaded_data'));
   	 		 displaySpinner();
     		});
     	  $("#data-loader").hide();
     	$('#SearchRepoName').removeClass('loadinggif');
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
}
	
</script>
<c:if test="${isAdmin}">
<c:if test="${list.totalPages>1}">
<script>
$(document).ready(function(){
    $('#pagination').twbsPagination({
        totalPages: ${list.totalPages},
        initiateStartPageClick:false,
        visiblePages: 10,
        startPage: ${list.number + 1},
        onPageClick: function (event, page) {
        	var num=0;num=page;
        	window.location = "EmailManagement?page="+(num-1);
        }
    });
});
</script>
</c:if>
</c:if>

