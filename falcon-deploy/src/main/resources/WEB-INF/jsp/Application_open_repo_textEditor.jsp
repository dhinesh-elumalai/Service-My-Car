
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<head>
<link href="${pageContext.request.contextPath}/static/css/codemirror.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/cobalt.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/blackboard.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/eclipse.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/neat.css" rel="stylesheet">
</head>
<body>
<div id="preloader">
		<!-- <img src="static/img/loader.png"> -->
		<i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
		<p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
	</div>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">		
<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

		<main id="main-container"> 
		<div class="content">
			<div class="block">
				<div class="block block-bordered">
					<div class="" id="fixedSet">
						
						<div class="">

							<ul class="breadcrumb mb-0 pt-5">
								<li class="breadcrumb-item pt-5"><a href="${pageContext.request.contextPath}/application"><i class="fa fa-home"></i></a></li>
								<c:forEach items="${path}" var="BackpathForRepo"
									varStatus="loop">
									<c:if test="${!loop.last}">
									   <c:url value="folders" var="url">
                                                                  <c:param name="directory" value="${BackpathForRepo}" />
                                                                  <c:param name="accessControl" value="${accessControl}" />
                                                                  <c:param name="gitStatus" value="${gitstatus}" />
                                                                  <c:param name="IsA" value="${IsA}" />
                                                                  <c:param name="access" value="${access}" />
                                                                  <c:param name="team" value="${team}" />
                                                                  <c:param name="role" value="${role}" />
                                                                   <c:param name="externalRepo" value="${externalRepo}" />
                                                           </c:url>
										<li class="breadcrumb-item pt-5"><a
											href="${pageContext.request.contextPath}/${url}">${displayPath.get(loop.index)}</a>

										</li>
									</c:if>
									<c:if test="${loop.last}">
										<li class="breadcrumb-item active  pt-5">
											${displayPath.get(loop.index)}</li>
											<li class="pt-5"> &nbsp &nbsp<span class="badge badge-success">${CurrentBranchName}</span></li>
										<c:if test="${accessControl=='READ/WRITE'}">
											<li class=" ml-auto">
											<c:if test="${externalRepo!=true}">
												<button class="btn btn-primary mr-5" data-toggle="modal"
													data-target="#myModal5" data-toggle="click-ripple">Rename</button>
													</c:if>
											</li>
											</c:if>
											<c:if test="${gitstatus=='YES'}">
											<li <c:if test="${accessControl=='READ/ONLY'}">class=" ml-auto"</c:if>>
											<button class="btn btn-primary mr-5" data-toggle="modal"
															data-target="#myModal1" style="word-spacing: -10px;" data-toggle="click-ripple">Diff</button></li>
											<li>
											<form class="form-vertical"
															action='${pageContext.request.contextPath}/History-for-this-file' 
															method="post">
															<input type="hidden" name="path" value="${URLpath}"
																id="d1"> <input type="hidden"
																value="${gitstatus}" name="gitStatus"> <input
																type="hidden" name="${_csrf.parameterName}"
																value="${_csrf.token}" />
															<button class="btn btn-primary mr-5" type="submit"
																style="word-spacing: -10px;" data-toggle="click-ripple">History</button>
																
											</form>
											</li>
										</c:if>	
										<c:if test="${accessControl=='READ/WRITE'&&externalRepo!=true}">		
													<li ><button class="btn btn-primary" onclick="submitEditor()" data-toggle="click-ripple">Commit</button></li>
										</c:if>
									</c:if>
								</c:forEach>
							</ul>
							<c:if test="${accessControl=='READ/WRITE'}">
								<c:forEach items="${path}" var="BackpathForRepo"
									varStatus="loop">
									<c:if test="${loop.last}">
										<div id="myModal5" class="modal fade" role="dialog">
											<div class="modal-dialog">

												<div class="modal-content">
													<div class="modal-header block-header block-header-default">
														<h4 class="block-title">Rename File</h4>
													</div>
													<div class="modal-body">
														<form action='${pageContext.request.contextPath}/change_file_name' method="post" id="renameFile">
															<input type="hidden" name="path" value="${URLpath}">
															<div class="form-group row">
															
																<div class="col-md-9 pr-0">
																	<input id="filename" name="fileName" type="text" placeholder="Enter file name with extension" class="form-control input-md" value='${displayPath.get(loop.index)}'>
																	<input id="oldfilename" type="hidden" value="${displayPath.get(loop.index)}">
																<small   id="fileExistErr" style="color: red; display:none ;margin-left: -15px;">&emsp;&emsp;Change file name</small>
																</div>
																
																<div class="col-md-3 pl-0">
																	<button type="submit" id="renameFileFormSubmit" disabled class=" btn btn-primary" data-toggle="click-ripple">Rename</button>
																</div>
															</div>
															<input type="hidden" value="${gitstatus}"
																name="gitStatus"> <input type="hidden"
																value="${accessControl}" name="accessControl"> <input
																type="hidden" value="${access}" name="access"> <input
																type="hidden" value="${IsA}" name="IsA"> <input
																type="hidden" value="${team}" name="team"> <input
																type="hidden" value="${role}" name="role">
															<div class="form-group row"></div>
															<input type="hidden" name="${_csrf.parameterName}"
																value="${_csrf.token}" />
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-alt-danger"
															data-dismiss="modal" data-toggle="click-ripple">Close</button>
													</div>
												</div>
											</div>
										</div>
										<form>
											<input type="hidden" name="path" value="${URLpath}">
											<input type="hidden" name="fileName"
												value="${displayPath.get(loop.index)}" readonly>
										</form>
									</c:if>
								</c:forEach>
							</c:if>
						</div>

						<div class="col-md-12 pl-0 pr-0">
							<div class="form-group mb-0">
								<div class="">
									<nav class="ml-auto">
										<c:if test="${gitstatus=='YES'}">
											<div id="myModal1" class="modal fade" role="dialog">
												<div class="modal-dialog modal-xxl">

													<div class="modal-content" id="modalForDiff">
														<div
															class="modal-header block-header block-header-default">
															<h4 class="col-md-12 block-title">File difference
																between commits</h4>
														</div>
														<div class="modal-body text-center">
															<form class="form-horizontal"
																action='${pageContext.request.contextPath}/difference_for_this_file'
																method="post" onSubmit="return checkthishash(this)">
																<div class="row">
																	<div class="col-lg-6 text-center">
																		<section class=" card " style="">
																			<header class="block-header block-header-default">
																				<h5 class="block-title text-left">Commit from
																				</h5>
																			</header>
																			<div class=" card-block">
																				<div class="card-text table-responsive">
																					<div class="input-group ">
																						<span class="input-group-addon"> <i
																							class="fa fa-search search1" style="top: 8px;"></i>
																						</span> <input class="form-control t-indent-10"
																							type="text" id="myInput" onkeyup="commitFrom()"
																							placeholder="Search by committer">
																					</div>

																					<div class="table-responsive" data-toggle="slimscroll" data-height="267px">
																						<table id="myTable"
																							class="table table-striped text-left"
																							style="margin-top: 3px;">

																							<tbody>
																								<c:forEach items='${loger}' var='logs'
																									varStatus='loops'>
																									<tr style="border: 1px solid #ebebeb">
																										<th style="width: 25%; font-weight: normal;"><label>
																												<div class="custom-control custom-radio custom-control-inline mb-5">
																													<input class="custom-control-input"
																														type="radio" name="newHash"
																														id="${logs.getName()}"
																														value="${logs.getName()}" required>
																													<label class="custom-control-label" for="${logs.getName()}">${logs.getAuthorIdent().getName()}</label>
																												</div>
																										</label></th>
																										<th style="width: 37.5%; font-weight: normal;"><p
																												class="short-text mb-0"
																												style="font-size: 13px;">${shortMessage.get(loops.index)}</p></th>
																										<th style="width: 37.5%; font-weight: normal;"><p
																												class="mb-0" style="font-size: 13px;"><jsp:useBean
																													id="dateValue129" class="java.util.Date" />
																												<jsp:setProperty name="dateValue129"
																													property="time"
																													value="${logs.getCommitterIdent().getWhen().getTime()}" />
																												<fmt:formatDate value="${dateValue129}"
																													pattern="${timestamp}" />
																											</p></th>

																									</tr>
																								</c:forEach>
																							</tbody>
																						</table>
																					</div>
																				</div>

																			</div>
																		</section>
																	</div>
																	<div class="col-lg-6">
																		<section class=" card  ">
																			<header class="block-header block-header-default">
																				<h5 class="block-title text-left">Commit to
																				</h5>
																			</header>
																			<div class="  card-block">
																				<div class=" card-text table-responsive">
																					<div class="input-group ">
																						<span class="input-group-addon"><i
																							class="fa fa-search search1" style="top: 8px;"></i></span>
																						<input class="form-control t-indent-10"
																							type="text" id="myInput1" onkeyup="commitTo()"
																							placeholder="Search by committer">
																					</div>

																					<div class="table-responsive" data-toggle="slimscroll" data-height="267px">
																						<table id="myTable1"
																						class="table table-striped  table-responsive text-left"
																						style="margin-top: 3px;" >

																						<tbody>
																							<c:forEach items='${loger}' var='logs'
																								varStatus='loops'>
																								<tr style="border: 1px solid #ebebeb">
																									<th style="width:25%;">
																										<div class="custom-control custom-radio mb-5">
																											<input class="custom-control-input"
																												type="radio" name="oldHash"
																												id="${logs.getName()}_k"
																												value="${logs.getName()}" >
																											<label class="custom-control-label"
																												for="${logs.getName()}_k">${logs.getAuthorIdent().getName()}</label>
																										</div> 
																										
																									</th>
																									<th style="width:37.5%;font-weight:normal;"><p class="mb-0" style="font-size: 13px;">${shortMessage.get(loops.index)}</p></th>
																									<th style="width:37.5%;font-weight:normal;"><p class="mb-0" style="font-size: 13px;"><jsp:useBean id="dateValue1291"
																											class="java.util.Date" /> <jsp:setProperty
																											name="dateValue1291" property="time"
																											value="${logs.getCommitterIdent().getWhen().getTime()}" />
																										<fmt:formatDate value="${dateValue1291}"
																											pattern="${timestamp}" /></p></th>

																								</tr>
																							</c:forEach>
																						</tbody>
																					</table>
																					</div>
																				</div>

																			</div>
																		</section>
																	</div>

																	<div class="col-md-5">

																		<input type="hidden" name="path" value="${URLpath}"
																			id="d1"> <input type="hidden"
																			value="${gitstatus}" name="gitStatus"> <input
																			type="hidden" value="${accessControl}"
																			name="accessControl"> <input type="hidden"
																			value="${access}" name="access"> <input
																			type="hidden" value="${IsA}" name="IsA"> <input
																			type="hidden" value="${team}" name="team"> <input
																			type="hidden" value="${role}" name="role"> <input
																			type="hidden" name="${_csrf.parameterName}"
																			value="${_csrf.token}" />
																			<input type="hidden" name="externalRepo" value="${externalRepo}"/>

																	</div>

																	<button
																		style="margin-top: 20px; margin-left: 30px;"
																		type="submit" class="btn  btn-alt-success" data-toggle="click-ripple">Get
																		difference</button>

																</div>
															</form>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-alt-danger"
																data-dismiss="modal" data-toggle="click-ripple">Close</button>
														</div>
													</div>

												</div>
											</div>
										</c:if>
									</nav>
								</div>
					<c:if test="${accessControl=='READ/WRITE'}">
								<form class="form-vertical" action='${pageContext.request.contextPath}/file-update' method="post" id="editorForm">
								</c:if>
						<c:if test="${accessControl=='READ/ONLY'}">
								<div class="form-vertical">
						</c:if>
									<input type="hidden" value="${URLpath}" name="path"> <input
										type="hidden" value="${gitstatus}" name="gitStatus"> <input
										type="hidden" value="${accessControl}" name="accessControl">
									<input type="hidden" value="${access}" name="access"> <input
										type="hidden" value="${IsA}" name="IsA"> <input
										type="hidden" value="${team}" name="team"> <input
										type="hidden" value="${role}" name="role">
									<textarea id="editor" name="textAreaValue" class="form-control"  style="display:none"><c:forEach items="${Filereader}" var='reader'>${reader}<% out.print("\n");%></c:forEach></textarea>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

									<nav class="navbar  navbar-toggleable-xl navbar-light bg-faded "
										style="border: 1px solid #ccc;">
										
											<ul class="nav navbar-nav p-10 editor-head">
												<li class="nav-item"><select
													class=" form-control btn-secondary" id="theme"
													onchange="displayTheme()">
														<option value="cobalt">Cobalt</option>
														<option value="blackboard">Blackboard</option>
														<option value="eclipse" selected>Eclipse</option>
														<option value="neat">Neat</option>
												</select></li>
												<li class="nav-item ml-10 mr-10"><select
													class=" form-control btn-secondary" id="code"
													onchange="displayLanguage()">
														<option value="xml">HTML/JSP/XML</option>
														<option value="text/x-java">JAVA</option>
														<option value="text/x-csrc">C</option>
														<option value="text/x-c++src">C++</option>
														<option value="sql" selected>SQL</option>
														<option value="javascript">JAVASCRIPT</option>
														<option value="css">CSS</option>
												</select></li>
												<li class="nav-item mr-10">
												<select class=" form-control btn-secondary language" id="cmfont">
														<option value="'Menlo-Regular'">Menlo Regular</option>
														<option value="'PT Mono', monospace">PT Mono</option>
														<option value="'courier-new">Courier New</option>
														<option value="'Roboto Mono', monospace" selected>Roboto Mono</option>														
												</select>
												</li>
												<li class="nav-item mr-10">
												<select class=" form-control btn-secondary fontsize" id="code1">
														<option value="12px">12 px</option>
														<option value="13px">13 px</option>
														<option value="14px" selected>14 px</option>
														<option value="15px">15 px</option>
														<option value="16px">16 px</option>														
												</select>
												</li>
												<li class="nav-item mr-10 mt-1">
													<button type="button" class="btn btn-sm btn-primary" data-toggle="click-ripple" onClick="saveChanges()">Set as default</button>
												</li>
												<c:if test="${accessControl=='READ/WRITE'}">
												<li class="ml-auto">
												<c:if test="${externalRepo!=true}">
													<button type="submit" class="btn btn-primary" data-toggle="click-ripple">Commit</button>
													</c:if>
												</li>
													</c:if>
											</ul>
											<div class="text-center"></div>
									
									</nav>
							<c:if test="${accessControl=='READ/WRITE'}">
										</form>				
							</c:if>
							<c:if test="${accessControl=='READ/ONLY'}">
								</div>
							</c:if>
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
	<%@include file="/static/js/pages/Application_open_repo_textEditorJS.jsp"%>
</body>