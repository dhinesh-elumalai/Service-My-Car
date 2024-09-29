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
<c:set var="page" value="${list.page}"></c:set>
 <main id="main-container">
                <!-- Page Content -->
                <div class="content">
	<div class="block block-bordered">
	<div class="row">
			<div class="col-md-12">
			<div class="block-header block-header-default "><h5 class="block-title text-uppercase">Saved Database Credentials</h5>
			</div>
			</div></div>
			<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active">Saved Database Credentials</li>
							</ul>
						</div>
		<div class="row">
			<div class="height-300  col-lg-12 " id="fixedSet">
				<div class="form-group mb-0" >
					<div class="row">
						<div class="col-md-12">
							<div class="">
							<div class="block-header col-md-12">
							<div class="col-md-5 pl-0">
								<div class="">
									<div class="input-group">
										<span class="input-group-addon fa fa-search search1 top-8" style="background-color: #fff;"></span> 
			                 			<input id="Search" class=" form-control t-indent-10 " type="text" placeholder="Search by mapping name or database" autocomplete="off">
									</div>
								</div>

							</div>
							<div class="block-options xs-pl-0 xs-mt-5">
							<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
									<a href="${pageContext.request.contextPath}/delegateAdd" class="btn btn-primary"
										role="button" style="float: left" data-toggle="click-ripple">New credential</a>
								</sec:authorize>
							</div>
						</div>
						</div>
						</div>
							
									
					</div>
				</div>
			<div class="no-data text-center" id="emptyDataajax" style="display: none;">
									<p>There is no data to display.</p>
							</div>
				<div class="col-md-12" id="jsp_datacard_id">
					<c:if test="${list.delegatedList.size()==0}">
				<div class="no-data text-center" id="emptyDataajax" >
									<p>There is no data to display.</p>
							</div>
					</c:if>
					
						<c:forEach items='${list.delegatedList}' var='logs' varStatus="loop">
							<div class="mb-30">
								<div class="block block-bordered ">
								<div class="">
								<div class="block-header block-header-default">
										<h5 class="block-title  font-w600">${logs.username}  <small style="font-size: 12px;font-style: italic;"> (Mapping)</small>
										<c:if test="${logs.enabled}">
										<span class="badge badge-success">Active</span>
										</c:if>
										<c:if test="${!logs.enabled}">
										<span class="badge badge-danger">Inactive</span>
										</c:if>
										</h5>
									</div>
									
									<div class="block-content">
										<div class=" col-md-12 mt-10">
												<div class="row ">
													<div class="table-responsive">
													<table class="table table-bordered table-striped">
													<thead>
														<tr>
															<th>DATABASE</th>
															<th>USERNAME</th>
															<th>STATUS</th>
															<c:if test="${logs.enabled}">
															<th class="text-center">ACTION</th>
															</c:if>
														</tr>
														</thead>
														<tbody>
															
											<c:forEach items='${logs.dbandunForUser}' var='logsf' varStatus="loop">
												<tr>
																<th class="font-w400">${logsf.link}</th>
																<td>${logsf.dbUN}</td>
																<c:if test='${logsf.dbEnabled}'><td><span class="badge badge-success">Active</span></td></c:if>
																<c:if test='${!logsf.dbEnabled}'><td><span class="badge badge-danger">Inactive</span></td></c:if>
																<c:if test="${logs.enabled}">
																<td class="text-center">
																<div class="btn-group">
														<a href="${pageContext.request.contextPath}/editDelegateMgmt?target=${logs.username}&dbUN=${logsf.dbUN}&dbid=${logsf.id}" class="fa fa-pencil btn btn-alt-primary btn-sm"  style="font-size:16px"> </a>
														<a href="${pageContext.request.contextPath}/deleteDatabasePasword?delDb=${logsf.dbId}" class="fa fa-trash btn btn-alt-danger btn-sm DeleteDialog" style="font-size:18px"> </a>
													</div>
																</td>
																</c:if>
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
							</div>
							
						</c:forEach>
				
				</div>
   <div class=" col-md-12" id="restDataDisplay" style="display: none;"></div>
					<div class="container-fluid " id="pagination_div">
                                 <nav aria-label="Page navigation flex-wrap">
                                     <ul class="pagination mt-10" id="pagination"></ul>
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
	<%@include file="/static/js/pages/Navbar_Settings_DelegateMgmtJS.jsp"%>
</body>
</html>