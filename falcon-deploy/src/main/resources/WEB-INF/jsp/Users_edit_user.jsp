<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
<div id="preloader">
		<!-- <img src="static/img/loader.png"> -->
		<i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
		<p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
	</div>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

		<main id="main-container"> <!-- Page Content -->
		<div class="content">
			<div class="">
				<div class="block block-bordered">

					<div class="" id="fixedSet">
						<div class="block-header block-header-default">
							<h3 class="block-title">UPDATE USER</h3>
						</div>
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/user"> Users</a>
								</li>
								<li class="breadcrumb-item active"> Update Users</li>
							</ul>
						</div>
						<div class="col-12 ">
							<div class=" block-bordered">
								<form action="${pageContext.request.contextPath}/update-user" method="post" class="mt-20 mb-20" id="user-edit">
									<fieldset>

										<sec:authorize access="hasAnyAuthority('ADMIN')">
											<c:choose>
												<c:when test="${(role.role !='SUPER_ADMIN')}">
													<input type="hidden" name="id" value="${user.id}" />
													<div class="form-group row">
														<div class="col-md-3 text-right">
															<label class="col-form-label" for="fn"><b>First
																	Name:</b></label>
														</div>
														<div class="col-md-8 col-lg-6">
															<input id="fn" name="firstName" type="text"
																value="${user.firstName}" class="form-control input-md text-capitalize">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 text-right" for="ln"><b>Last
																Name:</b></label>
														<div class="col-md-8 col-lg-6">
															<input id="ln" name="lastName" type="text"
																value="${user.lastName}" class="form-control input-md text-capitalize">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 text-right" for="emailForUser"><b>Email:</b></label>
														<div class="col-md-8 col-lg-6">
															<input id="emailForUser" name="email" type="email"
																value="${user.email}" class="form-control input-md"
																readonly>
														</div>
													</div>
													<c:choose>
														<c:when test="${role.role=='USER'}">
															<div class="  form-group row">
																<label class="col-md-3 text-right" for="team--role">
																	<b>Select Role:</b>
																</label>

																<div class="col-md-8 col-lg-6">
																	<select class="custom-select " id="team--role"
																		name="role" style="">
																		<option value="USER" selected>USER</option>
																		<sec:authorize
																			access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
																			<option value="ADMIN">ADMIN</option>
																		</sec:authorize>
																		<option value="TEAM_ADMIN">TEAM_ADMIN</option>
																	</select>
																</div>
															</div>
														</c:when>
														<c:when test="${role.role=='ADMIN'}">
															<div class="  form-group  row">
																<label class="col-md-3 text-right" for="team--role"><b>Select
																		Role:</b></label>
																<div class="col-md-8 col-lg-6">
																	<select class="custom-select" id="team--role"
																		name="role">
																		<sec:authorize
																			access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
																			<option value="ADMIN" selected>ADMIN</option>
																		</sec:authorize>
																		<option value="USER">USER</option>
																		<option value="TEAM_ADMIN">TEAM_ADMIN</option>
																	</select>
																</div>
															</div>
														</c:when>
														<c:when test="${role.role=='TEAM_ADMIN'}">
															<div class="  form-group row">
																<label class="col-md-3 text-right" for="rle"><b>Select
																		Role:</b></label> 
																	<div class="col-md-8 col-lg-6">
																		<select class="custom-select "
																	id="team--role" name="role">
																	<option value="TEAM_ADMIN" selected>TEAM_ADMIN</option>
																	<option value="USER">USER</option>
																	<sec:authorize
																		access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
																		<option value="ADMIN">ADMIN</option>
																	</sec:authorize>
																</select>
																</div>
															</div>
														</c:when>
													</c:choose>
													<c:choose>
														<c:when test="${user.enabled==true}">
															<div class=" form-group row">
																<label class="col-md-3 text-right" for="stats"><b>
																		Status:</b></label>
																<div class="col-md-8 col-lg-6">
																	<select class="custom-select " name="enabled">
																		<option value="true" selected>ACTIVE</option>
																		<option value="false">INACTIVE</option>
																	</select>
																</div>
															</div>
														</c:when>
														<c:when test="${user.enabled==false}">
															<div class=" form-group row">
																<label class="col-md-3 text-right" for="stats">
																	<b>Status:</b>
																</label> 
																<div class="col-md-8 col-lg-6">
																	<select class="custom-select " name="enabled">

																	<option value="true">ACTIVE</option>
																	<option value="false" selected>INACTIVE</option>
																</select>
																</div>
															</div>
														</c:when>
													</c:choose>
													<div class="form-group row">
														<label class="col-md-3 text-right" for="createdBy"><b>Created
																By:</b></label>
														<div class="col-md-8 col-lg-6">
														<c:set var="userr" value="${userRepo.findByEmail(user.createdUserEmail)}"></c:set>
															<input id="createdBy" name="createdBy" type="text"
																value="${userr.firstName} ${userr.lastName}" class="form-control input-md text-capitalize"
																readonly>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 text-right" for="createdTimestamp"><b>Created
																Timestamp:</b></label>
														<div class="col-md-8 col-lg-6">
															<jsp:useBean id="dateValue125" class="java.util.Date" />
															<jsp:setProperty name="dateValue125" property="time" value="${user.createdTimestamp.getTime()}" />
															<input id="createdTimestamp" name="createdTimestamp"
																type="text"
																value='<fmt:formatDate value="${dateValue125}"  pattern="${timestamp}"/>'
																class="form-control input-md" readonly>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 text-right" for="updatedBy"><b>Updated
																By:</b></label>
														<div class="col-md-8 col-lg-6">
														<c:set var="userr" value="${userRepo.findByEmail(user.updatedUserEmail)}"></c:set>
															<input id="updatedBy" name="updatedBy" type="text"
																value="${userr.firstName} ${userr.lastName}" class="form-control input-md text-capitalize"
																readonly>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 text-right" for="updatedTimestamp"><b>Updated
																Timestamp:</b></label>
														<div class="col-md-8 col-lg-6">
															<input type="hidden" id="updatedTimestamp123"
																value="${user.updatedTimestamp}">
															<jsp:useBean id="dateValue126" class="java.util.Date" />
															<jsp:setProperty name="dateValue126" property="time"
																value="${user.updatedTimestamp.getTime()}" />
															<input id="updatedTimestamp" name="updatedTimestamp"
																type="text"
																value='<fmt:formatDate value="${dateValue126}"  pattern="${timestamp}"/>'
																class="form-control input-md" readonly>
														</div>
													</div>
													<div class="form-group row" id="privileges">
														<label class="col-md-3 control-label text-right" for="rle"><b>Teams
																and Privileges:</b></label>
														<div class="col-md-8 col-lg-6">
															<section class=" block block-bordered">

																<div class="">
																	<ul class="nav nav-tabs border js-tabs-enabled"
																		data-toggle="tabs" role="tablist">
																		<li class="nav-item col-md-4 pl-0 pr-0"><a
																			class="nav-link active text-center" href="#File"
																			role="tab" data-toggle="tab">Teams</a></li>

																		<li class="nav-item col-md-4 pl-0 pr-0"><a
																			class="nav-link text-center" href="#Log" role="tab"
																			data-toggle="tab">Direct Grants</a></li>
																		<li class="nav-item col-md-4 pl-0 pr-0"><a
																			class="nav-link text-center" href="#Tag" role="tab"
																			data-toggle="tab">Role Grants</a></li>
																	</ul>

																	<div class="tab-content overflow-hidden">
																		<div role="tabpanel" class="tab-pane active" id="File">
																			<div class="card-text table-responsive col-md-12 mt-10" >
																				<div class="input-group">
																					<span class="input-group-addon search1"><i
																						class="fa fa-search"></i></span> <input
																						class="form-control col-md-12 t-indent-10"
																						type="text" id="SearchUser" autocomplete="off"
																						placeholder="Search for teams">
																				</div>
																				<section class="card" style="display: none;" id="repoCard" >
																					<div class=" card-text onhover" id="repos" data-toggle="slimscroll" data-height="200px" style="border:1px solid #ccc"></div>
																				</section>
																				<br>
																				<div id="cardStart" class="" data-toggle="slimscroll" data-height="350px">
																					<c:forEach items="${SelectedTeamForUser}"
																						var="team" varStatus="loop">
																						<div class='input-group' id=AAAA${loop.index+1}>
																							<span class='input-group-addon'><button
																									type='button' id=BBBB${loop.index+1}
																									class=' btn-outline-danger btn-none'
																									onclick='DeleteTeam(this)'
																									value='${team.getTeamCreate().getTeamName()}'>
																									<i class='si si-close'></i>
																								</button></span><label class='form-control'>${team.getTeamCreate().getTeamName()}</label>
																						</div>
																					</c:forEach>
																				</div>
																				<div id="cardhidden"></div>
																			</div>
																		</div>
																		<div role="tabpanel" class="tab-pane " id="Log">
																			<div class="card-text table-responsive col-md-12 mt-10">
																				<div class="input-group">

																					<span class="input-group-addon search1"><i
																						class="fa fa-search"></i></span> <input
																						class="form-control col-md-12 t-indent-10"
																						type="text" id="SearchUser1" autocomplete="off"
																						placeholder="Search for repo">
																					
																				</div>
																				<section class="card auto-search " id="repoCard1">
																					<div class=" card-text ht1" id="repos1" data-toggle="slimscroll" data-height="200px"></div>
																				</section>
																				<br>
																				<div id="cardStart1" class="" data-toggle="slimscroll" data-height="350px">
																					<c:forEach items="${SelectedRepoDirectAccess}"
																						var="repo" varStatus="loop">
																						<div class='input-group' id=AAAAA${loop.index+1}>
																							<span class='input-group-addon'><button
																									type='button' id=BBBBB${loop.index+1}
																									class=' btn-outline-danger btn-none'
																									onclick='DeleteRepo(this)'
																									value='${repo.getRepoName1().getRepoName()}'>

																									<i class='si si-close'></i>
																								</button></span><label class='form-control'>${repo.getRepoName1().getRepoName()} (${repo.getAccessControl1()})</label>

																						</div>
																					</c:forEach>
																				</div>
																				<div id="cardhidden1"></div>
																			</div>
																		</div>

																		<div role="tabpanel" class="tab-pane " id="Tag">
																			<div class="card-text table-responsive col-md-12 mt-10">
																				<div class="input-group">

																					<span class="input-group-addon search1"><i
																						class="fa fa-search"></i></span> <input
																						class="form-control col-md-12 t-indent-10"
																						type="text" id="SearchUser2" autocomplete="off"
																						placeholder="Search for role">
																					
																				</div>
																				
																				<section class="card onhover"style="display:none;"
																					id="repoCard2">
																					<div class=" card-text block-bordered" id="repos2" data-toggle="slimscroll" data-height="200px" style="    border: 1px solid rgb(204, 204, 204);"></div>
																				</section>
																				<br>
																				<div id="cardStart2" class="" data-toggle="slimscroll" data-height="350px">
																					<c:forEach items="${SelectedRoleAccess}" var="role"
																						varStatus="loop">
																						<div class='input-group ' id=AAAAAA${loop.index+1}>
																							<span class='input-group-addon'><button
																									type='button' id=BBBBBB${loop.index+1}
																									class=' btn-outline-danger btn-none'
																									onclick='DeleteRole(this)'
																									value='${role.getRoleName().getRoleName()}'>
																									<i class='si si-close'></i>
																								</button></span><label class='form-control'>${role.getRoleName().getRoleName()}</label>
																						</div>
																					</c:forEach>
																				</div>
																				<div id="cardhidden2"></div>
																			</div>
																		</div>
																	</div>
																</div>
															</section>
														</div>

													</div>




												</c:when>
											</c:choose>
										</sec:authorize>
										
										
										
										<sec:authorize access="hasAnyAuthority('SUPER_ADMIN')">
											
													<input type="hidden" name="id" value="${user.id}" />
													<div class="form-group row">
														<div class="col-md-3 text-right">
															<label class="col-form-label" for="fn"><b>First
																	Name:</b></label>
														</div>
														<div class="col-md-8 col-lg-6">
															<input id="fn" name="firstName" type="text"
																value="${user.firstName}" class="form-control input-md text-capitalize">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 text-right" for="ln"><b>Last
																Name:</b></label>
														<div class="col-md-8 col-lg-6">
															<input id="ln" name="lastName" type="text"
																value="${user.lastName}" class="form-control input-md text-capitalize">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 text-right" for="emailForUser"><b>Email:</b></label>
														<div class="col-md-8 col-lg-6">
															<input id="emailForUser" name="email" type="email"
																value="${user.email}" class="form-control input-md"
																readonly>
														</div>
													</div>
													<c:choose>
														<c:when test="${role.role=='USER'}">
															<div class="  form-group row">
																<label class="col-md-3 text-right" for="team--role">
																	<b>Select Role:</b>
																</label>

																<div class="col-md-8 col-lg-6">
																	<select class="custom-select " id="team--role"
																		name="role" style="">
																		<option value="USER" selected>USER</option>
																		<sec:authorize
																			access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
																			<option value="ADMIN">ADMIN</option>
																		</sec:authorize>
																		<option value="TEAM_ADMIN">TEAM_ADMIN</option>
																		<sec:authorize
																			access="hasAnyAuthority('SUPER_ADMIN')">
																			<option value="SUPER_ADMIN">SUPER_ADMIN</option>
																		</sec:authorize>
																	</select>
																</div>
															</div>
														</c:when>
														<c:when test="${role.role=='ADMIN'}">
															<div class="  form-group  row">
																<label class="col-md-3 text-right" for="team--role"><b>Select
																		Role:</b></label>
																<div class="col-md-8 col-lg-6">
																	<select class="custom-select" id="team--role"
																		name="role">
																		<sec:authorize
																			access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
																			<option value="ADMIN" selected>ADMIN</option>
																		</sec:authorize>
																		<option value="USER">USER</option>
																		<option value="TEAM_ADMIN">TEAM_ADMIN</option>
																		<sec:authorize
																			access="hasAnyAuthority('SUPER_ADMIN')">
																			<option value="SUPER_ADMIN">SUPER_ADMIN</option>
																		</sec:authorize>
																	</select>
																</div>
															</div>
														</c:when>
														<c:when test="${role.role=='SUPER_ADMIN'}">
															<div class="  form-group  row">
																<label class="col-md-3 text-right" for="team--role"><b>Select
																		Role:</b></label>
																<div class="col-md-8 col-lg-6">
																	<select class="custom-select" id="team--role"
																		name="role">
																		<sec:authorize
																			access="hasAnyAuthority('SUPER_ADMIN')">
																			<option value="SUPER_ADMIN" selected>SUPER_ADMIN</option>
																		</sec:authorize>
																		<sec:authorize
																			access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
																			<option value="ADMIN" >ADMIN</option>
																		</sec:authorize>
																		<option value="USER">USER</option>
																		<option value="TEAM_ADMIN">TEAM_ADMIN</option>
																	</select>
																</div>
															</div>
														</c:when>
														<c:when test="${role.role=='TEAM_ADMIN'}">
															<div class="  form-group row">
																<label class="col-md-3 text-right" for="rle"><b>Select
																		Role:</b></label> 
																	<div class="col-md-8 col-lg-6">
																		<select class="custom-select "
																	id="team--role" name="role">
																	<option value="TEAM_ADMIN" selected>TEAM_ADMIN</option>
																	<option value="USER">USER</option>
																	<sec:authorize
																		access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
																		<option value="ADMIN">ADMIN</option>
																	</sec:authorize>
																	<sec:authorize
																			access="hasAnyAuthority('SUPER_ADMIN')">
																			<option value="SUPER_ADMIN">SUPER_ADMIN</option>
																		</sec:authorize>
																</select>
																</div>
															</div>
														</c:when>
													</c:choose>
													<c:choose>
														<c:when test="${user.enabled==true}">
															<div class=" form-group row">
																<label class="col-md-3 text-right" for="stats"><b>
																		Status:</b></label>
																<div class="col-md-8 col-lg-6">
																	<select class="custom-select " name="enabled">
																		<option value="true" selected>ACTIVE</option>
																		<option value="false">INACTIVE</option>
																	</select>
																</div>
															</div>
														</c:when>
														<c:when test="${user.enabled==false}">
															<div class=" form-group row">
																<label class="col-md-3 text-right" for="stats">
																	<b>Status:</b>
																</label> 
																<div class="col-md-8 col-lg-6">
																	<select class="custom-select " name="enabled">

																	<option value="true">ACTIVE</option>
																	<option value="false" selected>INACTIVE</option>
																</select>
																</div>
															</div>
														</c:when>
													</c:choose>
													<div class="form-group row">
														<label class="col-md-3 text-right" for="createdBy"><b>Created
																By:</b></label>
														<div class="col-md-8 col-lg-6">
														<c:set var="userr" value="${userRepo.findByEmail(user.createdUserEmail)}"></c:set>
															<input id="createdBy" name="createdBy" type="text"
																value="${userr.firstName} ${userr.lastName}" class="form-control input-md text-capitalize"
																readonly>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 text-right" for="createdTimestamp"><b>Created
																Timestamp:</b></label>
														<div class="col-md-8 col-lg-6">
															<jsp:useBean id="dateValue12" class="java.util.Date" />
															<jsp:setProperty name="dateValue12" property="time"
																value="${user.createdTimestamp.getTime()}" />
															<input id="createdTimestamp" name="createdTimestamp"
																type="text"
																value='<fmt:formatDate value="${dateValue12}"  pattern="${timestamp}"/>'
																class="form-control input-md" readonly>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 text-right" for="updatedBy"><b>Updated
																By:</b></label>
														<div class="col-md-8 col-lg-6">
														<c:set var="userr" value="${userRepo.findByEmail(user.updatedUserEmail)}"></c:set>
															<input id="updatedBy" name="updatedBy" type="text"
																value="${userr.firstName} ${userr.lastName}" class="form-control input-md text-capitalize"
																readonly>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 text-right" for="updatedTimestamp"><b>Updated
																Timestamp:</b></label>
														<div class="col-md-8 col-lg-6">
															<input type="hidden" id="updatedTimestamp123"
																value="${user.updatedTimestamp}">
															<jsp:useBean id="dateValue121" class="java.util.Date" />
															<jsp:setProperty name="dateValue121" property="time"
																value="${user.updatedTimestamp.getTime()}" />
															<input id="updatedTimestamp" name="updatedTimestamp"
																type="text"
																value='<fmt:formatDate value="${dateValue121}"  pattern="${timestamp}"/>'
																class="form-control input-md" readonly>
														</div>
													</div>
													<div class="form-group row" id="privileges">
														<label class="col-md-3 control-label text-right" for="rle"><b>Teams
																and Privileges:</b></label>
														<div class="col-md-8 col-lg-6">
															<section class=" block block-bordered">

																<div class="">
																	<ul class="nav nav-tabs border js-tabs-enabled"
																		data-toggle="tabs" role="tablist">
																		<li class="nav-item col-md-4 pl-0 pr-0"><a
																			class="nav-link active text-center" href="#File"
																			role="tab" data-toggle="tab">Teams</a></li>

																		<li class="nav-item col-md-4 pl-0 pr-0"><a
																			class="nav-link text-center" href="#Log" role="tab"
																			data-toggle="tab">Direct Grants</a></li>
																		<li class="nav-item col-md-4 pl-0 pr-0"><a
																			class="nav-link text-center" href="#Tag" role="tab"
																			data-toggle="tab">Role Grants</a></li>
																	</ul>

																	<div class="tab-content overflow-hidden">
																		<div role="tabpanel" class="tab-pane active" id="File">
																			<div class="card-text table-responsive col-md-12 mt-10" >
																				<div class="input-group">
																					<span class="input-group-addon search1"><i
																						class="fa fa-search"></i></span> <input
																						class="form-control col-md-12 t-indent-10"
																						type="text" id="SearchUser" autocomplete="off"
																						placeholder="Search for teams">
																				</div>
																				<section class="card" style="display: none;" id="repoCard" >
																					<div class=" card-text onhover" id="repos" data-toggle="slimscroll" data-height="200px" style="border:1px solid #ccc"></div>
																				</section>
																				<br>
																				<div id="cardStart" class="" data-toggle="slimscroll" data-height="350px">
																					<c:forEach items="${SelectedTeamForUser}"
																						var="team" varStatus="loop">
																						<div class='input-group' id=AAAA${loop.index+1}>
																							<span class='input-group-addon'><button
																									type='button' id=BBBB${loop.index+1}
																									class=' btn-outline-danger btn-none'
																									onclick='DeleteTeam(this)'
																									value='${team.getTeamCreate().getTeamName()}'>
																									<i class='si si-close'></i>
																								</button></span><label class='form-control'>${team.getTeamCreate().getTeamName()}</label>
																						</div>
																					</c:forEach>
																				</div>
																				<div id="cardhidden"></div>
																			</div>
																		</div>
																		<div role="tabpanel" class="tab-pane " id="Log">
																			<div class="card-text table-responsive col-md-12 mt-10">
																				<div class="input-group">

																					<span class="input-group-addon search1"><i
																						class="fa fa-search"></i></span> <input
																						class="form-control col-md-12 t-indent-10"
																						type="text" id="SearchUser1" autocomplete="off"
																						placeholder="Search for repo">
																					
																				</div>
																				<section class="card auto-search " id="repoCard1">
																					<div class=" card-text ht1" id="repos1" data-toggle="slimscroll" data-height="200px"></div>
																				</section>
																				<br>
																				<div id="cardStart1" class="" data-toggle="slimscroll" data-height="350px">
																					<c:forEach items="${SelectedRepoDirectAccess}"
																						var="repo" varStatus="loop">
																						<div class='input-group' id=AAAAA${loop.index+1}>
																							<span class='input-group-addon'><button
																									type='button' id=BBBBB${loop.index+1}
																									class=' btn-outline-danger btn-none'
																									onclick='DeleteRepo(this)'
																									value='${repo.getRepoName1().getRepoName()}'>

																									<i class='si si-close'></i>
																								</button></span><label class='form-control'>${repo.getRepoName1().getRepoName()} (${repo.getAccessControl1()})</label>

																						</div>
																					</c:forEach>
																				</div>
																				<div id="cardhidden1"></div>
																			</div>
																		</div>

																		<div role="tabpanel" class="tab-pane " id="Tag">
																			<div class="card-text table-responsive col-md-12 mt-10">
																				<div class="input-group">

																					<span class="input-group-addon search1"><i
																						class="fa fa-search"></i></span> <input
																						class="form-control col-md-12 t-indent-10"
																						type="text" id="SearchUser2" autocomplete="off"
																						placeholder="Search for role">
																					
																				</div>
																				
																				<section class="card onhover"style="display:none;"
																					id="repoCard2">
																					<div class=" card-text block-bordered" id="repos2" data-toggle="slimscroll" data-height="200px" style="    border: 1px solid rgb(204, 204, 204);"></div>
																				</section>
																				<br>
																				<div id="cardStart2" class="" data-toggle="slimscroll" data-height="350px">
																					<c:forEach items="${SelectedRoleAccess}" var="role"
																						varStatus="loop">
																						<div class='input-group ' id=AAAAAA${loop.index+1}>
																							<span class='input-group-addon'><button
																									type='button' id=BBBBBB${loop.index+1}
																									class=' btn-outline-danger btn-none'
																									onclick='DeleteRole(this)'
																									value='${role.getRoleName().getRoleName()}'>
																									<i class='si si-close'></i>
																								</button></span><label class='form-control'>${role.getRoleName().getRoleName()}</label>
																						</div>
																					</c:forEach>
																				</div>
																				<div id="cardhidden2"></div>
																			</div>
																		</div>
																	</div>
																</div>
															</section>
														</div>
													</div>											
										</sec:authorize>

										<div id="dialog-confirm">
											<p id="textForDialog"></p>
										</div>
										<sec:authorize access="hasAnyAuthority('TEAM_ADMIN')">
											<input type="hidden" name="id" value="${user.id}" />

											<div class="form-group row">
												<label class="col-md-3 text-right" for="fn"><b>First
														name:</b></label>
												<div class="col-md-6">
													<input id="fn" name="firstName" type="text"
														value="${user.firstName}" class="form-control input-md"
														readonly>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 text-right" for="ln"><b>Last
														name:</b></label>
												<div class="col-md-6">
													<input id="ln" name="lastName" type="text"
														value="${user.lastName}" class="form-control input-md"
														readonly>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 text-right" for="emailForUser"><b>Email:</b></label>
												<div class="col-md-6">
													<input id="emailForUser" name="email" type="email"
														value="${user.email}" class="form-control input-md"
														readonly>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 text-right" for="rle"><b>Role:</b></label>
												<div class="col-md-6">
													<input id="rle" name="role" type="text"
														value="${role.role}" class="form-control input-md"
														readonly>
												</div>
											</div>
											<c:choose>
												<c:when test="${user.enabled==true}">
													<div class="form-group row">
														<label class="col-md-3 text-right" for="createdTimestamp"><b>Status:</b></label>
														<div class="col-md-6">
															<input id="createdTimestamp" type="text" value="enabled"
																class="form-control input-md" readonly> <input
																type="hidden" value="true" name="enabled">
														</div>
													</div>
												</c:when>
												<c:when test="${user.enabled==false}">
													<div class="form-group row">
														<label class="col-md-3 text-right" for="createdTimestamp"><b>Status:</b></label>
														<div class="col-md-6 pl-0">
															<input id="createdTimestamp" type="text" value="disabled"
																class="form-control input-md" readonly> <input
																type="hidden" value="false" name="enabled">
														</div>
													</div>
												</c:when>
											</c:choose>
											<div class="form-group row">
												<label class="col-md-3 text-right" for="createdBy"><b>Created
														By:</b></label>
												<div class="col-md-6">
													<c:set var="userr" value="${userRepo.findByEmail(user.createdUserEmail)}"></c:set>
													<input id="createdBy" name="createdBy" type="text"
														value="${userr.firstName} ${userr.lastName}" class="form-control input-md text-capitalize"
														readonly>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 text-right" for="createdTimestamp"><b>Created
														Timestamp:</b></label>
												<div class="col-md-6">
													<jsp:useBean id="dateValue129" class="java.util.Date" />
													<jsp:setProperty name="dateValue129" property="time"
														value="${user.createdTimestamp.getTime()}" />
													<input id="createdTimestamp" name="createdTimestamp"
														type="text"
														value='<fmt:formatDate value="${dateValue129}"  pattern="${timestamp}"/>'
														class="form-control input-md" readonly>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 text-right" for="updatedBy"><b>Updated
														By:</b></label>
												<div class="col-md-6">
													<c:set var="userr" value="${userRepo.findByEmail(user.updatedUserEmail)}"></c:set>
													<input id="updatedBy" name="updatedBy" type="text"
														value="${userr.firstName} ${userr.lastName}" class="form-control input-md text-capitalize"
														readonly>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 text-right" for="updatedTimestamp"><b>Updated
														Timestamp:</b></label>
												<div class="col-md-6">
													<input type="hidden" id="updatedTimestamp123"
														value="${user.updatedTimestamp}">
													<jsp:useBean id="dateValue130" class="java.util.Date" />
													<jsp:setProperty name="dateValue130" property="time"
														value="${user.updatedTimestamp.getTime()}" />
													<input id="updatedTimestamp" name="updatedTimestamp"
														type="text"
														value='<fmt:formatDate value="${dateValue130}"  pattern="${timestamp}"/>'
														class="form-control input-md" readonly>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 text-right" for="updatedTimestamp"><b>Updated
														Teams and Privileges :</b></label>
											
											<div class="col-md-6" id="privileges">
												<section class="  block block-bordered ">
													
													<div class=" card-block">

														<ul class="nav nav-tabs" role="tablist">
															<li class="nav-item col-md-4 pl-0 pr-0 text-center"><a
																class="nav-link active " href="#File" role="tab"
																data-toggle="tab">Teams</a></li>

															<li class="nav-item col-md-4 pl-0 pr-0 text-center"><a class="nav-link "
																href="#Log" role="tab" data-toggle="tab">Direct
																	Grants</a></li>
															<li class="nav-item col-md-4 pl-0 pr-0 text-center"><a class="nav-link "
																href="#Tag" role="tab" data-toggle="tab">Role Grants</a></li>

														</ul>
														<div class="tab-content">
															<div role="tabpanel" class="tab-pane active" id="File" style="min-height:300px">
																<div class="card-text table-responsive">
																	<div class="col-md-12 input-group mt-10">
																		<span class="input-group-addon">
																		<i class="fa fa-search search2 top-10"></i></span> 
																		<input class="form-control col-md-12 t-indent-10 mb-10" type="text" id="SearchUser" autocomplete="off" placeholder="Search for teams">
																		<hr>
																	</div>
																	<section class="card col-md-12" style="display: none;" id="repoCard">
																		<div class=" card-text onhover" data-toggle="slimscroll" data-height="200px" id="repos" style="border:1px solid #ebebeb"></div>
																	</section>
																	<div class="col-md-12" id="cardStart" data-toggle="slimscroll" data-height="300px">
																		<c:forEach items="${SelectedTeamForUser}" var="team"
																			varStatus="loop">
																			<div class='input-group' id=AAAA${loop.index+1}>
																				<span class='input-group-addon'><button
																						type='button' id=BBBB${loop.index+1}
																						class=' btn-outline-danger btn-none'
																						onclick='DeleteTeam(this)'
																						value='${team.getTeamCreate().getTeamName()}'>
																						<i class='si si-close'></i>
																					</button></span><label class='form-control'>${team.getTeamCreate().getTeamName()}</label>
																			</div>
																		</c:forEach>
																	</div>
																	<div id="cardhidden"></div>
																</div>
															</div>
															<div role="tabpanel" class="tab-pane " id="Log">
																<div class="card-text table-responsive">
																	<section class="card col-md-12"
																		style="display: none;"
																		id="repoCard1">
																		<div class=" card-text" id="repos1"></div>
																	</section>
																	<br>
																	<div class="col-md-12" id="cardStart1">
																		<c:forEach items="${SelectedRepoDirectAccess}"
																			var="repo" varStatus="loop">
																			<div class='input-group' id=AAAAA${loop.index+1}>
																				<span class='input-group-addon'></span><label
																					class='form-control'>${repo.getRepoName1().getRepoName()} (${repo.getAccessControl1()})</label>
																			</div>
																		</c:forEach>
																	</div>
																	<div id="cardhidden1"></div>
																</div>
															</div>
															<div role="tabpanel" class="tab-pane " id="Tag">
																<div class="card-text table-responsive">
																	<section class="card col-md-12" style="display: none;"
																		id="repoCard2">
																		<div class=" card-text" id="repos2" ></div>
																	</section>
																	<br>
																	<div class="col-md-12" id="cardStart2">
																		<c:forEach items="${SelectedRoleAccess}" var="role"
																			varStatus="loop">
																			<div class='input-group' id=AAAAAA${loop.index+1}>
																				<span class='input-group-addon'></span><label
																					class='form-control'>${role.getRoleName().getRoleName()}</label>
																			</div>
																		</c:forEach>
																	</div>
																	<div id="cardhidden2"></div>
																</div>
															</div>
														</div>
													</div>
												</section>
												
											</div>
											</div>
										</sec:authorize>
										<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN','TEAM_ADMIN')">
													<div class="form-group row">
														<div class="col-md-12 text-center">
															<button type="submit" class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Update</button>
															<a href="${pageContext.request.contextPath}/user" class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Back</a>
														</div>
													</div>
												
										</sec:authorize>
									</fieldset>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/Users_edit_userJS.jsp"%>
	<script>
		$('#user-edit')
				.formValidation(
						{

							framework : 'bootstrap4',

							fields : {
								firstName : {
									validators : {
										notEmpty : {
											message : 'First name is required'
										},
										stringLength : {
											min : 3,
											max : 30,
											message : 'First name must be more than 2 and less than 30 characters long'
										},
										regexp : {
											regexp : /^[a-zA-Z]+$/,
											message : 'First name can only consist of alphabets'
										}
									}
								},
								lastName : {
									validators : {
										notEmpty : {
											message : 'Last name is required'
										},
										stringLength : {
											min : 3,
											max : 30,
											message : 'Last name must be more than 2 and less than 30 characters long'
										},
										regexp : {
											regexp : /^[a-zA-Z0-9_]+$/,
											message : 'Last name can only consist of alphabetical, number and underscore'
										}
									}
								},
							},
							icon : {
								valid : 'fa fa-check',
								invalid : 'fa fa-times-circle',
								validating : 'fa fa-sync-alt'
							},

						});
	</script> 

</body>
</html>