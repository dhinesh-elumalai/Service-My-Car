 <%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
	<style>
.popover-header{
    background: #f0f2f5;
    padding-bottom: 10px;
}
	</style>
<body>
<div id="preloader">
		<!-- <img src="static/img/loader.png"> -->
		<i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
		<p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
	</div>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>
		
                  <c:if test="${not empty targetList}">
					<c:set var="page" value="${targetList.get(0).getPageinationDto()}"></c:set>
				</c:if>
			
				
		<main id="main-container"> <!-- Page Content -->
		<div class="content">
			<div class="block">
				<div class="block block-bordered">
					<div class="" id="fixedSet">
						<div class="block-header block-header-default">
							<h3 class="block-title">MAPPING</h3>
						</div>
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active">Mapping</li>
							</ul>
						</div>
						<div class="col-md-12 mt-10">
							<div class="form-group">
							<div class="form-group row">
								<div class="input-group col-md-8 col-sm-8">
									
									<div class="relative-sec width-70 xs-width-100 xs-mb-5">
									<span class="input-group-addon fa fa-search search1 top-10"></span> 
									<input id="targetSearch" class=" form-control t-indent-10" name="targetName"
										type="text"
										placeholder="Search by mapping or repo"
										autocomplete="off">
										</div>
								</div>
								<div class="col-md-4 col-sm-4">
									<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
										<a href="${pageContext.request.contextPath}/assignDbToRepo" class="btn btn-primary"
											role="button" style="float: right" data-toggle="click-ripple">New Mapping</a>
									</sec:authorize>
								</div>

							</div>
						</div>
						</div>
					
						<div class="col-md-12">
						<c:if test="${targetList.size()==0}">
								<div class="no-data text-center"  >
									<p>There is no data to display.<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')"> please <a href="${pageContext.request.contextPath}/assignDbToRepo">Click here</a> to add.</sec:authorize></p>
								</div>
						</c:if>
						<c:if test="${targetList.size()!=0}">
							<div class="block block-border" id="jsp_datacard_id">
								<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
									<c:forEach items='${targetList}' var='logs' varStatus="loop">
										<div class="block block-bordered" >
											<div class="">
											<div class="block-header block-header-default">
											                <c:url value="folders" var="url">
                                                                  <c:param name="directory" value="${directory}${logs.getRepoName().repoName}" />
                                                                  <c:param name="accessControl" value="READ/WRITE" />
                                                                  <c:param name="gitStatus" value="${logs.getRepoName().getGitProvided()}" />
                                                                  <c:param name="IsA" value="T" />
                                                                  <c:param name="access" value="direct" />
                                                                  <c:param name="team" value="nil" />
                                                                  <c:param name="role" value="nil" />
                                                           </c:url>
												<h3 class="block-title font-w600">
												<c:if test="${logs.getRepoName().enabled}">
												<a class="" href="${pageContext.request.contextPath}/${url}">${logs.getTarget().getTargetName()}
												<c:if test="${logs.getTarget().mapType=='MYSQL'}">
													<span class="badge badge-danger MYSQLbTN">MySQL</span>	
												</c:if>	
												<c:if test="${logs.getTarget().mapType=='ORACLE'}">
													<span class="badge badge-success OracleBTN">ORACLE</span>	
												</c:if>	
												 <small style="font-size: 12px;font-style: italic;">(Mapping)</small>
														-> ${logs.getRepoName().repoName} <small style="font-size: 12px;font-style: italic;">(Repo)</small></a>
												</c:if>
												<c:if test="${!logs.getRepoName().enabled}">
												${logs.getTarget().getTargetName()}
												<c:if test="${logs.getTarget().mapType=='MYSQL'}">
													<span class="badge badge-danger MYSQLbTN">MySQL</span>	
												</c:if>	
												<c:if test="${logs.getTarget().mapType=='ORACLE'}">
													<span class="badge badge-success OracleBTN">ORACLE</span>	
												</c:if>	
												 <small style="font-size: 12px;font-style: italic;">(Mapping)</small>
														-> ${logs.getRepoName().repoName} <small style="font-size: 12px;font-style: italic;">(Repo)</small>
												</c:if>
												  <c:if test="${logs.getRepoName().enabled}">
												<span class="badge badge-success">Active</span>
												</c:if>
												<c:if test="${!logs.getRepoName().enabled}">
												<span class="badge badge-danger">Inactive</span>
												</c:if>	

												 </h3>
											  		
												<c:if test="${logs.getRepoName().enabled}">	
												<div class="header-options">
													<a href="${pageContext.request.contextPath}/editRepoToDb?targetName=${logs.getTarget().getTargetName()}&repoName=${logs.repoName.repoName}"
														class="btn btn-sm btn-primary xs-mt-5" data-toggle="click-ripple"><i class=" fa fa-pencil"></i> Edit</a>
												</div>
												</c:if>
												</div>
												<div class="card-text card-block">
													<h6 class="list-head">Database List</h6>
													<ul class="mapping-list">
													<c:forEach items='${logs.getDatabases()}' var='logsf' varStatus="loop">
																<li>
																	<c:if test="${empty logsf.aliasName}">
																		<c:if test="${empty logsf.sid}">
																			<span class="custom-control-description">
																			<c:if test="${logsf.getautonomous()}">
																			<a href="${pageContext.request.contextPath}/update-databases-autonomous?tns_id=${logsf.getId()}" <c:if test="${displayDescriptor}">data-toggle="popover" title="Descriptor" data-placement="right" data-content="${logsf.getDescriptor()}"</c:if>>
																					${logsf.hostName}:${logsf.getPort()}/${logsf.service}</a>
																			</c:if>
																			<c:if test="${!logsf.getautonomous()}">
																			<a href="${pageContext.request.contextPath}/update-databases-tns?tns_id=${logsf.getId()}" <c:if test="${displayDescriptor}">data-toggle="popover" title="Descriptor" data-placement="right" data-content="${logsf.getDescriptor()}"</c:if>>
																					${logsf.hostName}:${logsf.getPort()}/${logsf.service}</a>
																			</c:if>
																			</span>
																		</c:if>
																		<c:if test="${empty logsf.service}">
																			<span class="custom-control-description">
																			<c:if test="${logsf.getautonomous()}">
																			<a href="${pageContext.request.contextPath}/update-databases-autonomous?tns_id=${logsf.getId()}" <c:if test="${displayDescriptor}">data-toggle="popover" title="Descriptor" data-placement="right" data-content="${logsf.getDescriptor()}"</c:if>>
																					${logsf.hostName}:${logsf.getPort()}:${logsf.sid}</a>
																			</c:if>
																			<c:if test="${!logsf.getautonomous()}">
																			<a href="${pageContext.request.contextPath}/update-databases-tns?tns_id=${logsf.getId()}" <c:if test="${displayDescriptor}">data-toggle="popover" title="Descriptor" data-placement="right" data-content="${logsf.getDescriptor()}"</c:if>>
																					${logsf.hostName}:${logsf.getPort()}:${logsf.sid}</a>
																			</c:if>		
																			</span>
																		</c:if>
																	</c:if> 
																	<c:if test="${not empty logsf.aliasName}">
																		<span class="custom-control-description">
																			<c:if test="${logsf.getautonomous()}">
																				<a href="${pageContext.request.contextPath}/update-databases-autonomous?tns_id=${logsf.getId()}" <c:if test="${displayDescriptor}">data-toggle="popover" title="Descriptor" data-placement="right" data-content="${logsf.getDescriptor()}"</c:if>>
																					${logsf.aliasName}</a>
																			</c:if>
																			<c:if test="${!logsf.getautonomous()}">
																				<a href="${pageContext.request.contextPath}/update-databases-tns?tns_id=${logsf.getId()}" <c:if test="${displayDescriptor}">data-toggle="popover" title="Descriptor" data-placement="right" data-content="${logsf.getDescriptor()}"</c:if>>
																					${logsf.aliasName}</a>
																			</c:if>	
																	
																		</span>
																	</c:if>
																	<c:if test="${!logsf.isEnableStatus()}">
																	<span class="badge badge-danger">Inactive</span>
																	</c:if>
																	<c:if test="${logsf.getautonomous()}">
																	<span class="badge badge-success">Autonomous</span>
																	</c:if>
																</li>
															
														</c:forEach>
														</ul>
												</div>
											</div>
										</div>
										
									</c:forEach>
								</sec:authorize>
								<sec:authorize access="hasAnyAuthority('TEAM_ADMIN','USER')">
									<c:forEach items='${targetList}' var='logs' varStatus="loop">
									
										<div class="card card-inverse">
											<div>
												
												<div class="block block-bordered">
												<div class="block-header block-header-default">
											
												<h3 class="block-title font-w600 color-primary">
													<a href="${pageContext.request.contextPath}/application">${logs.getRepo().getTargetName()} 
													<c:if test="${logs.getRepo().mapType=='MYSQL'}">
														<span class="badge badge-danger MYSQLbTN">MySQL</span>	
													</c:if>	
													<c:if test="${logs.getRepo().mapType=='ORACLE'}">
														<span class="badge badge-success OracleBTN">ORACLE</span>	
													</c:if>	
													<small style="font-size: 12px;font-style: italic;">(Mapping)</small> -> ${logs.getRepo().getRepoName()} <small style="font-size: 12px;font-style: italic;">(Repo)</small></a>
												</h3>
											</div>
											<h6 class="list-head">Database List</h6>
													<ul class="mapping-list" data-toggle="slimscroll" data-height="250px">
														<c:forEach items='${logs.getDatabases()}' var='logsf' varStatus="loop">
																<li><c:if test="${empty logsf.aliasName}">
																		<c:if test="${empty logsf.sid}">
																			<span class="custom-control-description" <c:if test="${displayDescriptor}">data-toggle="popover" title="Descriptor" data-placement="right" data-content="${logsf.getDescriptor()}"</c:if>>
																					${logsf.hostName}:${logsf.getPort()}/${logsf.service}</span>
																		</c:if>
																		<c:if test="${empty logsf.service}" >
																			<span class="custom-control-description" <c:if test="${displayDescriptor}">data-toggle="popover" title="Descriptor" data-placement="right" data-content="${logsf.getDescriptor()}"</c:if>>
																					${logsf.hostName}:${logsf.getPort()}:${logsf.sid}</span>
																		</c:if>
																	</c:if> <c:if test="${not empty logsf.aliasName}">
																		<span class="custom-control-description" <c:if test="${displayDescriptor}">data-toggle="popover" title="Descriptor" data-placement="right" data-content="${logsf.getDescriptor()}"</c:if>>
																				${logsf.aliasName}</span>
																	</c:if>
																<c:if test="${!logsf.isEnableStatus()}">
																	<span class="badge badge-danger">Inactive</span>
																</c:if>
																<c:if test="${logsf.getautonomous()}">
																	<span class="badge badge-success">Autonomous</span>
																	</c:if>
																</li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</div>
									</c:forEach>
								</sec:authorize>
							</div>
						
							<div class="" id="restDataDisplay"style="display: none;">
							<span class="no-data text-center" id="emptyDataajax" >
									<p>There is no data to display.<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')"> please <a href="${pageContext.request.contextPath}/assignDbToRepo">Click here</a> to add.</sec:authorize></p>
								</span>
							</div>
								</c:if>
							</div>
						
					<div class="container-fluid " id="pagination_div">
                        <nav aria-label="Page navigation">
                             <ul class="pagination mt-10 flex-wrap" id="pagination"></ul>
                        </nav>
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
	
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/MappingJS.jsp"%>
	