<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
	<div id="preloader">
		<!-- <img src="static/img/loader.png"> -->
		<i class="fa fa-3x fa-cog fa-spin" style="color: #324a7e"></i>
		<p>
			Loading <br>
			<small style="text-transform: capitalize">Please Wait</small>
		</p>
	</div>
	<div id="page-container"
		class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>
			<div id="dialog-confirm">
		<p id="textForDialog"></p>
	</div>
	<c:if test="${MODE=='EDIT'}">
		<div id="myModal" class="modal fade " role="dialog">
								<div class="modal-dialog modal-lg">
									<div class="modal-content ">
										<div class="modal-header block-header block-header-default">

											<h4 class="block-title">File Upload 
											<br><small style="color: #e86e6e">Note: Uploading a new credential file will delete the current credential file</small>
											</h4>
										
										</div>
										<div class="modal-body">
										<div class="">
							
												<form  id="chooseService">
												<div id="NewfileUploadForm">
													<div class="form-group row" id="modalFileUploadDiv">
													
												<label class="col-md-3 text-right" for=""><b>Credential zip file:</b></label>
													<div class="col-sm-7 ">
													<input type="hidden" value="${autodb.id}" name="tns_id">
													<input type="file" style="border:1px solid #dedede; padding:3px ; width:100%" name="credfile" onchange="emptySelectBox()" accept=".zip" id="fileSave">
													<small style="display: none; color:#f00;" id="fileupstat"> </small>
													
													<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />	
												</div>
											<button type="button" class="btn btn-primary xs-mt-5 js-click-ripple-enabled" data-toggle="click-ripple" onclick="changeCredFileandUpload()">
											<span class="click-ripple animate" ></span>Upload</button>
													
												</div>
												</div>
												<input type="hidden" value="${autodb.id}" name="tns_id">
												<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />	
												<div id="serviceModalBox" style="display: none">
												<div class="form-group row"  >
														<label class="col-md-3 text-right" for=""><b>Select Service:</b></label>
															<div class="col-md-7 ">
																<select id="ModalselectBoxService" name="service" class="form-control">
													             </select>
													             <small style="display: none; color:#f00;" id="fileupstat1"> </small>
															</div>
															
												</div>
														<div class="form-group row">
																<div class="col-md-12 text-center">
																		<button type="button" onclick="submitFileUploadModal()"  class=" btn btn-primary">Submit</button>
																		<i class="" style="vertical-align:middle;"  id="updateFile"></i>
																</div>
														</div>
														</div>
														</form>
												
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-alt-danger js-click-ripple-enabled" data-dismiss="modal" data-toggle="click-ripple" style="overflow: hidden; position: relative; z-index: 1;">Close</button>
										</div>
									</div>

								</div>
					</div>
		</c:if>
					
					
					
		
	<div class="modal fade" id="memberModal" tabindex="-1" role="dialog" aria-labelledby="memberModalLabel" aria-hidden="true">
									<div class="modal-dialog <c:if test="${pingStatus.length()>30}"> modal-lg</c:if> " id="switchSizeModal">
										<div class="modal-content">
											<div class="modal-header block-header block-header-default">
											
												<h4 class="modal-title col-md-12 block-title"
													id="memberModalLabel">
													Status
												</h4>
											</div>
											<div class="modal-body">
												<div class="block-content text-center">
													<p id="upload_status">
													<c:if test="${pingStatus.length()>20}">
														Ping failed! <br>
													</c:if>
														${pingStatus}
														<c:if test="${showUpdateSTS}">
														Update successsfull!
														</c:if>
													</p>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn  btn-alt-success" data-dismiss="modal" >Close</button>
											</div>
										</div>
									</div>
	</div>
								
								
								
		<main id="main-container"> <!-- Page Content -->
		<div class="content">
			<div class="block">
				<div class="block block-bordered">
					<div class="block-header block-header-default">
						<h3 class="block-title">Databases</h3>
					</div>
					<div class="col-md-12">
						<ul class="bg-none padding-left-0 breadcrumb">
							<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
							<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/databases">Database</a></li>
							<c:if test="${MODE=='EDIT'}">
								<li class="breadcrumb-item active">Edit Autonomous Database</li>
							</c:if>
							<c:if test="${MODE=='CREATE'}">
								<li class="breadcrumb-item active">Create Autonomous Database</li>
							</c:if>
						</ul>
					</div>
					<div class="col-md-12 p-0" id="fixedSet">
					<br>
					<c:if test="${MODE=='CREATE'}">
					<!-- action=<c:url value='autonomousDBcreate' /> method="post" enctype="multipart/form-data"-->
						<form class="form-horizontal col-md-12"   id="MainForm" >
							<div class="form-group row">
								<label class="col-md-3 text-right" for="an"><b>Connection name:</b></label>
								<div class="col-md-8 col-lg-6">
									<input id="FormAliasName" name="aliasName" type="text" placeholder="" class="form-control input-md" required>
								     <small style="display: none; color:#f00;" id="FormAliasNameErr"> Connection name already exists</small>
								</div>
							</div>
							<div class="form-group row" id="userchoose">
												<label class="col-md-3 text-right" for="userchoose"><b>Environment type:</b></label>
												<div class="col-md-8 col-lg-6">
													<select id="selectBoxUser" name="env" class="form-control">
														<option  selected="selected">Select Environment type</option>
														<c:forEach var="env" items="${env}">
															<option value="${env.environmentName}">${env.environmentName}</option>
														</c:forEach>
													</select>
												</div>
							</div>
							
						  <div class="form-group row">
								<label class="col-md-3 text-right" for="an"><b>Credential zip file:</b></label>
								<div class="col-md-7 col-lg-6 ">
									<input type="file" onChange="clearSelectBox()" style="border:1px solid #dedede; padding:3px ; width:100%" name="credfile" accept=".zip" id="credfile" required>
								</div>
								<!-- data-toggle="popover"  data-placement="right" data-content="Upload file to continue" -->
									<button type="button" onClick="getServiceList()"  class=" btn  btn-alt-primary">Upload</button>
							</div>
							
							<div class="form-group row" id="userchoose">
												<label class="col-md-3 text-right" for="userchoose"><b>Service:</b></label>
												<div class="col-md-8 col-lg-6">
													<select id="selectBoxService" name="service" class="form-control">
													
													</select>
												</div>
							</div>
							
							<div class="form-group row">
								<div class="col-md-12 text-center">
									<button type="button" id="SubmitFormButtonForm" onclick="validateAndsubmitAJAX()" class=" btn btn-primary" >Submit</button>
									<a href="/databases"><button type="button" class=" btn btn-primary" >Back</button></a>
								</div>
							</div>
							<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
						</form>
						</c:if>
						
						
						
						
						
						
						
						<c:if test="${MODE=='EDIT'}">
						
						<form class="form-horizontal col-md-12" action=<c:url value='autonomousDBupdate' /> method="post" id="MainFormEdit">
							<div class="form-group row">
								<label class="col-md-3 text-right" for="an"><b>Connection name:</b></label>
								<div class="col-md-8 col-lg-6">
									<input  name="aliasName" type="text" placeholder="" class="form-control input-md" required value="${autodb.aliasName}">
								</div>
							</div>
							<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
							<input type="hidden" value="${autodb.id}" name="tns_id">
							
							<div class="form-group row" id="userchoose">
												<label class="col-md-3 text-right" for="userchoose"><b>Environment type:</b></label>
												<div class="col-md-8 col-lg-6">
													<select id="selectBoxUser" name="env" class="form-control">
														<c:forEach var="env" items="${env}">
															<option value="${env.environmentName}"<c:if test="${autodb.databaseEnvironment.environmentName==env.environmentName}">selected</c:if> >${env.environmentName}</option>
														</c:forEach>
													</select>
												</div>
							</div>
							<div class="form-group row" >
												<label class="col-md-3 text-right" for="userchoose"><b>Credential file:</b></label>
												<div class="col-md-7 col-lg-6">
													<input type="text"  class="form-control input-md" readonly="readonly" value="${autodb.getFileName()}">
												</div>
												<button class="btn btn-alt-primary" data-toggle="modal" data-target="#myModal" data-toggle="click-ripple">
																 Upload File
												</button>
							</div>
						
							
							<div class="form-group row" id="userchoose">
												<label class="col-md-3 text-right" for="userchoose"><b>Service:</b></label>
												<div class="col-md-8 col-lg-6">
													<select id="selectBoxService" name="service" class="form-control" onchange="changeDescriptor()" >
													<c:forEach var="service" items="${serviceList}">
															<option value="${service}"<c:if test="${autodb.service==service}">selected</c:if> >${service}</option>
														</c:forEach>
													</select>
												</div>
							</div>
							
							<div class="form-group row ">
							<label class="col-md-3 control-label text-right" for="createdBy"><b>Created By:</b></label>
							<div class="col-md-6">
								<input id="createdBy" value='${autodb.getCreatedBy().firstName} ${autodb.getCreatedBy().lastName}' type="text"class="form-control input-md text-capitalize" readonly>
							</div>
						</div>
						<div class="form-group row ">
							<label class="col-md-3 control-label text-right" for="createdAt"><b>Created At:</b></label>
							<div class="col-md-6">
								<jsp:useBean id="dateValue" class="java.util.Date" />
								<jsp:setProperty name="dateValue" property="time" value="${autodb.getCreatedAt().getTime()}" />
								<input id="createdAt" value='<fmt:formatDate value="${dateValue}"  pattern="${timestamp}"/>'type="text" class="form-control input-md" readonly>
							</div>
						</div>
						<div class="form-group row ">
							<label class="col-md-3 control-label text-right" for="updatedBy"><b>Updated By:</b></label>
							<div class="col-md-6">
								<input id="updatedBy" value='${autodb.getUpdatedBy().firstName} ${autodb.getUpdatedBy().lastName}' type="text"
									class="form-control input-md text-capitalize" readonly>

							</div>
						</div>
						
						<div class="form-group row ">
							<label class="col-md-3 control-label text-right" for="updatedAt"><b>Updated At:</b></label>
							<div class="col-md-6">
								<input id="updatedAt123" type="hidden" value='${autodb.getUpdatedAt()}'>
								<jsp:useBean id="dateValue2" class="java.util.Date" />
								<jsp:setProperty name="dateValue2" property="time" value="${autodb.getUpdatedAt().getTime()}" />
								<input id="updatedAt"  type="text" <c:if test="${not empty autodb.getUpdatedAt()}">value='<fmt:formatDate value="${dateValue2}"  pattern="${timestamp}"/>'</c:if> class="form-control input-md" readonly>
							</div>
						</div>
						
						<div class="form-group row ">
							<label class="col-md-3 control-label text-right" for="descriptor"><b>Descriptor:</b></label>
							<div class="col-md-8 col-lg-6">
								<textarea rows="6" cols="6" readonly="readonly"  placeholder="" style="width: 100%; padding:8px 14px;" id="textAreaDB" >${autodb.getDescriptor().trim()}</textarea>
							</div>
						</div>
							
							<div class="form-group row">
								<div class="col-md-12 text-center">
									<button type="button"   class=" btn btn-primary" onclick="pingTest()">Ping Test</button>
									<button type="submit" id="updateButtonForm" disabled class=" btn btn-primary" >Update</button>
									<c:if test="${!showDelete}">
									<c:if test='${autodb.isEnableStatus()}'>
									 <a href="${pageContext.request.contextPath}/disable-databases-tns?tns_id=${autodb.getId()}" class="DeleteTnsDialog btn btn-md btn-alt-danger " data-toggle="click-ripple">
										Disable
									</a>
									</c:if>
									<c:if test='${!autodb.isEnableStatus()}'>
									 <a href="${pageContext.request.contextPath}/enable-databases-tns?tns_id=${autodb.getId()}" class="DeleteTnsDialog btn btn-md btn-alt-success " data-toggle="click-ripple">
										Enable
									</a>
									</c:if>
									</c:if>
									<c:if test="${showDelete}">
									 <a href="${pageContext.request.contextPath}/delete-databases-tns?tns_id=${autodb.getId()}" class="DeleteTnsDialogPermanenet btn btn-md btn-alt-danger " data-toggle="click-ripple">
										Delete
									</a>
										<c:if test='${!autodb.isEnableStatus()}'>
									 <a href="${pageContext.request.contextPath}/enable-databases-tns?tns_id=${autodb.getId()}" class="DeleteTnsDialog btn btn-md btn-alt-success " data-toggle="click-ripple">
										Enable
									</a>
									</c:if>
									</c:if>
								</div>
							</div>
							<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
						</form>
						</c:if>

					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/Databases_autonomous_createJS.jsp"%>
</body>
</html>
