

<script src="static/js/plugins/jquery.twbsPagination.min.js"></script>
<script>
var tp=0;
var cp=0;
var url;
var oldUrl;

var title;
var sort='';
var search='';



</script>
<c:choose>
<c:when test="${MODE == 'All'}">
<script>
url='listdeployrequest';
title='ALL REQUESTS';
</script>
</c:when>
<c:when test="${MODE == 'OPEN'}">
<script>
url='listOpenRequest';
title='OPEN REQUESTS';
</script>
</c:when>
<c:when test="${MODE == 'AA'}">
<script>
url='listUnAssigned';
title='UNASSIGNED REQUESTS';
</script>
</c:when>
<c:when test="${MODE == 'SELF'}">
<script>
url='listRequestByMe';
title='MY REQUESTS';
$('#requestBasedOn option[value="Requestor"]').remove();
</script>
</c:when>
<c:when test="${MODE == 'TO'}">
<script>
url='listRequestToMe';
title='REQUESTS ASSIGNED TO ME';
$('#requestBasedOn option[value="AssignedTo"]').remove();
</script>
</c:when>
</c:choose>
<script>
$(document).ready(function(){
    oldUrl=url;
	tableAddItems(0);
});

$('#rn').click(function(){
	var id=$(this).attr("id");
  sortHeader(id);
});
$('#ad').click(function(){
	var id=$(this).attr("id");
	  sortHeader(id);
	});
$('#ap').click(function(){
	var id=$(this).attr("id");
	  sortHeader(id);
	});
$('#op').click(function(){
	var id=$(this).attr("id");
	  sortHeader(id);
	});
$('#st').click(function(){
	var id=$(this).attr("id");
	  sortHeader(id);
	});
$('#at').click(function(){
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
		   sort='&sort=requestName,desc';
		   tableAddItems(cp+sort+search)
		   }
		if(id=='ad')
			{
			sort='&sort=requestor.firstName,desc';
			tableAddItems(cp+sort+search)
			}
		if(id=='ap')
			{
			sort='&sort=application.repoName,desc';
						tableAddItems(cp+sort+search)
			}

		if(id=='op')
			{
			sort='&sort=createdTimestamp,desc';
						tableAddItems(cp+sort+search)
			}
		if(id=='st')
		   {
			sort='&sort=deployRequestStatus.statusDesc,desc';
						tableAddItems(cp+sort+search)
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
			sort='&sort=requestName,asc';
			tableAddItems(cp+sort+search)
			}

		if(id=='ad')
			{
			sort='&sort=requestor.firstName,asc';
			tableAddItems(cp+sort+search)
			}

		if(id=='ap')
			{
			sort='&sort=application.repoName,asc';
			tableAddItems(cp+sort+search)
			}

		if(id=='op')
			{
			sort='&sort=createdTimestamp,asc';
			tableAddItems(cp+sort+search)
			}

		if(id=='st')
			{
			sort='&sort=deployRequestStatus.statusDesc,asc';
			tableAddItems(cp+sort+search)
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
			tableAddItems(cp+search)
		if(id=='ad')
			tableAddItems(cp+search)
		if(id=='ap')
			tableAddItems(cp+search)
		if(id=='op')
			tableAddItems(cp+search)
		if(id=='st')
			tableAddItems(cp+search)
	}
}
 function tableAddItems(pagenum){
	 displaySpinner();
	 $("#data-loader").show();
var status;
    $.ajax({ 
        url: url+'?page='+pagenum+'&size=10',
        data: {},
        type: 'get'
    }).done(function(responseData) {
            $("#preloader").hide();      
    	$('#tbody').children('tr').remove();
          var header=  $('#requestheader').text();
          if(header!=title)
              $('#requestheader').append(title);
  			if(responseData.content.length>0)
  				{
  				$("#emptyDataajax").hide();
  				$("#thead").show();
  				}
  			else
  				{
  				$("#emptyDataajax").show();
  				$("#thead").hide();
  				}
    	$.each(responseData.content, function(i, req) {		
    		if(req.status=="OPEN")
        		status="<span class='badge badge-info'>"+req.status+"</span>";
        		else 
        		status="<span class='badge badge-warning'>"+req.status+"</span>";
     
    		 	
    	    $("<tr>"+
    	     '<td class="text-left" style="padding: 10px!important;"><a href="requestDetail?reqId='+req.requestId+'">'+req.requestName+'</a>'+
    	          
    	     '</td>'+
    	      "<td class='font-w600 text-capitalize'>"+req.requestor+"</td>"+
    	      "<td class=' d-sm-table-cell'>"+req.application+"</td>"+
    	      "<td class=' d-sm-table-cell text-right'>"+req.submittedTime+"</td>"+
    	      "<td class='text-center'>"+status+"</td>"+   	    
    	       "</tr>").appendTo($('#tbody'));
    	     displaySpinner();
    		});
		 $("#data-loader").hide();
   	 $('#pagination').twbsPagination('destroy'); 	 
    	
   tp=responseData.totalPages;
   cp=responseData.number;
       $('#pagination').twbsPagination({
            totalPages: responseData.totalPages,
            initiateStartPageClick:false,
            visiblePages: 10,
            startPage: responseData.number+1,
            onPageClick: function (event, page) {
            	var num=0;num=page;
            	tableAddItems((num-1)+sort+search);
            }
        });

    		 }).fail(function() {
    			 $("#preloader").hide();
    });
    };

    
 $("#requestsearchkey").on('keyup', function postinput(){	
	 cp=0;
   	 var searchType= $('#requestBasedOn').val();
       var matchvalue = $("#requestsearchkey").val(); 
       if( !matchvalue == ""&&matchvalue.length>0)
       	{
    	         	
if( title=='ALL REQUESTS'){
	      url='searchRequest';
	      search='&search='+matchvalue+'&type='+searchType;
		tableAddItems(cp+'&search='+matchvalue+'&type='+searchType);
		
}
if( title=='OPEN REQUESTS'){
	url='searchOpenRequest';
	search='&search='+matchvalue+'&type='+searchType;
		tableAddItems(cp+'&search='+matchvalue+'&type='+searchType);
}
if( title=='UNASSIGNED REQUESTS'){
	url='searchUnAssigned';
	search='&search='+matchvalue+'&type='+searchType;
		tableAddItems(cp+'&search='+matchvalue+'&type='+searchType);
}
if( title=='MY REQUESTS'){
	url='searchRequestByMe';
	search='&search='+matchvalue+'&type='+searchType;
		tableAddItems(cp+'&search='+matchvalue+'&type='+searchType);
}
if( title=='REQUESTS ASSIGNED TO ME'){
	url='searchRequestToMe';
	search='&search='+matchvalue+'&type='+searchType;
		tableAddItems(cp+'&search='+matchvalue+'&type='+searchType);
}
   }
       else{
    	   url=oldUrl; 
    	   search='';
    	   tableAddItems(cp); 
       }
      
       });

</script>


