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
	        	window.location = "mappings?page="+(num-1);
	        }
	    });
});
</script>
</c:if>
<script>	 
    $("#targetSearch").on('keyup', function postinput(){		
        var matchvalue = $("#targetSearch").val(); 
        if( !matchvalue == ""&&matchvalue.length>1)
        	{
        	$("#preloader").show();
        	$('#targetSearch').addClass('loadinggif');
        	$('#paginationDiv').css("display","none");
        $.ajax({ 
            url: 'search_target_based_on_repo',
            data: {name: matchvalue},
            type: 'get'
        }).done(function(responseData) {
        	$("#preloader").hide();
        	$('#jsp_datacard_id').hide();
        	$('#restDataDisplay').show();
        	var empty=responseData.dto.length;
        	if(empty==0) {
        		$("#emptyDataajax").show();
        		$('#restDataDisplay').children('div').remove();
           		 $('#targetSearch').removeClass('loadinggif');
            }
        	else
        		{
        		$('#restDataDisplay').children('div').remove();
        		$("#emptyDataajax").hide();
        if(responseData.admin==true)
        	{
        	$.each(responseData.dto, function(i, tar) {
        		
        		 $("<div class='block block-bordered'  id='card"+i+"' style=''><div class='block-header block-header-default'><h5 class='block-title font-w600'> "+
        		 (tar.subDto.enabled?" <a  href='folders?directory="+
        				 tar.subDto.repoPath+"&accessControl=READ/WRITE&gitStatus="+
        				 tar.subDto.gitStatus+"&IsA=T&access=direct&team=nil&role=nil'>":"")+
        				 tar.subDto.teargetName+" <small style='font-size: 12px;font-style: italic;'>"+tar.subDto.mapType+" (Mapping)</small>  -> "+
        				 tar.subDto.repoName+" <small style='font-size: 12px;font-style: italic;'>(Repo)</small></a>"+
        				 (responseData.admin==true? "":" ")+ (tar.subDto.enabled?" <span class='badge badge-success'>Active</span>":" <span class='badge badge-danger'>Inactive</span>")+"</h5>"+
        				 (tar.subDto.enabled?"<a  href='editRepoToDb?targetName="+
        						 tar.subDto.teargetName+"&repoName="+tar.subDto.repoName
        						 +"' class='btn btn-sm btn-primary ' style='float: right'><i class='fa fa-pencil'></i> Edit</a>":"")+"</div><div class='card-text card-block' ><div class='col-md-12 pl-0'><h6 class='list-head'>Database List</h6><ul id='disp"+i
        						 +"' class='mapping-list'></ul> ").appendTo($('#restDataDisplay'));    
        		 
 		 $.each(tar.dto, function(key,val)
    			{ 
 			 console.log(tar.subDto.enabled)
    			 $(" <li><a href='"+(val.autonomous?"update-databases-autonomous":"update-databases-tns")+"?tns_id="+val.id+"' <c:if test='${displayDescriptor}'> data-toggle='popover' title='Descriptor' data-placement='right' data-content='"+val.descriptor+"'</c:if>>"+val.link+val.status+"</a>"+(val.autonomous?"<span class='badge badge-success'>Autonomous</span>":"")+"</li>").appendTo($('#disp'+i));
    		    }); 
    			$('#card'+i).after($("</div> </div></div> "));
    			$('[data-toggle="popover"]').popover({ trigger: "hover" });
        		});
        	}
        else
        	{
        	$.each(responseData.dto, function(i, tar) {
       		 $("<div class='block block-bordered'  id='card"+i+"' style='height:350px;overflow-y:auto;'><div class='block-header block-header-default'><h5 class='block-title font-w600'>  <a href='application'>"+tar.subDto.teargetName+" <small style='font-size: 12px;font-style: italic;'>"+tar.subDto.mapType+" (Mapping)</small> -> "+tar.subDto.repoName+" <small style='font-size: 12px;font-style: italic;'>(Repo)</small></a></h5></div><div class='card-text card-block' ><div class=' '  id='disp"+i+"'><h6 class='list-head'>Database List</h6> <ul id='ullist"+i+"' class='mapping-list'></ul>").appendTo($('#restDataDisplay'));        	
		 $.each(tar.dto, function(key,val)
   			{ 	        		
   			 $(" <li><span class='custom-control-description js-popover-enabled'  <c:if test='${displayDescriptor}'>  data-toggle='popover' title='Descriptor' data-placement='right' data-content='"+val.descriptor+"'</c:if>>"+val.link+val.status+"</span>"+(val.autonomous?"<span class='badge badge-success'>Autonomous</span>":"")+"</li>").appendTo($('#ullist'+i));
   		    }); 
   			$('#card'+i).after($("</div> </div></div> <div class='col-md-12'>  <br></div>"));
   			$('[data-toggle="popover"]').popover({ trigger: "hover" });
       		});
        	}
        	 $('#targetSearch').removeClass('loadinggif');
        		} }).fail(function() {
        			$("#preloader").hide();
            console.log('Failed');
        });
    }
        else
        	{
        	$('#restDataDisplay').children('div').remove();
        	$('#paginationDiv').css("display","");
        	$('#jsp_datacard_id').css("display","");
        	$('#restDataDisplay').css("display","none");
        	}
        });

</script>