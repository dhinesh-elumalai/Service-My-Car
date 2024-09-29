<script src="${pageContext.request.contextPath}/static/js/plugins/jquery.twbsPagination.min.js"></script>
<c:choose>
	<c:when
		test="${!FilesResoterdList.isEmpty()||!FolderRestoredList.isEmpty()}">
		<script>
 $(window).on('load',function(){
    $('#memberModal').modal('show');
     $('#loaderNormal').show();
});

</script>
	</c:when>
</c:choose>
<script>
$('input[type=radio][name=repoCredType]').change(function() {
    if (this.value == '0') {
       $('#displayCredType').show();
       $('#RepoUser').val('');
       $('#RepoPasswd').val('');
    }
    else if (this.value == '1') {
    	 $('#displayCredType').hide();
    	 $('#RepoUser').val('');
         $('#RepoPasswd').val('');
    }
});

function tableFilter() {

  var input, filter, table, tr, td, i;
  input = document.getElementById("searchBox");
  filter = input.value.toUpperCase();
  table = document.getElementById("repoTable");
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
</script>

<script>

$(document).ready(function(){
	 $('#pagination').twbsPagination({
	        totalPages: ${page.totalPages},
	        initiateStartPageClick:false,
	        visiblePages: 10,
	        startPage: ${page.number + 1},
	        onPageClick: function (event, page) {
	        	var num=0;num=page;
	        	window.location = "application?page="+(num-1);
	        }
	    });
		
	
    $("#repoNameSearch").on('keyup', function postinput(){	
    
        var matchvalue = $("#repoNameSearch").val(); 
        if( !matchvalue == ""&&matchvalue.length>1)
        	{
        	$("#preloader").show();
        	$('#repoNameSearch').addClass('loadinggif');
        	$('#pagination_div').css("display","none");
        $.ajax({ 
            url: 'search_repoForOntypeSearch',
            data: {name: matchvalue},
            type: 'get'
        }).done(function(responseData) {
        	var empty=responseData.length;
        	$('#jsp_loaded_data').css("display","none");
        	$('#Ajax_loaded_data').children('tr').remove();
        	$("#preloader").hide();
        	if(empty==0) {
       			 $("#emptyDataajax").show();
        		$("#thead").hide();
        			$('#repoNameSearch').removeClass('loadinggif');
            }
        	else
        		{
        		 $("#emptyDataajax").hide();
         		$("#thead").show();
        	$.each(responseData, function(i, rep) {
                $("<tr><th class='text-left' style='font-weight:normal; width:25%'><a href='folders?directory="+$.trim(rep.repoPath)+$.trim(rep.repoName)+"&accessControl=READ/WRITE&gitStatus="+$.trim(rep.enableGit)+"&IsA=T&access=direct&team=nil&role=nil' >"+$.trim(rep.repoName)+"</a></th><td>"+rep.repoType+"</td><td style='width:18%;' class='text-center'>"+rep.repoStatus+"</td><td class='text-left'>"+$.trim(rep.createdBy)+"</td><td  class='text-right'>"+$.trim(rep.cretedTime)+"</td><td class='text-center '><span class='badge"+(($.trim(rep.enableGit)=='YES')?" badge-success' style='background-color:#ff7f50'>":" badge-danger' style='background-color:#b22222'>")+$.trim(rep.enableGit)+"</span></td></tr>").appendTo($('#Ajax_loaded_data'));       
        		});
        	$('#repoNameSearch').removeClass('loadinggif');
        		} }).fail(function() {

            $("#preloader").hide();
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
}); 

</script>
	<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
<script>
$(document).ready(function(){
    $("#repoNameSearch11").on('keyup', function postinput(){	
    	$('#repoCard11').css("display","block");
        var matchvalue = $("#repoNameSearch11").val(); 
        if( !matchvalue == ""&&matchvalue.length>1)
        	{
        	$('#repoNameSearch11').addClass('loadinggif');
        	$("#preloader").show();
        $.ajax({ 
            url: 'changestatus_repoForSearch',
            data: {name: matchvalue},
            type: 'get'
        }).done(function(responseData) {
        	$("#preloader").hide();
        	var empty=responseData.length;
        	$('#repos11').children('label').remove();
        	$('#repos11').children('input').remove();
        	$('#repos11').children('div').remove();
        	

        	if(empty=='0') {
        		$('#repos11').children('table').remove();
        	$('#repoCard11').css("height","auto");
        		 $('<label />', {  text: 'No Repo is Available with name '+matchvalue}).appendTo($('#repos11'));
        		 $('#repoNameSearch11').removeClass('loadinggif');
            }
        	else
        		{
        		$('#repos11').children('table').remove();
        		$('<table id="myTable3" class="table table-striped table-bordered">'+
        		'<thead>'+
					'<tr>'+
						'<th class="text-center">Repository Name</th>'+
						'<th class="text-center">Git Repository</th>'+
						'<th class="text-center">Repository Status</th>'+
						'<th class="text-center">Action</th>'+
					'</tr>'+
				'</thead>'+
					'<tbody id="ajaxtable"></tbody></table>').appendTo('#repos11');
							$.each(responseData, function(i, obj) {
								$('<tr>'+
										'<td class="text-center">'+obj.repoName+'</td>'+
									    '<td class="text-capitalize text-center">'+(obj.gitProvided=='YES'?'<span class="badge badge-success">'+obj.gitProvided+'</span>':'<span class="badge badge-danger">'+obj.gitProvided+'</span>')+'</td>'+
									    '<td class="text-capitalize text-center">'+(obj.enabled?'<span class="badge badge-success">Active</span>':'<span class="badge badge-danger">Inactive</span>')+'</td>'+
										'<td class="text-capitalize text-center">'+
											(!obj.enabled?'<a  href="change_repo_status?reponame='+obj.repoName+'&status=true" class="checksubmit col-md-2">Enable</a>':'<a  href="change_repo_status?reponame='+obj.repoName+'&status=false" class="checksubmit col-md-2">Disable</a>')	
										+'</td>'+
								 '</tr>').appendTo('#ajaxtable');
							});
        	$('#repoNameSearch11').removeClass('loadinggif');
        		} }).fail(function() {
        			$("#preloader").hide();
            console.log('Failed');
        });
    }
        else
    	{
    	$('#repoCard11').css("display","none");
    	$('#repos11').children('table').remove();
    	}

        });
}); 
</script>
</sec:authorize>
<script>
$(document).on('click', 'a.checksubmit', function(e) {
    var link = this;
    e.preventDefault(); 
	$("#repoNameSearch11").val('');$('#repos11').children('label').remove();$('#repos11').children('div').remove();$('#repoCard11').css("display","none");
    $('#textForDialog').text('Are you sure you want to update this repo?'); 
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

$('#add_repo').on('submit', function(e){
    e.preventDefault();
   var reponameTyped=$("#valueCheck1").val();
   checkRepoName(reponameTyped,this);
   
})
 
$("#valueCheck1").focus(function(){
	$("#repoExistErr").hide();
});
function checkRepoName(reponameTyped,e)
{
	   $.ajax({ 
	       url: 'validate_repo_exist',
	       data: {repoName: reponameTyped},
	       type: 'get'
	   }).done(function(responseData) {

		   if(responseData=='true')
			   {
			   $("#repoExistErr").show();
			   }
		   else
			   {
			    e.submit();
			   }
	   }).fail(function() {
			$("#preloader").hide();
	        console.log('Failed');
	    });
	   }
</script>

<script>
function openRepoAndCheckPull(event,reponame){
	 console.log('here in');console.log(event);
	event.preventDefault();
	  $.ajax({ 
	       url: 'validate_repo_session_copy',
	       data: {repoName: reponame},
	       type: 'get'
	   }).done(function(responseData) {
		   if(responseData=='notpresent')
			   {
				 $("#Copydata").empty();
				  $("#prog").show();
				  $("#ICOprog").show();
				  $("#bug").hide();
				  $("#ICObug").hide();
				  $("#suc").hide();
				  $("#ICOsuc").hide();
				  $("#CopydataDiv").show();
				  $('#myModal12').modal('show');
				  $("#Copydata").append("Falcon Deploy is pulling contents from remote git repository. Please wait.<br>");
				  progressStatus(reponame);
				  updateTouchCount(reponame);
			   }
		   else if(responseData=='present')
			   {
			   location.href =event.target.href;
			   updateTouchCount(reponame)
			   }
	   }).fail(function() {
			$("#preloader").hide();
	        console.log('Failed');
	    });
	  }
function progressStatus(reponame)
{
	console.log(reponame)
   	  $.ajax({ 
             url: 'copy_repo_session_copy',
             data: {repoName: reponame},
             type: 'get'
         }).done(function(responseData)
       		{
        	 $("#suc").show(); $("#ICOsuc").show();
        	 $("#prog").hide();$("#ICOprog").hide();
        	 $("#Copydata").append("Successfully completed.");
       		}).fail(function() {
     	        console.log('Failed');
       		});
}

function updateTouchCount(reponame)
{ 
	console.log(reponame)
   	  $.ajax({ 
             url: 'update_session_copy_touchcount',
             data: {repoName: reponame},
             type: 'get'
         }).done(function(responseData){}).fail(function() {
     	        console.log('Failed');
       		});
}
</script>


<c:if test="${isPathChangeLive ne null}">
<c:if test="${isPathChangeLive.getPropertyValue()=='true'}">
<script>
$(document).ready(function(){
$("#loaderNormal").hide();
$("#PathChangeStatus").show();
$("#preloader").show();
});
</script>
</c:if>
</c:if>