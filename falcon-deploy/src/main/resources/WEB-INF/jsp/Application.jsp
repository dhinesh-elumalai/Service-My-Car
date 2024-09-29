<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
<div id="preloader">
		<!-- <img src="static/img/loader.png"> -->
		<i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
		<span id="loaderNormal"><p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p></span>
		<span id="loaderNormal1" style="display: none;"><p>Cloning in progress<br>This may take some time based on repo size.<br><small style="text-transform:capitalize">Please Wait</small></p></span>
		<span id="PathChangeStatus" style="display: none;"><p>In Progress <br><small style="text-transform:capitalize">Copying files</small></p></span>
	</div>
	
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">		
<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

		<main id="main-container">
		<div class="content">
			<div class="block block-bordered">
				<div>
					<div id="fixedSet">
						<div class="block-header block-header-default mb-10">
							<h3 class="block-title text-uppercase">Application</h3>
						</div>
						<div id="myModal12" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static" >
														<div class="modal-dialog modal-lg">

															<div class="modal-content">
																<div
																	class="modal-header block-header block-header-default">

																	<h4 class="col-md-12 pl-0 pr-0 block-title" >
																		Pull Status<br>
																	</h4>
																	<br>
																</div>
																<div class="modal-body pt-0">
																	<div class="col-md-12">
																		<h6 class=" text-center" style="color: red;"></h6>
																	</div>
																	<div  id="pullstatusForm">
																		<div class="block block-bordered" id="CopydataDiv">
																		<div class="block-header block-header-default">
                                   											 <h3 class="block-title">Process</h3>
                                   											<span id="prog">In progress</span>&nbsp; <i class="fa fa-2x fa-spinner fa-spin " style="color:green" id="ICOprog" ></i> 
                                   											<span id="bug"> Error</span>&nbsp; <span class="fa fa-2x fa-close" style="color:red" id="ICObug" ></span>
                                   											<span id="suc"> Completed</span>&nbsp; <span class="fa fa-2x fa-check" style="color:green" id="ICOsuc" ></span>
                               											 </div>
																		<div class=" block-content" >
                                   											 <p id="Copydata"></p>
                               											 </div>
                               											 </div>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-alt-danger" data-dismiss="modal" data-toggle="click-ripple">Close</button>
																</div>
															</div>
														</div>
						</div>
													
													
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active">Application</li>
							</ul>
						</div>

						
						<div class="col-md-12">
							<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
							<div class="block block-bordered">
							<div class="form-group pl-5 pr-5 mt-10 mb-10">
								<div class="row">
									<div class="col-md-5 input-group">
										<span class="input-group-addon fa fa-search search2"></span> <input
											id="repoNameSearch" class="form-control t-indent-10" name="repoName"
											type="text" placeholder="Search by repository name" autocomplete="off">
									</div>

									<div class="col-md-3"></div>
									<div class="col-md-4 xs-mt-5 mt-sm-1 md-sm-0">
										<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
											<button class="btn btn-alt-danger btn-block" type="button"
												data-toggle="modal" style="float: right;"
												data-target="#deleteRepo" data-toggle="click-ripple">
												<i class="fa fa-pencil"></i> Enable/ Disable Repository
											</button>
										</sec:authorize>
									</div>
								</div>
							</div>

									<div class="col-md-12 pt-10 pb-10 pl-5 pr-5">
										<div class="row">
											<div class="col-md-5 validate-red">	</div>
											<div class="col-md-3 xs-mt-5"></div>
											<div class="col-md-4 ">
												<button  class="btn btn-primary btn-block" type="button"data-toggle="modal" style="float: right;"
												data-target="#createRepo" data-toggle="click-ripple">
													<i class="fa fa-folder-open"></i> Create Repository
												</button>
											</div>
											</div>
											</div>
										<div id="createRepo" class="modal fade" role="dialog">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class=" modal-header block-header block-header-default">													
													<h4 class="modal-title block-title">Create Repository</h4>
												</div>
												<div class="modal-body">
													<section class="card card-block">
														<div class="card-text">
															<div class="form-group row">
																<div class="col-md-12">
													<ul class="nav nav-tabs" role="tablist">
														<li class="nav-item"><a class="nav-link active"
															href="#local" role="tab" data-toggle="tab">Falcon Repo</a></li>
														<li class="nav-item"><a class="nav-link"
															href="#remote" role="tab" data-toggle="tab">External Repo</a></li>
													</ul>
													
														<div class="tab-content">
														<div role="tabpanel" class="tab-pane active" id="local">
													
														<small style="color: #ef5350"><b>Note:-</b> Falcon repository stored locally and maintained by Falcon Deploy.</small>
															<form id="add_reposForm" action=<c:url value='create_repository' /> method="get">
																<div class="col-md-12 pt-10 pb-10 pl-5 pr-5">
																	<div class="row">
																		<div class="col-md-6 validate-red">	
																	<span class="input-group-addon fa fa-plus search2"></span> 								
												                     <input id="valueCheck1" class="width-100-imp form-control t-indent-10" name="repoName" type="text" placeholder="Enter new repository name" >
												                     <small   id="repoExistErr" style="color: red; display: none;">Repo name already exist &emsp;</small>
											                      </div>
											                   <div class="col-md-6 xs-mt-5">
											                    <div class="form-inline">
											                    	<label class="css-control css-control-sm css-control-primary css-radio">
                                                                    <input type="radio" class="css-control-input" value="YES" name="enableGit" checked>
                                                                    <span class="css-control-indicator"></span> With Git
                                                                    </label>
                                                                       <label class="css-control css-control-sm css-control-primary css-radio">
                                                                         <input type="radio" class="css-control-input" value="NO" name="enableGit">
                                                                         <span class="css-control-indicator"></span> Without Git
                                                                      </label>
										                        	</div>
										                     	</div>
										                  	</div>
										            	</div>
										                   	<div class="col-md-12 pt-10 pb-10 pl-5 pr-5 row">
											         <div class="col-md-4"></div>
											            <div class="col-md-4 ">
											          	<button class="btn btn-primary btn-block " type="submit" data-toggle="click-ripple">
											         		<i class="fa fa-folder-open"></i> Create Repository
											        	</button>
											      	</div>
											        	<div class="col-md-4"></div>
											      </div>
									            </form>
										</div>
									<div role="tabpanel" class="tab-pane fade" id="remote">
										<small style="color: #ef5350"><b>Note:-</b> External repository is any remote repository like Github, Gitlab or Bitbucket.</small>
									
									<form id="add_ext_reposForm" class="form-horizontal" action='create_external_repository' method="post" >
									<input type="hidden"name="${_csrf.parameterName}" value="${_csrf.token}" />
									<br>
											<div class="form-group row">
												<label class="col-md-3 text-right" for="an"><b>Repo name:</b></label>
												<div class="col-md-8 col-lg-6">
													<input id="RepoName" name="repoName" type="text" placeholder="" class="form-control input-md" required>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 text-right" for="an"><b>Repo URL:</b><br><small>(HTTP/HTTPS)</small></label>
												<div class="col-md-8 col-lg-6">
													<input id="RepoUrl" name="repoUrl" type="text" placeholder="" class="form-control input-md" required>
												</div>
											</div>
											<div class="form-group row">
											<label class="col-md-3 text-right" for="adfn"><b></b></label>
													<div class="custom-control custom-radio custom-control-inline mb-5 ml-10">
													<input id="FormServiceChecked" name="repoCredType" type="radio" value="0" checked class="custom-control-input"> <label class="custom-control-label" for="FormServiceChecked">Private Repo</label>
												</div>
												<div class="custom-control custom-radio mb-5">
													<input id="FormSidChecked" name="repoCredType" type="radio" value="1" class="custom-control-input"> <label class="custom-control-label" for="FormSidChecked">Public Repo</label>
												</div>
												</div>
											<div id="displayCredType">
											<div class="form-group row">
												<label class="col-md-3 text-right" for="an"><b>Repo User:</b></label>
												<div class="col-md-8 col-lg-6">
													<input id="RepoUser" name="repoUser" type="text" placeholder="" class="form-control input-md" required>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 text-right" for="an"><b>Repo password:</b></label>
												<div class="col-md-8 col-lg-6">
													<input id="RepoPasswd" name="repoPasswd"  type="password" placeholder="" class="form-control input-md" required>
												</div>
											</div>
											</div>
											
										    <div class="col-md-12 pt-10 pb-10 pl-5 pr-5 row">
											         <div class="col-md-4"></div>
											            <div class="col-md-4 ">
											          	<button class="btn btn-primary btn-block " type="submit" data-toggle="click-ripple">
											         		<i class="fa fa-folder-open"></i> Create Repository
											        	</button>
											      	</div>
											        	<div class="col-md-4"></div>
											  </div>
									    </form>
									</div>
									</div>
								</div>
							</div>
						</div>
						</section>
						</div> 
						<div class="modal-footer">
									<button type="button" class="btn btn-alt-danger" data-dismiss="modal">Close</button>
						</div>
						</div>
					</div>
				</div>

							</div>
								</sec:authorize>
							<div class="block">

								<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
									<div class="card-text">
										<div class=" table-responsive">
							<div class="no-data text-center" id="emptyDataajax" style="display: none;">
									<p>There is no data to display.</p>
							</div>
											<table id="myTable3" class="table table-bordered table-stripped xs-width-1000 sm-width-1000">
												<thead class="" id="thead">
													<tr>
														<th>REPO NAME</th>
														<th>TYPE</th>
														<th class="text-center">REPOSITORY STATUS</th>
														<th>CREATED BY</th>
														<th class="text-right">CREATED AT</th>
														<th class="text-center">GIT REPOSITORY</th>
													</tr>
												</thead>
												<tbody id="jsp_loaded_data">
													<c:forEach items="${repolist.content}" var="repo">
													       <c:url value="folders" var="url">
													       <c:if test="${repo.externalRepo}">
													        <c:param name="directory" value="${session_directory}${repo.repoName}" />
													       </c:if>
													         <c:if test="${!repo.externalRepo}">
													        <c:param name="directory" value="${directory}${repo.repoName}" />
													       </c:if>
                                                                 
                                                                  <c:param name="accessControl" value="READ/WRITE" />
                                                                  <c:param name="gitStatus" value="${repo.getGitProvided()}" />
                                                                  <c:param name="IsA" value="T" />
                                                                  <c:param name="access" value="direct" />
                                                                  <c:param name="team" value="nil" />
                                                                  <c:param name="role" value="nil" />
                                                                  <c:param name="externalRepo" value="${repo.externalRepo}" />
                                                           </c:url>
														<tr>

															<td class="font-w400 p-10" style="width:25%;" >
																<c:if test="${repo.enabled&&repo.externalRepo}">
																	<a href="${pageContext.request.contextPath}/${url}" onclick="openRepoAndCheckPull(event,'${repo.repoName}')">${repo.repoName}</a>
																</c:if>
																<c:if test="${repo.enabled&&!repo.externalRepo}">
																	<a href="${pageContext.request.contextPath}/${url}" >${repo.repoName}</a>
																</c:if>
																<c:if test="${!repo.enabled}">
																	${repo.repoName}
																</c:if>
															</td>
															
															<td><c:if test="${repo.externalRepo}"><span class="badge badge-primary" style="background-color: #5890ca!important">Remote</span></c:if><c:if test="${!repo.externalRepo}"><span class="badge badge-success" style="background-color: #daa520!important">Local</span></c:if></td>
															<td style="width:18%;" class="text-center">
															<c:if test="${repo.enabled}">
															<span class="badge badge-success">Active</span>
															</c:if>
															<c:if test="${!repo.enabled}">
															<span class="badge badge-danger">Inactive</span>
															</c:if>
															</td>
															<td style="width:18%;" class="text-capitalize">${repo.getCreatedBy().firstName} ${repo.getCreatedBy().lastName}</td>
															<td style="width:25%;" class="text-right"><jsp:useBean id="dateValue3" class="java.util.Date" /> <jsp:setProperty
																	name="dateValue3" property="time"
																	value="${repo.getCretedTime().getTime()}" /> <fmt:formatDate
																	value="${dateValue3}"
																	pattern="${timestamp}" /></td>
															<td style="width:25%;" class="text-center">
															
															<span <c:if test="${repo.getGitProvided()=='YES'}">class="badge badge-success" style="background-color:#ff7f50"</c:if>
															<c:if test="${repo.getGitProvided()=='NO'}">class="badge badge-danger" style="background-color:#b22222"</c:if>>${repo.getGitProvided()}</span>
															</td>
															
														</tr>
													</c:forEach>
												</tbody>
												<tbody id="Ajax_loaded_data">

												</tbody>
											</table>

										</div>
									</div>

									<div id="deleteRepo" class="modal fade" role="dialog">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class=" modal-header block-header block-header-default">													
													<h4 class="modal-title block-title">Enable/ Disable Repository</h4>
												</div>
												<div class="modal-body">
													<section class="card card-block">
														<div class="card-text">
															<br>
															<div class="form-group row">
																<div class="col-md-12">
																	<div class="input-group ">
																		<span class="input-group-addon  search1"><i
																			class="fa fa-search"></i></span> <input
																			id="repoNameSearch11" class="form-control t-indent-10"
																			name="repoName" type="text"
																			placeholder="Enter the name of the repository you want to enable/ disable. Enter '--ALL' to get the full list of repositories."
																			autocomplete="off" >
																	</div>
																	<section class="card mt-20" id="repoCard11">
																		
																		<div class=" card-text" id="repos11"></div>
																	</section>
																</div>
															</div>
														</div>
													</section>
												</div> 
												<div class="modal-footer">
													<button type="button" class="btn btn-alt-danger" data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>

								</sec:authorize>
								<sec:authorize access="hasAnyAuthority('TEAM_ADMIN','USER')">
									<div class="panel-body">
										<div class="col-md-12 pl-0 pr-0">
										<div class="input-group mt-10 mb-10">
												<span class="input-group-addon"><i
													class="fa fa-search search1 top-10"></i></span> <input
													class="form-control col-md-5 t-indent-10" id="searchBox"
													onkeyup="tableFilter()" placeholder="Search by repository name">
											</div>
											<div class=" table-responsive">
											<table id="repoTable" class="table table-bordered table-striped" style="width:1200px">
												<tbody>
													<tr>
														<th>REPO NAME</th>
														<th>TYPE</th>
														<th>CREATED BY</th>
														<th class="text-right">CREATED AT</th>
														<th class="text-center">GIT ENABLED</th>
														<th>ACCESS TYPE</th>
														<th>TEAM NAME</th>
														<th>ROLE NAME</th>
														<th>ACCESS CONTROL</th>
													</tr>
													<c:forEach items="${repolistBasedOnUser}" var="repo">
													 <c:url value="folders" var="url">
												
													       <c:if test="${repo.getRepoName1().externalRepo}">
													        <c:param name="directory" value="${session_directory}${repo.getRepoName1().repoName}" />
													       </c:if>
													         <c:if test="${!repo.getRepoName1().externalRepo}">
													        <c:param name="directory" value="${directory}${repo.getRepoName1().repoName}" />
													       </c:if>
<%--                                                                   <c:param name="directory" value="${directory}${repo.getRepoName1().repoName}" />
 --%>                                                                  <c:param name="accessControl" value="${repo.accessControl1}" />
                                                                  <c:param name="gitStatus" value="${repo.getRepoName1().getGitProvided()}" />
                                                                  <c:param name="IsA" value="F" />
                                                                  <c:param name="access" value="direct" />
                                                                  <c:param name="team" value="nil" />
                                                                  <c:param name="role" value="nil" />
                                                                  <c:param name="externalRepo" value="${repo.getRepoName1().externalRepo}" />
                                                      </c:url>
														<tr>
															<td class="font-w400 p-10">
															
															<a href="${pageContext.request.contextPath}/${url}" onclick="openRepoAndCheckPull(event,'${repo.getRepoName1().repoName}')">
																	${repo.getRepoName1().getRepoName()}</a></td>
															<td><c:if test="${repo.getRepoName1().externalRepo}"><span class="badge badge-danger" style="background-color: #5890ca!important">Remote</span></c:if><c:if test="${!repo.getRepoName1().externalRepo}"><span class="badge badge-success" style="background-color: #daa520!important">Local</span></c:if></td>		
															<td class="text-capitalize">${repo.repoName1.getCreatedBy().firstName} ${repo.repoName1.getCreatedBy().lastName}</td>
															<td class="text-right"><jsp:useBean id="dateValue122"
																	class="java.util.Date" /> <jsp:setProperty
																	name="dateValue122" property="time"
																	value="${repo.repoName1.getCretedTime().getTime()}" />
																<fmt:formatDate value="${dateValue122}"
																	pattern="${timestamp}" /></td>
															<td class="text-center"><span <c:if test="${repo.repoName1.getGitProvided()=='YES'}">class="badge badge-success" style="background-color:#ff7f50"</c:if><c:if test="${repo.repoName1.getGitProvided()=='NO'}">class="badge badge-danger" style="background-color:#b22222"</c:if>>${repo.repoName1.getGitProvided()}</span></td>
															<td>DIRECT ACCESS</td>
															<td></td>
															<td></td>
															<td>${repo.accessControl1}</td>
														</tr>
													</c:forEach>
													<c:forEach items="${repolistBasedOnUserandTeam}" var="repo">
													<c:url value="folders" var="url">
														<c:if test="${repo.repoCreate.externalRepo}">
													        <c:param name="directory" value="${session_directory}${repo.repoCreate.repoName}" />
													       </c:if>
													         <c:if test="${!repo.repoCreate.externalRepo}">
													        <c:param name="directory" value="${directory}${repo.repoCreate.repoName}" />
													       </c:if>
                                                                  <%-- <c:param name="directory" value="${directory}${repo.repoCreate.repoName}" /> --%>
                                                                  <c:param name="accessControl" value="${repo.getAccessControl()}" />
                                                                  <c:param name="gitStatus" value="${repo.repoCreate.getGitProvided()}" />
                                                                  <c:param name="IsA" value="F" />
                                                                  <c:param name="access" value="team" />
                                                                  <c:param name="team" value="${repo.team.teamName}" />
                                                                  <c:param name="role" value="nil" />
                                                                  <c:param name="externalRepo" value="${repo.repoCreate.externalRepo}" />
                                                      </c:url>
														<tr>
															<td class="font-w400 p-10"><a
																href="${pageContext.request.contextPath}/${url}" onclick="openRepoAndCheckPull(event,'${repo.repoCreate.repoName}')">
																	${repo.repoCreate.repoName} </a></td>
															<td><c:if test="${repo.repoCreate.externalRepo}"><span class="badge badge-danger" style="background-color: #5890ca!important">Remote</span></c:if><c:if test="${!repo.repoCreate.externalRepo}"><span class="badge badge-success" style="background-color: #daa520!important">Local</span></c:if></td>
															<td>${repo.repoCreate.getCreatedBy().firstName} ${repo.repoCreate.getCreatedBy().lastName}</td>
															<td class="text-right"><jsp:useBean id="dateValue123"
																	class="java.util.Date" /> <jsp:setProperty
																	name="dateValue123" property="time"
																	value="${repo.repoCreate.getCretedTime().getTime()}" />
																<fmt:formatDate value="${dateValue123}"
																	pattern="${timestamp}" /></td>
															<td class="text-center"><span <c:if test="${repo.repoCreate.getGitProvided()=='YES'}">class="badge badge-success" style="background-color:#ff7f50"</c:if><c:if test="${repo.repoCreate.getGitProvided()=='NO'}">class="badge badge-danger" style="background-color:#b22222"</c:if>>${repo.repoCreate.getGitProvided()}</span></td>
															<td>TEAM ACCESS</td>
															<td>${repo.team.teamName}</td>
															<td></td>
															<td>${repo.getAccessControl()}</td>
														</tr>
													</c:forEach>
													<c:forEach items="${repoListBasedOnRole}" var="repo">
													<c:url value="folders" var="url">
														<c:if test="${repo.repoCreate.externalRepo}">
													        <c:param name="directory" value="${session_directory}${repo.repoCreate.repoName}" />
													       </c:if>
													         <c:if test="${!repo.repoCreate.externalRepo}">
													        <c:param name="directory" value="${directory}${repo.repoCreate.repoName}" />
													       </c:if>
                                                                 <%--  <c:param name="directory" value="${directory}${repo.repoCreate.repoName}" /> --%>
                                                                  <c:param name="accessControl" value="${repo.getAccessControl()}" />
                                                                  <c:param name="gitStatus" value="${repo.repoCreate.getGitProvided()}" />
                                                                  <c:param name="IsA" value="F" />
                                                                  <c:param name="access" value="role" />
                                                                  <c:param name="team" value="nil" />
                                                                  <c:param name="role" value="${repo.getRoleName().getRoleName()}" />
                                                                  <c:param name="externalRepo" value="${repo.repoCreate.externalRepo}" />
                                                      </c:url>
													
														<tr>
															<td class="font-w400 p-10"><a
																href="${pageContext.request.contextPath}/${url}" onclick="openRepoAndCheckPull(event,'${repo.repoCreate.repoName}')">
																	${repo.repoCreate.repoName} </a></td>
															<td><c:if test="${repo.repoCreate.externalRepo}"><span class="badge badge-danger" style="background-color: #5890ca!important">Remote</span></c:if><c:if test="${!repo.repoCreate.externalRepo}"><span class="badge badge-success" style="background-color: #daa520!important">Local</span></c:if></td>
																	
															<td>${repo.repoCreate.getCreatedBy().firstName} ${repo.repoCreate.getCreatedBy().lastName}</td>
															<td class="text-right"><jsp:useBean id="dateValue124"
																	class="java.util.Date" /> <jsp:setProperty
																	name="dateValue124" property="time"
																	value="${repo.repoCreate.getCretedTime().getTime()}" />
																<fmt:formatDate value="${dateValue124}"
																	pattern="${timestamp}" /></td>
															<td class="text-center"><span <c:if test="${repo.repoCreate.getGitProvided()=='YES'}">class="badge badge-success" style="background-color:#ff7f50"</c:if><c:if test="${repo.repoCreate.getGitProvided()=='NO'}">class="badge badge-danger" style="background-color:#b22222"</c:if>>${repo.repoCreate.getGitProvided()}</span></td>
															<td>ROLE ACCESS</td>
															<td></td>
															<td>${repo.getRoleName().getRoleName()}</td>
															<td>${repo.getAccessControl()}</td>
														</tr>
													</c:forEach>
													<c:forEach items="${repoListBasedOnTeamTORole}" var="repo">
													<c:url value="folders" var="url">
														<c:if test="${repo.repoCreate.externalRepo}">
													        <c:param name="directory" value="${session_directory}${repo.repoCreate.repoName}" />
													       </c:if>
													         <c:if test="${!repo.repoCreate.externalRepo}">
													        <c:param name="directory" value="${directory}${repo.repoCreate.repoName}" />
													       </c:if>
                                                                  <%-- <c:param name="directory" value="${directory}${repo.repoCreate.repoName}" /> --%>
                                                                  <c:param name="accessControl" value="${repo.getAccessControl()}" />
                                                                  <c:param name="gitStatus" value="${repo.repoCreate.getGitProvided()}" />
                                                                  <c:param name="IsA" value="F" />
                                                                  <c:param name="access" value="teamrole" />
                                                                  <c:param name="team" value="${repo.getTeamCreate().teamName}" />
                                                                  <c:param name="role" value="${repo.getRoleName().getRoleName()}" />
                                                                  <c:param name="externalRepo" value="${repo.repoCreate.externalRepo}" />
                                                      </c:url>
														<tr>
															<td class="font-w400 p-10"><a
																href="${pageContext.request.contextPath}/${url}" onclick="openRepoAndCheckPull(event,'${repo.repoCreate.repoName}')">
																	${repo.repoCreate.repoName} </a></td>
															<td><c:if test="${repo.repoCreate.externalRepo}"><span class="badge badge-danger" style="background-color: #5890ca!important">Remote</span></c:if><c:if test="${!repo.repoCreate.externalRepo}"><span class="badge badge-success" style="background-color: #daa520!important">Local</span></c:if></td>
															<td>${repo.repoCreate.getCreatedBy().firstName} ${repo.repoCreate.getCreatedBy().lastName}</td>
															<td class="text-right"><jsp:useBean id="dateValue125"
																	class="java.util.Date" /> <jsp:setProperty
																	name="dateValue125" property="time"
																	value="${repo.repoCreate.getCretedTime().getTime()}" />
																<fmt:formatDate value="${dateValue125}"
																	pattern="${timestamp}" /></td>
															<td class="text-center"><span <c:if test="${repo.repoCreate.getGitProvided()=='YES'}" >class="badge badge-success" style="background-color:#ff7f50"</c:if><c:if test="${repo.repoCreate.getGitProvided()=='NO'}">class="badge badge-danger" style="background-color:#b22222"</c:if>>${repo.repoCreate.getGitProvided()}</span></td>
															<td>TEAM->ROLE ACCESS</td>
															<td>${repo.getTeamCreate().teamName}</td>
															<td>${repo.getRoleName().getRoleName()}</td>
															<td>${repo.getAccessControl()}</td>
														</tr>
													</c:forEach>

												</tbody>
											</table>
										</div>
										</div>

									</div>
								</sec:authorize>
							</div>
							<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
									<c:set var="page" value="${repolist}" />
								<div class="container-fluid pl-0" id="pagination_div">
                                   <nav aria-label="Page navigation">
                                      <ul class="pagination mt-10 flex-wrap" id="pagination"></ul>
                                   </nav>
                                </div>
							</sec:authorize>
						</div>

						<c:choose>
							<c:when
								test="${!FilesResoterdList.isEmpty()||!FolderRestoredList.isEmpty()}">
								<div class="modal fade" id="memberModal" tabindex="-1"
									role="dialog" aria-labelledby="memberModalLabel"
									aria-hidden="true">
									<div class="modal-dialog  modal-lg">
										<div class="modal-content">
											<div class="modal-header block-header block-header-default">
												
												<h4 class="modal-title col-md-12 block-title"
													id="memberModalLabel">
													Following files are successfully restored at repo <span class="color-primary">${repoName}.</span>
												</h4>

											</div>
											<div class="modal-body">
												<table
													class="table table-striped table-bordered table-responsive">
													<thead>
														<tr>
															<th style="width:65%">File Name</th>
															<th style="width:28%">File Restored path inside - ${repoName}</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items='${FilesResoterdList}'
															var="FilesResoterdList">
															<tr>
																<th><span class="fa fa-file-code-o">
																		${FilesResoterdList.getFileName()}</span></th>
																<td>${FilesResoterdList.getFilePath()}</td>
															</tr>
														</c:forEach>
														<c:forEach items='${FolderRestoredList}'
															var="FolderRestoredList">
															<tr>
																<td><span class="fa fa-folder-o "></span>
																		${FolderRestoredList.getFileName()}</td>
																<td>${FolderRestoredList.getFilePath()}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-alt-danger"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
							</c:when>
						</c:choose>
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
	<%@include file="/static/js/pages/ApplicationJS.jsp"%>
<script>

		$('#add_ext_reposForm').formValidation(
			{
					framework : 'bootstrap4',
							fields : {
								repoName : {
									validators : {
										notEmpty : {
											message : 'Repo name is required'
										},
										stringLength : {
											min : 2,
											max : 30,
											message : 'Repo name must be more than 2 and less than 30 characters long'
										},
										regexp : {
											regexp : /^[a-zA-Z0-9_]+$/,
											message : 'Repo name can only consist of alphabets,numbers and underscore'
										}
									}
								},
								repoUrl : {
									validators : {
										notEmpty : {
											message : 'Repo url is required'
										}
									}
								},
								repoPasswd : {
									validators : {
										notEmpty : {
											message : 'Password is required'
										}
									}
								},
								repoUser:{
									validators : {
										notEmpty : {
											message : 'Username is required'
										}
									}
								}
							},
							icon : {
								valid : 'fa fa-check',
								invalid : 'fa fa-times-circle',
								validating : 'fa fa-sync-alt'
							},

						}).on('success.form.fv', function(e) {
						    // Prevent form submission
							$("#preloader").show();
							 $('#loaderNormal').hide();
							 $('#loaderNormal1').show();
							 $("#createRepo").modal('hide');
						  
						});
		
		$('#add_reposForm').formValidation(
				{framework : 'bootstrap4',
								fields : {
									repoName : {
										validators : {
											notEmpty : {
												message : 'Repo name is required'
											},
											stringLength : {
												min : 2,
												max : 30,
												message : 'Repo name must be more than 2 and less than 30 characters long'
											},
											regexp : {
												regexp : /^[a-zA-Z0-9_]+$/,
												message : 'Repo name can only consist of alphabets,numbers and underscore'
											}
										}
									}								
								},
								icon : {
									valid : 'fa fa-check',
									invalid : 'fa fa-times-circle',
									validating : 'fa fa-sync-alt'
								},

							}).on('success.form.fv', function(e) {
							    // Prevent form submission
								$("#preloader").show();
								 $('#loaderNormal').show();
								 $('#loaderNormal1').hide();
							    $("#createRepo").modal('hide');
							  
							});
		

	</script>
</body>
</html>