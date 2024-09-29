
<script>
 var id=${request.requestId};
 var deployId='';
 var refreshIntervalId=null;
 var owenerId=null;
 
$(document).ready(function(){
	reqDeployments(id);
	if($('#schedule').text().trim().length<12){
		$('#schedule').hide();
	}
	refreshIntervalId = setInterval(function(){Detail(deployId)}, 10000);
});

$('#refresh').click(function() {
    location.reload();
});

var fixHelperModified = function(e, tr) {
    var $originals = tr.children();
    var $helper = tr.clone();
    $helper.children().each(function(index) {
      $(this).width($originals.eq(index).width())
    });
    return $helper;
  },
  updateIndex = function(e, ui) {
    $('td.index', ui.item.parent()).each(function(i) {
      $(this).html(i + 1);
    });
  };
  
  function togglecheckbox(source) {
	    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
	    for (var i = 0; i < checkboxes.length; i++) {
	        if (checkboxes[i] != source)
	            checkboxes[i].checked = source.checked;
	    }
	}
  
$(".sorttable tbody").sortable({
	 helper: fixHelperModified,
	 cursor: "move",
	  stop: updateIndex,
	  placeholder: "placeholder-style",
	  start  : function(event, ui){
		  	$(this).find('.placeholder-style  td:nth-child(4)').css('display', 'none')
		  	$(this).find('.placeholder-style  td:nth-child(5)').css('display', 'none')
		  	$(this).find('.placeholder-style  td:nth-child(7)').css('display', 'none')
	        $(ui.helper).addClass("ui-helper");
	        ui.helper.css('display', 'table');
	    }
	}).disableSelection();
function reqDeployments(reqId){
    $.ajax({ 
	        url: 'reqDetails?reqId='+reqId,
	        data: {},
	        type: 'get'
	    }).done(function(responseData) {
	    	
	    	$('#dbTabs').children('li').remove();
	  var active ="";
	    	$.each(responseData, function(i, req) {		
	    		if(i==0){
	    			active='nav-link active';
	    			Detail(req.deploymentId);	 
	    		}
	        	else
	    			active='nav-link';
	    	    $("<li class='nav-item'><a class='"+active+"' id="+req.deploymentId+"	href='javascript:void(0)' onclick='Detail("+req.deploymentId+");'>"+req.dbName+" - "+req.status+" <span class='badge badge-pill badge-danger'>"+req.priority+"</span></a>"+  
	    	       "</li>").appendTo($('#dbTabs'));
	    	  
	    		});
	    		 }).fail(function() {
	    });
	  };
	    
function reqDeploymen(reqId,deepid){
	        $.ajax({ 
	    	        url: 'reqDetails?reqId='+reqId,
	    	        data: {},
	    	        type: 'get'
	    	    }).done(function(responseData) {
	    	    	$('#dbTabs').children('li').remove();
	    	  var active ="";
	    	    	$.each(responseData, function(i, req) {
	    	    		if(req.deploymentId==deepid)
	    	    	       active='nav-link active';
	    	    		else
	    	    			 active='nav-link';
	    	    	    $("<li class='nav-item'><a class='"+active+"' id="+req.deploymentId+"	href='javascript:void(0)' onclick='Detail("+req.deploymentId+");'>"+req.dbName+" - "+req.status+" <span class='badge badge-pill badge-danger'>"+req.priority+"</span></a>"+  
	    	    	       "</li>").appendTo($('#dbTabs'));
	    	    	  
	    	    		});
	    	    		 }).fail(function() {
	    	    });
	     };


	     function getData(repo) { 
	    		$.ajax({ 
	    		       url: 'validate_repo_session_copy',
	    		       data: {repoName: repo},
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
	    					  $('#myModal13').modal('show');
	    					  $("#Copydata").append("Falcon Deploy is pulling contents from remote git repository. Please wait.<br>");
	    					  progressStatus(repo);
	    					  updateTouchCount(repo); 
	    				   }
	    			   else if(responseData=='present')
	    				   {
	    				   updateTouchCount(repo);
	    				   } 
	    			       }).fail(function() {
	    						$("#preloader").hide();
	    				        console.log('Failed');
	    				    });
	    		};

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
	    	        	 restageAndDeployGetBranch(reponame);
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
	    

function Detail(depId){
			$('#example-checkbox').prop('checked', false);
            deployId=depId;    
            $("#data-loader1").show();
            
	        $.ajax({ 
	    	        url: 'depDetails?depId='+depId,
	    	        data: {},
	    	        type: 'get'
	    	    }).done(function(responseData) {
	    	    	reqDeploymen(id,deployId);
	    	    	$('#depDetail').children('tr').remove();	
	    	    	$('#rollDetail').children('tr').remove();
	    	    	displaySpinner();

	    	            $('#assignedTo span').empty();
	    	            $('#assignedTo span').append(responseData.owner);
	    	               if(responseData.ownerLogedIn&&!responseData.requestClosed&&responseData.depStatus!="Cancelled"&&!(responseData.notifyAdmin==true&&responseData.notifyAdminForCredential==true)&&!(responseData.approved==false && (responseData.approver==true || responseData.notifyAdmin==true)))
	    	            	{
	    	            	rollbackDetails(depId); 
	    	            	}
	    	            else
	    	            	{
	    	            	$("#rollbackdatatitle").hide();
	    		    		$("#rollbackdatadiv").hide();
	    		    		$("#rollbackdatadiv1").hide();
	    	            	}
	    	          		
	    	             if(responseData.ownerLogedIn||responseData.notifyAdminForCredential||(responseData.requestClosed))
	    	            	 $('#changeOwnerShipDiv').hide();
	    	             else
	    	            	 $('#changeOwnerShipDiv').show();
	    	            
	    	             if(!responseData.dbEnabled)
	    	            	 $('#changeOwnerShipDiv').hide();
                        
						if(responseData.notifyAdmin==true&&responseData.notifyAdminForCredential==true)
							$('#credentialDiv').show();
						if((responseData.notifyAdmin==true&&!responseData.notifyAdminForCredential==true)||(responseData.requestClosed))
							$('#credentialDiv').hide();
					
						if((responseData.approved==false && (responseData.approver==false || responseData.notifyAdmin==false))||(responseData.requestClosed))
							$('#approve').empty();	

						if(responseData.approved==false && (responseData.approver==true || responseData.notifyAdmin==true))
							$('#approve').append('<button  onclick="approve()" class="btn btn-alt-primary" data-toggle="click-ripple">Approve</button>');

						if(responseData.approved==true||(responseData.requestClosed))
							$('#approve').empty();	
						
						 if(!responseData.dbEnabled)
							 {
							 $('#approve').empty();
							 $('#credentialDiv').empty();
							 $('#changeOwnerShipDiv').empty();
							 }
				
					auditDetails(depId);
				
					  if(responseData.ownereid!=null)
						  {
						  owenerId=responseData.ownereid;						  
						  $('#DepOwner').empty();
						  $('#DepOwner').append(responseData.owner);
						  }
					  
					if(!responseData.requestClosed)
					  if(responseData.ownerLogedIn&&(responseData.depStatus=="Scheduled")){
						  $('#stopDEPDiv').empty();
						  $('#startDEPDiv').empty();
	    	    	      $('#cancelDEPDiv').empty();
	
						    $('#stopDEPDiv').append('<button  class="btn btn-alt-danger"  onclick="stopdeb()" data-toggle="click-ripple">Stop</button>');
	    	    	    	$('#startDEPDiv').append('<button  class="btn btn-alt-success" onclick="startdeb()" data-toggle="click-ripple">Start</button>');
	    	    	    	$('#cancelDEPDiv').append('<button  class="btn btn-alt-danger"  onclick="canceldeb()" data-toggle="click-ripple">Cancel</button>');

					  }
					  else if(responseData.ownerLogedIn&&responseData.depStatus=="In Progress")
						  {
						  $('#stopDEPDiv').empty();
						  $('#startDEPDiv').empty();
	    	    	      $('#cancelDEPDiv').empty();
						  $('#stopDEPDiv').append('<button  class="btn btn-alt-danger"  onclick="stopdeb()" data-toggle="click-ripple">Stop</button>');
						  }
					  else if(responseData.ownerLogedIn&&responseData.depStatus=="Stopped")
						  {
						  $('#stopDEPDiv').empty();
						  $('#startDEPDiv').empty();
	    	    	      $('#cancelDEPDiv').empty();
						  $('#startDEPDiv').append('<button  class="btn btn-alt-success" onclick="startdeb()" data-toggle="click-ripple">Start</button>');
	    	    	      $('#cancelDEPDiv').append('<button  class="btn btn-alt-danger"  onclick="canceldeb()" data-toggle="click-ripple">Cancel</button>');
						  }
					  else{
						  $('#stopDEPDiv').empty();
						  $('#startDEPDiv').empty();
	    	    	      $('#cancelDEPDiv').empty();
					       }
					 if(!responseData.dbEnabled)
					 {
						 $('#stopDEPDiv').empty();
						  $('#startDEPDiv').empty();
	    	    	      $('#cancelDEPDiv').empty();
					 }
					
                   var status= $('#'+depId).text().split(/\s+/)[2];
                
                   if(status !='In')
                	   {
                	   clearInterval(refreshIntervalId);
                	   $("#ref-dif option").removeAttr('selected', 'selected');
               		$("#ref-dif option[value=manual]").attr('selected', 'selected');
               		$("#stop").hide();
               		$("#now").show();
                	   }
                   else
                	   {  
                	   clearInterval(refreshIntervalId);
               		refreshIntervalId = setInterval(function(){Detail(deployId)}, 10000);
                	   $("#ref-dif option").removeAttr('selected', 'selected');
               		$("#ref-dif option[value=10]").attr('selected', 'selected');
               		$("#stop").show();
               		$("#now").hide();
                	   }
              	 if(!responseData.dbEnabled)
              		$("#refreshDiv").hide();
              	 else
              		$("#refreshDiv").show(); 
                              var isAnyND=false;
           	                  var readonly="";
                              if(!responseData.ownerLogedIn)
                                  readonly="disabled"; 
	    	    	$.each(responseData.deployReqFile, function(i, req) {		
	    	    		var scriptStatus="";
                        $('#credential').val(id+':'+depId+':'+req.dbId+':'+req.application);
                       if(req.status=='Not Deployed')
                    	   isAnyND=true;
	    	            	if(req.status=="Successful")
	    	        		    scriptStatus="<a href='DeployLog/"+req.depDeailId+"' target='_blank' class='badge badge-success'>"+req.status+"</a>";
	    	        		else if(req.status=="Needs Verification")	
	    	        		 	scriptStatus="<a href='DeployLog/"+req.depDeailId+"' target='_blank' class='badge badge-warning'>"+req.status+"</a>";
	    	        		else if(req.status=="Failed")	
	    	        			scriptStatus='<a href="DeployLog/'+req.depDeailId+'"  target="_blank" class="badge badge-danger">'+req.status+'</a>'; 
	    	        		else if(req.status=="Skipped")	
	 	    	        		scriptStatus='<a  class="badge badge-warning" style="color:#fff">'+req.status+'</a>'; 
	    	        	    else if(req.status=="Killed")	
	    	        	    	scriptStatus='<a href="DeployLog/'+req.depDeailId+'"  target="_blank" class="badge badge-info " style="color:#fff">'+req.status+'</a>'; 
	    	        	  	else if(req.status=="Deploying"){
	    	        	  		scriptStatus='<a ><i class="fa fa-2x fa-cog fa-spin text-primary"></i></a><br>'+
	        	    	    	'<button type="button"'+(responseData.ownerLogedIn?'onclick="killScript($(this))"  value="'+id+':'+depId+':'+req.dbId+':'+req.application+':'+req.fileName+':'+req.depDeailId+'" class="btn btn-sm btn-alt-danger text-right mt-10" '+readonly+'>Kill </button>':' value="'+id+':'+depId+':'+req.dbId+':'+req.application+':'+req.fileName+':'+req.depDeailId+'" class="btn btn-sm btn-alt-danger text-right mt-10" '+readonly+'>Deploying </button>');
	    	        	  	}
		 	    	    $("<tr>"+		
	    	    	     "<th style='min-width:200px; overflow:auto; font-weight:normal' class='table-scroll'><a href='StagedFile/"+req.depDeailId+"' target='_blank'>"+req.fileName+(req.wrapper?"<br><span style='color:#518a4c'> Wrapper Script</span>":"")+(req.stageNum!=null?"<br><span style='color:#bd3232'> Restage - "+req.stageNum+"</span>":"")+"</a></th>"+
	    	    	     "<th class='text-center'><span class='badge badge-primary'>"+req.un+"</span></th>"+
	    	    	     "<td style='min-width:200px; overflow:auto' class='table-scroll'>"+req.param+"</td>"+
	    	    	     "<td style='min-width: 86px;'>"+(req.continueOnError?"Continue":"Exit")+"</td>"+
	    	    	   (((req.un&&responseData.ownerLogedIn)&&(!responseData.requestClosed))?'<td class="text-center" style="height:40px;min-width: 270px;">'+
	    	    	    		 '<div class="input-group"><select class="form-control"  id="'+req.dbId+'__'+req.depDeailId+'__select" >'+
	    	    	   ((req.status!="Deploying")?
                            '<option value="cred" >Credential</option>':'')+
                       ((req.status!="Deploying")?
                            '<option value="dep">Deploy</option>':'')+
                       ((req.status!="Deploying")?
                            '<option value="RandDep">Restage and deploy</option>':'')+ 
                       ((req.status=="Failed"||req.status=="Needs Verification")?
                            '<option value="MAS">Mark as \'Successful\'</option>':'')+  
                       ((req.status=="Successful"||req.status=="Needs Verification"||req.status=="Killed"||req.status=="Issue External")?
                             '<option value="MAF">Mark as \'Failed\'</option>':'')+
                        ((req.status=="Not Deployed")?
                             '<option value="skip">Skip current deployment</option>':'')+              
                       '</select>'+
                       ' <div class="input-group-append">'+
                               '<button type="button" class="btn btn-alt-primary" value="'+id+':'+depId+':'+req.dbId+':'+req.application+':'+req.fileName+':'+req.depDeailId+'" args="'+req.param+'" onerror="'+req.continueOnError+'" onclick="doProcess($(this))">Submit</button>'+
                        '</div>'+
                       '</div>'+    
	    	    	    		'</td>':'<td></td>')+
	    	    	     "<td class='text-center'>"+scriptStatus+"</td>"+
	    	    	     "<td class='text-right' >"+req.elapsedTime+"</td>"+
	    	    	     "<td class='text-right' >"+req.depTime+"</td>"+
	    	    	     "<td class='text-center' >"+(req.osLogFileFound?"<a href='OsLog/"+req.depDeailId+"' target='_blank' class='badge badge-danger'>OS log</a>":" ")+"</td>"+
	    	    	     "<td class='text-center' >"+(req.exceptionLogFileFound?"<a href='ExceptionLog/"+req.depDeailId+"' target='_blank' class='badge badge-warning' style='background-color:#f1a564'>Exception log</a>":" ")+"</td>"+
	    	    	    "</tr>").appendTo($('#depDetail'));
	    	    	    
	    	    	    displaySpinner();
	    	    	    $("#data-loader1").hide();
	    	    	 
	    	    	    if((!responseData.ownerLogedIn&&!responseData.requestClosed))
	    	    	    	{
	    	    	    	$('#depDetail').find($('td:nth-child(5)')).empty();$('#thead').find($('th:nth-child(5)')).empty();
	    	    	    	$('#depDetail').find($('td:nth-child(5)')).hide();$('#thead').find($('th:nth-child(5)')).hide();
	    	    	    	}
	    	    	    else
	    	    	    	$('#depDetail').find($('td:nth-child(5),th:nth-child(5)')).show();
	    	    	
	    	    	    if(responseData.requestClosed||!responseData.dbEnabled||responseData.depStatus=="Awaiting Approval"||responseData.depStatus=="Cancelled")
    	    	    	{
	    	    	    $('#depDetail').find($('td:nth-child(5)')).empty();$('#thead').find($('th:nth-child(5)')).empty();
    	    	    	$('#depDetail').find($('td:nth-child(5)')).hide();$('#thead').find($('th:nth-child(5)')).hide();
    	    	    	}

	    	    		});
	    	    	
	    	    	if(responseData.rollbackReqFile.length==0)
	    	    		{
	    	    		$("#rollbacktitle").hide();
	    	    		$("#rollbacktable").hide();
	    	    		}
	    	    	else
	    	    		{
	    	    		$("#rollbacktitle").show();
	    	    		$("#rollbacktable").show();
	    	    		}
	    	    	$.each(responseData.rollbackReqFile, function(i, req) {		
	    	    		var scriptStatus="";
                       // $('#credential').val(id+':'+depId+':'+req.dbId+':'+req.application);
                       if(req.status=='Not Deployed')
                    	   isAnyND=true;
	    	            	if(req.status=="Successful")
	    	        		    scriptStatus="<a href='DeployLog/"+req.depDeailId+"' target='_blank' class='badge badge-success'>"+req.status+"</a>";
	    	        		else if(req.status=="Needs Verification")	
	    	        		 	scriptStatus="<a href='DeployLog/"+req.depDeailId+"' target='_blank' class='badge badge-warning'>"+req.status+"</a>";
	    	        		else if(req.status=="Failed")	
	    	        			scriptStatus='<a href="DeployLog/'+req.depDeailId+'"  target="_blank" class="badge badge-danger">'+req.status+'</a>'; 
	    	        		else if(req.status=="Skipped")	
	 	    	        		scriptStatus='<a  class="badge badge-warning" style="color:#fff">'+req.status+'</a>'; 
	    	        	    else if(req.status=="Killed")	
	    	        	    	scriptStatus='<a href="DeployLog/'+req.depDeailId+'"  target="_blank" class="badge badge-info " style="color:#fff">'+req.status+'</a>'; 
	    	        	  	else if(req.status=="Deploying"){
	    	        	  		scriptStatus='<a ><i class="fa fa-2x fa-cog fa-spin text-primary"></i></a><br>'+
	        	    	    	'<button type="button"'+(responseData.ownerLogedIn?'onclick="killScript($(this))"  value="'+id+':'+depId+':'+req.dbId+':'+req.application+':'+req.fileName+':'+req.depDeailId+'" class="btn btn-sm btn-alt-danger text-right mt-10" '+readonly+'>Kill </button>':' value="'+id+':'+depId+':'+req.dbId+':'+req.application+':'+req.fileName+':'+req.depDeailId+'" class="btn btn-sm btn-alt-danger text-right mt-10" '+readonly+'>Deploying </button>');
	    	        	  	}
		 	    	    $("<tr>"+		
	    	    	     "<th style='min-width:200px; overflow:auto; font-weight:normal' class='table-scroll'><a href='StagedFile/"+req.depDeailId+"' target='_blank'>"+req.fileName+(req.wrapper?"<br><span style='color:#518a4c'> Wrapper Script</span>":"")+(req.stageNum!=null?"<br><span style='color:#bd3232'> Restage - "+req.stageNum+"</span>":"")+"</a></th>"+
	    	    	     "<th class='text-center'><span class='badge badge-primary'>"+req.un+"</span></th>"+
	    	    	     "<td style='min-width:200px; overflow:auto' class='table-scroll'>"+req.param+"</td>"+
	    	    	     "<td style='min-width: 86px;'>"+(req.continueOnError?"Continue":"Exit")+"</td>"+
	    	    	   (((req.un&&responseData.ownerLogedIn)&&(!responseData.requestClosed))?'<td class="text-center" style="height:40px;min-width: 270px;">'+
	    	    	    		 '<div class="input-group"><select class="form-control"  id="'+req.dbId+'__'+req.depDeailId+'__select" >'+
	    	    	   ((req.status!="Deploying")?
                            '<option value="cred" >Credential</option>':'')+
                       ((req.status!="Deploying")?
                            '<option value="dep">Deploy</option>':'')+
                       ((req.status!="Deploying")?
                            '<option value="RandDep">Restage and deploy</option>':'')+ 
                       ((req.status=="Failed"||req.status=="Needs Verification")?
                            '<option value="MAS">Mark as \'Successful\'</option>':'')+  
                       ((req.status=="Successful"||req.status=="Needs Verification"||req.status=="Killed"||req.status=="Issue External")?
                             '<option value="MAF">Mark as \'Failed\'</option>':'')+
                        ((req.status=="Not Deployed")?
                             '<option value="skip">Skip current deployment</option>':'')+              
                       '</select>'+
                       ' <div class="input-group-append">'+
                               '<button type="button" class="btn btn-alt-primary" value="'+id+':'+depId+':'+req.dbId+':'+req.application+':'+req.fileName+':'+req.depDeailId+'" args="'+req.param+'" onerror="'+req.continueOnError+'" onclick="doProcess($(this))">Submit</button>'+
                        '</div>'+
                       '</div>'+    
	    	    	    		'</td>':'<td></td>')+
	    	    	     "<td class='text-center'>"+scriptStatus+"</td>"+
	    	    	     "<td class='text-right' >"+req.elapsedTime+"</td>"+
	    	    	     "<td class='text-right' >"+req.depTime+"</td>"+
	    	    	     "<td class='text-center' >"+(req.osLogFileFound?"<a href='OsLog/"+req.depDeailId+"' target='_blank' class='badge badge-danger'>OS log</a>":" ")+"</td>"+
	    	    	     "<td class='text-center' >"+(req.exceptionLogFileFound?"<a href='ExceptionLog/"+req.depDeailId+"' target='_blank' class='badge badge-warning' style='background-color:#f1a564'>Exception log</a>":" ")+"</td>"+
	    	    	    "</tr>").appendTo($('#rollDetail'));
	    	    	    
	    	    	    displaySpinner();
	    	    	    $("#data-loader2").hide();
	    	    	 
	    	    	    if(!responseData.ownerLogedIn&&!responseData.requestClosed)
	    	    	    	{
	    	    	    	$('#rollDetail').find($('td:nth-child(5)')).empty();$('#thead').find($('th:nth-child(5)')).empty();
	    	    	    	$('#rollDetail').find($('td:nth-child(5)')).hide();$('#thead').find($('th:nth-child(5)')).hide();
	    	    	    	}
	    	    	    else
	    	    	    	$('#rollDetail').find($('td:nth-child(5),th:nth-child(5)')).show();
	    	    	    if(responseData.requestClosed||!responseData.dbEnabled||responseData.depStatus=="Awaiting Approval"||responseData.depStatus=="Cancelled")
    	    	    	{
	    	    	    $('#rollDetail').find($('td:nth-child(5)')).empty();$('#thead').find($('th:nth-child(5)')).empty();
    	    	    	$('#rollDetail').find($('td:nth-child(5)')).hide();$('#thead').find($('th:nth-child(5)')).hide();
    	    	    	}

	    	    		});
	    	    	
	    	    	if(!isAnyND)
	    	    		{
	    	    		  $('#stopDEPDiv').empty();
						  $('#startDEPDiv').empty();
	    	    	      $('#cancelDEPDiv').empty();
	    	    		}
	    	    	 if(!responseData.ownerLogedIn)
					 {
					    $('#stopDEPDiv').empty();
    	    	    	$('#startDEPDiv').empty();
    	    	    	$('#cancelDEPDiv').empty();
					 }  
	    	    		 }).fail(function() {

	    	    });
	    	    };

 function rollbackDetails(depId)
{
	   $.ajax({ 
	        url: 'rollbackFiles?depId='+depId,
	        data: {},
	        type: 'get'
	    }).done(function(responseData) {
	    	if(responseData.length>0)
	    		{
	    		$("#rollbackdatatitle").show();
	    		$("#rollbackdatadiv").show();
	    		$("#rollbackdatadiv1").show();
	    	$('#rollbackdatadiv').empty();
	    	$('#rollbackdatadiv').append('<div class="table-responsive"><button class="btn btn-alt-success js-click-ripple-enabled pull-right" onclick="startrollback();" id="startRoll" data-toggle="click-ripple" style="overflow: hidden; position: relative; z-index: 1;margin-bottom:10px;">Rollback Selected</button><button class="btn btn-alt-danger js-click-ripple-enabled pull-right" id="credRoll" onclick="provifecredforroll();" data-toggle="click-ripple" style="overflow: hidden; position: relative; z-index: 1;margin-bottom:10px;margin-right: 5px;">Credential</button><table class="table table-bordered table-vcenter xs-width-1000" id="rollback_'+depId+'sort">'+
			'<thead><tr>'+
			'<th class="text-center" style="width: 5%;"><label class="css-control css-control-sm css-control-primary css-checkbox"><input type="checkbox" class="css-control-input"  onclick="togglecheckbox(this);"><span class="css-control-indicator"></span></label></th>'+
			'<th class="text-center" style="width: 5%;">Sort</th>'+
			'<th class="text-left" style="min-width: 10%;">Script Name</th>'+
			'<th  style="display:none;width:0px">Delegated</th>'+
			'<th style="display:none;width:0px">saved</th>'+
			'<th class="text-center" style="width: 17%;">User Name</th>'+
			'<th class="text-left" style="display:none;width:0px">Password</th>'+
			'<th class="text-left" style="width: 22%;">parameters</th>'+ 
			'<th class="text-left" style="width: 15%;">Error Handling</th>'+
			'</tr></thead>'+
			'<tbody id="rollbacktbody"></tbody>'+
			'</table></div>');
	    	$.each(responseData, function(i, req) {	
	    		$('#rollbacktbody').append('<tr class="ui-state-default" id="rollback_'+depId+'_'+i+'">'+
				'<td class="font-w600 text-center" ><label class="css-control css-control-sm css-control-primary css-checkbox"><input type="checkbox" class="css-control-input" name="RollbackList" id="ischecked_'+i+'" ><span class="css-control-indicator"></span></label></td>'+
				'<td class="font-w600 text-center" ><i class="si si-cursor-move"></i></td>'+
				'<td style="max-width:200px; overflow:auto" class="table-scroll"><input type="hidden" readonly name="files" id="rollback_fn_'+i+'" value="'+req+'"><a href="Rollbackfile/'+id+'?filename='+req+'" target="_blank" style="color: #324a7e">'+req+'</a></td>'+
				'<td id="rollback_delegate_'+i+'" name="rollback_'+depId+'_Delegated" class="rollbackdelegated" style="display:none;width:0px"></td>'+
				'<td id="rollback_saved_'+i+'" name="rollback_'+depId+'_saved" class="rollbacksaved" style="display:none;width:0px"></td>'+
				'<td class="text-center">'+
				      '<button type="button" class="tdusername badge badge-primary" name="rollback_'+depId+'_selecteduser" depid="'+depId+'" class="rollbackun" id="rollback_un_'+i+'" onclick="changeUNandPWForSingleRollbackFile($(this))" style="border:none; cursor:pointer"></button>'+
				'</td>'+
				'<td class="text-center" style="display:none;width:0px">'+
			      '<input type="text" class="form-control" name="rollback_'+depId+'_selecteduserpass" class="rollbackpass" id="rollback_pw_'+i+'" readonly >'+
			    '</td>'+
				'<td class="text-center"><textarea class="form-control" id="rollback_param_'+i+'" name="parameters" placeholder="Type Parameters"></textarea></td>'+
				'<td class="text-center">'+   
				   '<select class="form-control" name="onError" id="rollback_err_'+i+'">'+
				       '<option value="false" selected>Exit On Error</option>'+
				       '<option value="true">Continue On Error</option></select>'+
				'</td>'+
				'</tr>');
	    		  $('#rollback_'+depId+'sort tbody').sortable({
	        		 helper: fixHelperModified,
	        		 cursor: "move",
	            	  stop: updateIndex,
	            	  placeholder: "placeholder-style",
	            	  start  : function(event, ui){
	            		  	$(this).find('.placeholder-style  td:nth-child(4)').css('display', 'none')
	            		  	$(this).find('.placeholder-style  td:nth-child(5)').css('display', 'none')
	            		  	$(this).find('.placeholder-style  td:nth-child(7)').css('display', 'none')
	            	        $(ui.helper).addClass("ui-helper");
	            	        ui.helper.css('display', 'table');
	            	    }
	            	}).disableSelection(); 

	    		});
	    		}
	    	else
	    		{
	    		$("#rollbackdatatitle").hide();
	    		$("#rollbackdatadiv").hide();
	    		$("#rollbackdatadiv1").hide();
	    		}
	    }).fail(function(){
	    	
	    }); 
} 
 function startrollback()
 {
	 var submit=false;
	 $.each($("#rollbacktbody").find('.tdusername') , function() { 
		 if($(this).text().length > 0)
			 submit=true;
		 else
			 submit=false;
	 });
	 if(submit==false)
		 {
    	 $('#status').text('Please provide credentials to use for this rollback.');
         $('#myModal').modal('show');
         return;
		 }
	 if($("#rollbacktbody").find('input[type=checkbox]:checked').length==0)
		 {
    	 $('#status').text('Please select atleast one file to rollback.');
         $('#myModal').modal('show');
         return;
		 }
	 if(submit==true&&$("#rollbacktbody").find('input[type=checkbox]:checked').length>0)
		 {
		  var totaldata={"deploymentId":deployId,"rollReqfiles":[]};
				var dbid=deployId;
				$('#rollbacktbody > tr').each(function()
				{ 
					var id=$(this).attr("id");
				   	var i=id.split("_")[2];
					if($("#ischecked_"+i).is(':checked'))
						{
					var fn=$(this).find('#rollback_fn_'+i).val();
				    var delegated=$(this).find('#rollback_delegate_'+i).html();
				    var saved=$(this).find('#rollback_saved_'+i).html();
				    var un=$(this).find('#rollback_un_'+i).text();
				    var pass=$(this).find('#rollback_pw_'+i).val();
				    var param=$(this).find('#rollback_param_'+i).val();
				    var err=$(this).find('#rollback_err_'+i).val();
					var inner={fileName:fn,delegated:delegated,saved:saved,un:un,pass:pass,err:err,param:param};
					totaldata.rollReqfiles.push(inner);	
						}
				});
		  send(totaldata);
		 }
 }
function send(data)
{
		//console.log(data)
 		$.ajax({
		        type : "POST",
		        url : "submitandstartrollbackFiles",
		        data : JSON.stringify(data),
		        contentType: "application/json"
		       }).done(function(responseData) {		    	 
		        	Detail(deployId);
		       }).fail(function() {
		          console.log('Failed');
		          $('#status').text("There is some network issue.Please check your internet access.");
		 	           $('#myModal').modal('show');
		      }); 
}
	
 function provifecredforroll()
 {
	 var dbid=deployId;
	 $.ajax({ 
         url: 'listDelegatePasswordDeploymentforRollback',
         data: {dpId: deployId,'${_csrf.parameterName}':'${_csrf.token}'},
         type: 'post'
     }).done(function(responseData) {
     	 
        var str='';
     	$.each(responseData, function(i, obj) {
     		str += '<option value='+obj.userName+'>'+obj.userName+'</option>';
    	    });	
    	$('#changeUN').empty();
    	$('#changeUN').append('<div class="modal-dialog" id="model_'+dbid+'"><div class="modal-content">'+
    			'<div class="modal-header block-header block-header-default">'+
    			'<h4 class="col-md-12 pl-0 pr-0 block-title" id="myModalLabel">Credential for rollback <br> </h4>'+
    			  '</div><div class="modal-body">'+
    			          '<div class="displayJqueryModel">'+
    			             '<div class="row width-100">'+
    			               '<div class=" block-header">'+
    			     '<select class="form-control mySelect" name="credential" onchange="changeCredentialViewModelforRollback('+dbid+',$(this));">'+
    			  		    '<option value="delegated" selected>Delegated Credential</option>'+ 
    			    		 '<option value="saved" >Saved Credential</option>'+
    			    		'<option value="credential" >Enter Credential</option>'+
    			    '</select>'+ 
    			    '</div></div>'+
    			    '<div class="">'+
    			    '<div class="">'+
    			       '<div class="form-group" id="owncredentialdivModel" style="display: none;">'+
    			        '<div class="mb-20"><label >User Name</label>'+
    			          '<input type="text" class="form-control" name="uname_model" placeholder="User Name">'+
    			        '</div>'+
    			         '<div class="mb-20"><label>Password</label>'+
    			         '<input type="password" class="form-control" name="upass_model">'+
    			         '</div><button type="button" class="btn btn-alt-primary" onclick="validateUNandPWModelForRollback('+dbid+')">Validate & Submit</button>'+
    			       '</div>'+
    			       '<div class="form-group" id="delegatedcredentialdivModel" >'+
    			          '<div class="mb-20"><label >User Name</label>'+
    			               '<select class="form-control"  name="DelegateCredentialUNModel"></select></div>'+
    			               '<button type="button" class="btn btn-alt-primary" onclick="validateDelegateModelForRollback('+dbid+')">Validate & Submit</button>'+
    			          '</div>'+
    			          '<div class="form-group" id="savedcredentialdivModel" style="display: none;"><div class="mb-20"><label>User Name</label>'+
    		    			'<select class="form-control" name="savedCredentialSelectModel"></select></div>'+
    		    			'<button type="button" class="btn btn-alt-primary" onclick="validateSavedModelForRollback('+dbid+')">Validate & Submit</button>'+
    		    			'</div>'
    			          +  
    			          '</div></div></div></div>'+
    			    '<div class="modal-footer">'+
    			    '<button type="button" class="btn btn-alt-danger" data-dismiss="modal">Close</button>'+
    			    '</div></div>');
     	$('#model_'+dbid).find("[name='DelegateCredentialUNModel']").empty();
    	$('#model_'+dbid).find("[name='DelegateCredentialUNModel']").append(str);
     	$('#changeUN').modal('show');
      }).fail(function() {
     	 
         console.log('Failed');
         $('#status').text("There is some network issue.Please check your internet access.");
	           $('#myModal').modal('show');
     }); 
 }
 
 function changeUNandPWForSingleRollbackFile(e)
 {
 	  $("#preloader").show();
 	var dbid=e.attr('depid');
 	var trid=e.attr('id').split("rollback_un_")[1];

	 $.ajax({ 
        url: 'listDelegatePasswordDeploymentforRollback',
        data: {dpId: deployId,'${_csrf.parameterName}':'${_csrf.token}'},
        type: 'post'
    }).done(function(responseData) {
    	 
       var str='';
    	$.each(responseData, function(i, obj) {
    		str += '<option value='+obj.userName+'>'+obj.userName+'</option>';
   	    });	
    	$('#changeUN').empty();
   	$('#changeUN').append('<div class="modal-dialog" id="model_'+dbid+'"><div class="modal-content">'+
   			'<div class="modal-header block-header block-header-default">'+
   			'<h4 class="col-md-12 pl-0 pr-0 block-title" id="myModalLabel">Credential for rollback <br> </h4>'+
   			  '</div><div class="modal-body">'+
   			          '<div class="displayJqueryModel">'+
   			             '<div class="row width-100">'+
   			               '<div class=" block-header">'+
   			     '<select class="form-control mySelect" name="credential" onchange="changeCredentialViewModelforRollback('+dbid+',$(this));">'+
   			  		    '<option value="delegated" selected>Delegated Credential</option>'+ 
   			    		 '<option value="saved" >Saved Credential</option>'+
   			    		'<option value="credential" >Enter Credential</option>'+
   			    '</select>'+ 
   			    '</div></div>'+
   			    '<div class="">'+
   			    '<div class="">'+
   			       '<div class="form-group" id="owncredentialdivModel" style="display: none;">'+
   			        '<div class="mb-20"><label >User Name</label>'+
   			          '<input type="text" class="form-control" name="uname_model" placeholder="User Name">'+
   			        '</div>'+
   			         '<div class="mb-20"><label>Password</label>'+
   			         '<input type="password" class="form-control" name="upass_model">'+
   			         '</div><button type="button" class="btn btn-alt-primary" onclick="validateUNandPWModelForRollbackSingleFile('+dbid+','+trid+')">Submit</button>'+
   			       '</div>'+
   			       '<div class="form-group" id="delegatedcredentialdivModel" >'+
   			          '<div class="mb-20"><label >User Name</label>'+
   			               '<select class="form-control"  name="DelegateCredentialUNModel"></select></div>'+
   			               '<button type="button" class="btn btn-alt-primary" onclick="validateDelegateModelForRollbackSingleFile('+dbid+','+trid+')">Submit</button>'+
   			          '</div>'+
   			          '<div class="form-group" id="savedcredentialdivModel" style="display: none;"><div class="mb-20"><label>User Name</label>'+
   		    			'<select class="form-control" name="savedCredentialSelectModel"></select></div>'+
   		    			'<button type="button" class="btn btn-alt-primary" onclick="validateSavedModelForRollbackSingleFile('+dbid+','+trid+')">Submit</button>'+
   		    			'</div>'
   			          +  
   			          '</div></div></div></div>'+
   			    '<div class="modal-footer">'+
   			    '<button type="button" class="btn btn-alt-danger" data-dismiss="modal">Close</button>'+
   			    '</div></div>');
   	$('#changeUN').modal('show');
    	$('#model_'+dbid).find("[name='DelegateCredentialUNModel']").empty();
   	$('#model_'+dbid).find("[name='DelegateCredentialUNModel']").append(str);
     }).fail(function() {
    	 
        console.log('Failed');
        $('#status').text("There is some network issue.Please check your internet access.");
	           $('#myModal').modal('show');
    }); 
 }
 
 
 function changeCredentialViewModelforRollback(e, t) {
		var selected=t.val();	

	    if (selected=='credential')
	    {
	     $('#model_'+e).find('#delegatedcredentialdivModel').hide();
	     $('#model_'+e).find('#owncredentialdivModel').show();
	     $('#model_'+e).find('#savedcredentialdivModel').hide();
	    }
	    else if (selected=='saved')
	    {
	    	
	   	 $.ajax({ 
	         url: 'listOwnCredentialDeploymentForRollback',
	         data: {dpid: e,'${_csrf.parameterName}':'${_csrf.token}'},
	         type: 'post'
	     }).done(function(responseData) { 
	    	 
	        var str='';
	     	$.each(responseData, function(i, obj) {
	     		str += '<option value='+obj.userName+'>'+obj.userName+'</option>';
	    	    });
	     	$('#model_'+e).find("[name='savedCredentialSelectModel']").empty();
	    	$('#model_'+e).find("[name='savedCredentialSelectModel']").append(str);
	      }).fail(function() {
	    	  
	         console.log('Failed');
	         $('#status').text("There is some network issue.Please check your internet access.");
		           $('#myModal').modal('show');
	     });
	    	 $('#model_'+e).find('#savedcredentialdivModel').show();
	    	 $('#model_'+e).find('#delegatedcredentialdivModel').hide();
	         $('#model_'+e).find('#owncredentialdivModel').hide();
	    }
	    else
	    	{
	    	
	    	 $.ajax({ 
	             url: 'listDelegatePasswordDeploymentforRollback',
	             data: {dpId: e,'${_csrf.parameterName}':'${_csrf.token}'},
	             type: 'post'
	         }).done(function(responseData) {
	        	 
	            var str='';
	         	$.each(responseData, function(i, obj) {
	         		str += '<option value='+obj.userName+'>'+obj.userName+'</option>';
	        	    });
	         	$('#model_'+e).find("[name='DelegateCredentialUNModel']").empty();
	        	$('#model_'+e).find("[name='DelegateCredentialUNModel']").append(str);
	          }).fail(function() { 
	             console.log('Failed');
	             $('#status').text("There is some network issue.Please check your internet access.");
	 	           $('#myModal').modal('show');
	         });
	    	 $('#model_'+e).find('#delegatedcredentialdivModel').show();
	         $('#model_'+e).find('#owncredentialdivModel').hide();
	         $('#model_'+e).find('#savedcredentialdivModel').hide();
	    	}
	}  
 
 
 function validateUNandPWModelForRollbackSingleFile(depid,trid)
 { 
	  var id=depid;
 	var uname = $('#model_'+id).find("[name='uname_model']").val();
 	var upass = $('#model_'+id).find("[name='upass_model']").val();
     if(( !uname == "" && uname.length>1) && (!upass == "" && upass.length>1)){	
   	 
         $.ajax({ 
             url: 'validate_db_rollback',
             data: {id: id,uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
             type: 'post'
         }).done(function(responseData) { 
            if(responseData=='Success'){
            	 $.ajax({ 
                     url: 'pass_to_encoder',
                     data: {upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
                     type: 'post'
                 }).done(function(responseData1)
              		   {
            	 $('#changeUN').modal('hide');
            	 $('#status').text('Validation successful!');
                 $('#myModal').modal('show');
                 $('#rollbacktbody').find("[id='rollback_delegate_"+trid+"']").html('false');
                 $('#rollbacktbody').find("[id='rollback_saved_"+trid+"']").html('false');
                 $('#rollbacktbody'). find("[id='rollback_un_"+trid+"']").show();
                 $('#rollbacktbody').find("[id='rollback_un_"+trid+"']").html(uname);
                 $('#rollbacktbody').find("[id='rollback_pw_"+trid+"']").val(responseData1);
              		   }).fail(function() {
              			 $('#changeUN').modal('hide');
                            console.log('Failed');
                           $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
                            $('#status').text("There is some network issue.Please check your internet access.");
            	           $('#myModal').modal('show');
                    });
   
            }
            else
     	   {
            $('#status').text(responseData);
            $('#changeUN').modal('hide');
            $('#myModal').modal('show');
     	   }
          }).fail(function() {
             console.log('Failed');
             $('#status').text("There is some network issue.Please check your internet access.");
 	           $('#myModal').modal('show');
         });
      }
     else
     	{
     	 $('#status').text("Please fill username and password field.");
          $('#myModal').modal('show');
     	} 
 }
 
 
 function validateUNandPWModelForRollback(depid)
 {  var id=depid;
 	var uname = $('#model_'+id).find("[name='uname_model']").val();
 	var upass = $('#model_'+id).find("[name='upass_model']").val();
     if(( !uname == "" && uname.length>1) && (!upass == "" && upass.length>1)){	
   	 
         $.ajax({ 
             url: 'validate_db_rollback',
             data: {id: id,uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
             type: 'post'
         }).done(function(responseData) { 
            if(responseData=='Success'){
            	 $.ajax({ 
                     url: 'pass_to_encoder',
                     data: {upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
                     type: 'post'
                 }).done(function(responseData1)
              		   {
            	 $('#changeUN').modal('hide');
            	 $('#status').text('Validation successful!');
                 $('#myModal').modal('show');
                 $('#rollbacktbody').find("[name='rollback_"+id+"_Delegated']").html('false');
                 $('#rollbacktbody').find("[name='rollback_"+id+"_saved']").html('false');
                 $('#rollbacktbody'). find("[name='rollback_"+id+"_selecteduser']").show();
                 $('#rollbacktbody').find("[name='rollback_"+id+"_selecteduser']").html(uname);
                 $('#rollbacktbody').find("[name='rollback_"+id+"_selecteduserpass']").val(responseData1);
              		   }).fail(function() {
              			 $('#changeUN').modal('hide');
                            console.log('Failed');
                           $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
                            $('#status').text("There is some network issue.Please check your internet access.");
            	           $('#myModal').modal('show');
                    });
   
            }
            else
     	   {
            $('#status').text(responseData);
            $('#changeUN').modal('hide');
            $('#myModal').modal('show');
     	   }
          }).fail(function() {
             console.log('Failed');
             $('#status').text("There is some network issue.Please check your internet access.");
 	           $('#myModal').modal('show');
         });
      }
     else
     	{
     	 $('#status').text("Please fill username and password field.");
          $('#myModal').modal('show');
     	}
 }
 
 
 function validateDelegateModelForRollbackSingleFile(depid,trid)
 {
 	var id=depid;
 	var uname = $('#model_'+id).find("[name='DelegateCredentialUNModel']").val();
     if( !uname == "" && uname.length>1){	
         $.ajax({ 
             url: 'validateDelegate_rollback',
             data: {id: id,uname:uname,'${_csrf.parameterName}':'${_csrf.token}'},
             type: 'post'
         }).done(function(responseData) { 
         	 var toSplit = responseData.split(","); 
            if(toSplit[0]=='Success'){
            	   $('#status').text('Validation successful!');
                   $('#changeUN').modal('hide');
                   $('#myModal').modal('show');
                   $('#rollbacktbody').find("[id='rollback_delegate_"+trid+"']").html('true');
                   $('#rollbacktbody').find("[id='rollback_saved_"+trid+"']").html('false');
                   $('#rollbacktbody'). find("[id='rollback_un_"+trid+"']").show();
                   $('#rollbacktbody').find("[id='rollback_un_"+trid+"']").html(uname);
                   $('#rollbacktbody').find("[id='rollback_pw_"+trid+"']").val("");
            }
            else
         	   { 
                $('#status').text(responseData);
                $('#changeUN').modal('hide');
                $('#myModal').modal('show');
         	   }
          }).fail(function() {
             $('#status').text("There is some network issue.Please check your internet access.");
 	           $('#myModal').modal('show');
         });
      }
     else
     	{
     	 $('#status').text("Please fill username and password field.");
          $('#myModal').modal('show');
     	}
 }
 
 function validateDelegateModelForRollback(depid)
 {
 	var id=depid;
 	var uname = $('#model_'+id).find("[name='DelegateCredentialUNModel']").val();
     if( !uname == "" && uname.length>1){	
         $.ajax({ 
             url: 'validateDelegate_rollback',
             data: {id: id,uname:uname,'${_csrf.parameterName}':'${_csrf.token}'},
             type: 'post'
         }).done(function(responseData) { 
         	 var toSplit = responseData.split(","); 
            if(toSplit[0]=='Success'){
            	   $('#status').text('Validation successful!');
                   $('#changeUN').modal('hide');
                   $('#myModal').modal('show');
                   $('#rollbacktbody').find("[name='rollback_"+id+"_Delegated']").html('true');
                   $('#rollbacktbody').find("[name='rollback_"+id+"_saved']").html('false');
                   $('#rollbacktbody'). find("[name='rollback_"+id+"_selecteduser']").show();
                   $('#rollbacktbody').find("[name='rollback_"+id+"_selecteduser']").html(uname);
            }
            else
         	   { 
                $('#status').text(responseData);
                $('#changeUN').modal('hide');
                $('#myModal').modal('show');
         	   }
          }).fail(function() {
             $('#status').text("There is some network issue.Please check your internet access.");
 	           $('#myModal').modal('show');
         });
      }
     else
     	{
     	 $('#status').text("Please fill username and password field.");
          $('#myModal').modal('show');
     	}
 }
 
 function validateSavedModelForRollbackSingleFile(depid,trid)
 {
 	var id=depid;
 	var uname = $('#model_'+id).find("[name='savedCredentialSelectModel']").val();
    if( !uname == "" && uname.length>1){	
  	 
        $.ajax({ 
            url: 'validateSavedRollback',
            data: {id: id,uname:uname,'${_csrf.parameterName}':'${_csrf.token}'},
            type: 'post'
        }).done(function(responseData) { 
     		 var toSplit = responseData.split(","); 
           if(toSplit[0]=='Success'){
        	   $('#changeUN').modal('hide');
        	   $('#status').text('Validation successful!');
               $('#myModal').modal('show');
               $('#rollbacktbody').find("[id='rollback_delegate_"+trid+"']").html('false');
               $('#rollbacktbody').find("[id='rollback_saved_"+trid+"']").html('true');
               $('#rollbacktbody'). find("[id='rollback_un_"+trid+"']").show();
               $('#rollbacktbody').find("[id='rollback_un_"+trid+"']").html(uname);
               $('#rollbacktbody').find("[id='rollback_pw_"+trid+"']").val("");
               
           }else
         	  {
           	  $('#status').text(responseData);
           	  $('#changeUN').modal('hide');
               $('#myModal').modal('show');
         	  }
         }).fail(function() {
            $('#status').text("There is some network issue.Please check your internet access.");
 	           $('#myModal').modal('show');
        });
     }
    else
    	{
    	 $('#status').text("Please fill username and password field.");
         $('#myModal').modal('show');
    	}
 }
 
 function validateSavedModelForRollback(depid)
 {
 	var id=depid;
 	var uname = $('#model_'+id).find("[name='savedCredentialSelectModel']").val();
    if( !uname == "" && uname.length>1){	
  	 
        $.ajax({ 
            url: 'validateSavedRollback',
            data: {id: id,uname:uname,'${_csrf.parameterName}':'${_csrf.token}'},
            type: 'post'
        }).done(function(responseData) { 
     		 var toSplit = responseData.split(","); 
           if(toSplit[0]=='Success'){
        	   $('#changeUN').modal('hide');
        	   $('#status').text('Validation successful!');
               $('#myModal').modal('show');
               
               $('#rollbacktbody').find("[name='rollback_"+id+"_Delegated']").html('false');
               $('#rollbacktbody').find("[name='rollback_"+id+"_saved']").html('true');
               $('#rollbacktbody'). find("[name='rollback_"+id+"_selecteduser']").show();
               $('#rollbacktbody').find("[name='rollback_"+id+"_selecteduser']").html(uname);
           }else
         	  {
           	  $('#status').text(responseData);
           	  $('#changeUN').modal('hide');
               $('#myModal').modal('show');
         	  }
         }).fail(function() {
            $('#status').text("There is some network issue.Please check your internet access.");
 	           $('#myModal').modal('show');
        });
     }
    else
    	{
    	 $('#status').text("Please fill username and password field.");
         $('#myModal').modal('show');
    	}
 }
 
 
 
 function hideError(){
	 $("#error1div1").hide();
	 $("#error1div2").hide();
	 $("#error1div3").hide();
 }
 
 
 function restageAndDeployGetCommit(depDetid,repo)
 { 
	 $('#commitlabel').hide();
	 $('#commitdiv1').hide();
	 $('#commitdiv2').hide();	 
	 $("#error1div1").hide();
	 $("#error1div2").hide();
	 $("#error1div3").hide();
	 $('#selectedCommit').empty();
		$('<option></option>').appendTo($('#selectedCommit'));
        $.ajax({ 
            url: 'restageAndDeployGetCommit',
            data: {depDetid: depDetid,branch: repo,'${_csrf.parameterName}':'${_csrf.token}'},
            type: 'post'
        }).done(function(responseData) {
        	if(responseData.externalRepo)
        		{
        		 $('#commitlabel').show();
        		 $('#commitdiv1').show();
        		 $('#commitdiv2').show();	
        		$.each(responseData.dto, function(i, data) {
      	 			$('<option value="'+data.commitID +'">'+data.commitID.substring(10, data.commitID.length)+' - '+data.commitMsg+' - '+data.commiter+'</option>').appendTo($('#selectedCommit'));
        		})
        		}
         }).fail(function() {
            $('#status').text("There is some issue.Please contact your administrator.");
 	           $('#myModal').modal('show');
        }); 
 }
 function selectCommit(){
	  var depDet=$('#myModal12').find('#depDetId').val(); 
	  var repo=$('#myModal12').find('#branchRepo').val();
	  restageAndDeployGetCommit(depDet,repo);
 }
 
 function restageAndDeployGetBranch(repo)
 { 
	 $('#branchlabel').hide();
	 $('#branchdiv1').hide();
	 $('#branchdiv2').hide();	 
	 $("#error1div1").hide();
	 $("#error1div2").hide();
	 $("#error1div3").hide();
	  
	 $('#branchRepo').empty();
		$('<option></option>').appendTo($('#branchRepo'));
        $.ajax({ 
            url: 'getBranchesDeployment',
            data: {repo: repo,'${_csrf.parameterName}':'${_csrf.token}'},
            type: 'post'
        }).done(function(responseData) {
        	  if(!responseData.repoExist&&responseData.externalRepo){
        		  $('#myModal12').modal('hide');
        		  $('#textForDialog').text('Are you sure you want to clone this repo?'); 
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
        		    	                    $(this).dialog("close");
        		    	                	//var repo=$("#SelectedRepo").val();
        		    	              	 	getData(repo);
        		    	               }
        		    	           },
        		    	           {
        		    	               text: "Cancel",
        		    	               "class": ' btn btn-sm btn-alt-danger',
        		    	               click: function() {
        		    	            	   location.reload(true);
        		    	            	   $(this).dialog("close");
        		    	               }
        		    	           }
        		    	 ]	
        		    }); 
        	  }
        	  if(responseData.repoExist&&responseData.externalRepo){
        		  updateTouchCount(repo);
        	  }
        	if(responseData.externalRepo)
        		{
        		 $('#branchlabel').show();
        		 $('#branchdiv1').show();
        		 $('#branchdiv2').show();	
        		$.each(responseData.branchListSet, function(i, data) {
      	 			$('<option value="'+data+'">'+data+'</option>').appendTo($('#branchRepo'));
        		})
        		}
         }).fail(function() {
            $('#status').text("There is some issue.Please contact your administrator.");
 	           $('#myModal').modal('show');
        }); 
 }
 
 
 
function doProcess(e)
	    	  {
	    		    var value=e.val();
	    		   	var reqid=value.split(":")[0];
	    		 	var depid=value.split(":")[1];
	    		 	var dbid=value.split(":")[2];
	    		 	var repo=value.split(":")[3];
	    		 	var fileName=value.split(":")[4];
	    		 	var depDetid=value.split(":")[5];
	    		    var val1=$('#'+dbid+'__'+depDetid+'__select').val();
	    		    var args=e.attr("args");
	    		    var onError=e.attr("onerror");
	    		    
	    		     $('#commitlabel').hide();
	    			 $('#commitdiv1').hide();
	    			 $('#commitdiv2').hide();
	    			 $('#branchlabel').hide();
	    			 $('#branchdiv1').hide();
	    			 $('#branchdiv2').hide();	
	    			 
	    		  if(val1=='cred')
	    			  changeUNandPWForSingleFile(e);
	    		  else if(val1=='dep')
	    			  {
	    			  $('#myModal12').find('#headerr').empty().append("Deploy script - "+fileName);
	    			  $('#myModal12').find('#argAdd').empty().val(args);	  
	    			  if(onError=='true')
	    				  {
	    				  $('#myModal12').find('#continue').prop('checked', true);
	    				  $('#myModal12').find('#exit').prop('checked', false);
	    				  }
	    			  else
	    				  {
	    				  $('#myModal12').find('#continue').prop('checked', false);
	    				  $('#myModal12').find('#exit').prop('checked', true);
	    				  }
	    			  $('#myModal12').find('#subtbtn').text('Deploy');
	    			  $('#myModal12').find('#subtbtn').show();
	    			  $('#myModal12').find('#reStagesubtbtn').hide();
	    			  
	    			  $('#myModal12').find('#depDetId').val(depDetid);
	    			  $('#myModal12').modal('show');
	    			
	    			  }
	    		  else if(val1=='RandDep')
	    			  {
	    			  $('#myModal12').find('#headerr').empty().append("Restage & Deploy script - "+fileName);
	    			  $('#myModal12').find('#argAdd').empty().val(args);
	    			  
	    			  restageAndDeployGetBranch(repo);
	    			  if(onError=='true')
	    				  {
	    				  $('#myModal12').find('#continue').prop('checked', true);
	    				  $('#myModal12').find('#exit').prop('checked', false);
	    				  }
	    			  else
	    				  {
	    				  $('#myModal12').find('#continue').prop('checked', false);
	    				  $('#myModal12').find('#exit').prop('checked', true);
	    				  }
	    			  $('#myModal12').find('#reStagesubtbtn').text('Restage & Deploy');
	    			  $('#myModal12').find('#subtbtn').hide();
	    			  $('#myModal12').find('#reStagesubtbtn').show();
	    			  $('#myModal12').find('#depDetId').val(depDetid);
	    			  $('#myModal12').modal('show');  
	    			  }
	    		  else if(val1=='MAS')
	    			  {
	    			   $.ajax({ 
		    		        url: 'changeStatus?depDetId='+depDetid+'&status=Successful',
		    		        type: 'get'
		    		    }).done(function(responseData) {
		    		    	Detail(deployId);
		    		    		 }).fail(function() {
		    		    			 
		    		    }); 
	    			  }
	    		  else if(val1=='MAF')
    			  {
    			   $.ajax({ 
	    		        url: 'changeStatus?depDetId='+depDetid+'&status=failed',
	    		        type: 'get'
	    		    }).done(function(responseData) {
	    		    	Detail(deployId);
	    		    		 }).fail(function() {
	    		    			 
	    		    }); 
    			  }
	    		  else if(val1=='skip')
    			  {
    			   $.ajax({ 
	    		        url: 'changeStatus?depDetId='+depDetid+'&status=Skip',
	    		        type: 'get'
	    		    }).done(function(responseData) {
	    		    	Detail(deployId);
	    		    		 }).fail(function() {
	    		    			 
	    		    }); 
    			  }	  
	    	  }
	    	    
 // changeOwnerShip 
 $("#changeOwnerShip").click(function() {
	    $.ajax({ 
	    url: 'ownerListForThisDep?depId='+deployId,
	     type: 'get'
	    }).done(function(responseData) { 
	    	$('#ownCredMyselfModel').find('#tbody').empty();
	    	$.each(responseData, function(i, req) {
	    		$('<tr><td>'+req.firstName+' '+req.lastName+' - '+req.email+'</td>'      
	    		       +'<td class="text-right">'+req.timestamp+'</td>'+'<td class="text-center">'+ 
	    		      (req.live?"<span class='badge badge-success'>YES</span>":"<span class='badge badge-danger'>NO</span>")+'</td></tr>').appendTo($('#ownCredMyselfModel').find('#tbody'));
	    		
	    	});
	       	
	    	$('#ownCredMyselfModel').modal('show');
	    }).fail(function() {
	    	 
	    }); 
	    
	 });


 function approve() {
	$("#preloader").show();
	  $.ajax({ 
	    url: 'approve?depId='+deployId,
	     type: 'get'
	     }).done(function(responseData) {
	    	Detail(deployId);
	    	
	    }).fail(function() {
	    	
	   }); 
 }

	    	    
 $("#subtbtn").click(function() {
	     var depDetId= $('#myModal12').find('#depDetId').val();
	     var args=$('#myModal12').find('#argAdd').val();
	     var onError=$('#myModal12').find('input[name=onError]:checked').val();	 
		 $('#myModal12').modal('hide');  
	    
	    	    $.ajax({ 
		        url: 'deployDetailWithoutRestage',
		        data: {depDetId: depDetId,args: args,onError: onError,'${_csrf.parameterName}':'${_csrf.token}'},
		        type: 'post'
		    }).done(function(responseData) {
		    	Detail(deployId);
		    	}).fail(function() {
		    			 
		    });    	    
	  });   
 
 $("#reStagesubtbtn").click(function() {
     var depDetId= $('#myModal12').find('#depDetId').val();
     var args=$('#myModal12').find('#argAdd').val();
     var onError=$('#myModal12').find('input[name=onError]:checked').val();
     var commitID=$('#selectedCommit').val();
    
    //alert(commitID)
    var branch=$('#branchRepo').val();
    var submit=true;
    if($("#branchRepo").is(":visible")){
    	if(branch.length<=0)
    		{submit=false}
    	if($('#selectedCommit').is(":visible"))
    		{
    		if(commitID.length<=0)
    			{submit=false}
    		}
    }
  if(submit)
	  {
	  $('#myModal12').modal('hide'); 
    	    $.ajax({ 
	        url: 'deployDetailWithRestage',
	        data: {depDetId: depDetId,branch:branch,commitID: commitID,args: args,onError: onError,'${_csrf.parameterName}':'${_csrf.token}'},
	        type: 'post'
	    }).done(function(responseData) {
	    	Detail(deployId);
	    	}).fail(function() {
	    			 
	    });  
	  }
  else{
	  $("#error1div1").show();
	  $("#error1div2").show();
	  $("#error1div3").show();
  }
  }); 
 
 
 $("#subtAsToMEbtn").click(function() {	
     $('#ownCredMyselfModel').modal('hide');  
    
    	    $.ajax({ 
	        url: 'changeOwnerShipForDeployment',
	        data: {deployId: deployId,'${_csrf.parameterName}':'${_csrf.token}'},
	        type: 'post'
	          }).done(function(responseData) {
	    	Detail(deployId);
	    	 }).fail(function() {
	    	 
	    });    	    
  }); 
 
 $("#subtDnAsToMebtn").click(function() {	
     $('#ownCredMyselfModel').modal('hide');  	    
  });
	    	    
$("#reqPause").click(function() {
	
	$.ajax({ 
        url: 'pauseRequest',
        data: {reqId: id,'${_csrf.parameterName}':'${_csrf.token}'},
        type: 'post'
    }).done(function(responseData) {
    	 
    	$("#reqPause").hide();
    	$("#reqResume").show();
    	Detail(deployId);
    		 }).fail(function()
    		{
    		
          }); 
});



$("#reqResume").click(function() {
	$.ajax({ 
        url: 'resumeRequest',
        data: {reqId: id,'${_csrf.parameterName}':'${_csrf.token}'},
        type: 'post'
    }).done(function(responseData) {
    	$("#reqPause").show();
    	$("#reqResume").hide();
    	Detail(deployId);
    		 }).fail(function() {
    			 
    }); 
});
function stopdeb() {
	$.ajax({
		url : 'pauseDeployment',
		data : {
			deployId : deployId,
			'${_csrf.parameterName}' : '${_csrf.token}'
		},
		type : 'post'
	}).done(function(responseData) {
		Detail(deployId);
	}).fail(function() {
		 
	});
}

function startdeb() {
	$.ajax({
		url : 'resumeDeployment',
		data : {
			deployId : deployId,
			'${_csrf.parameterName}' : '${_csrf.token}'
		},
		type : 'post'
	}).done(function(responseData) {
		Detail(deployId);
	}).fail(function() {
		 
	});
}
function canceldeb() {
	$.ajax({
		url : 'cancelDeployment',
		data : {
			deployId : deployId,
			'${_csrf.parameterName}' : '${_csrf.token}'
		},
		type : 'post'
	}).done(function(responseData) {
		Detail(deployId);
	}).fail(function() {
		 
	});
}
 function auditDetails(depId){
	    displaySpinner();
	    $("#data-loader").show();
				$.ajax({
					url : 'listAudit',
					data : {reqId:id,depId:depId},
					type : 'get'
				})
				.done(
						function(responseData) {
							 
							$('#audit').children('tr').remove();
							$
									.each(
											responseData,
											function(i, ad) {
												$(
														"<tr><td Style='min-width: 185px; padding:10px !important' class='text-right'>"
																+ ad.eventTime
																+ "</td>"
																+ "<td style='max-width:200px; overflow:auto' class='table-scroll'>"
																+ ad.object
																+ "</td>"
																+ "<td>"+ad.subject+"</td>"
																+ "<td style='max-width:200px; overflow:auto' class='table-scroll'>"
																+ ad.event
																+ "</td>"
																+ " <td class='text-capitalize'>"
																+ ad.submittedBy
																+ "</td></tr>")
														.appendTo($('#audit'));
											    displaySpinner();
											    $("#data-loader").hide();
											});

						})
				.fail(function() {
							$('#status').text("There is some network issue.Please check your internet access.");
							$('#myModal').modal('show');
						});
	}

 

</script>
 <script>
   $('#ref-dif').on('change',function(){
	   stopDepRefresh($(this).val())
	});
   function stopDepRefresh(val)
   {
	    if(val=="manual"){
	    	clearInterval(refreshIntervalId);
    		$("#stop").hide();
    		$("#now").show();
	    }
	    else{
	    	clearInterval(refreshIntervalId);
	    	refreshIntervalId = setInterval(function(){Detail(deployId)}, val*1000);
	   		$("#stop").show();
    		$("#now").hide();
	    }
   }
   
$("#stop").click(function () {
 		clearInterval(refreshIntervalId);
		$("#ref-dif option").removeAttr('selected', 'selected');
		$("#ref-dif option[value=manual]").attr('selected', 'selected');
		$("#stop").hide();
		$("#now").show();
})
$("#now").click(function () {
	clearInterval(refreshIntervalId);
      Detail(deployId);
})
$("#closeRequest").click(function () {
	  $('#closeRequestModal').modal('show');
})


   function changeCredentialViewModel(e,repo, t) {
		var selected=t.val();	

	    if (selected=='credential')
	    {
	     $('#model_'+e).find('#delegatedcredentialdivModel').hide();
	     $('#model_'+e).find('#owncredentialdivModel').show();
	     $('#model_'+e).find('#savedcredentialdivModel').hide();
	    }
	    else if (selected=='saved')
	    {
	    	
	   	 $.ajax({ 
	         url: 'listOwnCredentialDeployment',
	         data: {dbid: e,repoName:repo,'${_csrf.parameterName}':'${_csrf.token}'},
	         type: 'post'
	     }).done(function(responseData) { 
	    	 
	        var str='';
	     	$.each(responseData, function(i, obj) {
	     		str += '<option value='+obj.userName+'>'+obj.userName+'</option>';
	    	    });
	     	$('#model_'+e).find("[name='savedCredentialSelectModel']").empty();
	    	$('#model_'+e).find("[name='savedCredentialSelectModel']").append(str);
	      }).fail(function() {
	    	        $('#status').text("There is some network issue.Please check your internet access.");
		           $('#myModal').modal('show');
	     });
	    	 $('#model_'+e).find('#savedcredentialdivModel').show();
	    	 $('#model_'+e).find('#delegatedcredentialdivModel').hide();
	         $('#model_'+e).find('#owncredentialdivModel').hide();
	    }
	    else
	    	{
	    	
	    	 $.ajax({ 
	             url: 'listDelegatePasswordDeployment',
	             data: {dpId: e,repo:repo,'${_csrf.parameterName}':'${_csrf.token}'},
	             type: 'post'
	         }).done(function(responseData) {
	        	 
	            var str='';
	         	$.each(responseData, function(i, obj) {
	         		str += '<option value='+obj.userName+'>'+obj.userName+'</option>';
	        	    });
	         	$('#model_'+e).find("[name='DelegateCredentialUNModel']").empty();
	        	$('#model_'+e).find("[name='DelegateCredentialUNModel']").append(str);
	          }).fail(function() { 
	             $('#status').text("There is some network issue.Please check your internet access.");
	 	           $('#myModal').modal('show');
	         });
	    	 $('#model_'+e).find('#delegatedcredentialdivModel').show();
	         $('#model_'+e).find('#owncredentialdivModel').hide();
	         $('#model_'+e).find('#savedcredentialdivModel').hide();
	    	}
	}   
   
//killing running deployment with saved credential  
   function validateSavedModel(reqid,dbid,repo,depid,fileName,depDetid)
   {
   	var id=dbid;
   	var uname = $('#model_'+id).find("[name='savedCredentialSelectModel']").val();
      if( !uname == "" && uname.length>1){	
    	 
          $.ajax({ 
              url: 'validateSaved',
              data: {id: id,repoName:repo,uname:uname,'${_csrf.parameterName}':'${_csrf.token}'},
              type: 'post'
          }).done(function(responseData) { 
       		 var toSplit = responseData.split(","); 
             if(toSplit[0]=='Success'){
                 $.ajax({ 
                     url: 'killScript',
                     data: {username:uname,password:toSplit[1].trim(),typCred:false,reqId: reqid,deploymentId:depid,fileName:fileName,depDetid:depDetid,'${_csrf.parameterName}':'${_csrf.token}'},
                     type: 'post'
                 }).done(function(responseData1) { 
                  	  $('#status').text(responseData1);
                      $('#myModal').modal('show');
                      $('#changeUN').modal('hide');
                 }).fail(function() {
                 })
             }else
           	  {
             	  $('#status').text(responseData);
             	  $('#changeUN').modal('hide');
                 $('#myModal').modal('show');
           	  }
           }).fail(function() {
              console.log('Failed');
              $('#status').text("There is some network issue.Please check your internet access.");
   	           $('#myModal').modal('show');
          });
       }
      else
      	{
      	 $('#status').text("Please fill username and password field.");
           $('#myModal').modal('show');
      	}
   }
   
   function validateSavedModelSingleFile(reqid,dbid,repo,depid,fileName,depDet)
   {
   	var id=dbid;
   	var uname = $('#model_'+id).find("[name='savedCredentialSelectModel']").val();
      if( !uname == "" && uname.length>1){	
    	 
          $.ajax({ 
              url: 'validateSaved',
              data: {id: id,repoName:repo,uname:uname,'${_csrf.parameterName}':'${_csrf.token}'},
              type: 'post'
          }).done(function(responseData) {
        
       		 var toSplit = responseData.split(","); 
             if(toSplit[0]=='Success'){
           
                 var upass=toSplit[1];
                 $.ajax({ 
                     url: 'changeCredentialForFile',
                     data: {depDet:depDet,uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
                     type: 'post'
                 }).done(function(responseData) { 
                	 if(responseData=="success")
                	 {
                  
               	  $('#status').text("Validation success!");
                  $('#myModal').modal('show');
                  $('#changeUN').modal('hide');
               	 Detail(deployId);
                	 }
                 }).fail(function() {
               	  
                 }) 
                 
             }else
           	  {
           	  
             	  $('#status').text(responseData);
                 $('#myModal').modal('show');
           	  }
           }).fail(function() {
              console.log('Failed');
        	  
              $('#status').text("There is some network issue.Please check your internet access.");
   	           $('#myModal').modal('show');
          });
       }
      else
      	{
    	  
      	 $('#status').text("Please fill username and password field.");
           $('#myModal').modal('show');
      	}
   }
   
   
  
   
  //***************************************************************************************************************************************

//killing running deployment with entered credential
function validateUNandPWModel(reqid,dbid,repo,depid,fileName,depDetid)
{     var id=dbid;
	var uname = $('#model_'+id).find("[name='uname_model']").val();
	var upass = $('#model_'+id).find("[name='upass_model']").val();
    if(( !uname == "" && uname.length>1) && (!upass == "" && upass.length>1)){	
  	 
        $.ajax({ 
            url: 'validate_db',
            data: {id: id,uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
            type: 'post'
        }).done(function(responseData) { 
           if(responseData=='Success'){
               $.ajax({ 
                   url: 'killScript',
                   data: {username:uname,password:upass,typCred:true,reqId: reqid,deploymentId:depid,fileName:fileName,depDetid:depDetid,'${_csrf.parameterName}':'${_csrf.token}'},
                   type: 'post'
               }).done(function(responseData1) { 
                   $('#status').text(responseData1);
                   $('#myModal').modal('show');
                   $('#changeUN').modal('hide');
               }).fail(function() {
               })
           }
           else
    	   {
           $('#status').text(responseData);
           $('#changeUN').modal('hide');
           $('#myModal').modal('show');
    	   }
         }).fail(function() {
            console.log('Failed');
            $('#status').text("There is some network issue.Please check your internet access.");
	           $('#myModal').modal('show');
        });
     }
    else
    	{
    	 $('#status').text("Please fill username and password field.");
         $('#myModal').modal('show');
    	}
}
  

function validateUNandPWModelSingleFile(reqid,dbid,repo,depid,fileName,depDet)
{   var id=dbid;
	var uname = $('#model_'+id).find("[name='uname_model']").val();
	var upass = $('#model_'+id).find("[name='upass_model']").val();
    if(( !uname == "" && uname.length>1) && (!upass == "" && upass.length>1)){	
  	 
        $.ajax({ 
            url: 'validate_db',
            data: {id: id,uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
            type: 'post'
        }).done(function(responseData) { 
           if(responseData=='Success'){
        	   $.ajax({ 
                   url: 'pass_to_encoder',
                   data: {upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
                   type: 'post'
               }).done(function(responseData1)
            		   {
                   $.ajax({ 
                       url: 'changeCredentialForFile',
                       data: {depDet:depDet,uname:uname,upass:responseData1,'${_csrf.parameterName}':'${_csrf.token}'},
                       type: 'post'
                   }).done(function(responseData) { 
                  		 if(responseData=="success")
                    	 {
                  		
                   	  $('#status').text("Validation success!");
                      $('#myModal').modal('show');
                      $('#changeUN').modal('hide');
                 	 Detail(deployId);
                    	 }
                   }).fail(function() {
                		  
                   }) 
               }).fail(function() {
              	    
                     console.log('Failed');
                     $('#status').text("There is some network issue.Please check your internet access.");
     	           $('#myModal').modal('show');
             });
        	   
        
           }
           else
    	   {
        		  
           $('#status').text(responseData);
           $('#changeUN').modal('hide');
           $('#myModal').modal('show');
    	   }
         }).fail(function() {
       	  
            console.log('Failed');
            $('#status').text("There is some network issue.Please check your internet access.");
	           $('#myModal').modal('show');
        });
     }
    else
    	{
    	 $('#status').text("Please fill username and password field.");
         $('#myModal').modal('show');
    	}
}
//killing running deployment with delegated credential
function validateDelegateModel(reqid,dbid,repo,depid,fileName,depDetid)
{
	var id=dbid;
	var uname = $('#model_'+id).find("[name='DelegateCredentialUNModel']").val();
    if( !uname == "" && uname.length>1){	
        $.ajax({ 
            url: 'validateDelegate',
            data: {id: id,repoName:repo,uname:uname,'${_csrf.parameterName}':'${_csrf.token}'},
            type: 'post'
        }).done(function(responseData) { 
        	 var toSplit = responseData.split(","); 
           if(toSplit[0]=='Success'){
               $.ajax({ 
                   url: 'killScript',
                   data: {username:uname,password:toSplit[1].trim(),typCred:false,reqId: reqid,deploymentId:depid,fileName:fileName,depDetid:depDetid,'${_csrf.parameterName}':'${_csrf.token}'},
                   type: 'post'
               }).done(function(responseData1) { 
            	   $('#status').text(responseData1);
                   $('#changeUN').modal('hide');
                   $('#myModal').modal('show');
               }).fail(function() {
            		  
               })
           }
           else
        	   { 
               $('#status').text(responseData);
               $('#changeUN').modal('hide');
               $('#myModal').modal('show');
        	   }
         }).fail(function() {
       	  
            console.log('Failed');
            $('#status').text("There is some network issue.Please check your internet access.");
	           $('#myModal').modal('show');
        });
     }
    else
    	{
    	 $('#status').text("Please fill username and password field.");
         $('#myModal').modal('show');
    	}
}

function validateDelegateModelSingleFile(reqid,dbid,repo,depid,fileName,depDet)
{
	var id=dbid;
	var uname = $('#model_'+id).find("[name='DelegateCredentialUNModel']").val();
    if( !uname == "" && uname.length>1){		
  	 
        $.ajax({ 
            url: 'validateDelegate',
            data: {id: id,repoName:repo,uname:uname,'${_csrf.parameterName}':'${_csrf.token}'},
            type: 'post'
        }).done(function(responseData) { 
        	 var toSplit = responseData.split(","); 
           if(toSplit[0]=='Success'){
               var upass=toSplit[1];
               $.ajax({ 
                   url: 'changeCredentialForFile',
                   data: {depDet:depDet,uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
                   type: 'post'
               }).done(function(responseData) { 
            	   if(responseData=="success")
              	     {
            		   
             	  $('#status').text("Validation success!");
                $('#myModal').modal('show');
                $('#changeUN').modal('hide');
             	 Detail(deployId);
              	   }
               }).fail(function() {
            	   
               }) 
           }
           else
        	   {
        	   
               $('#status').text(responseData);
               $('#changeUN').modal('hide');
               $('#myModal').modal('show');
        	   }
         }).fail(function() {
        	 
            console.log('Failed');
            $('#status').text("There is some network issue.Please check your internet access.");
	           $('#myModal').modal('show');
        });
     }
    else
    	{
    	 $('#status').text("Please fill username and password field.");
         $('#myModal').modal('show');
    	}
}
   
 //***************************************************************************************************************************************
   
   
   
   
   
   function killScript(e)
   {
   	var value=e.val();
   	var reqid=value.split(":")[0];
 	var depid=value.split(":")[1];
 	var dbid=value.split(":")[2];
 	var repo=value.split(":")[3];
 	var fileName=value.split(":")[4];
 	var depDeailId=value.split(":")[5];
   	 $.ajax({ 
            url: 'listDelegatePasswordDeployment',
            data: {dpId: dbid,repo:repo,'${_csrf.parameterName}':'${_csrf.token}'},
            type: 'post'
        }).done(function(responseData) {
        	 
           var str='';
        	$.each(responseData, function(i, obj) {
        		str += '<option value='+obj.userName+'>'+obj.userName+'</option>';
       	    });	
        	$('#changeUN').empty();
       	$('#changeUN').append('<div class="modal-dialog" id="model_'+dbid+'"><div class="modal-content">'+
       			'<div class="modal-header block-header block-header-default">'+
       			'<h4 class="col-md-12 pl-0 pr-0 block-title" id="myModalLabel">Cancel Deployment <br> <small style="font-size: small;">User Should have privilege to query gv$session and run \'alter system kill session\'.</small></h4>'+
       			  '</div><div class="modal-body">'+
       			          '<div class="displayJqueryModel">'+
       			             '<div class="row width-100">'+
       			               '<div class=" block-header">'+
       			     '<select class="form-control mySelect" name="credential" onchange="changeCredentialViewModel('+dbid+',\''+repo+'\',$(this));">'+
       			  		    '<option value="delegated" selected>Delegated Credential</option>'+ 
       			    		 '<option value="saved" >Saved Credential</option>'+
       			    		'<option value="credential" >Enter Credential</option>'+
       			    '</select>'+
       			    '</div></div>'+
       			    '<div class="">'+
       			    '<div class="">'+
       			       '<div class="form-group" id="owncredentialdivModel" style="display: none;">'+
       			        '<div class="mb-20"><label >User Name</label>'+
       			          '<input type="text" class="form-control" name="uname_model" placeholder="User Name">'+
       			        '</div>'+
       			         '<div class="mb-20"><label>Password</label>'+
       			         '<input type="password" class="form-control" name="upass_model">'+
       			         '</div><button type="button" class="btn btn-alt-primary" onclick="validateUNandPWModel('+reqid+','+dbid+',\''+repo+'\','+depid+',\''+fileName+'\','+depDeailId+')">Submit</button>'+
       			       '</div>'+
       			       '<div class="form-group" id="delegatedcredentialdivModel" >'+
       			          '<div class="mb-20"><label >User Name</label>'+
       			               '<select class="form-control"  name="DelegateCredentialUNModel"></select></div>'+
       			               '<button type="button" class="btn btn-alt-primary" onclick="validateDelegateModel('+reqid+','+dbid+',\''+repo+'\','+depid+',\''+fileName+'\','+depDeailId+')">Submit</button>'+
       			          '</div>'+
       			          '<div class="form-group" id="savedcredentialdivModel" style="display: none;"><div class="mb-20"><label>User Name</label>'+
       		    			'<select class="form-control" name="savedCredentialSelectModel"></select></div>'+
       		    			'<button type="button" class="btn btn-alt-primary" onclick="validateSavedModel('+reqid+','+dbid+',\''+repo+'\','+depid+',\''+fileName+'\','+depDeailId+')">Submit</button>'+
       		    			'</div>'
       			          +  
       			          '</div></div></div></div>'+
       			    '<div class="modal-footer">'+
       			    '<button type="button" class="btn btn-alt-danger" data-dismiss="modal">Close</button>'+
       			    '</div></div>');
       	$('#changeUN').modal('show');
        	$('#model_'+dbid).find("[name='DelegateCredentialUNModel']").empty();
       	$('#model_'+dbid).find("[name='DelegateCredentialUNModel']").append(str);
         }).fail(function() {
        	 
            console.log('Failed');
            $('#status').text("There is some network issue.Please check your internet access.");
   	           $('#myModal').modal('show');
        });
   	
   }
 
   function changeUNandPWForSingleFile(e)
   {
   	var value=e.val();
   	var reqid=value.split(":")[0];
 	var depid=value.split(":")[1];
 	var dbid=value.split(":")[2];
 	var repo=value.split(":")[3];
 	var fileName=value.split(":")[4];
 	var depDetid=value.split(":")[5];
   	 $.ajax({ 
            url: 'listDelegatePasswordDeployment',
            data: {dpId: dbid,repo:repo,'${_csrf.parameterName}':'${_csrf.token}'},
            type: 'post'
        }).done(function(responseData) {  
        	 
           var str='';
        	$.each(responseData, function(i, obj) {
        		str += '<option value='+obj.userName+'>'+obj.userName+'</option>';
       	    });	
        	$('#changeUN').empty();
       	$('#changeUN').append('<div class="modal-dialog" id="model_'+dbid+'"><div class="modal-content">'+
       			'<div class="modal-header block-header block-header-default">'+
       			'<h4 class="modal-title block-title" id="myModalLabel">Credential for '+fileName+'</h4>'+
       			  '</div><div class="modal-body">'+
       			          '<div class="displayJqueryModel">'+
       			             '<div class="row width-100">'+
       			               '<div class="block-header pt-0">'+
       			     '<select class="form-control mySelect" name="credential" onchange="changeCredentialViewModel('+dbid+',\''+repo+'\',$(this));">'+
       			  		    '<option value="delegated" selected>Delegated Credential</option>'+ 
       			    		 '<option value="saved" >Saved Credential</option>'+
       			    		'<option value="credential" >Enter Credential</option>'+
       			    '</select>'+
       			    '</div></div>'+
       			    '<div class="">'+
       			    '<div class="">'+
       			       '<div class="form-group" id="owncredentialdivModel" style="display: none;">'+
       			        '<div class="mb-20"><label >User Name</label>'+
       			          '<input type="text" class="form-control" name="uname_model" placeholder="User Name">'+
       			        '</div>'+
       			         '<div class="mb-20"><label>Password</label>'+
       			         '<input type="password" class="form-control" name="upass_model">'+
       			         '</div><button type="button" class="btn btn-alt-primary" onclick="validateUNandPWModelSingleFile(\''+reqid+'\','+dbid+',\''+repo+'\',\''+depid+'\',\''+fileName+'\',\''+depDetid+'\')">Submit</button>'+
       			       '</div>'+
       			       '<div class="form-group" id="delegatedcredentialdivModel" >'+
       			          '<div class="mb-20"><label >User Name</label>'+
       			               '<select class="form-control"  name="DelegateCredentialUNModel"></select></div>'+
       			               '<button type="button" class="btn btn-alt-primary" onclick="validateDelegateModelSingleFile(\''+reqid+'\','+dbid+',\''+repo+'\',\''+depid+'\',\''+fileName+'\',\''+depDetid+'\')">Submit</button>'+
       			          '</div>'+
       			          '<div class="form-group" id="savedcredentialdivModel" style="display: none;"><div class="mb-20"><label>User Name</label>'+
       		    			'<select class="form-control" name="savedCredentialSelectModel"></select></div>'+
       		    			'<button type="button" class="btn btn-alt-primary" onclick="validateSavedModelSingleFile(\''+reqid+'\','+dbid+',\''+repo+'\',\''+depid+'\',\''+fileName+'\',\''+depDetid+'\')">Submit</button>'+
       		    			'</div>'
       			          +  
       			          '</div></div></div></div>'+
       			    '<div class="modal-footer">'+
       			    '<button type="button" class="btn btn-alt-danger" data-dismiss="modal">Close</button>'+
       			    '</div></div>');
       	$('#changeUN').modal('show');
        	$('#model_'+dbid).find("[name='DelegateCredentialUNModel']").empty();
       	$('#model_'+dbid).find("[name='DelegateCredentialUNModel']").append(str);
         }).fail(function() {
        	 
            console.log('Failed');
            $('#status').text("There is some network issue.Please check your internet access.");
   	           $('#myModal').modal('show');
        });
   }
   </script>
  	<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">	 
   <script>
   $('#credential').click(function(){ 
	   	var value=$('#credential').val();
	   	var reqid=value.split(":")[0];
	 	var depid=value.split(":")[1];
	 	var dbid=value.split(":")[2];
	 	var repo=value.split(":")[3];
	   	 $.ajax({ 
	            url: 'listDelegatePasswordDeployment',
	            data: {dpId: dbid,repo:repo,'${_csrf.parameterName}':'${_csrf.token}'},
	            type: 'post'
	        }).done(function(responseData) {
	        	 
	           var str='';
	        	$.each(responseData, function(i, obj) {
	        		str += '<option value='+obj.userName+'>'+obj.userName+'</option>';
	       	    });	
	        	$('#changeUN').empty();
	       	$('#changeUN').append('<div class="modal-dialog" id="model_'+dbid+'"><div class="modal-content">'+
	       			'<div class="modal-header block-header block-header-default">'+
	       			'<h4 class="modal-title block-title" id="myModalLabel">Credential To Start Deployment</h4>'+
	       			  '</div><div class="modal-body">'+
	       			          '<div class="displayJqueryModel">'+
	       			             '<div class="row width-100">'+
	       			               '<div class=" block-header">'+
	       			     '<select class="form-control mySelect" name="credential" onchange="changeCredentialViewModel('+dbid+',\''+repo+'\',$(this));">'+
	       			  		    '<option value="delegated" selected>Delegated Credential</option>'+ 
	       			    		 '<option value="saved" >Saved Credential</option>'+
	       			    		'<option value="credential" >Enter Credential</option>'+
	       			    '</select>'+
	       			    '</div></div>'+
	       			    '<div class="">'+
	       			    '<div class="">'+
	       			       '<div class="" id="owncredentialdivModel" style="display: none;">'+
	       			        '<div class="mb-20"><label >User Name</label>'+
	       			          '<input type="text" class="form-control" name="uname_model" placeholder="User Name">'+
	       			        '</div>'+
	       			         '<div class="mb-20"><label>Password</label>'+
	       			         '<input type="password" class="form-control" name="upass_model">'+
	       			         '</div><button type="button" class="btn btn-alt-primary" onclick="validateUNandPWModelForNotify(\''+reqid+'\','+dbid+',\''+repo+'\',\''+depid+'\')">Validate & Submit</button>'+
	       			       '</div>'+
	       			       '<div class="form-group" id="delegatedcredentialdivModel" >'+
	       			          '<div class="mb-20"><label >User Name</label>'+
	       			               '<select class="form-control"  name="DelegateCredentialUNModel"></select></div>'+
	       			               '<button type="button" class="btn btn-alt-primary" onclick="validateDelegateModelForNotify(\''+reqid+'\','+dbid+',\''+repo+'\',\''+depid+'\')">Validate & Submit</button>'+
	       			          '</div>'+
	       			          '<div class="form-group" id="savedcredentialdivModel" style="display: none;"><div class="mb-20"><label>User Name</label>'+
	       		    			'<select class="form-control" name="savedCredentialSelectModel"></select></div>'+
	       		    			'<button type="button" class="btn btn-alt-primary" onclick="validateSavedModelForNotify(\''+reqid+'\','+dbid+',\''+repo+'\',\''+depid+'\')">Validate & Submit</button>'+
	       		    			'</div>'
	       			          +  
	       			          '</div></div></div></div>'+
	       			    '<div class="modal-footer">'+
	       			    '<button type="button" class="btn btn-alt-danger" data-dismiss="modal">Close</button>'+
	       			    '</div></div>');
	       	$('#changeUN').modal('show');
	        	$('#model_'+dbid).find("[name='DelegateCredentialUNModel']").empty();
	       	$('#model_'+dbid).find("[name='DelegateCredentialUNModel']").append(str);
	         }).fail(function() {
	        	 
	            console.log('Failed');
	            $('#status').text("There is some network issue.Please check your internet access.");
	   	           $('#myModal').modal('show');
	        });
	   
   });
   
   function validateDelegateModelForNotify(reqid,dbid,repo,depid)
   {
   	var id=dbid;
   	var uname = $('#model_'+id).find("[name='DelegateCredentialUNModel']").val();
       if( !uname == "" && uname.length>1){		
     	 
           $.ajax({ 
               url: 'validateDelegate',
               data: {id: id,repoName:repo,uname:uname,'${_csrf.parameterName}':'${_csrf.token}'},
               type: 'post'
           }).done(function(responseData) { 
           	 var toSplit = responseData.split(","); 
              if(toSplit[0]=='Success'){
                  var upass=toSplit[1];
                  $.ajax({ 
                      url: 'provideCredentialForAllFileinDeployment',
                      data: {reqId: reqid,deploymentId:depid,uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
                      type: 'post'
                  }).done(function(responseData) { 
               	   if(responseData=="success")
                 	     {
               		   
                	  $('#status').text("Validation success!");
                   $('#myModal').modal('show');
                   $('#changeUN').modal('hide');
                	 Detail(deployId);
                 	   }
                  }).fail(function() {
               	   
                  }) 
              }
              else
           	   {
           	   
                  $('#status').text(responseData);
                  $('#changeUN').modal('hide');
                  $('#myModal').modal('show');
           	   }
            }).fail(function() {
           	 
               console.log('Failed');
               $('#status').text("There is some network issue.Please check your internet access.");
   	           $('#myModal').modal('show');
           });
        }
       else
       	{
       	 $('#status').text("Please fill username and password field.");
            $('#myModal').modal('show');
       	}
   }
   
   
   function validateUNandPWModelForNotify(reqid,dbid,repo,depid)
   {   var id=dbid;
   	var uname = $('#model_'+id).find("[name='uname_model']").val();
   	var upass = $('#model_'+id).find("[name='upass_model']").val();
       if(( !uname == "" && uname.length>1) && (!upass == "" && upass.length>1)){	
     	 
           $.ajax({ 
               url: 'validate_db',
               data: {id: id,uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
               type: 'post'
           }).done(function(responseData) { 
              if(responseData=='Success'){
           	   $.ajax({ 
                      url: 'pass_to_encoder',
                      data: {upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
                      type: 'post'
                  }).done(function(responseData1)
               		   {
                      $.ajax({ 
                          url: 'provideCredentialForAllFileinDeployment',
                          data: {reqId: reqid,deploymentId:depid,uname:uname,upass:responseData1,'${_csrf.parameterName}':'${_csrf.token}'},
                          type: 'post'
                      }).done(function(responseData) { 
                     	 if(responseData=="success")
                       	 {
                      	 $('#status').text("Validation success!");
                         $('#myModal').modal('show');
                         $('#changeUN').modal('hide');
                    	 Detail(deployId);
                       	 }
                      }).fail(function() {
                   		  
                      }) 
                  }).fail(function() {
                 	    
                        console.log('Failed');
                        $('#status').text("There is some network issue.Please check your internet access.");
        	           $('#myModal').modal('show');
                });
           	   
           
              }
              else
       	   {
           		  
              $('#status').text(responseData);
              $('#changeUN').modal('hide');
              $('#myModal').modal('show');
       	   }
            }).fail(function() {
          	  
               console.log('Failed');
               $('#status').text("There is some network issue.Please check your internet access.");
   	           $('#myModal').modal('show');
           });
        }
       else
       	{
       	 $('#status').text("Please fill username and password field.");
            $('#myModal').modal('show');
       	}
   }
   
   function validateSavedModelForNotify(reqid,dbid,repo,depid)
   {
   	var id=dbid;
   	var uname = $('#model_'+id).find("[name='savedCredentialSelectModel']").val();
      if( !uname == "" && uname.length>1){	
    	 
          $.ajax({ 
              url: 'validateSaved',
              data: {id: id,repoName:repo,uname:uname,'${_csrf.parameterName}':'${_csrf.token}'},
              type: 'post'
          }).done(function(responseData) {
        
       		 var toSplit = responseData.split(","); 
             if(toSplit[0]=='Success'){
           
                 var upass=toSplit[1];
                 $.ajax({ 
                     url: 'provideCredentialForAllFileinDeployment',
                     data: {reqId: reqid,deploymentId:depid,uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
                     type: 'post'
                 }).done(function(responseData) { 
                	 if(responseData=="success")
                	 {
                  
               	  $('#status').text("Validation success!");
                  $('#myModal').modal('show');
                  $('#changeUN').modal('hide');
               	 Detail(deployId);
                	 }
                 }).fail(function() {
               	  
                 }) 
                 
             }else
           	  {
           	  
             	  $('#status').text(responseData);
                 $('#myModal').modal('show');
           	  }
           }).fail(function() {
              console.log('Failed');
        	  
              $('#status').text("There is some network issue.Please check your internet access.");
   	           $('#myModal').modal('show');
          });
       }
      else
      	{
    	  
      	 $('#status').text("Please fill username and password field.");
           $('#myModal').modal('show');
      	}
   }
   </script>
   </sec:authorize>