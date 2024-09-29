<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
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
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
<div id="preloader">
        <i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
       <p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
</div>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>
	
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
	      <!--Jquery will dynamically add contents here...  -->
	     <div class="modal fade" id="changeUN" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

	      </div>
		<main id="main-container"> 
		<div class="content">
			<div class="block block-bordered">
				<div class="block-header block-header-default">
					<h3 class="block-title font-w600">
						DEPLOYMENT - ${repoName}
					</h3>
					<div class="block-options xs-text-right">
					<form action="${pageContext.request.contextPath}/updateDeployRequestRollbackFiles" method="post">
					<input type="hidden" name="reponame" value='${repoName}'>
					<input type="hidden" name="reqid" value='${request.deployRequestId}'>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

					<button class="btn btn-primary" type="submit" data-toggle="click-ripple">Previous</button>
					<button type="button" class="btn btn-primary" onclick="submitAll()" data-toggle="click-ripple">Next</button>
					<a href="${pageContext.request.contextPath}/deleteRequest?reqid=${request.deployRequestId}"><button class="btn btn-danger" type="button" data-toggle="click-ripple">Cancel</button></a>

					</form>	
					</div>
				</div>
				<div class="col-md-12">
					<div class="block block-bordered ">
						<div class="block-header block-header-default">
							<h3 class="block-title">Select Database</h3>
						</div>
						<div class="block-content">
						<c:forEach items="${notSelecteddbList}" var="db">
							<div class="col-md-12 "> <label class="css-control css-control-primary css-control-sm css-checkbox">
									<input type="checkbox" value="${db.getId()}---${db.getLink()}---${db.isShowCredentialViewOnDeployRequest()}" class="chkbox css-control-input" id="section-hider"> 
									<span class="css-control-indicator"></span>
									${db.getLink()}  
								</label>
							</div>
							</c:forEach>
							<c:forEach items="${SelecteddbList}" var="db">
							<div class="col-md-12 ">
								<label class="css-control css-control-primary css-control-sm css-checkbox">
									<input type="checkbox" value="${db.getId()}---${db.getLink()}---${db.isShowCredentialViewOnDeployRequest()}" class="chkbox css-control-input" id="section-hider" checked>
									 <span class="css-control-indicator"></span>
									${db.getLink()}  
								</label>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!--Contents will be added dynamically here using jquery  -->
				<div class="box-hider" id="add">
<c:forEach items="${deploymentRepo.findByRequestIdDeployRequestIdOrderByPriorityAsc(request.deployRequestId)}" var="db" varStatus="i">
<c:forEach items="${SelecteddbList}" var="db1">
<c:if test="${db1.getId()==db.getDbId().getId()}">
<c:set var = "showCred"  value = "${db1.isShowCredentialViewOnDeployRequest()}"/>
</c:if>
</c:forEach>			
<form id="${db.getDbId().getId()}">
    <div class="col-md-12">
        <div class="block block-bordered">
            <div class="block-header block-header-default">
                <h3 class="block-title">${dbconverter.convertDbToString(db.getDbId())}</h3>
                <div class="block-options">
                    <div class="form-group ">
	                    <ul class="nav navbar-nav">
	                    	<li class="mr-10"><label>priority</label></li>
	                    	<li>
							<select class="form-control" name="priority">
                             <c:forEach var = "id" begin = "1" end = "${request.getDeployRequestDbMap().size()}">
                                 <option value="${id}" <c:if test="${db.getPriority().intValue()==id}">selected</c:if>>${id}</option>
                              </c:forEach>
        
                            </select>
							</li>
	                    </ul>
                    </div>
                </div>
            </div>
            <div class="block-header">
                <div class="block-content pl-0 pr-0">
                    <div class="col-md-6">
                        <label class="css-control css-control-primary css-control-sm css-checkbox">
                            <input type="checkbox" value="true"  class="css-control-input" name="Notify_Admin" onclick="boxDisable(${db.getDbId().getId()}, $(this));"<c:if test="${db.isNotifyAdmin()}">checked</c:if>>
                            <span class="css-control-indicator"></span>Notify Administrators </label>
                        <label class="css-control css-control-primary css-control-sm css-checkbox xs-ml-0">
                            <input type="checkbox" class="css-control-input" value="true" name="postwrappper" <c:if test="${db.isPostWrapper()}">checked</c:if>>
                            <span class="css-control-indicator"></span>Post DeploymentWrapper </label>
                    </div>
                    <c:if test="${showCred==true}">
                    <div class="${db.getDbId().getId()}displayJquery" <c:if test="${db.isNotifyAdmin()}">style="display:none"</c:if>>
                        <div class="col-md-8">
                            <div class="row">
                                <div class="block-header xs-width-100">
                                    <select class="form-control mySelect xs-width-100" name="credential" onchange="changeCredentialView(${db.getDbId().getId()},$(this));">
                                        <option value="delegated" selected>Delegated Credential</option>
                                        <option value="saved">Saved Credential</option>
                                        <option value="credential" selected>Enter Credential</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="block">
                                <div class="">
                                    <div class="form-group" id="owncredentialdiv" >
                                        <div class="mb-20">
                                            <label>User Name</label>
                                            <input type="text" class="form-control" name="un" placeholder="User Name" required>
                                        </div>
                                        <div class="mb-20">
                                            <label>Password</label>
                                            <input type="password" class="form-control" name="pw" required>
                                        </div>
                                        <button type="button" name="savecredential" class="btn btn-alt-primary xs-mb-5 xs-md-0-360" onclick="saveUNandPW(${db.getDbId().getId()})">Save Password</button>&emsp;
                                        <button type="button" class="btn btn-alt-primary" onclick="validateUNandPW(${db.getDbId().getId()})">Validate</button>
                                    </div>
                                    <div class="form-group" id="savedcredentialdiv" style="display: none;">
                                        <div class="mb-20">
                                            <label>User Name</label>
                                            <select class="form-control" name="savedCredentialSelect"></select>
                                        </div>
                                        <button type="button" class="btn btn-alt-primary" onclick="validateSaved(${db.getDbId().getId()})">Validate</button>
                                    </div>
                                    <div class="form-group" id="delegatedcreadentialdiv" style="display: none;">
                                        <div class="mb-20">
                                            <label>User Name</label>
                                            <select class="form-control" name="DelegateCredentialUN"></select>
                                        </div>
                                        <button type="button" class="btn btn-alt-primary" onclick="validateDelegate(${db.getDbId().getId()})">Validate</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:if>
                </div>
            </div>
            <div class="">
                <div class="block block-bordered">
                    <div class="block-content">
                        <div class="table-responsive">
                            <table class="table table-bordered table-vcenter sorttable xs-width-1000"  id="${db.getDbId().getId()}sort">
                                <thead>
                                    <tr>
                                        <th class="text-center" style="width: 5%">delete</th>
                                        <th class="text-center" style="width: 5%;">sort</th>
                                        <th class="text-left" style="width: 25%;">Script Name</th>
                                        <th style="display: none;">Delegated</th>
                                        <th style="display: none;">saved</th>
                                        <th class="text-center" style="width: 10%;">User Name</th>
                                        <th class="text-center" style="display: none;">Password</th>
                                        <th class="text-center" style="width: 25%;">parameters <c:if test="${mapTypeUsed=='ORACLE'}"><small> (Space separated)</small></c:if>
                                        <c:if test="${mapTypeUsed=='MYSQL'}">
                                        <br>
                                      		 <small>(Example : SET @var1 = 2;SET @var2 = 'sample';)</small>
                                        </c:if>
                                        <c:if test="${mapTypeUsed=='ORACLE'}">
                                        <br>
                                       	   <small>(Example : 2 'sample')</small>
                                        </c:if>
                                        </th>
                                        <th class="text-center" style="width: 10%;">Error Handling</th>
                                    </tr>
                                </thead>
                                <tbody class="ui-sortable">
  <c:forEach items="${deploymentDetailRepo.findByDeployDbIdIdAndRollbackFileIsFalseOrderByFileOrderAsc(db.getId())}" var="files" varStatus="i">
    <tr class="ui-state-default" id="${db.getDbId().getId()}_${i.index}">
        <td class="text-center">
            <button type="button" class="btn btn-sm btn-secondary js-tooltip-enabled del-btn"><i class="fa fa-times"></i></button>
        </td>
        <td class="font-w600 text-center"><i class="si si-cursor-move"></i></td>
        <td>
            <input type="hidden" readonly name="files" id="fn_${i.index}" value="${fn:replace(files.getFileMap().getFileName(), '\\\\','\\')}">${fn:replace(files.getFileMap().getFileName(), '\\\\','\\')}</td>
        <td id="delegate_${i.index}" name="${db.getDbId().getId()}_Delegated" style="display: none;">
${files.delegated}
        </td>
        <td id="saved_${i.index}" name="${db.getDbId().getId()}_saved" style="display: none;">
${files.saved}
        </td>
        <td class="text-center" >
            <button type="button" class="tdusername badge badge-primary" name="${db.getDbId().getId()}_selecteduser" id="un_${i.index}" onclick="changeUNandPW($(this))" style="border:none; cursor:pointer"><c:if test="${!db.isNotifyAdmin()}">${files.getUserName()}</c:if></button>
        </td>
        <td class="text-center" style="display: none;">
        <c:if test="${!(files.delegated||files.saved)}">
            <input type="password" class="form-control" name="${db.getDbId().getId()}_selecteduserpass" value='${files.getPassWord()}' id="pw_${i.index}" readonly>
        </c:if>
        </td>
        <td class="text-center">
            <textarea class="form-control" id="param_${i.index}" name="parameters" placeholder="Type Parameters" >${files.getArgs()}</textarea>
        </td>
        <td class="text-center">
            <select class="form-control" name="onError" id="err_${i.index}">
                <option value="false" <c:if test="${!files.getContinueOnError()}">selected</c:if>>Exit On Error</option>
                <option value="true" <c:if test="${files.getContinueOnError()}">selected</c:if>>Continue On Error</option>
            </select>
        </td>
    </tr>
</c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</c:forEach>
				</div>
			</div>
		</div>
		<!-- END Page Content --> </main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/Navbar_NewDeployement_step3JS.jsp"%>
</body>
</html>
