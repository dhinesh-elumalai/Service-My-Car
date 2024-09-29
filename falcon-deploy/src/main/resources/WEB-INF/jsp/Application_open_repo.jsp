<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>

<div id="preloader">
		<!-- <img src="static/img/loader.png"> -->
		<i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
		<p><c:if test="${rootDir==true}">Pulling</c:if> <c:if test="${rootDir!=true}">Loading </c:if><br><small style="text-transform:capitalize">Please Wait</small></p>
	</div>
	

<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">		
<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

		<main id="main-container"> <!-- Page Content -->
		<div class="content">
			<div class="block">
				<div class="block block-bordered">
					<div class="block-header block-header-default mb-20">
						<h3 class="block-title">APPLICATION</h3>
					</div>
					
					<div class="col-md-12" id="fixedSet">
						<div class="card " id="repoOpenedHeight">
							<div class=" card-header card-header-background">
								<ul class="nav nav-tabs nav-tabs-block border js-tabs-enabled"
									data-toggle="tabs" role="tablist">
								
										<li class="nav-item"><a
											class="nav-link <c:if test="${externalRepo!=true}">active</c:if> link-color-white" href="#File"
											role="tab" data-toggle="tab">Files</a></li>

									<c:if test="${gitStatus=='YES'||externalRepo==true}">
										<li class="nav-item"><a
											class="nav-link    link-color-white"
											href="#Log" role="tab" data-toggle="tab">Log</a></li>
										<li class="nav-item"><a class="nav-link link-color-white"
											href="#Tag" role="tab" data-toggle="tab">Tag</a></li>
										<li class="nav-item"><a class="nav-link <c:if test="${externalRepo==true}">active</c:if> link-color-white"
											href="#Branch" role="tab" data-toggle="tab">Branch</a></li>
											<c:if test="${externalRepo!=true}">
										<li class="nav-item"><a class="nav-link link-color-white"
											href="#Clone_URL" role="tab" data-toggle="tab">Clone URL</a></li>
											</c:if>
									</c:if>
								</ul>
								<div class="tab-content mb-20">
									<br>
									<c:if test="${accessControl=='READ/WRITE'}">
										<div role="tabpanel" class="tab-pane <c:if test="${externalRepo!=true}">active</c:if>" id="File">
											<div class="row">
												<c:if test="${accessControl=='READ/WRITE'&&externalRepo!=true}">
													<div class="col-md-12">
														<div class="row">
															<div class="col-sm-7">
															<form class="mr-sm-3" action="${pageContext.request.contextPath}/create_new_folder" method="post" id="createNewFolderForm">
														<div class="row">
															<div class=" col-md-8 col-sm-8 pr-0 xs-pr-15">
															<input type="text" name="folderName" placeholder="Enter folder name" class=" form-control pull-left" >
															<input type="hidden" value="${URLpath}"
																	name="folderpath"> <input type="hidden"
																	value="${gitStatus}" name="gitstatus"> <input
																	type="hidden" value="${access}" name="access">
																<input type="hidden" value="${IsA}" name="IsA">
																<input type="hidden" value="${team}" name="team">
																<input type="hidden" value="${role}" name="role">
																<input type="hidden" value="${accessControl}"name="accessControl"> 
																<input type="hidden" value="${externalRepo}"name="externalRepo"> 
																<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
														</div>
																
															<div class="col-md-4 xs-mt-5 col-sm-4 mt-md-0 pl-0 xs-pl-15">
																<button class="btn btn-primary   pull-left" type="submit" data-toggle="click-ripple">
																	<i class="fa fa-folder"></i> Create New Folder
																</button>
															</div>
														</div>
																
														</form>
														</div>
														<div class="col-sm-4 ml-auto">
														<div class="row text-right">
															<div class="col-sm-7 pr-0  xs-mt-5 xs-mb-5 ">
																<form class="" action="${pageContext.request.contextPath}/create_new_file"
																method="post">
																<input type="hidden" value="${URLpath}"
																	name="folderPATH"> <input type="hidden"
																	value="${gitStatus}" name="gitSTATUS"> <input
																	type="hidden" value="${accessControl}"
																	name="accessCONTROL"> <input type="hidden"
																	value="${access}" name="access"> <input
																	type="hidden" value="${IsA}" name="IsA"> <input
																	type="hidden" value="${team}" name="team"> <input
																	type="hidden" value="${role}" name="role"> <input
																	type="hidden" name="${_csrf.parameterName}"
																	value="${_csrf.token}" />
																	<input type="hidden" value="${externalRepo}"name="externalRepo">

																<button class="btn btn-primary mr-md-1 ml-md-1 xs-mr-6 text-right" data-toggle="click-ripple">
																	<i class="fa fa-file-code-o"></i> Create New File
																</button>
															</form>
															</div>
															<div class="col-sm-5 pl-0 xs-pl-15">
																<button class="btn btn-primary"
																data-toggle="modal" data-target="#myModal" data-toggle="click-ripple">
																<i class="fa fa-upload"></i> Upload File
															</button>
															</div>
														</div>	
													</div>
														</div>														
													</div>													
												</c:if>
											</div>
										</div>
									</c:if>
									<div role="tabpanel" class="tab-pane col-12" id="Clone_URL">
										<div class="form-inline">
											<c:if test="${gitStatus=='YES'&&externalRepo!=true}">
												<div class=" input-group col-md-6 col-sm-12"
													style="margin-left: -15px;">
													<button class="btn btn-primary">URL</button>
													<input class=" form-control" type="text"
														value='git clone ${ip}/${repoName}.git' readonly>
												</div>
											</c:if>
										</div>
									</div>
									
									<c:if test="${externalRepo==true}">									
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
																	<button type="button" style="display: none;" class="btn btn-alt-success" onClick="switchBranchAndPull('${repoName}')" data-toggle="click-ripple" id="switchBTN">Switch to HEAD and Pull</button>
																	<button type="button" class="btn btn-alt-danger" onClick="window.location.reload();" data-toggle="click-ripple">Close</button>
																</div>
															</div>
														</div>
													</div>
									
									</c:if>
									
									<div role="tabpanel"
										class="tab-pane <c:if test="${accessControl=='READ/ONLY'&&externalRepo!=true}">active</c:if>"
										id="Log">
										<c:if test="${gitStatus=='YES'}">
											<button class="btn btn-primary mr-xl-2" data-toggle="modal"
												data-target="#myModal2" type="submit" data-toggle="click-ripple">Commit log</button>
										</c:if>
									</div>

									<div role="tabpanel" class="tab-pane " id="Tag">
										<button class="btn btn-primary  mr-xl-2" data-toggle="modal"
											data-target="#myModal3" data-toggle="click-ripple">Tag List</button>
										<c:if test="${accessControl=='READ/WRITE'}">
											<c:if test="${gitStatus=='YES'&&externalRepo!=true}">
												<button class="btn btn-primary  mr-xl-2" data-toggle="modal"
													data-target="#myModal5" data-toggle="click-ripple">Create Tag</button>
											</c:if>
										</c:if>
									</div>

									<div role="tabpanel" class="tab-pane <c:if test="${externalRepo==true}">active</c:if>" id="Branch">
										<div class="col-12">
											<div class="row">
											<c:if test="${accessControl=='READ/WRITE'}">
												<c:if test="${gitStatus=='YES'}">
													<div class=" input-group col-md-6 xs-pl-0 xs-mt-5 xs-mb-5 sm-mt-10 sm-pl-0 sm-mb-10">
														<span class="current-icon-align"><i
															class="fa fa-random"> </i> &nbsp;Current Branch</span> <input
															type="text" class="form-control"
															value="${CurrentBranchName}" readonly>
													</div>
													<c:if test="${externalRepo==true}">
													<button class="btn btn-primary  mr-xl-5"
														data-toggle="modal" data-target="#myModal1">Change</button>
														</c:if>
												</c:if>
											</c:if>
											</div>
											</div>
											<c:if test="${accessControl=='READ/ONLY'}">
												<div class="form-group row">
													<c:if test="${gitStatus=='YES'}">
													<div class=" input-group col-md-6">
														<span class="input-group-addon current-icon-align"> <i class="fa fa-random"></i> Current Branch</span> 
															<input type="text" class="form-control" value="${CurrentBranchName}" readonly>
													</div>
													</c:if>
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</div>
							<div id="myModal" class="modal fade" role="dialog">
								<div class="modal-dialog">
									<div class="modal-content ">
										<div class="modal-header block-header block-header-default">

											<h4 class="block-title">File Upload</h4>
										</div>
										<div class="modal-body">
										<div class="">
											<form  action=<c:url value='upload-file' /> method="post" enctype="multipart/form-data" id="fileUploadForm">
												<div class="row">
													<div class="col-sm-9 upload-validate pr-0">
												<input type="hidden" value="${URLpath}" name="folderName">
												<input type="hidden" value="${gitStatus}" name="gitstatus">
												<input type="hidden" value="${access}" name="access">
												<input type="hidden" value="${IsA}" name="IsA">
												<input type="hidden" value="${team}" name="team"> 
												<input type="hidden" value="${role}" name="role"> 
												<input type="hidden" value="${externalRepo}" name="externalRepo">
												<input type="file" style="border:1px solid #bbb; padding:3px ; width:100%" name="fileSave" accept=".doc,.txt,.html,.xml,.java,.xhtml,.css,.js,.json,.asp,.aspx,.bat,.php,.sql,.jsp" multiple>
												<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
												</div>
									<div class="col-sm-2">
										<button type="submit" class="btn btn-primary xs-mt-5" data-toggle="click-ripple">Upload</button>
									</div>
												</div>	
											</form>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-alt-danger"
												data-dismiss="modal" data-toggle="click-ripple">Close</button>
										</div>
									</div>

								</div>
							</div>
							<c:if test="${externalRepo==true}">
						<div id="myModal1" class="modal fade" role="dialog">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header block-header block-header-default">
											<h4 class="block-title">Checkout Branch</h4>
										</div>
										<div class="modal-body">
											<form class="form-horizontal"
												action=<c:url value='CheckoutBranch' /> method="post">
												<input type="hidden" value="${URLpath}" name="folderName">
												<input type="hidden" value="${gitStatus}" name="gitstatus">
												<input type="hidden" value="${access}" name="access">
												<input type="hidden" value="${IsA}" name="IsA"> <input
													type="hidden" value="${team}" name="team"> <input
													type="hidden" value="${role}" name="role"> <input
													type="hidden" value="${accessControl }"
													name="accessControl2">

												<section class="card">
													<div class=" card-text">
														<br>
														<div class="input-group ">
															<span class="search1"> <i class="fa fa-search"></i></span>
															<input class="form-control t-indent-10" type="text"
																id="myInput" onkeyup="BranchSearch()"
																placeholder="Search for Branch-names.">
														</div>
														<hr>
														<div class="popup-overflow">
															<table id="myTable"
																class="table table-striped  text-left">

																<tbody>
																	<c:forEach items="${BranchList}" var="Branch"
																		varStatus="loop">
																		<tr>
																			<th>
																				<div class="custom-control custom-radio mb-5">
																					<input class="custom-control-input"
																						name="BranchList" id="${loop.index}" type="radio"
																						style="vertical-align: middle" value="${Branch}">
																					<label class="custom-control-label"
																						for="${loop.index}" style="margin-left: 14px;">
																						${Branch} </label>
																				</div>
																			</th>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>
													</div>
												</section>
												<div class="d-flex justify-content-center">
													<input type="hidden" name="${_csrf.parameterName}"
														value="${_csrf.token}" />
													<button id="submit" class="btn btn-primary">Checkout</button>
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary"
												data-dismiss="modal">Close</button>
										</div>
									</div>

								</div>
							</div>
							</c:if>
							<div id="myModal2" class="modal fade" role="dialog">
								<div class="modal-dialog">

									<div class="modal-content">
										<div class="modal-header block-header block-header-default">
											<h4 class="block-title">Select Branch</h4>
										</div>
										<div class="modal-body">

											<form class="form-horizontal"
												action=<c:url value='Log_for_this_repo' /> method="post">
												<input type="hidden" value="${URLpath}" name="folderpath">

												<section class=" card ">

													<div class=" card-text">
														<br>
														<div class="input-group ">
															<span class="input-group-addon search1"><i
																class="fa fa-search"></i></span> <input
																class="form-control t-indent-10" type="text"
																id="myInput7" onkeyup="BranchForLog()"
																placeholder="Search by branch name">
														</div>
														<hr>
														<div class="block block-bordered" data-toggle="slimscroll" data-height="250px">
															<div class="table-responsive">
																<table id="myTable7" class="table table-striped text-left xs-width-500px">

																<tbody>
																	<tr>
																		<th>
																			<div class="custom-control custom-radio mb-5">
																				<input class="custom-control-input"
																					name="BranchList" type="radio" id="all"
																					style="vertical-align: middle" value="ALL">
																				<label class="custom-control-label" for="all"
																					style="margin-left: 14px;">all</label>
																			</div>
																		</th>
																	</tr>
																	<c:forEach items="${BranchList}" var="Branch"
																		varStatus="loop">
																		<tr>
																			<th>
																				<div class="custom-control custom-radio mb-5">
																					<input class="custom-control-input"
																						name="BranchList" type="radio"
																						id="br${loop.index}"
																						style="vertical-align: middle" value="${Branch}">
																					<label class="custom-control-label"
																						for="br${loop.index}" style="margin-left: 14px;">
																						${Branch}</label>
																				</div>

																			</th>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
															</div>
														</div>
													</div>
												</section>
												<div class="d-flex justify-content-center">
													<input type="hidden" name="${_csrf.parameterName}"
														value="${_csrf.token}" />
													<button id="submit" class="btn btn-primary mt-10 submit2">Checkout</button>
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-alt-danger"
												data-dismiss="modal">Close</button>
										</div>
									</div>

								</div>
							</div>
							<div id="myModal3" class="modal fade" role="dialog">
								<div class="modal-dialog">

									<div class="modal-content">
										<div class="modal-header block-header block-header-default">
											<h4 class="block-title">Tag List</h4>
										</div>
										<div class="modal-body">
											<div class="form-horizontal">
												<section class="card">

													<div class="card-text">
														<br>
														<div class="input-group ">
															<span class="input-group-addon search1"> <i
																class="fa fa-search"></i>
															</span> <input class="form-control t-indent-10" type="text"
																id="myInput3" onkeyup="TagSearch()"
																placeholder="Search by tag names">
														</div>
														<hr>
														<div class="block block-bordered" data-toggle="slimscroll" data-height="250px">
															<table id="myTable3"
																class="table table-striped text-left">
																<tbody>
																	<c:forEach items="${Taglist}" var="Tag"
																		varStatus="loop">
																		<tr>
																			<th>${Tag}</th>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>
													</div>
												</section>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-alt-danger"
												data-dismiss="modal">Close</button>
										</div>
									</div>

								</div>
							</div>

						

							<div id="myModal5" class="modal fade" role="dialog">
								<div class="modal-dialog">

									<div class="modal-content">
										<div class="modal-header block-header block-header-default">
											<h4 class="block-title">Create New Tag</h4>
										</div>
										<div class="modal-body">
											<form class="form-horizontal"
												action=<c:url value='create_new_tag' /> method="post">
												<input type="hidden" value="${URLpath}" name="folderName">
												<input type="hidden" value="${gitStatus}" name="gitstatus">
												<input type="hidden" value="${accessControl }"
													name="accessControl2"> <input type="hidden"
													value="${access}" name="access"> <input
													type="hidden" value="${IsA}" name="IsA"> <input
													type="hidden" value="${team}" name="team"> <input
													type="hidden" value="${role}" name="role">
												<div class="form-group row">
													<div class="col-md-1"></div>
													<input type="text" name="TagName"
														placeholder="Enter tag name"
														class=" form-control col-md-8 nn1">
													<button id="submit" class="btn btn-primary xs-mt-5 sm-mt-10 submit1">Create</button>
												</div>
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}" />
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-alt-danger"
												data-dismiss="modal">Close</button>
										</div>
									</div>

								</div>
							</div>



							<div class="card-text">
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/application"><i
											class="fa fa-home"></i></a></li>
									<c:forEach items="${path}" var="BackpathForRepo"
										varStatus="loop">
										<c:if test="${!loop.last}">
										<c:url value="folders" var="url">
                                                                  <c:param name="directory" value="${BackpathForRepo}" />
                                                                  <c:param name="accessControl" value="${accessControl}" />
                                                                  <c:param name="gitStatus" value="${gitStatus}" />
                                                                  <c:param name="IsA" value="${IsA}" />
                                                                  <c:param name="access" value="${access}" />
                                                                  <c:param name="team" value="${team}" />
                                                                  <c:param name="role" value="${role}" />
                                                                    <c:param name="externalRepo" value="${externalRepo}" />
                                                      </c:url>
											<li class="breadcrumb-item"><a
												href="${pageContext.request.contextPath}/${url}">${displayPath.get(loop.index)}</a>
											</li>
										</c:if>
										<c:if test="${loop.last}">
											<li class="breadcrumb-item active">
												${displayPath.get(loop.index)}</li>
										</c:if>
									</c:forEach>
								</ul>
								<div class=" input-group ">
									<span class="search1"><i class="fa fa-search"></i></span> <input
										class="col-md-5 form-control t-indent-10" type="text"
										id="myInput4" onkeyup="FileFolderSearch()"
										placeholder="Filter by file name or folder name">
										<c:if test="${externalRepo==true}">
										<div class="col-md-7 form-inline ">
												<div class="ml-auto input-group col-md-2 col-sm-12">
													<button class="btn btn-primary" onclick="pullRepo('${repoName}')">Pull</button>
												</div>
										</div>
										</c:if>
								</div>
								<hr>
								<div data-toggle="slimscroll" data-height="400px">
								<div class="table-responsive" >
								<table id="myTable4" class="table table-striped table-bordered xs-width-500px">
									<thead></thead>
									<tbody>
										<tr>
											<th>Name</th>
											<th class="text-right">Last Modified At</th>
											<c:if test="${accessControl=='READ/WRITE'&&externalRepo!=true}">
												<th class="text-center">Action</th>
											</c:if>
										</tr>
										<c:forEach items="${openRepo}" var="repo">
											<c:if
												test="${repo.isDirectory()=='true' && (repo.getName()!='.git')}">
												<c:url value="folders" var="url">
                                                                  <c:param name="directory" value="${repo.getAbsolutePath()}" />
                                                                  <c:param name="accessControl" value="${accessControl}" />
                                                                  <c:param name="gitStatus" value="${gitStatus}" />
                                                                  <c:param name="IsA" value="${IsA}" />
                                                                  <c:param name="access" value="${access}" />
                                                                  <c:param name="team" value="${team}" />
                                                                  <c:param name="role" value="${role}" />
                                                                    <c:param name="externalRepo" value="${externalRepo}" />
                                                      </c:url>
												<tr>
													<th class="font-w400"><a class="color-primary"
															href="${pageContext.request.contextPath}/${url}">
															<span class="fa fa-folder"></span>&nbsp; <span style="text-align: left;  width:50%">${repo.getName()}</span></a></th>
													<th></th>
													<c:if test="${accessControl=='READ/WRITE'&&externalRepo!=true}">
													<c:url value="delete_folder" var="url1">
                                                                  <c:param name="directory" value="${repo}" />
                                                                  <c:param name="accessControl" value="${accessControl}" />
                                                                  <c:param name="gitStatus" value="${gitStatus}" />
                                                                  <c:param name="IsA" value="${IsA}" />
                                                                  <c:param name="access" value="${access}" />
                                                                  <c:param name="team" value="${team}" />
                                                                  <c:param name="role" value="${role}" />
                                                                    <c:param name="externalRepo" value="${externalRepo}" />
                                                      </c:url>
														<th class="text-center">
															<a href="${pageContext.request.contextPath}/${url1}" class="DeleteFolderDialog btn btn-sm btn-alt-danger"> 
																<span class="fa fa-trash " style="font-size: 18px;"></span>
															</a>
														</th>
													</c:if>
												</tr>
											</c:if>
										</c:forEach>

										<c:forEach items="${openRepo}" var="repo" varStatus="loop">
											<c:if test="${repo.isFile()=='true' }">
											<c:url value="editor" var="url">
                                                                  <c:param name="directory" value="${repo.getAbsolutePath()}" />
                                                                  <c:param name="accessControl" value="${accessControl}" />
                                                                  <c:param name="gitStatus" value="${gitStatus}" />
                                                                  <c:param name="IsA" value="${IsA}" />
                                                                  <c:param name="access" value="${access}" />
                                                                  <c:param name="team" value="${team}" />
                                                                  <c:param name="role" value="${role}" />
                                                                    <c:param name="externalRepo" value="${externalRepo}" />
                                                      </c:url>
												<tr>

													<th style="text-align: left; width:60%" class="font-w400"><a
                                                   href="${pageContext.request.contextPath}/${url}">															
														<span style="text-align: left;"><span class="fa fa fa-file-code-o"></span>&nbsp; ${repo.getName()}</span>

													</a></th>
													<td class="text-right"><jsp:useBean
															id="dateValue5" class="java.util.Date" /> <jsp:setProperty
															name="dateValue5" property="time"
															value="${repo.lastModified()}" /> <fmt:formatDate
															pattern="${timestamp}" value="${dateValue5}" /></td>
													<c:if test="${accessControl=='READ/WRITE'&&externalRepo!=true}">

													<c:url value="delete_file" var="url1">
                                                                  <c:param name="directory" value="${repo}" />
                                                                  <c:param name="accessControl" value="READ/WRITE" />
                                                                  <c:param name="gitStatus" value="${gitStatus}" />
                                                                  <c:param name="IsA" value="${IsA}" />
                                                                  <c:param name="access" value="${access}" />
                                                                  <c:param name="team" value="${team}" />
                                                                  <c:param name="role" value="${role}" />
                                                                    <c:param name="externalRepo" value="${externalRepo}" />
                                                      </c:url>

														<td class="text-center"><a
                                                            href="${pageContext.request.contextPath}/${url1}"
															class="DeleteFileDialog btn btn-sm btn-alt-danger"> <span class="fa fa-trash"
																style="font-size: 18px;"></span></a></td>
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
			<div id="dialog-confirm">
				<p id="textForDialog"></p>
			</div>
		
	
		</main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/Application_open_repoJS.jsp"%>
	<script>

 $('#createNewFolderForm').formValidation({
        framework: 'bootstrap4',     
        icon: {
           valid: 'fa fa-check',
           invalid: 'fa fa-times-circle',
           validating: 'fa fa-sync-alt'
               },
            fields: {
            	folderName: {
                    validators: {
                        notEmpty: {
                            message: 'Folder name is required'
                        },
                        stringLength: {
                            min: 2,
                            maxl:30,
                            message: 'Folder name must be more than 2 and less than 30 characters long'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_@#$%^*!()&]+$/,
                            message: 'Folder name should not have backslash or forwardslash'
                        }
                    }
                }
            }
        });
 
 
 $(document).ready(function() {
	 $('#fileUploadForm').formValidation({
	     framework: 'bootstrap4',     
	     icon: {
	        valid: 'fa fa-check',
	        invalid: 'fa fa-times-circle',
	        validating: 'fa fa-sync-alt'
	            },
	         fields: {
	        	 fileSave: {
	                 validators: {
	                     notEmpty: {
	                         message: 'Atleast 1 file should be selected'
	                     },
	                     file: {
	                    	    
	                            message: 'The selected file is not valid'
	                        }
	                 }
	             }
	         }
	     });
 });
  
</script>
<script>
$(document).ready(function(){
    $('.submit1').attr('disabled',true);
    $('.nn1').keyup(function(){
        if($(this).val().length !=0)
            $('.submit1').attr('disabled', false);            
        else
            $('.submit1').attr('disabled',true);
    })
});

$(document).ready(function(){
     $('.submit2').attr('disabled',true); 
    
    if($('input[name=BranchList]:checked').length>0){
            $('.submit2').attr('disabled', false);  
                }
    else{
        $('.submit2').attr('disabled', true);  

    }
    $('input[name=BranchList]').on('click', function() {
        $('.submit2').attr('disabled', false);  
  	});    
}); 

$(document).ready(function(){
    $('.submit3').attr('disabled',true); 
   
   if($('input[name=BranchListt]:checked').length>0){
           $('.submit3').attr('disabled', false);  
               }
   else{
       $('.submit3').attr('disabled', true);  

   }
   $('input[name=BranchList]').on('click', function() {
       $('.submit3').attr('disabled', false);  
 	});    
}); 
  
  
</script>
</body>
</html>

