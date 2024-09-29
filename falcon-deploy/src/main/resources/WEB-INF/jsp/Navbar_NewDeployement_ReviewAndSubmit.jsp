
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
<div id="preloader">
		<i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
		<span id="loaderNormal"><p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p></span>
</div>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>
		<c:set var="isemptyroll" value="true"></c:set>
		<main id="main-container">	
		<div class="content">
		<div class="block block-bordered">
			<div class="block ">
				<div class="block-header block-header-default mb-20">
					<h3 class="block-title ">
						<b>DEPLOYMENT - ${req.application.repoName}</b> <span class="float-right">REQUEST ID - ${req.deployRequestId}</span>
					</h3>
				</div>
				<div class="col-md-12">
					<div class="block block-bordered ">
						<div class="padding-10 block-header-default">
						<div class="row">
						    <div class="col-md-10">
							<h3 class="block-title "><b class="text-uppercase">Deployment script files</b>					
							</h3>
							</div>
			<div class="col-md-2">
				<form action="${pageContext.request.contextPath}/updateDeployRequestFiles" class="float-right" method="post">
					<input type="hidden" name="reponame" value='${req.application.repoName}'>
					<input type="hidden" name="reqid" value='${req.deployRequestId}'>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<button class="btn btn-sm btn-primary" type="submit" data-toggle="click-ripple">Edit</button>	
				</form>	
			</div>
						</div>
						</div>
						<div >

						<div class="block-content ">
						<c:if test="${req.branch!=null && req.branch.trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-3 col-7">
							<h6>Branch </h6>
							</div>
							<div class="col-md-9 col-5">
								:&nbsp; 	
								 <span class="badge badge-success">${req.branch.trim()}</span>
							</div>
							</div>
						</c:if>
						<c:if test="${req.getBaseCommit()!=null && req.getBaseCommit().trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-3 col-7">
								<h6 class="">Commit</h6>
							</div>
							<div class="col-md-9 col-5">
								:&nbsp; 
							 <span class="badge badge-danger">${req.getBaseCommit().trim()}</span>
							</div>
							</div>
						</c:if>
						
						<c:if test="${deployRequestService.getCommitMessage(req.getBaseCommit(),req)!=null}">
							<div class="row col-md-12">
							<div class="col-md-3 col-7">
								<h6 class="">Message</h6>
							</div>
							<div class="col-md-9 col-5">
								:&nbsp; 
							 <small>${deployRequestService.getCommitMessage(req.getBaseCommit(),req)}</small>
							</div>
							</div>
						</c:if>
						<c:if test="${req.getBaseTag()!=null && req.getBaseTag().trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-3 col-7">
								<h6 class="">Tag</h6>
							</div>
							
							<div class="col-md-9 col-5">
								:&nbsp; 
							<span class="badge badge-danger">${req.getBaseTag().trim()}</span>							
							</div>
							</div>
						</c:if>
				
						</div>
						<c:if test="${req.branch!=null && req.branch.trim()!=''}">
						<hr>
						</c:if>
						<c:if test="${req.getBaseTag()!=null && req.getBaseTag().trim()!=''}">
						<hr>
						</c:if>
						
							<div class="col-md-12">
							<ul class="mapping-list" data-toggle="slimscroll" data-height="200px">
								<c:forEach var="fileInRepo" items="${req.getDeployRequestRepoFileMap()}">
								<c:if test="${fileInRepo.rollback==false}">
								<li>${fn:replace(fileInRepo.getFileName(), "\\\\", "\\")}</li>	
								</c:if>
								</c:forEach>
							</ul>
							</div>
						</div>					
					</div>
				</div>
	 <c:if test="${req.getRollbackPresent()}">
				<div class="col-md-12">
					<div class="block block-bordered ">
						<div class="padding-10 block-header-default">
						<div class="row">
						    <div class="col-md-10">
							<h3 class="block-title text-uppercase"><b>rollback script files</b></h3>
							</div>
			<div class="col-md-2">
				<form action="${pageContext.request.contextPath}/updateDeployRequestRollbackFiles" class="float-right" method="post">
					<input type="hidden" name="reponame" value='${req.application.repoName}'>
					<input type="hidden" name="reqid" value='${req.deployRequestId}'>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<button class="btn btn-sm btn-primary" type="submit" data-toggle="click-ripple">Edit</button>	
				</form>	
			</div>
						</div>
						</div>
						<div>
							<c:forEach var="fileInRepo" items="${req.getDeployRequestRepoFileMap()}">
								<c:if test="${fileInRepo.rollback}">
								<c:set var="isemptyroll" value="false"></c:set>
								</c:if>
								</c:forEach>
						<div class="block-content ">
						<c:if test="${req.getRollbackBranch()!=null && req.getRollbackBranch().trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-3 col-7">
							<h6>Branch </h6>
							</div>
							<div class="col-md-9 col-5">
								:&nbsp; 	
								 <span class="badge badge-success">${req.getRollbackBranch().trim()}</span>
							</div>
							</div>
						</c:if>
						<c:if test="${req.getRollbackCommit()!=null && req.getRollbackCommit().trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-3 col-7">
								<h6 class="">Commit</h6>
							</div>
							<div class="col-md-9 col-5">
								:&nbsp; 
							 <span class="badge badge-danger">${req.getRollbackCommit().trim()}</span>
							</div>
							</div>
						</c:if>
						<c:if test="${deployRequestService.getCommitMessage(req.getRollbackCommit(),req)!=null}">
							<div class="row col-md-12">
							<div class="col-md-3 col-7">
								<h6 class="">Message</h6>
							</div>
							<div class="col-md-9 col-5">
								:&nbsp; 
							 <small>${deployRequestService.getCommitMessage(req.getRollbackCommit(),req)}</small>
							</div>
							</div>
						</c:if>
						<c:if test="${req.getRollbackTag()!=null && req.getRollbackTag().trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-3 col-7">
								<h6 class="">Tag</h6>
							</div>
							
							<div class="col-md-9 col-5">
								:&nbsp; 
							<span class="badge badge-danger">${req.getRollbackTag().trim()}</span>							
							</div>
							</div>
						</c:if>
						
						</div>
					<c:if test="${req.getRollbackBranch()!=null && req.getRollbackBranch().trim()!=''}">
						<hr>
					</c:if>		
					<c:if test="${req.getRollbackTag()!=null && req.getRollbackTag().trim()!=''}">
						<hr>
					</c:if>	

							<div class="col-md-12">
							 <c:if test="${isemptyroll==false}">
							<ul class="mapping-list" data-toggle="slimscroll" data-height="200px">
								<c:forEach var="fileInRepo" items="${req.getDeployRequestRepoFileMap()}">
								<c:if test="${fileInRepo.rollback}">
								<li>${fn:replace(fileInRepo.getFileName(), "\\\\", "\\")}</li>	
								</c:if>
								</c:forEach>
							</ul>
							</c:if>
							<c:if test="${isemptyroll}">
							<br>
							<div class="col-md-12">
								<div class="text-center">No rollback files selected</div>	<br>
							</div>
							</c:if>
							</div>
						</div>					
					</div>
				</div>
		</c:if>	
				</div>

			<div class="block ">
              <div><br></div>
				<div class="col-md-12">
					<div class="block block-bordered ">
						<div class="padding-10 block-header block-header-default">
				       <h3 class="block-title text-uppercase"><b>Deployment Schedule and Notification</b> </h3>
							<div class="block-options">
							<form action="${pageContext.request.contextPath}/submitDBandFileStep3" class="float-right" method="post">
					<input type="hidden" name="reponame" value='${req.application.repoName}'>
					<input type="hidden" name="reqid" value='${req.deployRequestId}'>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<button class="btn btn-sm btn-primary" type="submit" data-toggle="click-ripple">Edit</button>	
				</form>	
							</div>
						</div>
						<div class="block-content ">
							<div class="row col-md-12">
						    <c:if  test="${req.getDeployRequestSchedule()!=null}">
							<div class="col-md-3 col-7">
							<h6>Once Immediately </h6>
							</div>
							<div class="col-md-9 col-5">
								:&nbsp; 	
								 <c:choose><c:when test="${req.getDeployRequestSchedule().isOnceImmediately()}"><span class="badge badge-success">Yes</span></c:when><c:otherwise><span class="badge badge-danger">No</span></c:otherwise></c:choose>
							</div>
							</c:if>
							</div>
							<div class="row col-md-12">
							<div class="col-md-3 col-7">
								<h6 class="">E-mail on Success </h6>
							</div>
							<div class="col-md-9 col-5">
								:&nbsp; 
							 <c:choose><c:when test="${req.mailOnsuccess}"><span class="badge badge-success">Yes</span></c:when><c:otherwise><span class="badge badge-danger">No</span></c:otherwise></c:choose>
							</div>
							</div>
							<div class="row col-md-12">
							<div class="col-md-3 col-7">
								<h6 class="">E-mail on Failure</h6>
							</div>
							
							<div class="col-md-9 col-5">
								:&nbsp; 
							<c:choose><c:when test="${req.mailOnfail}"><span class="badge badge-success">Yes</span></c:when><c:otherwise><span class="badge badge-danger">No</span></c:otherwise></c:choose>							
							</div>
							</div>
							<c:if  test="${req.getDeployRequestSchedule()!=null}">
						<c:if test="${not req.getDeployRequestSchedule().isOnceImmediately()}">
						<div class="col-md-12 row">
								<div class="col-md-3">
									<h6>Scheduled Timestamp</h6>
								</div>
								<div class="col-md-9">
									<jsp:useBean id="dateValue" class="java.util.Date" />
								<jsp:setProperty name="dateValue" property="time" value="${req.getDeployRequestSchedule().getScheduledTimestamp().getTime()}" />
								 :&nbsp; <fmt:formatDate value="${dateValue}"  pattern="MM-dd-yyyy HH:mm:ss"/>	
								 (${req.getDeployRequestSchedule().getDeployedTimezone()})
								</div>
							</div>
						</c:if>
						</c:if>
						</div>
						
					</div>
				</div>
				</div>
				<!-- </div>
       <div class="content"> -->
       <div class="col-md-12">
	<div class="block block-bordered">
	<div class="padding-10 block-header-default">
						<div class="row">
						    <div class="col-md-10">
							<h3 class="block-title"><b>DATABASES AND SELECTED FILES</b></h3>
							</div>
							<div class="col-md-2">
				<form action="${pageContext.request.contextPath}/updateDeployRequestDB" class="float-right" method="post">
					<input type="hidden" name="reponame" value='${req.application.repoName}'>
					<input type="hidden" name="reqid" value='${req.deployRequestId}'>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<button class="btn btn-sm  btn-primary" type="submit" data-toggle="click-ripple">Edit</button>	
				</form>	
				</div>
						</div>
						</div>
				<c:forEach var="dbId" items="${deploymentRepo.findByRequestIdDeployRequestIdOrderByPriorityAsc(req.deployRequestId)}">
				<div><br></div>
				<div class="col-md-12 wrap">
				<div class="block block-bordered ">
				<div class="show_hide">
				<div class="block-header block-header-default">
						<c:set var = "logsf"  value = "${dbId.getDbId()}"/>
											<c:if test="${empty logsf.aliasName}">
												<c:if test="${empty logsf.sid}">
													<h3 class="block-title">
														Database : ${logsf.hostName}:${logsf.getPort()}:${logsf.service}
                                                     </h3>
												</c:if>
												<c:if test="${empty logsf.service}">
													<h3 class="block-title">
														Database : ${logsf.hostName}:${logsf.getPort()}/${logsf.sid}
														</h3>
												</c:if>

											</c:if>
											<c:if test="${not empty logsf.aliasName}">
												<h3 class="block-title">Database : ${logsf.aliasName}</h3>
											</c:if>
							<span class="fa fa-angle-down" style="float:right;"></span>
				 </div>
				 </div>
				<div class="col-md-12 slidingDivs">
				<div>
				 <br>
				 <div class="row">
				 <div class="col-md-12 row">
				 <div class="col-md-3 col-7">
				 <h6 >Priority</h6>
				 </div>
				 <div class="col-md-9 col-5">
				 :&nbsp; ${dbId.priority}
				 </div>
				 </div>
				 <div class="col-md-12 row">
				 <div class="col-md-3 col-7">
				 <h6>Deploy Wrapper File</h6>
				 </div>
				<div class="col-md-9 col-5">
				:&nbsp; 
			<c:choose><c:when test="${dbId.postWrapper}"><span class="badge badge-success">Yes</span></c:when><c:otherwise><span class="badge badge-danger">No</span></c:otherwise></c:choose>											 
				 </div>
				 </div>
				 <div class="col-md-12 row">
				 <div class="col-md-3 col-7">
				 <h6>Notify Administrators</h6>
				 </div>
				 <div class="col-md-9 col-5">
				  :&nbsp;
				  <c:choose><c:when test="${dbId.notifyAdmin}"><span class="badge badge-success">Yes</span></c:when><c:otherwise><span class="badge badge-danger">No</span></c:otherwise></c:choose>	
				 </div>
				 </div>
				</div>
				</div>
                 <div class="table-responsive">
                 <div><br></div>
			   <table class="table table-bordered table-vcenter " id="sort">
					<thead>
						<tr>
                       	<th style="width: 15%;">Script Name</th>
						<th style="width: 100px;">User Name</th>
						<th style="width: 100px;">Credential Type</th>
						<th style="width: 100px;">parameters</th>
						<th style="width: 100px;">Error Handling</th>
						</tr>
					</thead>
					<tbody >
			<c:forEach items="${deploymentDetailRepo.findByDeployDbIdIdAndRollbackFileIsFalseOrderByFileOrderAsc(dbId.getId())}" var="files">
					<tr class="ui-state-default">
						<th>
						${fn:replace(files.getFileMap().getFileName(), "\\\\", "\\")}
						</th>
						<td class="">
							${files.userName}
						</td>
					<td class="">
					<c:if test="${!dbId.notifyAdmin}">
		              <c:if test="${!(empty files.passWord)&&!files.delegated}">
                          USER CREDENTIAL
                     </c:if>
                     <c:if test="${!(empty files.passWord)&&files.delegated}">
                          DELEGATED CREDENTIAL
                     </c:if>
                     </c:if>
					</td>
						<td class="">
							${files.args}
						</td>
						<td class="">
						<c:if test="${files.continueOnError}">
						Continue On Error
						</c:if>
					<c:if test="${!files.continueOnError}">
						Exit On Error
						</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
</div>
</div>
</div>
				</div>
			</c:forEach>	
			</div>
			</div>
			<div class=" text-center pb-20">
				<a href="${pageContext.request.contextPath}/submitDeployRequest?reqid=${req.deployRequestId}"><button class="btn btn-primary" data-toggle="click-ripple">Submit</button></a>
				<a href="${pageContext.request.contextPath}/deleteRequest?reqid=${req.deployRequestId}"><button class="btn btn-alt-danger ml-5" data-toggle="click-ripple">Cancel</button></a>
			</div>
			</div>	
				
			<div></div>
			</div>
		</main>

	</div>


	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<script src="static/js/plugins/multiselect.min.js"></script>
	<%@include file="/static/js/pages/Navbar_NewDeployement_ReviewAndSubmitJS.jsp"%>
<c:if test="${showpopup ne null}">
<c:if test="${showpopup}">
<script>
$(document).ready(function(){
$("#loaderNormal").hide();
$("#PathChangeStatus").show();
$("#preloader").show();
});
</script>
</c:if>
</c:if>
	
</body>
</html>
