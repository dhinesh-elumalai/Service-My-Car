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

 <main id="main-container">
                <!-- Page Content -->
                <div class="content">
	<div class="block block-bordered">
	<div class="row">
			<div class="col-md-12">
			<div class="block-header block-header-default "><h5 class="block-title text-uppercase">File Type Configuration</h5>
			</div>
			</div></div>
			<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active">File Type Configuration</li>
							</ul>
						</div>
		<div class="container">
			<div class="col-md-12" id="fixedSet">
			<div class="block-header pl-0 pr-0">
							<div class="col-md-5 pl-0 xs-mb-5">
								<div class="">
									<div class="input-group">
							<span class="input-group-addon fa fa-search search1 top-8" ></span> 
			                <input id="Search" class=" form-control t-indent-10 " type="text" placeholder="Search by file type" autocomplete="off">
									</div>
								</div>

							</div>
							<div class="block-options xs-pl-0">
								<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
									<a href="${pageContext.request.contextPath}/fileConfigAdd" class="btn btn-primary"
										role="button" style="float: left" data-toggle="click-ripple">New File Type</a>
								</sec:authorize>
							</div>
						</div>
			
					<div class="card card-block" id="table_card_id">
					<div class=" table-responsive" id="jsp_table">
						<table class="table table-striped table-bordered xs-width-500px">
							<thead class="text-center">
								<tr>
									<th class="text-left">File Extension Name</th>									
									<th>Action</th>
								</tr>
							</thead>
							<tbody id="jsp_loaded_data">
								<c:forEach items='${page.content}' var='logs' varStatus="loop">
									<tr>
										
										
										<th style="font-weight:normal"><c:out value='${logs.fileTypeName}' /></th>
										<c:choose>
													<c:when test="${(logs.defaultFileType==true)}">
														<td></td>
													</c:when>
													<c:otherwise>
														<td class="text-center" style="">
														<div class="btn-group">
														<a href="${pageContext.request.contextPath}/fileConfigEdit?fileTypeId=${logs.fileTypeId}">
															<span class="fa fa-pencil-square-o btn btn-sm btn-alt-primary" style="padding-top:8px"></span>
														</a>
														<a href="${pageContext.request.contextPath}/deleteFileType?fileTypeId=${logs.fileTypeId}" class="DeleteFiletypDialog">
															<span class="fa fa-trash btn btn-sm btn-alt-danger" style="padding-top:8px"></span>
														</a>
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
					
					<div id="pagination_div">
                                 <nav aria-label="Page navigation">
                                     <ul class="pagination mt-10 flex-wrap" id="pagination"></ul>
                                 </nav>
                     </div>
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
<%@include file="/static/js/pages/Navbar_Settings_FileTypeConfigJS.jsp"%>	
</body>
</html>