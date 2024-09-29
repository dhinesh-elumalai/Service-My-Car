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

 <main id="main-container">
                <!-- Page Content -->
                <div class="content">
	<div class="">
		<div class="block block-bordered">
			<div id="fixedSet">
				
				<c:choose>
					<c:when test="${MODE== 'Add'}">
						<div class="block-header block-header-default">
							<h3 class="block-title">CREATE ROLE</h3>
						</div>
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/roles">Roles</a>
								</li>
								<li class="breadcrumb-item active"> Create Role</li>
							</ul>
						</div>
						<form class="form-group" method="post" id="role-add" action="${pageContext.request.contextPath}/roleCreation">
							<div class="form-group row">
								<div class="col-12 mt-20">
								<div class="col-md-3 pull-left text-right">
									<label for="tn"><b>Role Name:</b></label>
								</div>
								<div class="col-md-8 col-lg-6 pull-left">
									<input id="tn" name="roleName" type="text"
										placeholder="" class="form-control input-md"
										required autocomplete="off"> <small id="tnError"
										style="color: red; display: none; margin-top:5px">Role already exists</small>
								</div>
								</div>
							</div>

							<div class="col-md-12">
								<div class=" form-group row required mb-0" id="privileges">
									<label class="col-md-3 pull-left text-right" for="rle"><b>Teams and Privileges:</b></label> 
									<div class="col-md-8 col-lg-6">
												<div class="" >
									<section class="height-add-user block block-bordered " >
										<div class="col-md-12 padding-left-0 padding-right-0">

											<ul class="nav nav-tabs  " data-toggle="tabs" role="tablist">

												<li class="nav-item col-md-4 padding-right-0 padding-left-0"><a
													class="nav-link active text-center" href="#File" role="tab"
													data-toggle="tab">Users</a></li>

												<li class="nav-item col-md-4 padding-left-0 padding-right-0"><a
													class="nav-link text-center" href="#Log" role="tab"
													data-toggle="tab">Grants on Repo</a></li>
												<li class="nav-item col-md-4 padding-left-0 padding-right-0"><a
													class="nav-link text-center" href="#Tag" role="tab"
													data-toggle="tab">Teams</a></li>

											</ul>

											<div class="tab-content " >
												<div role="tabpanel" class="tab-pane active" id="File">

													<div class="card-text col-md-12 mt-10" >

														<div class="input-group ">
															<span class="input-group-addon search1"><i
																class="fa fa-search"></i></span> 
																<input class="form-control t-indent-10" type="text"
																id="SearchUser" 
																autocomplete="off" placeholder="Search by users">
															<hr>
														</div>

														<section class="repoCard-padding-0 card auto-search col-md-12 name1" id="repoCard">
															<div data-toggle="slimscroll" data-height="200px" class="repos-border card-text onhover" id="repos"></div>
														</section>
														<br>

														<div id="cardStart" class="" data-toggle="slimscroll" data-height="350px"></div>
														<div id="cardhidden"></div>
													</div>
												</div>
												<div role="tabpanel" class="tab-pane" id="Log" >
													<div class="card-text col-md-12 mt-10">

														<div class="input-group">
														
															<span class="input-group-addon search1"><i class="fa fa-search"></i></span> 
															<input class="form-control col-md-12 t-indent-10" type="text" id="SearchUser1" autocomplete="off"
																placeholder="Search by repo">
															
														</div>
														<section class="repoCard-padding-0 card auto-search" style="" id="repoCard1">
															<div data-toggle="slimscroll" data-height="200px" class="repos-border card-text " id="repos1"></div>
														</section>
														<br>

														<div class="">
															<div id="cardStart1" data-toggle="slimscroll" data-height="350px"></div>

															<div id="cardhidden1"></div>
														</div>
													</div>
												</div>
												<div role="tabpanel" class="tab-pane " id="Tag">
													<div class="card-text col-md-12 mt-10">

														<div class="input-group ">
														
															<span class="input-group-addon search1"><i
																class="fa fa-search"></i></span> 
																<input class="form-control t-indent-10" type="text"
																id="SearchUser2" autocomplete="off"
																placeholder="Search by team">
															<br>
														</div><!--  repos-border -->
														<section class="card auto-search"  id="repoCard2">
															<div data-toggle="slimscroll" data-height="200px"  class="card-text onhover" id="repos2"></div>
														</section>
														<br>

														<div class="">
														<div id="cardStart2" data-toggle="slimscroll"></div>
														<div id="cardhidden2"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</section>
									<br>
								</div>
									</div>
								</div>
								
								<div class="form-group row text-center">
								
								<div class="col-md-12 mb-20 sm-mt-0">
									<button type="submit" class="btn btn-primary" data-toggle="click-ripple">Submit</button>
									<a href="${pageContext.request.contextPath}/roles" class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Back</a>
								</div>
							</div>
							</div>
							
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
					</c:when>

					<c:when test="${MODE=='Edit' }">
						<div class="block block-bordered">
						<div class="block-header block-header-default mb-20">
							<h3 class="block-title">UPDATE ROLE</h3>
						</div>
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/roles">Roles</a>
								</li>
								<li class="breadcrumb-item active"> Update Role</li>
							</ul>
						</div>
						
						<form class="form-group col-md-12" method="Post" action="${pageContext.request.contextPath}/roleUpdation">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="form-group row">
								<label class="col-md-3 control-label text-right"
									for="rolenameip"><b>Role Name:</b></label>
								<div class="col-md-8 col-lg-6">
									<input id="rolenameip" name="roleName" type="text"
										value='${roleName.getRoleName()}'
										class="form-control input-md" readonly>

								</div>
							</div>

							<div class="form-group row">
								<label class="col-md-3 control-label text-right" for="createdBy"><b>Created
										By:</b></label>
								<div class="col-md-8 col-lg-6">
									<input id="createdBy"  type="text"
										value='${roleName.getCreatedBy().firstName} ${roleName.getCreatedBy().lastName}'
										class="form-control input-md text-capitalize" readonly>

								</div>
							</div>

							<div class="form-group row">
								<label class="col-md-3 control-label text-right"
									for="createdTimestamp"><b>Created Timestamp:</b></label>
								<div class="col-md-8 col-lg-6">
									<jsp:useBean id="dateValue131" class="java.util.Date" />
									<jsp:setProperty name="dateValue131" property="time"
										value="${roleName.getCreatedTimestamp().time}" />
									<c:if test="${roleName.getCreatedTimestamp().time!=null}">

										<input id="createdTimestamp" type="text"
											value='<fmt:formatDate value="${dateValue131}"  pattern="${timestamp}"/>'
											class="form-control input-md" readonly>
									</c:if>
									<c:if test="${roleName.getCreatedTimestamp().time==null}">
										<input id="createdTimestamp" type="text" value=''
											class="form-control input-md" readonly>
									</c:if>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-3 control-label text-right" for="updatedBy"><b>Updated
										By:</b></label>
								<div class="col-md-8 col-lg-6">
									<input id="updatedBy" type="text"
										value='${roleName.getUpdatedBy().firstName } ${roleName.getUpdatedBy().lastName }'
										class="form-control input-md" readonly>

								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-3 control-label text-right"
									for="updatedTimestamp"><b>Updated Timestamp:</b></label>
								<div class="col-md-8 col-lg-6">

									<jsp:useBean id="dateValue132" class="java.util.Date" />
									<jsp:setProperty name="dateValue132" property="time"
										value="${roleName.getUpdatedTimestamp().time}" />
									<c:if test="${roleName.getUpdatedTimestamp().time!=null}">

										<input id="updatedTimestamp" type="text"
											value='<fmt:formatDate value="${dateValue132}"  pattern="${timestamp}"/>'
											class="form-control input-md" readonly>
									</c:if>
									<c:if test="${roleName.getUpdatedTimestamp().time==null}">
										<input id="updatedTimestamp" type="text" value=''
											class="form-control input-md" readonly>
									</c:if>
								</div>
							</div>

							<div class="form-group row">
								<label class="col-md-3 pull-left text-right" for="rle"><b>Teams and Privileges:</b></label> 
								<div class="col-md-8 col-lg-6">
									<section class=" block block-bordered">
									<div class="" data-toggle="slimscroll" data-height="500px">

										<ul class="nav nav-tabs border js-tabs-enabled" data-toggle="tabs" role="tablist">
											<li class="nav-item col-md-4 pl-0 pr-0"><a
												class="nav-link active text-center" href="#File" role="tab"
												data-toggle="tab">Users</a></li>

											<li class="nav-item col-md-4 pl-0 pr-0"><a class="nav-link text-center"
												href="#Log" role="tab" data-toggle="tab">Grants on Repo </a></li>
											<li class="nav-item col-md-4 pl-0 pr-0"><a class="nav-link text-center"
												href="#Tag" role="tab" data-toggle="tab">Teams</a></li>

										</ul>
										<div class="tab-content">
											<div role="tabpanel" class="tab-pane active col-md-12 mt-10" id="File">
												<div class="card-text table-responsive">
													<sec:authorize
														access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
														<div class="input-group ">
															
															<span class="input-group-addon search1"><i
																class="fa fa-search"></i></span> <input
																class="form-control t-indent-10" type="text"
																id="SearchUser" autocomplete="off"
																placeholder="Search by users">
															<hr>
														</div>
													</sec:authorize>

													<section class="card" id="repoCard" style="display:none">
														<div class="card-text" data-toggle="slimscroll" data-height="200px" style="border:1px solid #ccc" id="repos" ></div>
													</section>
													<br>
													<div id="cardStart" class="">
														<c:forEach items="${roleUserRepo}" var="user"
															varStatus="loop">
															<div class='input-group' id=AA${loop.index+1}>
																<span class='input-group-addon'> <sec:authorize
																		access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
																		<button type='button' id=BB${loop.index+1}
																			class=' btn-outline-danger btn-none'
																			onclick='DeleteUser(this)'
																			value='${user.getUser().getEmail()}'>
																			<i class='si si-close'></i>
																		</button>
																	</sec:authorize></span><label class='form-control'>${user.getUser().getFirstName()}
																	${user.getUser().getLastName()} -
																	${user.getUser().getEmail()}</label>
															</div>
														</c:forEach>
													</div>
													<div id="cardhidden"></div>
												</div>
											</div>
											<div role="tabpanel" class="tab-pane col-md-12 mt-10" id="Log">
												<div class="card-text table-responsive">
													<sec:authorize
														access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
														<div class="input-group ">
															
															<span class="input-group-addon search1"><i
																class="fa fa-search"></i></span> <input
																class="form-control t-indent-10" type="text"
																id="SearchUser1" autocomplete="off"
																placeholder="Search by repo">
															<hr>
														</div>
													</sec:authorize>
													<section class="card" id="repoCard1" style="display:none">
														<div class="card-text" data-toggle="slimscroll" data-height="200px" style="border:1px solid #ccc" id="repos1"></div>
													</section>
													
													<div id="cardStart1" class="mt-10">
														<c:forEach items="${falconRepoForRole}" var="role"
															varStatus="loop">
															<div class='input-group' id=AAA${loop.index+1}>
																<span class='input-group-addon'> <sec:authorize
																		access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
																		<button type='button' id=BBB${loop.index+1}
																			class=' btn-outline-danger btn-none'
																			onclick='DeleteRepo(this)'
																			value='${role.getRepoCreate().getRepoName()}'>
																			<i class='si si-close'></i>
																		</button>
																	</sec:authorize></span><label class='form-control'>${role.getRepoCreate().getRepoName()} (${role.getAccessControl()})
																</label>
															</div>
														</c:forEach>
													</div>
													<div id="cardhidden1"></div>
												</div>
											</div>


											<div role="tabpanel" class="tab-pane col-md-12 mt-10" id="Tag">
												<div class="card-text table-responsive">
													<sec:authorize
														access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
														<div class="input-group ">
															
															<span class="input-group-addon search1"><i
																class="fa fa-search"></i></span> <input
																class="form-control t-indent-10" type="text"
																id="SearchUser2" autocomplete="off"
																placeholder="Search by teams">
															
														</div>
													</sec:authorize>
													<section class="card" id="repoCard2" style="display:none">
														<div class=" card-text" data-toggle="slimscroll" data-height="200px" style="border:1px solid #ccc" id="repos2"></div>
													</section>
												
													<div id="cardStart2" class="mt-10">
														<c:forEach items="${teamForRoleRepo}" var="team"
															varStatus="loop">
															<div class='input-group' id=AAAA${loop.index+1}>
																<span class='input-group-addon'> <sec:authorize
																		access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
																		<button type='button' id=BBBB${loop.index+1}
																			class=' btn-outline-danger btn-none'
																			onclick='DeleteTeam(this)'
																			value='${team.getTeam().getTeamName()}'>
																			<i class='si si-close'></i>
																		</button>
																	</sec:authorize></span><label class='form-control'>${team.getTeam().getTeamName()}
																</label>
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
								<br>
							</div>
							<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
								<div class="form-group row">
									<!-- <label class="col-md-4 control-label" for="submit"></label> -->
									<div class="col-md-12 text-center xs-text-center sm-text-center">
										<button type="submit" class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Update</button>
										<a href="${pageContext.request.contextPath}/roles" class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Back</a> <a
											href="${pageContext.request.contextPath}/delete-role?roleName=${roleName.getRoleName()}"
											class="btn btn-danger DeleteTeamDialog" data-toggle="click-ripple">Delete</a>
									</div>
								</div>
							</sec:authorize>
						</form>
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
	<%@include file="/static/js/pages/Role_RepoAndRepoMappJS.jsp"%>
	<script>
		$('#role-add')
				.formValidation(
						{
							framework : 'bootstrap4',
							fields : {
								roleName : {
									validators : {
										notEmpty : {
											message : 'Role name is required'
										},
										stringLength : {
											min : 2,
											max : 30,
											message : 'Role name must be more than 2 and less than 30 characters long'
										},
										regexp : {
											regexp : /^[a-zA-Z0-9_]+$/,
											message : 'Role name can only consist of alphabetical, number and underscore'
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
