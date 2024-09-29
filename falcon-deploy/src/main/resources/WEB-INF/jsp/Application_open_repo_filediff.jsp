
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	<div id="page-container"
		class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>


		<main id="main-container"> <!-- Page Content -->
		<div class="content">
			<div class="block">
				<div class="block block-bordered">
					<div class="" id="fixedSet">
						<div class="form-group">
							<div class="block block-bordered block-header mb-0 editor-head pt-5 pb-5">
								<ul class="breadcrumb mb-0">
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
								<nav class="ml-auto">
									<c:if test="${gitStatus=='YES'}">
									 <c:url value="editor" var="url">
                                                                  <c:param name="directory" value="${URLpath}" />
                                                                  <c:param name="accessControl" value="${accessControl}" />
                                                                  <c:param name="gitStatus" value="${gitStatus}" />
                                                                  <c:param name="IsA" value="${IsA}" />
                                                                  <c:param name="access" value="${access}" />
                                                                  <c:param name="team" value="${team}" />
                                                                  <c:param name="role" value="${role}" />
                                                                  <c:param name="externalRepo" value="${externalRepo}" />
                                                 </c:url>
										<div class=" ">
											<ul class="nav navbar-nav">
											<c:if test="${accessControl=='READ/WRITE'&&externalRepo!=true}">
												<li class="mr-10"><a
													href="${pageContext.request.contextPath}/${url}"
													class="btn btn-primary" data-toggle="click-ripple"> Edit</a></li>
													</c:if>
												<li>
													<button class="btn btn-primary" data-toggle="modal"
														data-target="#myModal1" data-toggle="click-ripple">Diff</button>
												</li>
											</ul>

										</div>
										<div id="myModal1" class="modal fade" role="dialog">
											<div class="modal-dialog modal-lg  modal-xxl">

												<div class="modal-content" id="modalForDiff">
													<div class="">
														<div
															class="modal-header block-header block-header-default">
															<h4 class="col-md-12 block-title">File difference
																between commits</h4>
														</div>
													</div>
													<div class="modal-body text-center">
														<form class="form-horizontal"
															action='${pageContext.request.contextPath}/difference_for_this_file' 
															method="post" onSubmit="return checkthishash(this)">
															<div class="row">
																<div class="col-lg-6 text-center">
																	<section class="  card ">
																		<header class="block-header block-header-default">
																			<h5 class="block-title text-left">Commit from</h5>
																		</header>
																		<div class=" card-block">
																			<div class=" table-responsive">
																				<div class="input-group ">
																					<span class="input-group-addon"><i
																						class="fa fa-search search1" style="top: 8px"></i></span>
																					<input class="form-control t-indent-10" type="text"
																						id="myInput" onkeyup="commitFrom()"
																						placeholder="Search by branch name">
																				</div>
																				<div class="table-responsive"
																					data-toggle="slimscroll" data-height="267px">
																					<table id="myTable"
																						class="table table-striped  table-responsive text-left"
																						style="margin-top: 3px;">
																						<tbody>
																							<c:forEach items='${loger}' var='logs'
																								varStatus='loops'>
																								<tr style="border: 1px solid #ebebeb;">
																									<th style="width: 25%"><label>
																											<div
																												class="custom-control custom-radio custom-control-inline mb-5">
																												<input class="custom-control-input"
																													type="radio" name="newHash"
																													id="${logs.getName()}"
																													value="${logs.getName()}" required>
																												<label class="custom-control-label"
																													for="${logs.getName()}">${logs.getCommitterIdent().getName()}</label>
																											</div>
																									</label></th>
																									<th style="width: 37.5%; font-weight: normal">${shortMessage.get(loops.index)}</th>
																									<th style="width: 37.5%; font-weight: normal">
																										<jsp:useBean id="dateValue1291"
																											class="java.util.Date" /> <jsp:useBean
																											id="dateValue12" class="java.util.Date" /> <jsp:setProperty
																											name="dateValue12" property="time"
																											value="${logs.getCommitterIdent().getWhen().getTime()}" />
																										<fmt:formatDate value="${dateValue12}"
																											pattern="${timestamp}" />
																									</th>
																								</tr>
																							</c:forEach>
																						</tbody>
																					</table>
																				</div>
																			</div>

																		</div>
																	</section>
																</div>
																<div class="col-lg-6 text-center">
																	<section class=" card ">
																		<header class="block-header block-header-default">
																			<h5 class="block-title text-left">Commit to</h5>
																		</header>
																		<div class="card-block">
																			<div class=" table-responsive">
																				<div class="input-group ">
																					<span class="input-group-addon"><i
																						class="fa fa-search search1" style="top: 8px"></i></span>
																					<input class="form-control t-indent-10" type="text"
																						id="myInput1" onkeyup="commitTo()"
																						placeholder="Search by branch name">
																				</div>
																				<div class="table-responsive"
																					data-toggle="slimscroll" data-height="267px">
																					<table id="myTable1"
																						class="table table-striped  table-responsive text-left"
																						style="margin-top: 3px;">
																						<tbody>
																							<c:forEach items='${loger}' var='logs'
																								varStatus='loops'>
																								<tr style="border: 1px solid #ebebeb">
																									<th style="width: 25%;">
																										<div class="custom-control custom-radio mb-5">
																											<input class="custom-control-input"
																												type="radio" name="oldHash"
																												id="${logs.getName()}_k"
																												value="${logs.getName()}"> <label
																												class="custom-control-label"
																												for="${logs.getName()}_k">${logs.getCommitterIdent().getName()}</label>
																										</div>

																									</th>
																									<th style="width: 37.5%; font-weight: normal;">${shortMessage.get(loops.index)}</th>
																									<th style="width: 37.5%; font-weight: normal;">
																										<jsp:useBean id="dateValue129"
																											class="java.util.Date" /> <jsp:setProperty
																											name="dateValue129" property="time"
																											value="${logs.getCommitterIdent().getWhen().getTime()}" />
																										<fmt:formatDate value="${dateValue129}"
																											pattern="${timestamp}" />
																									</th>
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
																	<input type="hidden" name="path" value="${URLpath}" id="d1"> 
																	<input type="hidden" value="${gitStatus}" name="gitStatus">
																	 <input type="hidden" value="${accessControl}" name="accessControl">
																	  <input type="hidden" value="${access}" name="access">
																	   <input type="hidden" value="${IsA}" name="IsA">
																	    <input type="hidden" value="${team}" name="team"> 
																		<input type="hidden" value="${role}" name="role">
																		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
																		<input type="hidden" name="externalRepo" value="${externalRepo}"/>
																</div>
																<button type="submit" class="btn  btn-primary" data-toggle="click-ripple">Get
																	difference</button>

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
									</c:if>
								</nav>
							</div>

							<textarea id="editor" name="textAreaValue" class="form-control "><c:forEach items="${textAreaValue}" var="reader"><c:set var="decode1" value="${reader}" /><c:set var="decode2" value="${fn:replace(decode1, '<', '&lt;')}"/>${fn:replace(decode2, ">", "&gt;")}<%out.print("\n");%></c:forEach></textarea>
							<nav class="navbar  navbar-toggleable-xl navbar-light bg-faded ">
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
												<li class="nav-item mr-10"><select
													class=" form-control btn-secondary language" id="code"
													onchange="displayLanguage()">
														<option value="'Menlo-Regular'">Menlo Regular</option>
														<option value="'PT Mono', monospace">PT Mono</option>
														<option value="'courier-new">Courier New</option>
														<option value="'Roboto Mono', monospace" selected>Roboto Mono</option>														
												</select></li>
												<li class="nav-item mr-10">
												<select class=" form-control btn-secondary fontsize" id="code1">
														<option value="12px">12 px</option>
														<option value="13px">13 px</option>
														<option value="14px" selected>14 px</option>
														<option value="15px">15 px</option>
														<option value="16px">16 px</option>														
												</select></li>
								</ul>
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
	<%@include file="/static/js/pages/Application_open_repo_filediffJS.jsp"%>
	<script>
$(document).ready(function(){
    $("select.language").change(function(){
        var fontfamily = $(".language option:selected").val();
        $(".CodeMirror").css("font-family" , fontfamily);
    });
    $("select.fontsize").change(function(){
        var size = $(".fontsize option:selected").val();
        $(".CodeMirror").css("font-size" , size);
    });  
});
</script>
</body>
</html>