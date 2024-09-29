<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>

<div id="preloader">
		<i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
		<span id="loaderNormal"><p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p></span>
		<span id="PathChangeStatus" style="display: none;"><p>In Progress <br><small style="text-transform:capitalize">Copying files</small></p></span>
</div>

<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>
					<div id="myModal12" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static" >
														<div class="modal-dialog modal-lg">

															<div class="modal-content">
																<div
																	class="modal-header block-header block-header-default">

																	<h4 class="col-md-12 pl-0 pr-0 block-title" >
																		Pull Status<br>
																	</h4>
																	<br>
																</div>
																<div class="modal-body pt-0">
																	<div class="col-md-12">
																		<h6 class=" text-center" style="color: red;"></h6>
																	</div>
																	<div  id="pullstatusForm">
																		<div class="block block-bordered" id="CopydataDiv">
																		<div class="block-header block-header-default">
                                   											 <h3 class="block-title">Process</h3>
                                   											<span id="prog">In progress</span>&nbsp; <i class="fa fa-2x fa-spinner fa-spin " style="color:green" id="ICOprog" ></i> 
                                   											<span id="bug"> Error</span>&nbsp; <span class="fa fa-2x fa-close" style="color:red" id="ICObug" ></span>
                                   											<span id="suc"> Completed</span>&nbsp; <span class="fa fa-2x fa-check" style="color:green" id="ICOsuc" ></span>
                               											 </div>
																		<div class=" block-content" >
                                   											 <p id="Copydata"></p>
                               											 </div>
                               											 </div>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" style="display: none;" class="btn btn-alt-success" onClick="switchBranchAndPull()" data-toggle="click-ripple" id="switchBTN">Switch to HEAD and Pull</button>
																	<button type="button" class="btn btn-alt-danger" data-dismiss="modal" data-toggle="click-ripple">Close</button>
																</div>
															</div>
														</div>
						</div>
		<main id="main-container"> 
		<div class="content">
			<c:choose>
				<c:when test="${MODE=='Add'}">
					<form action="${pageContext.request.contextPath}/createDeployRequest"  method="post" id="depStart">
						<div class="block block-bordered">
							<div class="block-header block-header-default">
								<h3 class="block-title font-w600">
									DEPLOYMENT<br><small>Start by selecting the application for this deployment</small>
								</h3>
								<div class="block-options xs-text-right">
									<button type="submit" class="btn btn-primary" id="val"  data-toggle="click-ripple">Next</button>
								</div>
							</div>
							<div class="block-content">
								<div class="block block-bordered">
									<div class="block-header block-header-default">
										<h3 class="block-title">Select Application</h3>			                     	
										    <div class="text-right">
                                                <label class="css-control css-control-sm  css-control-primary css-switch">
                                                    <input type="checkbox" name="rollbackstep" value="YES" class="css-control-input" id="changeForm">
                                                    <span class="css-control-indicator"></span><span id="toggleForm">Add Rollback Step</span>
                                                </label>
                                           </div>
									</div>
									<div class="block-content pb-300 xs-pl-5 xs-pr-5">
										<div class="col-md-6 pl-0 xs-pr-0">
											<div class="row">
												<div class="col-md-8 pr-0 align">
													<select name="selectedRepo" class="js-select2 form-control select-validation" style="width: 100%" data-placeholder="Select Application" id="SelectedRepo" onchange="checkBranch()" required>
											<option></option>
											<!-- Required for data-placeholder attribute to work with Select2 plugin -->
											<c:forEach var="repo" items="${list}">
												<option value="${repo.getRepoCreate().repoName}">${repo.getRepoCreate().repoName}</option>
											</c:forEach>
												
										</select>
												</div>
												<div class="col-md-2">
												<button class="btn btn-primary" type="button" onclick="pullRepo()"  id="pullBtn" style="display: none;">Pull</button>
												</div>
											</div>
										
										 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />											
										</div>
														<div class="mt-10" style="display: none" id="branchOrtagDIV">
											                    <div class="form-inline">
											                    	<label class="css-control css-control-sm css-control-primary css-radio">
                                                                    <input type="radio" class="css-control-input" value="branch" id="branchIP" name="branchOrtag" checked>
                                                                    <span class="css-control-indicator"></span> Branch
                                                                    </label>
                                                                       <label class="css-control css-control-sm css-control-primary css-radio">
                                                                         <input type="radio" class="css-control-input" value="tag" id="tagIP" name="branchOrtag">
                                                                         <span class="css-control-indicator"></span> Tag
                                                                      </label>
										                        	</div>
										                     	</div>
									                  	
										<div class="col-md-6 pl-0 xs-pr-0 pt-10 align1" style="display: none;" id="branchDIV">
											<select name="selectedBranch" class="js-select2 form-control select-validation" style="width: 100%;" data-placeholder="Select Branch" id="branchSelect" onchange="checkcommit()" required>
											<option></option>
											
										</select>
									
										</div>	
										
										
										<div class="col-md-6 pl-0 xs-pr-0 pt-10 align1"style="display: none;" id="commitDIV">
											<select name="selectedCommit" class="js-select2 form-control select-validation" style="width: 100%;" data-placeholder="Select Commit" id="commitSelect" required>
											<option></option>
											
										</select>
										</div>	
				
											<div class="col-md-6 pl-0 xs-pr-0 pt-10 align1"style="display: none;" id="tagDIV">
											<select name="selectedTag" class="js-select2 form-control select-validation" style="width: 100%;" data-placeholder="Select Tag" id="tagSelect" required>
											<option></option>
											
										</select>
										</div>	
									</div>
								</div>
							</div>
						</div>
					</form>
				</c:when>

				<c:when test="${MODE=='previous'}">
					<form action="${pageContext.request.contextPath}/updateDeployRequest" method="post" id="depStart">
						<div class="block block-bordered">
							<div class="block-header block-header-default">
								<h3 class="block-title font-w600">
									DEPLOYMENT<br><small> Start by selecting the application for this deployment</small>
								</h3>
								<div class="block-options xs-text-right">
									<button type="submit" class="btn btn-primary" data-toggle="click-ripple">Next</button>
									<a href="${pageContext.request.contextPath}/deleteRequest?reqid=${reqid}"><button class="btn btn-danger" type="button" data-toggle="click-ripple">Cancel</button></a>
								</div>
							</div>
							<div class="block-content">
								<div class="block block-bordered">
									<div class="block-header block-header-default">
										<h3 class="block-title">Select Application</h3>
										<div class="text-right">
                                                <label class="css-control css-control-sm  css-control-primary css-switch">
                                                    <input type="checkbox" name="rollbackstep" value="YES" class="css-control-input" id="changeForm"<c:if test="${CurrentRollbackForThisDeployRequest}">checked</c:if>>
                                                    <span class="css-control-indicator"></span><span id="toggleForm">Add Rollback Step</span>
                                                </label>
                                           </div>
									</div>
									<div class="block-content pb-300 xs-pl-5 xs-pr-5">
									<div class="col-md-6 pl-0 xs-pr-0">
									<div class="row">
												<div class="col-md-8 pr-0 align">
										<select name="selectedRepo" onchange="checkBranch()" class="js-select2 form-control  select-validation align" data-placeholder="Select Application" id="SelectedRepo" required >
											<!-- Required for data-placeholder attribute to work with Selec154649t2 plugin -->
											<c:forEach var="repo" items="${list}">	
											<c:choose>
    											<c:when test="${repo.getRepoCreate().repoName==repoName}">
       											<option value="${repo.getRepoCreate().repoName}" selected>${repo.getRepoCreate().repoName}</option>
   												 </c:when>    
  												  <c:otherwise>align1
   												    <option value="${repo.getRepoCreate().repoName}">${repo.getRepoCreate().repoName}</option> 
    											    <br />
    											</c:otherwise>
												</c:choose>
											</c:forEach>
										</select> 
										</div>
										<div class="col-md-2">
										<button class="btn btn-primary" type="button" onclick="pullRepo()"  id="pullBtn" <c:if test="${!branchList.externalRepo}">style='display: none'</c:if>>Pull</button>
										</div>
										</div>
										
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										<input type="hidden" name="reqid" value="${reqid}" />	
										</div>																			
										<div class="mt-10" <c:if test="${!branchList.externalRepo}">style='display: none'</c:if> id="branchOrtagDIV">
											                    <div class="form-inline">
											                    	<label class="css-control css-control-sm css-control-primary css-radio">
                                                                    <input type="radio" class="css-control-input" value="branch" id="branchIP" name="branchOrtag" <c:if test="${CurrentBranchOrTagForThisDeployRequest}">checked</c:if>>
                                                                    <span class="css-control-indicator"></span> Branch
                                                                    </label>
                                                                       <label class="css-control css-control-sm css-control-primary css-radio">
                                                                         <input type="radio" class="css-control-input" value="tag" id="tagIP" name="branchOrtag" <c:if test="${!CurrentBranchOrTagForThisDeployRequest}">checked</c:if>>
                                                                         <span class="css-control-indicator"></span> Tag
                                                                      </label>
										                        	</div>
										 </div>
										                     	
										<div class="col-md-6 pl-0 xs-pr-0 pt-10 align1" <c:if test="${!branchList.externalRepo||!CurrentBranchOrTagForThisDeployRequest}">style='display: none'</c:if> id="branchDIV">
											<select name="selectedBranch" class="js-select2 form-control select-validation align1" style="width: 100%;" data-placeholder="Select Branch" id="branchSelect" onchange="checkcommit()" required>
											<option></option>
											<c:forEach var="branch" items="${branchList.branchListSet}">	
											<c:choose>
    											<c:when test="${CurrentBranchForThisDeployRequest==branch}">
       											<option value="${branch}" selected>${branch}</option>
   												 </c:when>    
  												  <c:otherwise>
   												    <option value="${branch}">${branch}</option>   											   
    											</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
										</div>	
										
										<div class="col-md-6 pl-0 xs-pr-0 pt-10 align1" <c:if test="${!branchList.externalRepo||!CurrentBranchOrTagForThisDeployRequest}">style='display: none'</c:if> id="commitDIV">
											<select name="selectedCommit" class="js-select2 form-control select-validation align1" style="width: 100%;" data-placeholder="Select Commit" id="commitSelect" required>
											<option></option>
											<c:forEach var="commit" items="${commitList}">	
											<c:choose>
    											<c:when test="${commit.commitID==CurrentCommitForThisDeployRequest}">
       											<option value="${commit.commitID}" selected>${fn:substring(commit.commitID,10,fn:length(commit.commitID))} - ${commit.commitMsg} - ${commit.commiter}</option>
   												 </c:when>    
  												  <c:otherwise>
       											<option value="${commit.commitID}">${fn:substring(commit.commitID,10,fn:length(commit.commitID))} - ${commit.commitMsg} - ${commit.commiter}</option>   											  
    											</c:otherwise>
												</c:choose>
											</c:forEach>
											</select>
										</div>	
				
										<div class="col-md-6 pl-0 xs-pr-0 pt-10 align1" <c:if test="${!branchList.externalRepo||CurrentBranchOrTagForThisDeployRequest}">style='display: none'</c:if> id="tagDIV">
											<select name="selectedTag" class="js-select2 form-control select-validation " style="width: 100%;" data-placeholder="Select Tag" id="tagSelect" required>
											<option></option>
											<c:forEach var="tag" items="${tagList.tagListSet}">	
											<c:choose>
    											<c:when test="${tag==CurrentTagForThisDeployRequest}">
       											<option value="${tag}" selected>${tag}</option>
   												 </c:when>    
  												  <c:otherwise>
       											<option value="${tag}">${tag}</option>    											  
    											</c:otherwise>
												</c:choose>
											</c:forEach>
											</select>
										</div>	
																		
									</div>					
								</div>
							</div>
						</div>
					</form>
				</c:when>
			</c:choose>
			<div id="dialog-confirm">
							<p id="textForDialog"></p>
						</div>
</div>
			<!-- END Page Content -->
		</main>
	</div>

	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
		<script src="static/js/plugins/multiselect.min.js"></script>
	
	
<c:if test="${isPathChangeLive ne null}">
<c:if test="${isPathChangeLive.getPropertyValue()=='true'}">
<script>
$(document).ready(function(){
$("#loaderNormal").hide();
$("#PathChangeStatus").show();
$("#preloader").show();
$('#multiselect2').multiselect();
});
</script>
<script>
$(document).ready(function(){
    $('#val').prop("disabled", "disabled");
});
</script>
</c:if>
</c:if>

<script>
function switchBranchAndPull(reponame){
	var reponame=$("#SelectedRepo").val();
	 $("#switchBTN").hide();
	  $.ajax({ 
	         url: '${pageContext.request.contextPath}/switchToHead',
	         data: {reponame:reponame,'${_csrf.parameterName}':'${_csrf.token}'},
	         type: 'post'
	     }).done(function(responseData){
	  	 	console.log(responseData);
	  	 		if(responseData=='success'){
	  	 			pullRepo()
	  	 		}else{
	  	 	   	 $("#CopydataDiv").show();
	  			 $("#Copydata").empty();
	  			$("#Copydata").append(responseData);
	  	 		}	 		
	  	 	}).fail(function() {
	  	   	    console.log('Failed');
	  	   	});	
}
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
				  $('#myModal12').modal('show');
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
	function pullRepo(){
		var reponame=$("#SelectedRepo").val();
		 console.log(reponame)
		 $('#myModal12').modal('show');
		 $("#Copydata").empty();
		  $("#prog").show();
		  $("#ICOprog").show();
		  $("#bug").hide();
		  $("#ICObug").hide();
		  $("#suc").hide();
		  $("#ICOsuc").hide();
		  $("#CopydataDiv").show();
		  $('#myModal12').modal('show');
		  $("#Copydata").append("Falcon Deploy is pulling contents from remote git repository.");
		  $.ajax({ 
	         url: '${pageContext.request.contextPath}/pullRepo',
	         data: {reponame:reponame,'${_csrf.parameterName}':'${_csrf.token}'},
	         type: 'post'
	     }).done(function(responseData)
	  	 	{
	       	 $("#CopydataDiv").show();
			 $("#Copydata").empty();
	 	$.each(responseData, function(i, req) {	
	 	if(req=='err-stop')
	 	{
	 	  $("#prog").hide();
	   	  $("#ICOprog").hide();
	   	  $("#suc").hide();
	  	  $("#ICOsuc").hide();	
	   	  $("#bug").show();
	   	  $("#ICObug").show();
	 	}
	 	else if(req=='stop')
	 	 {
	 		checkBranch();
	 		checkcommit();
	 		$("#switchBTN").hide();
	 		 $("#prog").hide();
	      	  $("#ICOprog").hide();
	 		  $("#bug").hide();
	       	  $("#ICObug").hide();
	 		 $("#suc").show();
	     	  $("#ICOsuc").show();	
	 	 }else if(req=='ref_not_exist'){
	 		 $("#switchBTN").show();
	 		  $("#prog").hide();
	 	   	  $("#ICOprog").hide();
	 	   	  $("#suc").hide();
	 	  	  $("#ICOsuc").hide();	
	 	   	  $("#bug").show();
	 	   	  $("#ICObug").show();
	 	 }
	    else
	 	 {
	 	  $("#prog").show();
	  	  $("#ICOprog").show();
	  	  $("#bug").hide();
	  	  $("#ICObug").hide();
	  	  $("#suc").hide();
	  	  $("#ICOsuc").hide();
	 		 $("#Copydata").append(req+"<br>");
	 	  }
	 	});
	 	
	   	}).fail(function() {
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
        	 checkBranch();
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
$(document).ready(function () {	
 $('#depStart').formValidation({
        framework: 'bootstrap4',     
        icon: {
           valid: 'fa fa-check',
           invalid: 'fa fa-times-circle',
           validating: 'fa fa-sync-alt'
               },
            fields: {
            	selectedRepo: {
                     validators: {
                         notEmpty: {
                             message: 'Application is required'
                         }
                     }               
                 },
                 selectedBranch:{
                	 validators: {
                         notEmpty: {
                             message: 'Branch is required'
                         }
                     } 
                 },
                 selectedCommit:{
                	 validators: {
                         notEmpty: {
                             message: 'Commit is required'
                         }
                     } 
                 },
                 selectedTag:{
                	 validators: {
                         notEmpty: {
                             message: 'Tag is required'
                         }
                     } 
                 },
             }
        });
    });

  

function checkBranch(){
	var repo=$("#SelectedRepo").val();
	//alert(repo);
	$('#preloader').show();
	$.ajax({ 
          url: '${pageContext.request.contextPath}/getBranchesDeployment',
          data: {repo:repo,'${_csrf.parameterName}':'${_csrf.token}'},
          type: 'post'
      }).done(function(responseData)
    	{
    	  if(!responseData.repoExist&&responseData.externalRepo){  		  
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
    		    	                	var repo=$("#SelectedRepo").val();
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
    	
    	  console.log(responseData);
    		$('#preloader').hide();
    	  $('#depStart').data('formValidation').resetForm();
    	  $('#branchSelect').empty();
    	  $('#commitSelect').empty();
    	  $('#tagSelect').empty();
    	  $('<option></option>').appendTo($('#tagSelect'));
    	  $('<option></option>').appendTo($('#commitSelect'));
			$('<option></option>').appendTo($('#branchSelect'));
    	  if(responseData.externalRepo)
    		  {
    		  $('#pullBtn').show();
    	 	 $('#branchDIV').show();
    	 	 $('#commitDIV').show();
    		 $('#tagDIV').hide();
    	 	 $('#branchOrtagDIV').show();
    	 	$('#branchIP').prop("checked", true);
    	 	$.each(responseData.branchListSet, function(i, data) {
    	 			$('<option value="'+data +'">'+data+'</option>').appendTo($('#branchSelect'));
    	 		});
    		  }
    	  else
    		  {
    		  $('#pullBtn').hide();
    		  $('#branchDIV').hide();
    		  $('#commitDIV').hide();
    		  $('#branchOrtagDIV').hide();
    		  $('#branchOrtagDIV').hide();
    		  }
    	}).fail(function() {
    	    console.log('Failed');
    	    $('#preloader').hide();
    	});	
}

function checkTag(){
	var repo=$("#SelectedRepo").val();
	//alert(repo);
	$('#preloader').show();
	$.ajax({ 
          url: '${pageContext.request.contextPath}/getTagDeployment',
          data: {repo:repo,'${_csrf.parameterName}':'${_csrf.token}'},
          type: 'post'
      }).done(function(responseData)
    	{
    	  console.log(responseData);
    		$('#preloader').hide();
    	  $('#depStart').data('formValidation').resetForm();
    	  $('#branchSelect').empty();
    	  $('#commitSelect').empty();
    	  $('#tagSelect').empty();
    	  $('<option></option>').appendTo($('#tagSelect'));
    	  $('<option></option>').appendTo($('#commitSelect'));
			$('<option></option>').appendTo($('#branchSelect'));
    	  if(responseData.externalRepo)
    		  {
    	 	 $('#branchDIV').hide();
    	 	 $('#commitDIV').hide();
    	 	 $('#tagDIV').show();
    	 	 $('#branchOrtagDIV').show();
    	 	$('#tagIP').prop("checked", true);
    	 		$.each(responseData.tagListSet, function(i, data) {
    	 			$('<option value="'+data +'">'+data+'</option>').appendTo($('#tagSelect'));
    	 		});
    		  }
    	  else
    		  {
    		  $('#branchDIV').hide();
    		  $('#commitDIV').hide();
    		  $('#branchOrtagDIV').hide();
    		  $('#branchOrtagDIV').hide();
    		  }
    	}).fail(function() {
    	    console.log('Failed');
    	});	
}


$('input[type=radio][name=branchOrtag]').change(function() {
    if (this.value == 'branch') {
       //alert("Allot");
            $('#branchSelect').empty();
 	  $('#commitSelect').empty();
 	 $('#tagSelect').empty();
       checkBranch();
  
    }
    else if (this.value == 'tag') {
        $('#branchSelect').empty();
   	  $('#commitSelect').empty();
   	 $('#tagSelect').empty();
    	checkTag();
    }
});
function checkcommit(){
	var repo=$("#SelectedRepo").val();
	var branch=$("#branchSelect").val();
	$('#preloader').show();
	$('#commitSelect').empty();
	$('<option></option>').appendTo($('#commitSelect'));
	$.ajax({ 
        url: '${pageContext.request.contextPath}/getCommitDetailsDeployment',
        data: {repo:repo,branch:branch,'${_csrf.parameterName}':'${_csrf.token}'},
        type: 'post'
    }).done(function(responseData)
  	{
  	  console.log(responseData);
  		$('#preloader').hide();
  	  $('#depStart').data('formValidation').resetForm();
  	 		$.each(responseData, function(i, data) {
  	 			console.log(i,data);
  	 			$('<option value="'+data.commitID +'">'+data.commitID.substring(10, data.commitID.length)+' - '+data.commitMsg+' - '+data.commiter+'</option>').appendTo($('#commitSelect'));
  	 		});
  	}).fail(function() {
  	    console.log('Failed');
  	});	
}
</script>
</body>
</html>
