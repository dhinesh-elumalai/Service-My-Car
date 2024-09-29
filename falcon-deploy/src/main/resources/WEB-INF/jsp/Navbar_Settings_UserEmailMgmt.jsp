<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<head>
<style type="text/css">
.css-switch .css-control-input~.css-control-indicator {
    background-color: #707071;
}

</style>
</head>
<body>
<div id="preloader">
        <i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
       <p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
</div>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
	<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
	<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

 <main id="main-container">
   <div class="content">
			<div class="">
				<div class="block block-bordered">
					<div class="block-header block-header-default">
						<h3 class="block-title">Email Notification Preference</h3>
						
					</div>
					<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active">Email Notification Preference</li>
							</ul>
						</div>

					<div class="" id="fixedSet">
						<div class="block-header">
							<div class="col-md-5 pl-0 xs-mb-5">
								<div class="">
									<div class="input-group">
										<span class="input-group-addon fa fa-search search1" style="top: 10px"></span> <input id="SearchRepoName" class=" form-control t-indent-10" name="SearchName" type="text" placeholder="Search by repo name" autocomplete="off">
									</div>
								</div>

							</div>
							<div class="block-options xs-pl-0">
								<div class="">
								
								<a href="${pageContext.request.contextPath}/silentAll" class=" btn btn-primary" data-toggle="click-ripple"><i
											class="fa fa-bell-slash"></i> Turn Off All</a>
											<a href="${pageContext.request.contextPath}/unsilentAll" class=" btn btn-primary" data-toggle="click-ripple"><i
											class="fa fa-bell"></i> Turn On All</a>
								</div>
							</div>
						</div>

				
						<div class="block col-12">
			
						<c:if test="${not isAdmin}">
							<div class="no-data text-center" id="emptyDataajax" <c:if test="${not empty list}">style="display: none;"</c:if>>
									<p>There is no data to display.</p>
							</div>
						</c:if>
							
						<c:if test="${isAdmin}">
							<div class="no-data text-center" id="emptyDataajax" <c:if test="${not empty list.content}">style="display: none;"</c:if>>
									<p>There is no data to display.</p>
							</div>
						</c:if>
							
							
							<div class=" table-responsive">
							 <div id="data-loader" class="loader-height" style="display: none; height: 175px; width: 1130px;">
 									<div style="display:table-cell; vertical-align:middle;">
 										<i class="fa fa-2x fa-cog fa-spin" style="color:#324a7e"></i>
									<p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
 									</div>
						     </div>
								<table class="table table-striped table-bordered text-left sm-width-1000" id="tableData">
								<c:if test="${not isAdmin}">
								<c:if test="${not empty list}">
									<thead id="thead">
										<tr>
											<th class="text-center">Repo Name</th>
											<th class="text-right">Updated At</th>
											<th class="text-center">OFF / ON</th>
										</tr>
									</thead>
									</c:if>
									</c:if>
								<c:if test="${isAdmin}">
								<c:if test="${not empty list.content}">
									<thead id="thead">
										<tr>
											<th class="text-center">Repo Name</th>
											<th class="text-right">Updated At</th>
											<th class="text-center">OFF / ON</th>
										</tr>
									</thead>
									</c:if>
									</c:if>
									<tbody id="jsp_loaded_data">
									<c:if test="${!isAdmin}">
									<c:forEach items="${list}" var="repoList">
											<tr>
												<td class="text-center">${repoList.repoName}</td>		
												<td class="text-right">${repoList.updatedTime}</td>										
												<td class="text-center">
													<label class="css-control css-control-sm  css-control-primary css-switch">
                                                	<input type="checkbox" class="css-control-input changeForm" <c:if test="${!repoList.selected}">checked</c:if> onchange="changeEventHandle(this,'${repoList.repoName}')">
                                               		 <span class="css-control-indicator"></span><span id="toggleForm"></span>
                                            		</label>												
                                             </td>
											</tr>
									</c:forEach>
									</c:if>
									<c:if test="${isAdmin}">
									<c:forEach items="${list.content}" var="repoList">
											<tr>
												<td class="text-center">${repoList.repoName}</td>		
												<td class="text-right">${repoList.updatedTime}</td>										
												<td class="text-center">
													<label class="css-control css-control-sm  css-control-primary css-switch">
                                                	<input type="checkbox" class="css-control-input changeForm" <c:if test="${!repoList.selected}">checked</c:if> onchange="changeEventHandle(this,'${repoList.repoName}')">
                                               		 <span class="css-control-indicator"></span><span id="toggleForm"></span>
                                            		</label>												
                                             </td>
											</tr>
									</c:forEach>
									</c:if>
									</tbody>
									<tbody id="Ajax_loaded_data">
									</tbody>
								</table>
							</div>
						
							<c:if test="${isAdmin}">
							<div class="container-fluid " id="pagination_div">
                                <div class="row">
                                	<nav aria-label="Page navigation">
                                     <ul class="pagination mt-10 flex-wrap" id="pagination"></ul>
                                 </nav>
                                </div>
                           </div>
                           </c:if>
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
<%@include file="/static/js/pages/Navbar_Settings_UserEmailMgmtJs.jsp"%>	
</body>
</html>		
			