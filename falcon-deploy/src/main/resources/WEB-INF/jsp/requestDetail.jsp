<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<style>
.ui-helper {
    width: 100% !important;
}
.ui-sortable-helper {
    display: table!important;
}
.placeholder-style{
  background-color: white!important;
  height:80px!important;
}
</style>
<body>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

		<main id="main-container"> 
		<div class="content">
			<div class="block">
				<div class="block block-bordered">
					<div class="block-header block-header-default">
					<div class="col-md-8">
						 <div class="row">
						<ul class="nav navbar-nav">
							<li class="xs-width-100">
								<h3 class="block-title font-w600 pr-15">
									${request.requestName}
								</h3>
							</li>
							<li>
								<form method="post" action="${pageContext.request.contextPath}/duplicateRequest">
								  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								  <input type="hidden" name="reqId" value="${request.requestId}" />
							      <button type="submit" class="btn btn-primary  mr-5 " data-toggle="click-ripple">Duplicate Request</button>
								</form>
							</li>
							<li>
								<c:if test="${request.status=='OPEN'}">		
								   <c:if test="${showCloseReq}">							
									  <button id="closeRequest" class="btn btn-primary" data-toggle="click-ripple">Close Request</button>
								   </c:if>
								</c:if>
							</li>
						</ul>
						
						
						
						</div> 
					</div>
					<div class="header-options">
					<c:if test="${request.status=='OPEN'}">	
						<c:if test="${request.pauseStatus}">
						
						<button id="reqResume" class="btn btn-primary" data-toggle="click-ripple">Resume</button>
						<button id="reqPause" class="btn btn-primary"  style="display: none;" data-toggle="click-ripple">Pause</button>
						
						</c:if>
						<c:if test="${!request.pauseStatus}">					
						<button id="reqPause" class="btn btn-primary"  data-toggle="click-ripple">Pause</button>
						<button id="reqResume" class="btn btn-primary" style="display: none;" data-toggle="click-ripple">Resume</button>					
						</c:if>
						
				
						
					<button type="button" id="refresh" class="btn-block-option">
								<i class="si si-refresh" style="font-size: 20px; top:5px"></i>
					</button>
				</c:if>
				</div>
					</div>
			</div>	
			</div>
			
			 <div class="modal fade" id="changeUN" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
			<div class="block">
				<div class="block block-bordered col-md-12 p-20">
					<div class="row">
						<div class="col-md-6">
							<div class="block block-bordered block-content pb-20 mb-0"
								style="min-height: 168px;">
								<p>
									<strong>Requestor :</strong> ${request.requestor}
 								</p>
								<p>
									<strong>Application :</strong> ${request.application}
								</p>
								<p>
									<strong>Opened :</strong> ${request.submittedTime}
								</p>
							</div>
						</div>
						<div class="col-md-6 pl-0 xs-pl-15 xs-mt-5 sm-mt-10 sm-pl-15">
							<div class="block block-bordered block-content pb-20 mb-0" style="min-height: 168px;" id="rightdiv">
							<c:if test="${!request.onceImmediately}">
								<p id="schedule">
									<strong>Scheduled :</strong> ${request.scheduledTime} (${request.deployedTZ}) 
								</p>
							</c:if>
								<p>
									<strong>Status :</strong> ${request.status}
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="block block-bordered block-content pb-20 mb-0">
				<div class="block">
				<div class="block block-bordered">
				<div class="selector ">
					<ul class="nav nav-tabs nav-tabs-block " data-toggle="tabs"
						role="tablist" id="dbTabs">
						

					</ul>
				</div>
				<div class="block-content block-content-full tab-content overflow-hidden xs-p-0">
					<div class="tab-pane fade show active" id="btabs-animated-fade-home" role="tabpanel">
						<div class="">
						<div class="block-header pl-0 pr-0 pb-0">
						<div class="col-lg-7 pl-0 xs-pl-15">
					
							<p class="block-title" id="assignedTo">
							   <strong>Owner :</strong> <span id="DepOwner"></span>
							</p>
					<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">	
						     <div class="" id="changeOwnerShipDiv" style="display: none;margin-bottom: 10px;">
                         	     <button  class="btn btn-alt-warning" id="changeOwnerShip" data-toggle="click-ripple">Assign to myself</button>
                         	 </div>
                    </sec:authorize>
						</div>
					<c:if test="${request.status=='OPEN'}">
						<div class="form-group row col-lg-5 xs-ml-0" id="refreshDiv">
                         	<span class="col-lg-4 col-form-label text-right pr-0 xs-pl-0 sm-pl-0" >Refresh</span>

                              <div class="col-lg-4 xs-mt-5 xs-pl-0 xs-pr-0 xs-mb-5 sm-pl-0 sm-pr-0 sm-mb-10">
                                 <select class="form-control" id="ref-dif" >
                                     <option value="5">5 Sec</option>
                                     <option value="10" selected>10 Sec</option>
                                     <option value="15" >15 Sec</option>
                                     <option value="20" >20 Sec</option>
                                     <option value="manual">Manual</option>
                                 </select>
                              </div>
                              <button id="stop" class="btn btn-primary  col-lg-4" data-toggle="click-ripple">Stop Refresh</button>  
                               <button id="now" class="btn btn-primary  col-lg-4" style="display: none;" data-toggle="click-ripple">Refresh Now</button>    
                        	 </div>
                       </c:if>
							</div>
					<c:if test="${request.status=='OPEN'}">			
					
						 <div class="form-group row col-lg-5 pull-left xs-ml-0">
						 <div class=" pl-0 block-bordered pr-5">
                        		 <h3 class="block-title font-w600">Deployment Script</h3>
                    		 </div>
                         </div> 
                    
                         <div class="col-lg-7 pull-right pr-0 xs-pr-15 mb-10">
						<ul class="nav navbar float-right acc-btn">
                         <li id="startDEPDiv" >
							</li> 
							<li class="" id="stopDEPDiv">
						</li>
							<li class="" id="cancelDEPDiv" >
							</li> 
							
							<li class="" id="approve" >
							</li>
                       	<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">	
							<li class="" id="credentialDiv" style="display: none;">
								<button  class="btn btn-alt-primary width-100" id="credential" data-toggle="click-ripple">Credential</button>
							</li> 
						</sec:authorize>
							</ul>
						</div>
						</c:if>
					
                  
                        <div class="kk">
                      <div class="block-content ">
						<c:if test="${request.baseBranch!=null && request.baseBranch.trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-2 col-6">
							<h6>Branch </h6>
							</div>
							<div class="col-md-10 col-6">
								:&nbsp; 	
								 <span class="badge badge-success">${request.baseBranch.trim()}</span>
							</div>
							</div>
						</c:if>
						<c:if test="${request.getBaseCommit()!=null && request.getBaseCommit().trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-2 col-7">
								<h6 class="">Commit</h6>
							</div>
							<div class="col-md-10 col-5">
								:&nbsp; 
							 <span class="badge badge-danger">${request.getBaseCommit().trim()}</span>
							</div>
							</div>
						</c:if>
						<c:if test="${request.baseMessage!=null && request.baseMessage.trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-2 col-7">
								<h6 class="">Message</h6>
							</div>
							<div class="col-md-10 col-5">
								:&nbsp; 
							<small> ${request.baseMessage.trim()}</small>
							</div>
							</div>
						</c:if>
						<c:if test="${request.getBaseTag()!=null && request.getBaseTag().trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-2 col-7">
								<h6 class="">Tag</h6>
							</div>
							
							<div class="col-md-10 col-5">
								:&nbsp; 
							<span class="badge badge-danger">${request.getBaseTag().trim()}</span>							
							</div>
							</div>
						</c:if>
						</div>
                     <div class="table-responsive">
                       <div id="data-loader1" class="loader-height" >
 									<div style="display:table-cell; vertical-align:middle;">
 										<i class="fa fa-2x fa-cog fa-spin" style="color:#324a7e"></i>
									<p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
 									</div>
						</div> 
							
                            <table class="table table-striped table-vcenter table-bordered xs-width-1000 sm-width-1000" style="min-width: 1550px;">                            
                                <thead id="thead">
                                    <tr>
                                        <th>Sql Script</th>
                                        <th class="text-center">User Name</th>
                                        <th>Parameter</th>
                                        <th>On error</th>
                                 	    <th class="text-center">Manage</th>
                                        <th class="text-center">status</th>
                                        <th class="text-right">Elapsed Time</th>
                                        <th class="text-right">Deployment Time</th>
                                        <th class="text-center">OS Log</th>
                                        <th class="text-center" style="width:10%">Exception</th>
                                    </tr>                
                                </thead>
                                <tbody id="depDetail">
                                    <tr>
                                       
                                    </tr>
                                   
                                 
                                </tbody>
                            </table>
                        </div>
                        </div>
                       <hr> 
                      <div class=" pl-0 block-bordered" id="rollbacktitle" style="display: none;margin-bottom: 10px;">
                         <h3 class="block-title font-w600">Rollback Script</h3>
                     </div>
                 
                        <div class="kk" id="rollbacktable" style="display: none;">
                        	 <div class="table-responsive">
                       <div id="data-loader2" class="loader-height" >
 									<div style="display:table-cell; vertical-align:middle;">
 										<i class="fa fa-2x fa-cog fa-spin" style="color:#324a7e"></i>
									<p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
 									</div>
						</div> 
							 <div class="block-content ">
						<c:if test="${request.rollbackBranch!=null && request.rollbackBranch.trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-2 col-6">
							<h6>Branch </h6>
							</div>
							<div class="col-md-10 col-6">
								:&nbsp; 	
								 <span class="badge badge-success">${request.rollbackBranch.trim()}</span>
							</div>
							</div>
						</c:if>
						<c:if test="${request.rollbackCommit!=null && request.rollbackCommit.trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-2 col-7">
								<h6 class="">Commit</h6>
							</div>
							<div class="col-md-10 col-5">
								:&nbsp; 
							 <span class="badge badge-danger">${request.rollbackCommit.trim()}</span>
							</div>
							</div>
						</c:if>
						<c:if test="${request.rollbackMessage!=null && request.rollbackMessage.trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-2 col-7">
								<h6 class="">Message</h6>
							</div>
							<div class="col-md-10 col-5">
								:&nbsp; 
							<small>${request.rollbackMessage.trim()}</small>
							</div>
							</div>
						</c:if>
						<c:if test="${request.rollbackTag!=null && request.rollbackTag.trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-2 col-7">
								<h6 class="">Tag</h6>
							</div>
							
							<div class="col-md-10 col-5">
								:&nbsp; 
							<span class="badge badge-danger">${request.rollbackTag.trim()}</span>							
							</div>
							</div>
						</c:if>
						</div>
                            <table class="table table-striped table-vcenter table-bordered xs-width-1000 sm-width-1000" style="min-width: 1550px;">                            
                                <thead id="thead">
                                    <tr>
                                        <th>Sql Script</th>
                                        <th class="text-center">User Name</th>
                                        <th>Parameter</th>
                                        <th>On error</th>
                                 	    <th class="text-center">Manage</th>
                                        <th class="text-center">status</th>
                                        <th class="text-right">Elapsed Time</th>
                                        <th class="text-right">Deployment Time</th>
                                        <th class="text-center">OS Log</th>
                                        <th class="text-center" style="width:10%">Exception</th>
                                    </tr>                
                                </thead>
                                <tbody id="rollDetail">
                                    <tr>
                                       
                                    </tr>
                                   
                                 
                                </tbody>
                            </table>
                        </div>
                        </div>
                        
                        
                        
                      <div class="block-header pl-0 block-bordered" id="rollbackdatatitle">
                         <h3 class="block-title font-w600">Deploy Rollback Script</h3>
                     </div>
                     <div class="block-content " id="rollbackdatadiv1" style="display: none">
						<c:if test="${request.rollbackBranch!=null && request.rollbackBranch.trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-2 col-6">
							<h6>Branch </h6>
							</div>
							<div class="col-md-10 col-6">
								:&nbsp; 	
								 <span class="badge badge-success">${request.rollbackBranch.trim()}</span>
							</div>
							</div>
						</c:if>
						<c:if test="${request.rollbackCommit!=null && request.rollbackCommit.trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-2 col-7">
								<h6 class="">Commit</h6>
							</div>
							<div class="col-md-10 col-5">
								:&nbsp; 
							 <span class="badge badge-danger">${request.rollbackCommit.trim()}</span>
							</div>
							</div>
						</c:if>
						<c:if test="${request.rollbackMessage!=null && request.rollbackMessage.trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-2 col-7">
								<h6 class="">Message</h6>
							</div>
							<div class="col-md-10 col-5">
								:&nbsp; 
							<small>${request.rollbackMessage.trim()}</small>
							</div>
							</div>
						</c:if>
						<c:if test="${request.rollbackTag!=null && request.rollbackTag.trim()!=''}">
							<div class="row col-md-12">
							<div class="col-md-2 col-7">
								<h6 class="">Tag</h6>
							</div>
							
							<div class="col-md-10 col-5">
								:&nbsp; 
							<span class="badge badge-danger">${request.rollbackTag.trim()}</span>							
							</div>
							</div>
						</c:if>
						</div>
                      <div id="rollbackdatadiv">
                        </div>
                        <div class="block-header pl-0 block-bordered">
                         <h3 class="block-title font-w600">Audit Trail</h3>
                     </div>
                     <div class="table-responsive">
                             <div id="data-loader" class="loader-height" >
 									<div style="display:table-cell; vertical-align:middle;">
 										<i class="fa fa-2x fa-cog fa-spin" style="color:#324a7e"></i>
									<p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
 									</div>
						</div> 
						
                            <table class="table table-striped table-vcenter table-bordered xs-width-1000 sm-width-1000">
                                <thead>
                                    <tr>
                                        <th class="text-right">Event Timestamp</th>
                                        <th>Object</th>
                                        <th>Event</th>
                                        <th>Event Description</th>
                                        <th>User</th>
                                    </tr>
                                    
                                </thead>
                                <tbody id="audit">                                               
                                                                        
                                </tbody>
                            </table>
                        </div>
						</div>
					</div>
				</div>
			</div>
				
				</div>
			</div>
			</div>
			 <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header block-header block-header-default">
								<h4 class="modal-title block-title " id="myModalLabel">Result</h4>
							</div>
							<div class="modal-body">
								<p id="status"></p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-alt-danger"
									data-dismiss="modal" data-toggle="click-ripple">Close</button>
							</div>
						</div>
					</div>
	      </div>
	    <sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">	  
	      <div class="modal fade" id="ownCredMyselfModel" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-lg  modal-dialog">
						<div class="modal-content">
							<div class="modal-header block-header block-header-default">
								<h4 class="modal-title block-title" id="ownCredMyselfModelLabel">Change Ownership</h4>
							</div>
							<div class="modal-body">
						<div class="table-responsive">
                                	<table class="table table-bordered table-striped table-vcenter xs-width-500px">
                                <thead>
                                    <tr>
                                        <th>Owner</th>
                                        <th class="text-right">TimeStamp</th>
                                        <th class="d-none d-sm-table-cell text-center">Current Owner</th>
                                    </tr>
                                </thead>
                                <tbody id="tbody">
                                </tbody>
                            </table>
                         </div>
                         <div class="col-md-12 pl-0 pr-0 mt-10 text-center">
									<button id="subtAsToMEbtn" class=" btn btn-alt-primary">Assign to myself</button>
									<span></span>
									<button id="subtDnAsToMebtn" class=" btn btn-alt-primary">Do not assign</button>
                                     
								</div>
                         
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-alt-danger"
									data-dismiss="modal" data-toggle="click-ripple">Close</button>
							</div>
						</div>
					</div>
	      </div>
	   </sec:authorize>   
	      
	  <div id="myModal12" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">
           <div class="modal-content">
				<div class=" block-header block-header-default">
                     <h6 class="mb-0" id="headerr"></h6>
				</div>
				<div class="modal-body">
					<div class="col-md-12">
						<br>
						<div class="form-group row ">
	                         <label class="col-md-2 control-label text-right" for="submit">Argument :</label>
	                              <div class="col-md-10 ">
									<textarea id="argAdd" class="width-100" cols="4" rows="4" name="script" required></textarea>
								</div>
								<label class="col-md-2 control-label text-right" for="submit" id="branchlabel" style="display: none;">Branch :</label>
								 <div class="col-md-8" id="branchdiv1" style="display: none;">
									<select name="selectedbranch" id="branchRepo" class="js-select2 form-control width-100 select-validation" style="width: 100%" data-placeholder="Select Branch" onchange="selectCommit()" required>
											<option></option>
										</select>
									</div>
									
									<div class="col-md-2" id="branchdiv2" style="display: none"><small></small></div>
								
								<label class="col-md-2 control-label text-right mt-10" for="submit" id="commitlabel" style="display: none;">Commit :</label>
								 <div class="col-md-8 mt-10" id="commitdiv1" style="display: none;">
									<select name="selectedCommit" id="selectedCommit" class="js-select2 form-control width-100 select-validation" style="width: 100%" data-placeholder="Select commit" onchange="hideError()" required>
											<option></option>
										</select>
									</div>
									<div class="col-md-2 mt-10" id="commitdiv2" style="display: none"></div>
									
									
									<label class="col-md-2 control-label text-right mt-10"  id="error1div1" style="display: none;"></label>
								 <div class="col-md-8 mt-10" id="error1div2" style="display: none;">
									<small class="form-control-feedback"  style="">Branch and Commit is required</small>
									</div>
									<div class="col-md-2 mt-10" id="error1div3" style="display: none"></div>
									
									
								<label class="col-md-2 control-label text-right" for="submit">On error :</label>
	                              <div class="col-md-10 ">
									<div class="custom-control custom-radio custom-control-inline mb-5">
                                                    <input class="custom-control-input" type="radio" name="onError" id="exit" value="exit" >
                                                    <label class="custom-control-label" for="exit">Exit</label>
                                    </div>
                                     <div class="custom-control custom-radio custom-control-inline mb-5">
                                                    <input class="custom-control-input" type="radio" name="onError" id="continue" value="continue">
                                                    <label class="custom-control-label" for="continue">Continue</label>
                                     </div>
								</div>
								
								 <input  type="hidden"  id="depDetId" >
								<div class="col-md-12 pl-0 pr-0 mt-10 text-center">
									<button id="subtbtn" class=" btn btn-primary"></button>
									<button id="reStagesubtbtn" class=" btn btn-primary"></button>
                                     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								</div>
								</div>						
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-alt-danger" data-dismiss="modal" data-toggle="click-ripple">Close</button>
				</div>
			</div>
        </div>
	</div>
		<div id="dialog-confirm">
							<p id="textForDialog"></p>
						</div>
	<div id="myModal13" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static" >
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
																	<button type="button" class="btn btn-alt-danger" data-dismiss="modal" data-toggle="click-ripple">Close</button>
																</div>
															</div>
														</div>
						</div>
	<c:if test="${request.status=='OPEN'}">	
	<c:if test="${showCloseReq}">	
		 <div class="modal fade" id="closeRequestModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header block-header block-header-default">
								<h4 class="modal-title block-title" id="mycloseRequestModa">Confirmation</h4>
							</div>
							<div class="modal-body">
								<p >Are you sure you want to close this request?</p>
								<div class="col-md-12 pl-0 pr-0 mt-10 text-center">
								 <form action="${pageContext.request.contextPath}/closeRequest" method="post">
								  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								  <input type="hidden" name="reqid" value='${request.requestId}'> 
									<button   type="submit" class=" btn btn-primary">Yes</button>
										<button  type="button" class=" btn btn-primary" data-dismiss="modal">No</button>
								 </form>   
								</div>
							</div>
						</div>
					</div>
	         </div>
	         </c:if>
      </c:if>
      
		</main>
	</div>

	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/RequestDetailJS.jsp"%>
	<script>
		$(document).ready(function () {
		    $('.selector').mousewheel(function(e, delta) {
		        this.scrollLeft -= (delta * 40);
		        e.preventDefault();
		    });
		    
		    });
	</script>
 <script type="text/javascript">
    $(document).ready(function() {
    	displaySpinner();
    });
    function displaySpinner()
    {
        var divHeight = $('.table-responsive').height(); 
        $('.loader-height').css('height', divHeight+'px');
        
        var divWidth = $('.table-responsive').width(); 
        $('.loader-height').css('width', divWidth+'px');
    }
  </script>
		</body>
</html>