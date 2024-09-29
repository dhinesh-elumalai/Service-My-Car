<script src="static/js/plugins/jquery.twbsPagination.min.js"></script>
<script src="static/js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<c:if test="${selected}">
		<script>
	$(document).ready(function(){
		var edate = new Date(${currentDate});
		var sdate = new Date(${startdate});
		sdate.setDate(sdate.getDate() - ${purgeDeleteDays}); 
		initialize(sdate,edate);
	});
	</script>
</c:if>	
<c:if test="${!selected}">
	<script>
	$(document).ready(function(){
		var edate = new Date(${currentDate});
		var sdate = new Date(${startdate});
		initialize(sdate,edate);
	});
	</script>
</c:if> 
	<script>
		function initialize(sdate,edate)
		{
			console.log(sdate);
			console.log(edate);
		$('#fdate').datepicker({ 
			startDate: sdate,
			endDate: edate,
		    todayHighlight: true,
		    autoclose: true,
		    format: 'mm-dd-yyyy',
		    orientation: "bottom" , 
		});
		$('#tdate').datepicker({ 
			startDate:sdate,
			endDate: edate,
		    todayHighlight: true,
		    autoclose: true,
		    format: 'mm-dd-yyyy',
		    orientation: "bottom" ,
		});

		}
		
		
		$("#history").change(function() {
			var edate = new Date(${currentDate});
			var sdate = new Date(${startdate});
			sdate.setDate(sdate.getDate() - ${purgeDeleteDays}); 
			var stdate = new Date(${startdate});

		    if(this.checked) {
		    	$('#fdate').datepicker('destroy');
				$('#tdate').datepicker('destroy');
		    	initialize(sdate,edate);
		    	
		    }
		    else
		    	{
		    	$('#fdate').datepicker('destroy');
				$('#tdate').datepicker('destroy');
		    	initialize(stdate,edate);
		    	}
		});
	</script>
	
<script>
$(document).ready(function(){
	var dateSent=${dateSent};
	 var fdate=$('#fdate').val();
	  var tdate=$('#tdate').val();

	 $('#pagination_jsp').twbsPagination({
	        totalPages: ${list.totalPages},
	        initiateStartPageClick:false,
	        visiblePages: 10,
	        startPage: ${list.number + 1},
	        onPageClick: function (event, page) {
	        	var num=0;num=page;
	        	console.log("dateSent",dateSent)
	        	if(dateSent=='true'||dateSent==true)
	        	  window.location = "report?fdate="+fdate+"&tdate="+tdate+"&page="+(num-1)+"&selected="+${selected};
	        	else
	        	  window.location = "report?page="+(num-1)+"&selected="+${selected};
	        }
	    });
	 
});


$('[name="chkbx"]').change(function() {
	 var val=$(this).val();

	 if($('[name="chkbx"]:not(:checked)').length==6){
		 clearOptions();
	 }

	 initSelect2();
       if($(this).is(":checked")) {
          $("#"+val+"Div").show();
       }
       else
       	{
       	$("#"+val+"Div").hide();
        $("#"+val+"Div select option") .prop("selected", false);
       	}

   if($('input[name="chkbx"]:checked').length>0)
    	   $("#filtrbtn").show(); 
       else
    	   $("#filtrbtn").hide();  
       
   });
   
   
   function initSelect2()
   {
	   $("#selectedApp").select2({

			  multiple : true,
			  width: '100%',
			  placeholder: "",
			});
		$("#selectedDb").select2({

			  multiple : true,
			  width: '100%',
			  placeholder: "",
			});

		$("#selectedTeam").select2({

			  multiple : true,
			  width: '100%',
			  placeholder: "",
			});

		$("#selectedUser").select2({

			  multiple : true,
			  width: '100%',
			  placeholder: "",
			});

		$("#selectedEnv").select2({

			  multiple : true,
			  width: '100%',
			  placeholder: "",
			});
			
		$("#selectedScript").select2({
			  multiple : true,
			  width: '100%',
			  placeholder: "",
			});
			
		 $("#selectedScript").select2({ 
			  multiple : true,
			  width: '100%',
			  placeholder: "",
			}); 

   }
   
  function submitForFilter(page)
  {
	  displaySpinner();
	  $("#data-loader").show();
	  var fdate=$('#fdate').val();
	  var tdate=$('#tdate').val();
	  var repoName=$('#selectedApp').val();
	  var teamName=$('#selectedTeam').val();
	  var dbid=$('#selectedDb').val();
	  var envId=$('#selectedEnv').val();
	  var scriptName=$('#selectedScript').val();
	  var usrid=$('#selectedUser').val();
	  var selected = $("#history").is(":checked");

	  
	    $.ajax({ 
	        url: 'reportFinalFilter',
	        data: {fdate:fdate,tdate:$.trim(tdate),repoName:repoName,teamName:teamName,dbid:dbid,envId:envId,scriptName:scriptName,usrid:usrid,size:10,page:page,selected:selected,'${_csrf.parameterName}':'${_csrf.token}'},
	        type: 'post'
	    }).done(function(responseData) {
	    	console.log("response data : "+responseData+" :  ");
	    	if(!jQuery.isEmptyObject(responseData))
	    		{
	    	  if(responseData.content.length==0)
	    	  {
	    		  $("#emptyDataajax").show();
	    		  $("#thead").hide();
	    	  }
	    	  else
	    		  {
	    		  $("#emptyDataajax").hide();
	    		  $("#thead").show();
	    		  }
	    	$('#jsptbody').hide();
	    	$('#ajaxtbody').empty();
	    	$('#ajaxtbody').show();
	    	$('#pagination_div_jsp').hide();
	    	$('#pagination_div_ajax').show();
	    	$.each(responseData.content, function(i, req) {	
	    		
	    		var active='';
	    		if(i%2!=0)
	    			active=' class="table-active"';
	    		var rowspan=req.reportDetail.length+1;	
	    		
	    		 $('<tr'+active+'>'+
				'<td rowspan="'+rowspan+'">'+req.script+'- <b class="text-primary"> '+(rowspan-1)+'</b></td>'+
				'</tr>' ).appendTo($('#ajaxtbody'));
				$.each(req.reportDetail, function(j, dr)
						{
					 $('<tr'+active+'>'+
				'<td>'+dr.repoName+' - '+dr.reqid+' - '+dr.db+'</td>'+
				'<td class="text-right">'+dr.deployedTime+'</td>'+
				'<td>'+dr.env+'</td>'+
				'<td class="text-center">'+
				'<a href="DeployLog/'+dr.logUrl+'"  target="_blank"'+
				((dr.scriptStatus=='Successful')?' class="badge badge-success "':'')+
						((dr.scriptStatus=='Needs Verification')?' class="badge badge-warning"':'')+
								((dr.scriptStatus=='Failed')?' class="badge badge-danger"':'')+
										((dr.scriptStatus=='Killed')?' class="badge badge-info"':'')+'>'+dr.scriptStatus+'</a></td>'+
				'<td>'+dr.userName+'</td>'+
				'</tr>' ).appendTo($('#ajaxtbody'));
					  displaySpinner();
				});
				 $("#data-loader").hide();
	    		});
	    	$('#jsp_total_script_count').hide();
	    	 $('#ajax_total_script_count').show();
	    	 $('#ajax_totalScripts').text(responseData.totalElements);
	   	     $('#pagination_ajax').twbsPagination('destroy'); 	 
	    	
	       $('#pagination_ajax').twbsPagination({
	            totalPages: responseData.totalPages,
	            initiateStartPageClick:false,
	            visiblePages: 10,
	            startPage: responseData.number+1,
	            onPageClick: function (event, page) {
	            	var num=0;num=page;
	            	submitForFilter(page-1);
	            }
	        });
	    }
	    	else
	    		{
	    		 $("#preloader").hide();
	    		 $("#data-loader").hide();
	    		$('#ajaxtbody').empty();
		    	$('#ajaxtbody').hide();
		    	$('#jsptbody').hide();
		    	 $('#pagination_div_jsp').hide();
		    	 $('#pagination_div_ajax').hide();
		    	 $('#totalScripts').empty();
		    	 $('#jsp_total_script_count').hide();
		    	 $('#ajax_total_script_count').hide();
		    	 
	    		}
	    		 }).fail(function() {
	    			 $("#preloader").hide();
	    });  
  }
  
  function clearOptions()
  {
      $("select option").prop("selected", false);
      $("select").val('').trigger("change");
	  $('#ajaxtbody').empty();
  	$('#ajaxtbody').hide();
  	$('#jsptbody').show();
  	$('#ajax_total_script_count').hide();
	$('#jsp_total_script_count').show();
  	$('#pagination_div_ajax').hide();
  	$('#pagination_div_jsp').show();

  }
  
</script>
