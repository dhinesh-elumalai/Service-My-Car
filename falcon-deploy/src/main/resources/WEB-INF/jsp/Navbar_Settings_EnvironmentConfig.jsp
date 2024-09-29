<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>

<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
	<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
	<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

 <main id="main-container">
   <div id="preloader">
        <i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
       <p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
</div>             <!-- Page Content -->
                <div class="content">
	<div class="block block-bordered">
	<div class="row">
			<div class="col-md-12">
			<div class="block-header block-header-default ">
				<h5 class="block-title text-uppercase">Environment Configuration</h5>
			</div>
			</div></div>
			<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active">Environment Configuration</li>
							</ul>
						</div>
		<div class="row padding-10 content">
			<div class="container  col-lg-12" id="fixedSet">
				<div class="form-group" >
					<div class="row">
						<div class="col-md-6 col-sm-7 input-group">
			                <span class="input-group-addon fa fa-search search2" ></span> 
			                 <input id="Search" class=" form-control t-indent-10" type="text" placeholder="Search by environment name" autocomplete="off">
			           	
						</div>
						<div class="col-md-2 col-sm-1"></div>
							<div class="col-md-4 col-sm-4 xs-mt-5">
								<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
									<a href="${pageContext.request.contextPath}/envConfigAdd" class="btn btn-primary"
										role="button" style="float: right" data-toggle="click-ripple">New Environment</a>
								</sec:authorize>
							</div>			
					</div>
				</div>
					<div class="card card-block height-500" "
					id="table_card_id">
					<div class=" table-responsive" id="jsp_table">
						<table class="table table-striped table-bordered xs-width-500px">
							<thead class="">
								<tr>
									<!-- <th style="width:50px" class="text-right">ID</th> -->
									<th>Environment Name</th>
									
									<th class="text-center" colspan="2">Action</th>
								</tr>
							</thead>
							<tbody id="jsp_loaded_data">
								<c:forEach items='${page.content}' var='logs' varStatus="loop">
									<tr>
										
										<%-- <td style="height:40px" class="text-right"><c:out value='${logs.environmentId}' /></td> --%>
										<th style="font-weight:normal"><c:out value='${logs.environmentName}' /></th>
										<c:choose>
										<c:when test="${(logs.defaultEnvironment==true)}">
										 <td class="text-center"></td>
										</c:when>
										<c:otherwise>
										<td class="text-center border-right-none">
										
                            <div class="btn-group">
										<a href="${pageContext.request.contextPath}/envConfigEdit?envId=${logs.environmentId}"><i class="fa fa-pencil-square-o text-centet btn btn-alt-primary btn-sm" style="padding-top: 8px;"></i></a>
										<a href="${pageContext.request.contextPath}/deleteEnv?envId=${logs.environmentId}" class="DeleteEnvDialog btn btn-alt-danger btn-sm"><i class="fa fa-trash "></i></a>
									</div>
										</td>
										</c:otherwise>
										</c:choose>
										
									</tr>
								</c:forEach>
							</tbody>
							<tbody id="Ajax_loaded_data">
							</tbody>
						</table>
					</div>
					
             	 <nav aria-label="Page navigation">
                       <ul class="pagination flex-wrap mt-10" id="pagination"></ul>
                 </nav>
				</div>
						<div id="dialog-confirm">
							<p id="textForDialog"></p>
						</div>
			</div>
		</div>
	</div>
	</div>
	</main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
<%@include file="/static/js/pages/Navbar_Settings_EnvironmentConfigJS.jsp"%>	
</body>
</html>