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

		<main id="main-container"> 
		<div class="content">
		<form action="${pageContext.request.contextPath}/updateDeployRequestFiles" method="post" style="display: none" id="previousForm">
									<input type="hidden" name="reponame" value="${repoName}">
									<input type="hidden" name="reqid" id="reqid" value="${requestId}">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			<c:choose>
				<c:when test="${MODE=='Add'}">
					<form action="${pageContext.request.contextPath}/submitFile_step3" method="post" id="depStart">
						<div class="block block-bordered">
							<div class="block-header block-header-default">
								<h3 class="block-title font-w600">
									DEPLOYMENT - ${repoName}<br>
								</h3>
								<div class="block-options xs-text-right">
									<button class="btn btn-primary js-click-ripple-enabled" type="button" onclick="submitPreviousForm()" data-toggle="click-ripple" style="overflow: hidden; position: relative; z-index: 1;">Previous</button>
									<button type="submit" class="btn btn-primary" id="val"  data-toggle="click-ripple">Next</button>
									<a href="${pageContext.request.contextPath}/deleteRequest?reqid=${requestId}"><button class="btn btn-danger" type="button" data-toggle="click-ripple">Cancel</button></a>
									
								</div>
							</div>
							<div class="block-content">
								<div class="block block-bordered">
									<div class="block-header block-header-default">
										<h3 class="block-title">Rollback Script Select Branch or Tag</h3>       	
										       
									</div>
									<div class="block-content pb-300 xs-pl-5 xs-pr-5">
										
												<div class="mt-10"  id="branchOrtagDIV">
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
										                     	
										<div class="col-md-6 pl-0 xs-pr-0 pt-10"  id="branchDIV">
											<select name="selectedBranch" class="js-select2 form-control select-validation" style="width: 100%;" data-placeholder="Select Branch" id="branchSelect" onchange="checkcommit()" required>
											<option></option>		
										</select>
										</div>	
										
										<div class="col-md-6 pl-0 xs-pr-0 pt-10" id="commitDIV">
											<select name="selectedCommit" class="js-select2 form-control select-validation" style="width: 100%;" data-placeholder="Select Commit" id="commitSelect" required>
											<option></option>
											
										</select>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										<input type="hidden" name="reponame" value='${repoName}'>
										<input type="hidden" name="reqid" value='${requestId}'>
										</div>	
				
										<div class="col-md-6 pl-0 xs-pr-0 pt-10"style="display: none;" id="tagDIV">
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
					<form action="${pageContext.request.contextPath}/submitFile_step3" method="post" id="depStart">
					
					<div class="block block-bordered">
							<div class="block-header block-header-default">
								<h3 class="block-title font-w600">
									DEPLOYMENT - ${repoName}<br>
								</h3>
								<div class="block-options xs-text-right">
									<button class="btn btn-primary js-click-ripple-enabled" type="button" onclick="submitPreviousForm()" data-toggle="click-ripple" style="overflow: hidden; position: relative; z-index: 1;">Previous</button>
									<button type="submit" class="btn btn-primary" id="val"  data-toggle="click-ripple">Next</button>
									<a href="${pageContext.request.contextPath}/deleteRequest?reqid=${requestId}"><button class="btn btn-danger" type="button" data-toggle="click-ripple">Cancel</button></a>									
								</div>
							</div>
							
							<div class="block-content">
								<div class="block block-bordered">
									<div class="block-header block-header-default">
										<h3 class="block-title">Rollback Script Select Branch or Tag</h3>       	
										       
									</div>
									<div class="block-content pb-300 xs-pl-5 xs-pr-5">
									<div class="col-md-6 pl-0 xs-pr-0">
										<%-- <select name="selectedRepo" onchange="checkBranch()" class="js-select2 form-control  select-validation" data-placeholder="Select Application" id="SelectedRepo" required >
											<option></option>
											<!-- Required for data-placeholder attribute to work with Selec154649t2 plugin -->
											<c:forEach var="repo" items="${list}">	
											<c:choose>
    											<c:when test="${repo.getRepoCreate().repoName==repoName}">
       											<option value="${repo.getRepoCreate().repoName}" selected>${repo.getRepoCreate().repoName}</option>
   												 </c:when>    
  												  <c:otherwise>
   												    <option value="${repo.getRepoCreate().repoName}">${repo.getRepoCreate().repoName}</option> 
    											    <br />
    											</c:otherwise>
												</c:choose>
										
											</c:forEach>
										</select>  --%>
										<input type="hidden" name="reponame" value="${repoName}" />	
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										<input type="hidden" name="reqid" value="${requestId}" />	
										</div>									
											<%-- <div class="col-md-6 pl-0 xs-pr-0 pt-10"  id="branchDIV" <c:if test="${!branchList.externalRepo}">style="display: none"</c:if>>
											<select name="selectedBranch" class="js-select2 form-control select-validation" style="width: 100%;" data-placeholder="Select Branch" id="branchSelect" required>
											<option></option>
											<c:forEach var="branch" items="${branchList.branchListSet}">	
											<c:choose>
    											<c:when test="${CurrentBranchForThisDeployRequest==branch}">
       											<option value="${branch}" selected>${branch}</option>
   												 </c:when>    
  												  <c:otherwise>
   												    <option value="${branch}">${branch}</option> 
    											    <br />
    											</c:otherwise>
												</c:choose>
										
											</c:forEach>
										</select>
										</div> --%>		
										<%-- <c:forEach var="branch" items="${branchList.branchListSet}">
										${CurrentBranchForThisDeployRequest} - ${requestId}
										</c:forEach> --%>
				
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
										                     	
										<div class="col-md-6 pl-0 xs-pr-0 pt-10" <c:if test="${!branchList.externalRepo||!CurrentBranchOrTagForThisDeployRequest}">style='display: none'</c:if> id="branchDIV">
											<select name="selectedBranch" class="js-select2 form-control select-validation" style="width: 100%;" data-placeholder="Select Branch" id="branchSelect" onchange="checkcommit()" required>
											<option></option>
											<c:forEach var="branch" items="${branchList.branchListSet}">	
											<c:choose>
    												<c:when test="${CurrentBranchForThisDeployRequest.trim()==branch.trim()}">
       													<option value="${branch}" selected>${branch}</option>
   													 </c:when>    
  												 	 <c:otherwise>
   												   	 <option value="${branch}">${branch}</option>   											   
    												</c:otherwise>
											</c:choose>
											</c:forEach>
										</select>
										</div>	
										
										<div class="col-md-6 pl-0 xs-pr-0 pt-10" <c:if test="${!branchList.externalRepo||!CurrentBranchOrTagForThisDeployRequest}">style='display: none'</c:if> id="commitDIV">
											<select name="selectedCommit" class="js-select2 form-control select-validation" style="width: 100%;" data-placeholder="Select Commit" id="commitSelect" required>
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
				
										<div class="col-md-6 pl-0 xs-pr-0 pt-10" <c:if test="${!branchList.externalRepo||CurrentBranchOrTagForThisDeployRequest}">style='display: none'</c:if> id="tagDIV">
											<select name="selectedTag" class="js-select2 form-control select-validation" style="width: 100%;" data-placeholder="Select Tag" id="tagSelect" required>
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
						
						<%-- <div class="block block-bordered">
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
									</div>
									<div class="block-content pb-300 xs-pl-5 xs-pr-5">
									<div class="col-md-6 pl-0 xs-pr-0">
										<select name="selectedRepo" onchange="checkBranch()" class="js-select2 form-control  select-validation" data-placeholder="Select Application" id="SelectedRepo" required >
											<option></option>
											<!-- Required for data-placeholder attribute to work with Selec154649t2 plugin -->
											<c:forEach var="repo" items="${list}">	
											<c:choose>
    											<c:when test="${repo.getRepoCreate().repoName==repoName}">
       											<option value="${repo.getRepoCreate().repoName}" selected>${repo.getRepoCreate().repoName}</option>
   												 </c:when>    
  												  <c:otherwise>
   												    <option value="${repo.getRepoCreate().repoName}">${repo.getRepoCreate().repoName}</option> 
    											    <br />
    											</c:otherwise>
												</c:choose>
										
											</c:forEach>
										</select> 
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										<input type="hidden" name="reqid" value="${reqid}" />	
										</div>									
											<div class="col-md-6 pl-0 xs-pr-0 pt-10"  id="branchDIV" <c:if test="${!branchList.externalRepo}">style="display: none"</c:if>>
											<select name="selectedBranch" class="js-select2 form-control select-validation" style="width: 100%;" data-placeholder="Select Branch" id="branchSelect" required>
											<option></option>
											<c:forEach var="branch" items="${branchList.branchListSet}">	
											<c:choose>
    											<c:when test="${CurrentBranchForThisDeployRequest==branch}">
       											<option value="${branch}" selected>${branch}</option>
   												 </c:when>    
  												  <c:otherwise>
   												    <option value="${branch}">${branch}</option> 
    											    <br />
    											</c:otherwise>
												</c:choose>
										
											</c:forEach>
										</select>
										</div>										
									</div>					
								</div>
							</div>
						</div> --%>
					</form>
				</c:when>
			</c:choose>
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
$(document).ready(function () {
	 //checkBranch();
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

 function submitPreviousForm(){
	 $("#previousForm").submit();
 } 

function checkBranch(){
	var repo='${repoName}';
	//alert(repo);
	$('#preloader').show();
	$.ajax({ 
          url: '${pageContext.request.contextPath}/getBranchesDeployment',
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
    		  $('#branchDIV').hide();
    		  $('#commitDIV').hide();
    		  $('#branchOrtagDIV').hide();
    		  $('#branchOrtagDIV').hide();
    		  }
    	}).fail(function() {
    	    console.log('Failed');
    	});	
}

function checkTag(){
	var repo='${repoName}';
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
       checkBranch();
    }
    else if (this.value == 'tag') {
    	checkTag();
    }
});
function checkcommit(){
	var repo='${repoName}';
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

<c:if test='${MODE.equals("Add")}'>
<script>
$(document).ready(function () {
	 checkBranch();
	});
</script>
</c:if>


</body>
</html>
