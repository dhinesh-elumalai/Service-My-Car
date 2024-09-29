<script src="static/js/plugins/jquery.twbsPagination.min.js"></script>
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
	        	window.location = "roles?page="+(num-1);
	        }
	    });
	}); 
</script>
</c:if>
<script>
$(document).ready(function(){
	 if(${roleList.size()}>0)
	 {$("#emptyData").hide();}
});

	    $("#roleSearch").on('keyup', function postinput(){
	        var matchvalue = $("#roleSearch").val(); 
	        $('#emptyDataajax').hide();
	        if( !matchvalue == ""&&matchvalue.length>1)
	        	{
	        	$("#preloader").show();
	        	$('#roleSearch').addClass('loadinggif');
	        	$('#pagination_div').hide();
	        	
	        $.ajax({ 
	            url: 'search_role',
	            data: {name: matchvalue},
	            type: 'get'
	        }).done(function(responseData) { 
	        	$("#preloader").hide();
	        	$('#jsp_datacard_id').css("display","none");
	        	$('#restDataDisplay').css("display","");
	        	var empty=responseData.length;
	 
	        	if(empty==0) {
	        		$('#roleSearch').removeClass('loadinggif');
	        		$('#restDataDisplay').children('div').remove();
	        		$('#emptyDataajax').show();
	            }
	        	else
	        		{
	        		$('#emptyDataajax').hide();
	        		$('#restDataDisplay').children('div').remove();
	        	$.each(responseData, function(i, role) {
	        	 $("<div class='block block-bordered'  id='card"+i+"'><div class='block-header block-header-default'><h5 class='block-title'>"+role.roleName+""+(role.admin==true? "":" ")+"<small style='font-size: 12px;font-style: italic;'> (Role)</small></h5>"+(role.admin==true?"<a href='EditRepoToRole?roleName="+role.roleName+"' class='btn btn-sm btn-primary' role='button'  style='float:right'><i class='fa fa-pencil'></i> Edit</a>":"")+"</div><div class='card-text card-block' ><div class='col-md-12'  id='disp"+i+"'> <div class='card card-block' id='panel_view'><h6 class='list-head pl-0'>Repository List</h6><ul class='mapping-list' id='rol"+i+"'></ul>").appendTo($('#restDataDisplay'));
	        		$.each(role.repoName, function(key,val)
	        			{ 	        		
	        				 $(" <li>"+ val.repoName+" <small>("+val.accessControl+")</small></li>").appendTo($('#rol'+i));
	        		    });
	        			$('#card'+i).after($("</ul></div> </div></div>"));
	        		});
	        	$('#roleSearch').removeClass('loadinggif');
	        		} }).fail(function() {
	            console.log('Failed');
	            $("#preloader").hide();
	        });
	       }
	        else
	        	{
	        	$('#restDataDisplay').children('div').remove();
	        	$('#pagination_div').show();
	        	$('#jsp_datacard_id').show();
	        	$('#restDataDisplay').hide();
	        	}
	        });

	
</script>