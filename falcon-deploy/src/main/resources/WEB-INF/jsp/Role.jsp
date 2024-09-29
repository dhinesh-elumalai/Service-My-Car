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
		<c:if test="${not empty roleList}">
				<c:set var="page" value="${roleList.get(0).getPageinationDto()}"></c:set>
		</c:if>
		<main id="main-container"> <!-- Page Content -->
		<div class="content">
			<div>
				<div class="block block-bordered">
					<div class="" id="fixedSet">
						<div class="block-header block-header-default">
							<h3 class="block-title">ROLE</h3>
						</div>
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active">Role</li>
							</ul>
						</div>
						<div class="col-md-12 mt-10">
							<div class="form-group">
								<div class="form-group row">
									<div class="input-group col-md-5 col-sm-8">
										<span class="input-group-addon fa fa-search search2"
											style="background-color: #fff;"></span> <input
											id="roleSearch" class="form-control t-indent-10"
											name="roleName" type="text"
											placeholder="Search by role name" autocomplete="off">
									</div>
									<div class="col-md-7 xs-mt-5 col-sm-4">
										<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
											<a href="${pageContext.request.contextPath}/assignRepoToRole" class="btn btn-primary act-new-role"
												role="button" style="float: right" data-toggle="click-ripple">Create Role</a>
										</sec:authorize>
									</div>
								</div>
							</div>
						</div>

						<div>
							<div class="block col-md-12" id="jsp_datacard_id">
							<div class="no-data text-center" id="emptyData">
									<p>There is no data to display.<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')"> please <a href="${pageContext.request.contextPath}/assignRepoToRole">Click here</a> to add.</sec:authorize></p>
								</div>
								<c:forEach items='${roleList}' var='logs' varStatus="loop">
									<div class="block block-bordered mb-30">

										<div class="block-header block-header-default">
											<h3 class="block-title">${logs.getRoleName()} <small style="font-size: 12px;font-style: italic;">(Role)</small></h3>
											<div class="header-options">
												<sec:authorize
													access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
													<a href="${pageContext.request.contextPath}/EditRepoToRole?roleName=${logs.getRoleName()}"
														class="btn btn-primary btn-sm xs-mt-5" role="button" data-toggle="click-ripple"><i
														class=" fa fa-pencil"></i> Edit</a>
												</sec:authorize>
											</div>
										</div>
										<div class="">
										
											<div class="card card-block" id="panel_view">
											<h6 class="list-head">Repository List</h6>
											<ul class="mapping-list">
												<c:forEach items='${logs.getRepoName()}' var='logsf'
													varStatus="loop">
													<li>
														${logsf.getRepoName()} <small>(${logsf.getAccessControl()})</small>
													</li>
												</c:forEach>
												</ul>
											</div>
										</div>
									</div>

								</c:forEach>
								
							</div>
							
							<div class=" col-md-12" id="restDataDisplay" style="display: none;"></div>
								<div class="no-data text-center" id="emptyDataajax" style="display: none;">
									<p>There is no data to display.<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')"> please <a href="${pageContext.request.contextPath}/assignRepoToRole">Click here</a> to add.</sec:authorize></p>
								</div>
						</div>

				
						<div class="container-fluid " id="pagination_div">
                               <div class="row">
                               	<nav aria-label="Page navigation">
                                     <ul class="pagination mt-10 flex-wrap" id="pagination"></ul>
                                 </nav>
                               </div>
                           </div>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/RoleJS.jsp"%>
	
	