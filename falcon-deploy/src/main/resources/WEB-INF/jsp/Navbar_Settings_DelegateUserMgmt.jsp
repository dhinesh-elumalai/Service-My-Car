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
<c:set var="page" value="${list}"></c:set>
 <main id="main-container">
                <!-- Page Content -->
                <div class="content">
	<div class="block">
		<div class="block block-bordered">
			<div id="fixedSet">
				<div class="block-header block-header-default">
						<h3 class="block-title text-uppercase">Delegated Database Credentials</h3>
					</div>
					<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active">Delegated Database Credentials</li>
							</ul>
						</div>
					<div class="form-group mb-0">
					<div class="block-header">
						<div class="col-md-5 pl-0">
							<div class="input-group">
								<span class="input-group-addon fa fa-search search1 top-10"></span> 
			                 <input id="Search" class=" form-control t-indent-10" type="text" placeholder="Search by mapping or user name " autocomplete="off">
			                 </div>
						</div>
						<div class="block-options xs-pl-0 xs-mt-5">
								
									 
			                 	<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
									<a href="${pageContext.request.contextPath}/delegateUser" class="btn btn-primary"
										role="button" style="float: left" data-toggle="click-ripple">Delegate credential</a>
								</sec:authorize>
			                 
								
							</div>			
					</div>
				</div>
				
		<div class="no-data text-center" id="emptyDataajax" style="display: none;">
									<p>There is no data to display.</p>
			</div>
				<div class="col-md-12" id="jsp_datacard_id">
					<c:if test="${list.content.size()==0}">
				<div class="no-data text-center" id="emptyDataajax" >
									<p>There is no data to display.</p>
							</div>
					</c:if>
					
						<c:forEach items='${list.content}' var='logs' varStatus="loop">
							<div class="block block-bordered">
								<div>
								<div class="block-header block-header-default">
								
										<h5 class="block-title font-w600">
											<span>${logs.targetName} <small style="font-size: 12px;font-style: italic;">(Mapping)</small> <c:if test="${logs.enabled}"><span class="badge badge-success">Active</span></c:if>
										     <c:if test="${!logs.enabled}"><span class="badge badge-danger">Inactive</span></c:if> -&gt; ${logs.dbName} <small style="font-size: 12px;font-style: italic;">(Database)</small> <c:if test="${logs.dbEnabled}"><span class="badge badge-success">Active</span></c:if>
										     <c:if test="${!logs.dbEnabled}"><span class="badge badge-danger">Inactive</span></c:if></span>
										   
 										</h5>
									
									
									</div>
								
									<div class="card-text card-block">
									<div class="block-content">
													<div class=" col-md-12">
												
												<div class="row">
											<div class="table-responsive">
												<table class="table table-bordered table-striped">
													<thead>
														<tr>
															<th>USER NAME</th>
															<th>USER (GRANTEE)</th>
															<c:if test="${logs.enabled}">
															<th class="text-center">ACTION</th>
															</c:if>
														</tr>
														</thead>
														<tbody>
											<c:forEach items='${logs.delPassDto}' var='logsf' varStatus="loop">
												<c:if test="${logsf.enabled}">
												<tr>
													<td class="font-w400 p-10">${logsf.userName}</td>
													<td><span class="color-primary"><span class="text-capitalize">${logsf.fname} ${logsf.lname} </span>(${logsf.email})</span></td>
													<c:if test="${logs.enabled}">
													<td class="text-center">
													<div class="btn-group">
														<a href="${pageContext.request.contextPath}/deleteDelegate?delDb=${logsf.db}" class="fa fa-trash btn btn-sm btn-alt-danger DeleteDialog"> </a>
													</div>
													</td>
													</c:if>
												</tr>			
												</c:if>
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
                                 <nav aria-label="Page navigation">
                                     <ul class="pagination mt-10 flex-wrap" id="pagination"></ul>
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
	<%@include file="/static/js/pages/Navbar_Settings_DelegateUserMgmtJS.jsp"%>
</body>
</html>