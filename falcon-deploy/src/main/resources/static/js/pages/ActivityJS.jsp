
<script src="${pageContext.request.contextPath}/static/js/plugins/jquery.twbsPagination.min.js"></script>
<script>
var url='ActivityTimelineList?';
var urlSearch="ActivityTimelineListOnSearch?";
var filter="ActivityTimelineListOnFilter?";
var url1=url;
var refreshIntervalId=null;
var tp=0;
var cp=0;
var sort='';
$(document).ready(function(){
	tableAddItems(0);
	refreshIntervalId=setInterval(tableAddItems,10000);	
	 $("#preloader").hide();
});
</script>

<script>

 function tableAddItems(pagenum){
	 displaySpinner();
	 $("#data-loader").show();

    $.ajax({ 
        url: url1+'page='+pagenum,
        data: {},
        type: 'get'
    }).done(function(responseData) {

            $("#preloader").hide();
    	$('#tbody').children('tr').remove();
    	var myRole=responseData.myRole;
    	
    	if(responseData.dto.length==0)
    		{ $("#emptyDataajax").show();$("#thead").hide();}
    	else
    		{ $("#emptyDataajax").hide();$("#thead").show();}
    	$.each(responseData.dto, function(i, req) {		
    		var scriptStatus="";
    	if(req.scriptStatus=="Successful")
    		scriptStatus="<a href='DeployLog/"+req.url+"' target='_blank' class='badge badge-success'>"+req.scriptStatus+"</a>";
    		else if(req.scriptStatus=="Needs Verification")	
    			scriptStatus="<a href='DeployLog/"+req.url+"' target='_blank' class='badge badge-warning'>"+req.scriptStatus+"</a>";
    		 else if(req.scriptStatus=="Failed")	
    			scriptStatus='<a href="DeployLog/'+req.url+'"  target="_blank" class="badge badge-danger">'+req.scriptStatus+'</a>'; 
    	    else if(req.scriptStatus=="Killed")	
    	    	scriptStatus='<a href="DeployLog/'+req.url+'"  target="_blank" class="badge badge-info " style="color:#fff">'+req.scriptStatus+'</a>'; 
    	    else if(req.scriptStatus=="Skipped")	
    	    	    	scriptStatus='<a  class="badge badge-warning " style="color:#fff">'+req.scriptStatus+'</a>'; 
    	    else if(req.scriptStatus=="Deploying")	
    	    	scriptStatus='<a ><i class="fa fa-2x fa-cog fa-spin text-primary"></i></a><br>'+
    	    	'<button type="button"  class="btn btn-sm btn-alt-danger text-right mt-10">Deploying</button>';
    	    
    	    	
    	    $("<tr style='height: 50px;'"+i+">"+
    	     '<td class="text-right" style="max-width:200px overflow:auto">'+
    	         '<a href="requestDetail?reqId='+req.reqId+'" class="font-w600">'+
    	          req.reqId+'</a>'+
    	     '</td>'+
    	      "<td style='max-width:200px; overflow:auto; text-transform:capitalize'>"+req.requestor +"</td>"+
    	      "<td style='max-width:200px; overflow:auto'>"+req.application +"</td>"+
    	      "<td style='max-width:200px; overflow:auto'>"+req.db +"</td>"+
    	      "<td style='max-width:200px; overflow:auto' class='table-scroll'>"+req.scriptFileName +"</td>"+
    	      "<td class='text-center' style='max-width:200px; overflow:auto'>"+ scriptStatus +"</td>"+
    	      "<td class='text-right' style='max-width:200px; overflow:auto'>"+req.elapsedTime+"</td>"+
    	      "<td class='' style='max-width:200px; overflow:auto; text-align:right'>"+req.deployedTime+"</td>"+   	   
    	       "</tr>").appendTo($('#tbody'));
    	      displaySpinner();
    		
    		});

    	 $("#data-loader").hide();
   	 $('#pagination').twbsPagination('destroy'); 	 
    
   tp=responseData.pgDTO.totalPages;
   cp=responseData.pgDTO.number;
       $('#pagination').twbsPagination({
            totalPages: responseData.pgDTO.totalPages,
            initiateStartPageClick:false,
            visiblePages: 10,
            startPage: responseData.pgDTO.number+1,
            onPageClick: function (event, page) {
            	var num=0;num=page;
              	clearInterval(refreshIntervalId);             
              	tableAddItems(num-1+sort);
            	if($("#now").is(":hidden"))
            	refreshIntervalId = setInterval(function(){tableAddItems(num-1)}, 20000);
            }
        });
        
       $("#preloader").hide();
    
    		 }).fail(function() {
    			 $("#preloader").hide();
       
    });
	$('#SearchIP').removeClass('loadinggif');
    };

</script>

<script>

       $("#clearField").click(function () {
    	   $("#stimeip").val("");
    	   $("#etimeip").val("");
    	   if( $('ref-dif').val()!="manual"){
    		   clearInterval(refreshIntervalId);
    		   url1=url;
    		   sort="";
    		   tableAddItems(0);
    	   }
    	   else
    		   {
    		   url1=url;
    		   clearInterval(refreshIntervalId);
         		tableAddItems(0);
    		   }
          });
           $('#Filterbtn').click(function(){
        	   var stime=$("#stimeip").val();
        	   var etime=   $("#etimeip").val();
        	   if(stime.length>7&&etime.length>7)
        		  {
        		   url1=urlSearch+'sdate='+stime+'&edate='+etime+'&';
        		   cp=0;
        		   tableAddItems(cp);
        		  }
        	   else
        		   {
        		   clearInterval(refreshIntervalId);
        		   url1=url;
        		   tableAddItems(cp);
        		   }
        	   
           });
           
           $('#SearchIP').keyup(function(){
        	   var searchBase=$("#SearchOn").val();
        	   var searchOn=$("#SearchIP").val();
        	   if($(this).val().length>0)
        		  {
        		   $("#ref-dif option").removeAttr('selected', 'selected');
        			$("#ref-dif option[value=manual]").attr('selected', 'selected');
        			$("#stop").hide();
            		$("#now").show();
            		   clearInterval(refreshIntervalId);
        		   $('#SearchIP').addClass('loadinggif');
        		   url1=filter+'&searchBase='+searchBase+'&searchOn='+searchOn+'&';
        		   cp=0;
        		   tableAddItems(cp);
        		  } 
        	   else
    		   {
        		 clearInterval(refreshIntervalId);
    		   url1=url;
    		   tableAddItems(cp);
    		   }
           });
        $("#stop").click(function () {
              		clearInterval(refreshIntervalId);
            		$("#ref-dif option").removeAttr('selected', 'selected');
            		$("#ref-dif option[value=manual]").attr('selected', 'selected');
            		$("#stop").hide();
            		$("#now").show();
            })
            $("#now").click(function () {
              		clearInterval(refreshIntervalId);
              		tableAddItems(cp);
            })
     
 </script> 
 <script>
   $('#ref-dif').on('change',function(){
	    if( $(this).val()=="manual"){
	    	clearInterval(refreshIntervalId);
    		$("#stop").hide();
    		$("#now").show();
	    }
	    else{
	    	clearInterval(refreshIntervalId);
	    	refreshIntervalId = setInterval(function(){tableAddItems(cp)}, $(this).val()*1000);
	   		$("#stop").show();
    		$("#now").hide();
	    }
	});
   </script>
   <script>
   $('#rn').click(function(){
	 
	   clearInterval(refreshIntervalId);
		$("#ref-dif option").removeAttr('selected', 'selected');
		$("#ref-dif option[value=manual]").attr('selected', 'selected');
		$("#stop").hide();
		$("#now").show();
		var id=$(this).attr("id");
	  sortHeader(id);
	});
   $('#r').click(function(){
	   clearInterval(refreshIntervalId);
		$("#ref-dif option").removeAttr('selected', 'selected');
		$("#ref-dif option[value=manual]").attr('selected', 'selected');
		$("#stop").hide();
		$("#now").show();
		var id=$(this).attr("id");
	  sortHeader(id);
	});
   $('#a').click(function(){
	   clearInterval(refreshIntervalId);
		$("#ref-dif option").removeAttr('selected', 'selected');
		$("#ref-dif option[value=manual]").attr('selected', 'selected');
		$("#stop").hide();
		$("#now").show();
		var id=$(this).attr("id");
	  sortHeader(id);
	});
   $('#db').click(function(){
	   clearInterval(refreshIntervalId);
		$("#ref-dif option").removeAttr('selected', 'selected');
		$("#ref-dif option[value=manual]").attr('selected', 'selected');
		$("#stop").hide();
		$("#now").show();
		var id=$(this).attr("id");
	  sortHeader(id);
	});
   $('#sf').click(function(){
	   clearInterval(refreshIntervalId);
		$("#ref-dif option").removeAttr('selected', 'selected');
		$("#ref-dif option[value=manual]").attr('selected', 'selected');
		$("#stop").hide();
		$("#now").show();
		var id=$(this).attr("id");
	  sortHeader(id);
	});
   $('#ss').click(function(){
	   clearInterval(refreshIntervalId);
		$("#ref-dif option").removeAttr('selected', 'selected');
		$("#ref-dif option[value=manual]").attr('selected', 'selected');
		$("#stop").hide();
		$("#now").show();
		var id=$(this).attr("id");
	  sortHeader(id);
	});
   $('#et').click(function(){
	   clearInterval(refreshIntervalId);
		$("#ref-dif option").removeAttr('selected', 'selected');
		$("#ref-dif option[value=manual]").attr('selected', 'selected');
		$("#stop").hide();
		$("#now").show();
		var id=$(this).attr("id");
	  sortHeader(id);
	});
   $('#dt').click(function(){
	   clearInterval(refreshIntervalId);
		$("#ref-dif option").removeAttr('selected', 'selected');
		$("#ref-dif option[value=manual]").attr('selected', 'selected');
		$("#stop").hide();
		$("#now").show();
		var id=$(this).attr("id");
	  sortHeader(id);
	});
   $('#depb').click(function(){
	   clearInterval(refreshIntervalId);
		$("#ref-dif option").removeAttr('selected', 'selected');
		$("#ref-dif option[value=manual]").attr('selected', 'selected');
		$("#stop").hide();
		$("#now").show();
		var id=$(this).attr("id");
	  sortHeader(id);
	});
   
   
   function sortHeader(id){
	   cp=0;
		 var fa_sort= $('#'+id).find('i').hasClass('fa-sort');
		   var fa_sort_up= $('#'+id).find('i').hasClass('fa-sort-up');
		   var fa_sort_down= $('#'+id).find('i').hasClass('fa-sort-down');
		  
		if(fa_sort){
			$('tr th').find('i').removeClass('fa-sort-up');
			$('tr th').find('i').removeClass('fa-sort-down');
			$('tr th').find('i').addClass('fa-sort');
			$('#'+id).find('i').removeClass('fa-sort-down');
			$('#'+id).find('i').removeClass('fa-sort');
			$('#'+id).find('i').addClass('fa-sort-up');
			
		
		
		if(id=='rn')
				{
			   sort='&sort=deployDbId.requestId.deployRequestId,desc';
			     tableAddItems(cp+sort)
			     }
			if(id=='r')
				{
				 sort='&sort=deployDbId.requestId.requestor.firstName,desc';
				  tableAddItems(cp+sort)
				}
			if(id=='a')
				{
				 sort='&sort=deployDbId.requestId.application.repoName,desc';
				  tableAddItems(cp+sort)
				}
		
			if(id=='sf')
				{
				 sort='&sort=fileMap.fileName,desc';
				  tableAddItems(cp+sort)
				}
				
				if(id=='ss')
					{
					 sort='&sort=deploymentScriptStatus.statusCode,desc';
					  tableAddItems(cp+sort)
					}
			if(id=='et')
				{
				 sort='&sort=elapsedTimestamp,desc';
				  tableAddItems(cp+sort)
				}
			if(id=='et')
			{
			 sort='&sort=elapsedTimestamp,desc';
			  tableAddItems(cp+sort)
			}
			if(id=='dt')
			{
			 sort='&sort=logTimestamp,desc';
			  tableAddItems(cp+sort)
			}
			if(id=='depb')
			{
			 sort='&sort=deployDbId.requestId.owner.firstName,desc';
			  tableAddItems(cp+sort)
			}
		}
		   
		if(fa_sort_up){
			$('tr th').find('i').removeClass('fa-sort-up');
			$('tr th').find('i').removeClass('fa-sort-down');
			$('tr th').find('i').addClass('fa-sort');
			$('#'+id).find('i').removeClass('fa-sort-up');
			$('#'+id).find('i').removeClass('fa-sort');
			$('#'+id).find('i').addClass('fa-sort-down');
			
			if(id=='rn')
			{
		   sort='&sort=deployDbId.requestId.deployRequestId,asc';
		     tableAddItems(cp+sort)
		     }
		if(id=='r')
			{
			 sort='&sort=deployDbId.requestId.requestor.firstName,asc';
			  tableAddItems(cp+sort)
			}
		if(id=='a')
			{
			 sort='&sort=deployDbId.requestId.application.repoName,asc';
			  tableAddItems(cp+sort)
			}
	
		if(id=='sf')
			{
			 sort='&sort=fileMap.fileName,asc';
			  tableAddItems(cp+sort)
			}
			
			if(id=='ss')
				{
				 sort='&sort=deploymentScriptStatus.statusCode,asc';
				  tableAddItems(cp+sort)
				}
		if(id=='et')
			{
			 sort='&sort=elapsedTimestamp,asc';
			  tableAddItems(cp+sort)
			}
		if(id=='et')
		{
		 sort='&sort=elapsedTimestamp,asc';
		  tableAddItems(cp+sort)
		}
		if(id=='dt')
		{
		 sort='&sort=logTimestamp,asc';
		  tableAddItems(cp+sort)
		}
		if(id=='depb')
		{
		 sort='&sort=deployDbId.requestId.owner.firstName,asc';
		  tableAddItems(cp+sort)
		}	
			
		}

		if(fa_sort_down){
			$('tr th').find('i').removeClass('fa-sort-up');
			$('tr th').find('i').removeClass('fa-sort-down');
			$('tr th').find('i').addClass('fa-sort');
			$('#'+id).find('i').removeClass('fa-sort-up');
			$('#'+id).find('i').removeClass('fa-sort-down');
			$('#'+id).find('i').addClass('fa-sort');
			
			if(id=='rn')
		      tableAddItems(cp)
	    	if(id=='r')
			  tableAddItems(cp)
		    if(id=='a')
			  tableAddItems(cp)
		    if(id=='sf')
			  tableAddItems(cp) 
		    if(id=='ss')
			  tableAddItems(cp)		
		    if(id=='et')
			  tableAddItems(cp)
		    if(id=='et')
		      tableAddItems(cp)
		    if(id=='dt')
		      tableAddItems(cp)
		    if(id=='depb')
		     tableAddItems(cp)
		
		}
	}
   </script>
