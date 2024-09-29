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
<c:set var="page" value="${list.pgDto}"></c:set>
 <main id="main-container">
                <!-- Page Content -->
                <div class="content">
	<div class="block">
		<div class="block block-bordered">
			<div id="fixedSet">
			<div class="block-header block-header-default">
					<h3 class="block-title text-uppercase">Wrapper Configuration</h3>
				</div>
				<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active">Wrapper Configuration</li>
							</ul>
						</div>
				<div class="block-header ">
				<div class="form-group col-md-12 mb-0" >
					<div class="row">
						<div class="col-md-5 col-sm-8 pl-0 xs-pr-0">
							 <div class="input-group">
				                <span class="input-group-addon fa fa-search search1 top-8"></span> 
				                <input id="Search" class="form-control t-indent-10" type="text" placeholder="Search by mapping" autocomplete="off">
			           		</div>	
						</div>
							<div class="block-options col-md-7 col-sm-4 pr-0">
								<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
									<a href="${pageContext.request.contextPath}/WrapperConfigAdd" class="btn btn-primary float-right xs-mt-5"
										role="button" data-toggle="click-ripple">New Wrapper Config</a>
								</sec:authorize>
							</div>			
					</div>
				</div>
				</div>
		<div class="no-data text-center" id="emptyDataajax" style="display: none;">
									<p>There is no data to display.</p>
							</div>
				<div class="col-md-12" id="jsp_datacard_id">
					<c:if test="${list.rerturnList.size()==0}">
				<div class="no-data text-center" id="emptyDataajax" >
									<p>There is no data to display.</p>
							</div>
					</c:if>
						<c:forEach items='${list.rerturnList}' var='logs' varStatus="loop">
							<div class="block block-bordered">
								<div>
								<div class="block-header block-header-default">
								   <c:if test="${logs.enabled}">
								      <h3 class="block-title font-w600">${logs.mapName} <small style="font-size: 12px;font-style: italic;">(Mapping)</small> <span class="badge badge-success">Active</span></h3>
											<div class="block-options xs-pl-0">
												<a href="${pageContext.request.contextPath}/editWrapper?mapping=${logs.mapName}" class="btn btn-primary btn-sm" data-toggle="click-ripple"><i class="fa fa-pencil"></i> Edit</a>
											</div>
									</c:if>
									<c:if test="${!logs.enabled}">
									   <h3 class="block-title color-primary font-w600">${logs.mapName} <small style="font-size: 12px;font-style: italic;">(Mapping)</small> <span class="badge badge-danger">Inactive</span></h3>
									</c:if>
								</div>
									<div class="" >
									<h6 class="list-head" style="font-weight:normal;color:#646464">Database <small style="font-size: 14px; color:#336eb9">(Wrapper file)</small></h6>
									<ul class="mapping-list">
										<c:forEach items='${logs.dbAndFile}' var='logsf' varStatus="loop">
											<li>${logsf.dbName} &nbsp;(<span class="color-primary">${logsf.fileName}</span>) <c:if test="${!logsf.dbEnabled}"><span class="badge badge-danger">Inactive</span></c:if><c:if test="${logsf.dbEnabled}"><span class="badge badge-success">Active</span></c:if></li>
										</c:forEach>
										</ul>										
									</div>
								</div>
							</div>
							
						</c:forEach>
				
				</div>
        		<div class=" col-md-12" id="restDataDisplay" style="display: none;"></div>		
					<div class="col-md-12" id="pagination_div">
                                 <nav aria-label="Page navigation">
                                     <ul class="pagination flex-wrap mt-10" id="pagination"></ul>
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
	<%@include file="/static/js/pages/Navbar_Settings_WrapperConfigJS.jsp"%>

</body>
</html>