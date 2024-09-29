<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<body>
<div id="preloader">
		<!-- <img src="static/img/loader.png"> -->
		<i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
		<p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
	</div>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">	
<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
	<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

 <main id="main-container">
                <!-- Page Content -->
                <div class="content">
	<div class="block">
		<div class="block block-bordered ">
			<div class="" id="fixedSet">
			
	        <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header block-header block-header-default">
								<h4 class="modal-title block-title" id="myModalLabel">Result</h4>
							</div>
							<div class="modal-body">
								<p id="status"></p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-alt-success"
									data-dismiss="modal" data-toggle="click-ripple">Close</button>
							</div>
						</div>
					</div>
	      </div>
<c:choose>					
   <c:when test="${FieldToUpdate.getHostName() ne null && FieldToUpdate.getPort() ne null &&(FieldToUpdate.getService() ne null || FieldToUpdate.getSid() ne null )}">
   <c:set var = "FormHostDisplay"  value="true"/>
   </c:when>
   <c:otherwise>
   <c:set var = "FormHostDisplay"  value="false"/>
   </c:otherwise>
</c:choose>	
				<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
				<div class="block-header block-header-default">
					<h3 class="block-title">UPDATE DATABASE</h3>
				</div>
				<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/databases">Database</a>
								</li>
								<li class="breadcrumb-item active"> Update Database</li>
							</ul>
						</div>
				</sec:authorize>
				<sec:authorize access="hasAnyAuthority('TEAM_ADMIN','USER')">
					<h3 class="text-center">TNS Description</h3>
				</sec:authorize>
				<div class="col-md-12">
					<div class="block  mt-20">
						<form class="mt-20 col-md-12" action=<c:url value='update-tns-databases' /> method="post">
					<fieldset>
						<input type="hidden" name="tns_id" value="${FieldToUpdate.getId()}" />
		<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
					<div class="col-12 text-right">
                                            <label class="css-control css-control-sm  css-control-primary css-switch">
                                                <input type="checkbox" class="css-control-input" id="changeForm"<c:if test="${FormHostDisplay eq false}">checked</c:if>>
                                                <span class="css-control-indicator"></span><span id="toggleForm"><c:if test="${FormHostDisplay eq false}">Use Form Fields</c:if><c:if test="${FormHostDisplay eq true}">Use Descriptor</c:if></span>
                                            </label>
                     </div>


						<div class="form-group row ">
							<label class="col-md-3 control-label text-right" for="an"><b>Alias name:</b></label>
							<div class="col-md-6">
								<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
									<input id="an" name="AliasName" type="text" value='${FieldToUpdate.getAliasName()}'class="form-control input-md">
									<span style="color:red;display: none;" id="anErr" > Alias name should not be Empty. </span>
								</sec:authorize>
								<sec:authorize access="hasAnyAuthority('TEAM_ADMIN','USER')">
									<input name="AliasName" type="text"value='${FieldToUpdate.getAliasName()}' class="form-control input-md" readonly>
								</sec:authorize>
							</div>
						</div>
						
						<div class="form-group row ">
							<label class="col-md-3 control-label text-right" for="an"><b>DB Type:</b></label>
							<div class="col-md-6">
									<input id="type" name="type" type="text" value='${FieldToUpdate.dbType}' class="form-control input-md" readonly="readonly">
							</div>
						</div>

						<div class="form-group row " id="hn1" <c:if test="${FormHostDisplay eq false}">style="display:none;"</c:if>>
							<label class="col-md-3 control-label text-right" for="hn"><b>Host name:</b></label>
							<div class="col-md-6">
								<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
									<input id="hn" name="HostName" type="text"value='${FieldToUpdate.getHostName()}'class="form-control input-md" >
								    <span style="color:red;display: none;" id="hnErr" > Host name should not be Empty. </span>
								</sec:authorize>
								<sec:authorize access="hasAnyAuthority('TEAM_ADMIN','USER')">
									<input id="hn" name="HostName" type="text"value='${FieldToUpdate.getHostName()}' class="form-control input-md" readonly>
								</sec:authorize>
							</div>
						</div>

						<div class="form-group row " id="port1" <c:if test="${FormHostDisplay eq false}">style="display:none;"</c:if>>
							<label class="col-md-3 control-label text-right" for="port"><b>Port:</b></label>
							<div class="col-md-6">
								<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
									<input id="port" name="port" type="text" value='${FieldToUpdate.getPort()}'class="form-control input-md" >
							        <span style="color:red;display: none;" id="portErr" > Port should not be Empty. </span>
								</sec:authorize>
								<sec:authorize access="hasAnyAuthority('TEAM_ADMIN','USER')">
									<input id="port" name="port" type="text"value='${FieldToUpdate.getPort()}'class="form-control input-md" readonly>
								</sec:authorize>
							</div>
						</div>


						<div class="form-group row " id="service1" <c:if test="${FormHostDisplay eq false}">style="display:none;"</c:if>>
							<label class="col-md-3 control-label text-right" for="service"><b>Service:</b></label>
							<div class="col-md-6">
								<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
									<input id="service" name="service" type="text"value='${FieldToUpdate.getService()}'class="form-control input-md" >
									<span style="color:red;display: none;" id="serviceErr" > Service or Sid should not be Empty. </span>
								</sec:authorize>
								<sec:authorize access="hasAnyAuthority('TEAM_ADMIN','USER')">
									<input id="service" name="service" type="text"value='${FieldToUpdate.getService()}'class="form-control input-md" readonly>
								</sec:authorize>

							</div>
						</div>
						<div class="form-group row " id="sid1" <c:if test="${FormHostDisplay eq false}">style="display:none;"</c:if>>
							<label class="col-md-3 control-label text-right" for="sid"><b>SID:</b></label>
							<div class="col-md-6">
								<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
									<input id="sid" name="sid" type="text"value='${FieldToUpdate.getSid()}'class="form-control input-md" >
								    <span style="color:red;display: none;" id="sidErr" > Service or Sid should not be Empty. </span>
								</sec:authorize>
								<sec:authorize access="hasAnyAuthority('TEAM_ADMIN','USER')">
									<input id="sid" name="sid" type="text"value='${FieldToUpdate.getSid()}'class="form-control input-md" readonly>
								</sec:authorize>
							</div>
						</div>
					
						
						<div class="form-group row "  id="userchoose">
								<label class="col-md-3 control-label text-right" for="userchoose"><b>Environment:</b></label>
								<div class="col-md-6">
									<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
									<select id="selectBoxUser" name="env" class="width-100 form-control">
									 <c:forEach var="env" items="${env}"> 
       								 <option value="${env.environmentId}" <c:if test="${env.environmentId eq FieldToUpdate.databaseEnvironment.environmentId}">selected</c:if>>${env.environmentName}</option>
   									 </c:forEach>
									</select>
									</sec:authorize>
									<sec:authorize access="hasAnyAuthority('TEAM_ADMIN','USER')">
									<input id="sid" name="env" type="text" value='${FieldToUpdate.databaseEnvironment.environmentName}' class="form-control input-md" readonly>
								</sec:authorize>
								</div>
					  </div>							
						<div class="form-group row ">
							<label class="col-md-3 control-label text-right" for="createdBy"><b>Created By:</b></label>
							<div class="col-md-6">
								<input id="createdBy" name="createdBy"value='${FieldToUpdate.getCreatedBy().firstName} ${FieldToUpdate.getCreatedBy().lastName}' type="text"class="form-control input-md text-capitalize" readonly>
							</div>
						</div>
						<div class="form-group row ">
							<label class="col-md-3 control-label text-right" for="createdAt"><b>Created At:</b></label>
							<div class="col-md-6">
								<jsp:useBean id="dateValue" class="java.util.Date" />
								<jsp:setProperty name="dateValue" property="time" value="${FieldToUpdate.getCreatedAt().getTime()}" />
								<input id="createdAt" name="createdAt"value='<fmt:formatDate value="${dateValue}"  pattern="${timestamp}"/>'type="text" class="form-control input-md" readonly>
							</div>
						</div>
						<div class="form-group row ">
							<label class="col-md-3 control-label text-right" for="updatedBy"><b>Updated By:</b></label>
							<div class="col-md-6">
								<input id="updatedBy" name="updatedBy"
									value='${FieldToUpdate.getUpdatedBy().firstName} ${FieldToUpdate.getUpdatedBy().lastName}' type="text"
									class="form-control input-md text-capitalize" readonly>

							</div>
						</div>
						<div class="form-group row ">
							<label class="col-md-3 control-label text-right" for="updatedAt"><b>Updated At:</b></label>
							<div class="col-md-6">
								<jsp:useBean id="dateValue2" class="java.util.Date" />
								<jsp:setProperty name="dateValue2" property="time" value="${FieldToUpdate.getUpdatedAt().getTime()}" />
								<input id="updatedAt" name="updatedAt" type="text" <c:if test="${not empty FieldToUpdate.getUpdatedAt()}">value='<fmt:formatDate value="${dateValue2}"  pattern="${timestamp}"/>'</c:if> class="form-control input-md" readonly>
							</div>
						</div>
						<div class="form-group row " id="descriptor1" <c:if test="${FormHostDisplay eq true}">style="display:none;"</c:if>>
							<label class="col-md-3 control-label text-right" for="descriptor"><b>Descriptor:</b></label>
							<div class="col-md-6">
								<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
									<textarea id="descriptor" name="descriptor" class="form-control input-md" Style="height: 150px" >${FieldToUpdate.getDescriptor().trim()}</textarea>
									 <span style="color:red;display: none;" id="descriptorErr" > Descriptor should not be Empty. </span>
								</sec:authorize>
								<sec:authorize access="hasAnyAuthority('TEAM_ADMIN','USER')">
									<textarea id="descriptor" name="descriptor"
										class="form-control input-md" readonly Style="height: 150px">${FieldToUpdate.getDescriptor().trim()}</textarea>
								</sec:authorize>
							</div>
						</div>
         </sec:authorize>
						<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
							<div class="form-group row ">
								
								<div class="col-md-7 offset-md-3 sm-text-center">
								   <button type="button" class="btn btn-md btn-primary mr-sm-2 width-20" onClick="validateFieldsAvailability()" data-toggle="click-ripple">Validate</button>
									<button type="submit" id="SubmitFormButtonForm" class="btn btn-md btn-primary mr-sm-2 width-20"  disabled data-toggle="click-ripple">Update</button>
									<c:if test="${!showDelete}">
									<c:if test='${FieldToUpdate.isEnableStatus()}'>
									 <a href="${pageContext.request.contextPath}/disable-databases-tns?tns_id=${FieldToUpdate.getId()}" class="DeleteTnsDialog btn btn-md btn-alt-danger width-20" data-toggle="click-ripple">
										Disable
									</a>
									</c:if>
									<c:if test='${!FieldToUpdate.isEnableStatus()}'>
									 <a href="${pageContext.request.contextPath}/enable-databases-tns?tns_id=${FieldToUpdate.getId()}" class="DeleteTnsDialog btn btn-md btn-alt-success width-20" data-toggle="click-ripple">
										Enable
									</a>
									</c:if>
									</c:if>
									<c:if test="${showDelete}">
									 <a href="${pageContext.request.contextPath}/delete-databases-tns?tns_id=${FieldToUpdate.getId()}" class="DeleteTnsDialogPermanenet btn btn-md btn-alt-danger width-20" data-toggle="click-ripple">
										Delete
									</a>
										<c:if test='${!FieldToUpdate.isEnableStatus()}'>
									 <a href="${pageContext.request.contextPath}/enable-databases-tns?tns_id=${FieldToUpdate.getId()}" class="DeleteTnsDialog btn btn-md btn-alt-success width-20" data-toggle="click-ripple">
										Enable
									</a>
									</c:if>
									</c:if>
								</div>

							</div>
						</sec:authorize>
					</fieldset>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="dialog-confirm">
		<p id="textForDialog"></p>
	</div>
	</div>
	</main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/Databases_EditJS.jsp"%>

</body>
</html>