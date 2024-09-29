<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
<div id="preloader">
        <i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
       <p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
</div>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
	<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
	<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>
<c:set var="page" value="${list.getPgDTo()}"></c:set>
 <main id="main-container">
                <!-- Page Content -->
                <div class="content">
	<div class="block">
		<div class="block block-bordered">
			<div class="" id="fixedSet">
				<div class="block-header block-header-default">
					<h3 class="block-title">DEPLOY PRIVILEGE MANAGEMENT</h3>
				</div>
				<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active">Deploy Privilege Management</li>
							</ul>
						</div>
				<div class="block-header">

							<div class="col-md-5 pl-0">
								<div class="">
									<div class="input-group">
										<span class="input-group-addon fa fa-search search1" style="top:9px"></span> 
			                 <input id="Search" class=" form-control t-indent-10" type="text" placeholder="Search by mapping name or DB alias name or SID or service" autocomplete="off" required="required">
									</div>
								</div>

							</div>
							<div class="block-options xs-mt-5 xs-pl-0">
								<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
									<a href="${pageContext.request.contextPath}/AssignDeployprivilegeToUser" class="btn btn-primary"
										role="button" style="float: left" data-toggle="click-ripple">New Privilege</a>
								</sec:authorize>
							</div>
				</div>
					<div class="no-data text-center" id="emptyDataajax" style="display: none;">
									<p>There is no data to display.</p>
							</div>
				<div class="col-md-12" id="jsp_datacard_id">
				<c:if test="${list.dto.size()==0}">
				<div class="no-data text-center" id="emptyDataajax" >
									<p>There is no data to display.</p>
							</div>
					</c:if>
						<c:forEach items='${list.dto}' var='logs' varStatus="loop">
							<div class="block block-bordered" >
								<div>
									<div class="block-header block-header-default">
									<c:if test="${logs.enabled}">
										<h5 class="block-title font-w600 ">
											<span>${logs.map} <small style="font-size: 12px;font-style: italic;"> (Mapping)</small> <span class="badge badge-success">Active</span> -&gt; <a href="${pageContext.request.contextPath}/update-databases-tns?tns_id=${logs.dbid}"> ${logs.db} <small style="font-size: 12px;font-style: italic;"> (Database)</small> <c:if test="${logs.dbEnabled}"><span class="badge badge-success">Active</span></c:if><c:if test="${!logs.dbEnabled}"><span class="badge badge-danger">Inactive</span></c:if></a>
											</span>
											
										</h5>
											<div class="block-options xs-pl-0">
												<a href="${pageContext.request.contextPath}/editDeployPrivilege?mapping=${logs.map}&dbid=${logs.dbid}" class="btn btn-sm btn-primary" data-toggle="click-ripple"><i class="fa fa-pencil"></i> Edit</a>
											</div>
									</c:if>
									<c:if test="${!logs.enabled}">
									   <h5 class="block-title font-w600 ">
											<span>${logs.map} <small style="font-size: 12px;font-style: italic;"> (Mapping)</small> <span class="badge badge-danger">Inactive</span> -&gt; <a href="${pageContext.request.contextPath}/update-databases-tns?tns_id=${logs.dbid}"> ${logs.db} <small style="font-size: 12px;font-style: italic;"> (Database)</small> <c:if test="${logs.dbEnabled}"><span class="badge badge-success">Active</span></c:if><c:if test="${!logs.dbEnabled}"><span class="badge badge-danger">Inactive</span></c:if></a>
											</span>
											
										</h5>
									</c:if>
									
									
									</div>
									<div class="">
									<h6 class="list-head">Privileges List</h6>
									<ul class="mapping-list">
											<c:forEach items='${logs.bu}' var='logsf' varStatus="loop">
												<div class="custom-control-description">
													<li><p class="mb-10"><span class="text-capitalize">${logsf.firstName} ${logsf.lastName}</span> - ${logsf.email}</p></li>
												</div>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<div class="mb-20"></div>
						</c:forEach>
				
				</div>
				<div class=" col-md-12" id="restDataDisplay" style="display: none;"></div>
					    <div class="container-fluid " id="pagination_div">
                                 <nav aria-label="Page navigation">
                                     <ul class="pagination mt-10 flew-wrap" id="pagination"></ul>
                                 </nav>
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
	<%@include file="/static/js/pages/Navbar_Settings_DeployPrivilegeJS.jsp"%>
</body>
</html>