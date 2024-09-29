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
	<div class="block">
		<div class="block block-bordered">
			<div id="fixedSet">
				
				<c:choose>
					<c:when test="${MODE=='ADD'}">
						
						<div class="block-header block-header-default ">
							<h3 class="block-title">CREATE TEAM</h3>
						</div>
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/teams">Teams</a>
								</li>
								<li class="breadcrumb-item active"> Create Team</li>
							</ul>
						</div>
						<div  class="">
						<form class="form-group " method="get" id="add-team" action="${pageContext.request.contextPath}/teamCreation">
							<div class="form-group row">
								<div class="col-md-12 mt-20">
								<div class="col-md-3 pull-left text-right">
								<label class="control-label text-right" for="tn"><b>Name:</b></label>
								</div>
								<div class="col-md-8 col-lg-6 pull-left">
									<input id="tn" name="teamName" type="text"
										placeholder="" class="form-control input-md"
										required autocomplete="off"> <small id="tnError"
										style="color: red; display: none;">Already this
										teamname is present?Please choose some other name.</small>
								</div>
								</div>
							</div>
							<div class="col-md-12">
								
								<div class=" form-group row required mb-0" id="privileges">
									<label class="col-md-3 pull-left text-right" for="rle"><b>Teams and Privileges:</b></label> 
									<div class="col-md-8 col-lg-6">
												<div class="" >
									<section class="height-add-user block block-bordered mb-0" >
										<div class="col-md-12 padding-left-0 padding-right-0 sm-pl-0">

											<ul class="nav nav-tabs  " data-toggle="tabs" role="tablist">

												<li class="nav-item col-md-4 padding-right-0 padding-left-0"><a
													class="nav-link active text-center" href="#File" role="tab"
													data-toggle="tab">User</a></li>

												<li class="nav-item col-md-4 padding-left-0 padding-right-0"><a
													class="nav-link text-center" href="#Log" role="tab"
													data-toggle="tab">Direct Grants</a></li>
												<li class="nav-item col-md-4 padding-left-0 padding-right-0"><a
													class="nav-link text-center" href="#Tag" role="tab"
													data-toggle="tab">Role Grants</a></li>

											</ul>

											<div class="tab-content " >
												<div role="tabpanel" class="tab-pane active" id="File">

													<div class="card-text col-md-12 mt-10" >
                                              <sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
														<div class="input-group ">
															<span class="input-group-addon search1"><i
																class="fa fa-search"></i></span> 
														<input class="form-control  col-md-12 t-indent-10" type="text" id="SearchUser" autocomplete="off" placeholder="Search by users">
														</div>
														
														<section class="repoCard-padding-0 card auto-search col-md-12 name1" id="repoCard">
															<div  class="repos-border card-text onhover" data-toggle="slimscroll" id="repos"></div>
														</section>
														<br>
                                              </sec:authorize>
														<div id="cardStart"  data-toggle="slimscroll"  data-height="400"></div>
														<div id="cardhidden" ></div>
													</div>
												</div>
												
												
												
												
												<div role="tabpanel" class="tab-pane" id="Log" >
													<div class="card-text col-md-12 mt-10">

														<div class="input-group ">
														
															<span class="input-group-addon search1"><i class="fa fa-search"></i></span> 
															<input class="form-control col-md-12 t-indent-10" 
																type="text" id="SearchUser1" autocomplete="off"
																placeholder="Search by repo">
															<hr>
														</div>
														<section class="repoCard-padding-0 card auto-search " style="" id="repoCard1">
															<div class="repos-border card-text " data-toggle="slimscroll" id="repos1"></div>
														</section>
														<br>		
														<div class="">
															<div id="cardStart1" data-toggle="slimscroll" data-height="400"></div>

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
																placeholder="Search by role">
														</div><!--  repos-border -->
														<section class="card auto-search"  id="repoCard2">
															<div class="card-text onhover" data-toggle="slimscroll"  id="repos2"></div>
														</section>
														<br>	
														<div class="">
														<div id="cardStart2" data-toggle="slimscroll" data-height="400px"></div>
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
								
								<br>
							</div>
							<div class="form-group row">
								<label class="col-md-3 control-label" for="submit"></label>
								<div class="col-md-6 text-center">
									<button type="submit" class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Submit</button>
									<a href="${pageContext.request.contextPath}/teams" class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Back</a>
								</div>
							</div>
						</form>
						</div>
					</c:when>



		<c:when test="${MODE=='EDIT' }">
						<div class="block-header block-header-default mb-20">
							<h3 class="block-title">UPDATE TEAM</h3>
						</div>
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/teams">Teams</a>
								</li>
								<li class="breadcrumb-item active"> Update Team</li>
							</ul>
						</div>
						<form class="form-group col-md-12"  method="get" action="${pageContext.request.contextPath}/teamUpdation">

							<div class="form-group row">
								<label class="col-md-3 control-label text-right"
									for="teamnameip"><b>Name :</b></label>
								<div class="col-md-8 col-lg-6">
									<input id="teamnameip" name="teamName" type="text"
										placeholder="Search by team name" value='${team.getTeamName()}'
										class="form-control input-md" readonly>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-3 control-label text-right" for="createdBy"><b>Created
										By :</b></label>
								<div class="col-md-8 col-lg-6">
									<input id="createdBy" name="createdBy" type="text"
										value='${team.getCreatedBy().firstName} ${team.getCreatedBy().lastName}' class="form-control input-md text-capitalize"
										readonly>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-3 control-label text-right"
									for="createdTimestamp"><b>Created Timestamp :</b></label>
								<div class="col-md-8 col-lg-6">
									<jsp:useBean id="dateValue130" class="java.util.Date" />
									<jsp:setProperty name="dateValue130" property="time"
										value="${team.getCreatedTimestamp().time}" />
									<c:if test="${team.getCreatedTimestamp().time!=null}">
										<input id="createdTimestamp" name="createdTimestamp"
											type="text"
											value='<fmt:formatDate value="${dateValue130}"  pattern="${timestamp}"/>'
											class="form-control input-md" readonly>
									</c:if>
									<c:if test="${team.getCreatedTimestamp().time==null}">
										<input id="createdTimestamp" name="createdTimestamp"
											type="text" value='' class="form-control input-md" readonly>
									</c:if>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-3 control-label text-right" for="updatedBy"><b>Updated
										By :</b></label>
								<div class="col-md-8 col-lg-6">
									<input id="updatedBy" name="updatedBy" type="text"
										value='${team.getUpdatedBy().firstName} ${team.getUpdatedBy().lastName}' class="form-control input-md text-capitalize"
										readonly>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-3 control-label text-right"
									for="updatedTimestamp"><b>Updated Timestamp :</b></label>
								<div class="col-md-8 col-lg-6">
									<jsp:useBean id="dateValue131" class="java.util.Date" />
									<jsp:setProperty name="dateValue131" property="time"
										value="${team.getUpdatedTimestamp().time}" />
									<c:if test="${team.getUpdatedTimestamp().time!=null}">
										<input id="updatedTimestamp" name="updatedTimestamp"
											type="text"
											value='<fmt:formatDate value="${dateValue131}"  pattern="${timestamp}"/>'
											class="form-control input-md" readonly>
									</c:if>
									<c:if test="${team.getUpdatedTimestamp().time==null}">
										<input id="createdTimestamp" name="createdTimestamp"
											type="text" value='' class="form-control input-md" readonly>
									</c:if>
								</div>
							</div>
							<div class="form-group row">
							<label class="col-md-3 control-label text-right"
									for="updatedTimestamp"><b>Users and Privileges :</b></label>
								<div class="col-md-8 col-lg-6">
								<section class=" block block-bordered " style="min-height: 350px">
									<div class=" card-block">
										<ul class="nav nav-tabs" role="tablist">
											<li class="nav-item col-md-4 pl-0 pr-0 text-center"><a
												class="nav-link active " href="#File" role="tab"
												data-toggle="tab">Users</a></li>
											<li class="nav-item col-md-4 pl-0 pr-0 text-center"><a class="nav-link "
												href="#Log" role="tab" data-toggle="tab">Direct Grants</a></li>
											<li class="nav-item col-md-4 pl-0 pr-0 text-center"><a class="nav-link "
												href="#Tag" role="tab" data-toggle="tab">Role Grants</a></li>
										</ul>
										<br>
										<div class="tab-content">
											<div role="tabpanel" class="tab-pane active" id="File">
												<div class="card-text table-responsive">
													<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
														<div class="col-md-12 input-group ">
															<span class="input-group-addon "><i
																class="fa fa-search search2 top-10"></i></span> <input
																class="form-control col-md-12 t-indent-10" type="text"
																id="SearchUser" autocomplete="off"
																placeholder="Search by users">
															<hr>
														</div>
													</sec:authorize>
													<sec:authorize access="hasAnyAuthority('TEAM_ADMIN')">
														<c:if test="${isTA=='yes'}">
															<div class="col-md-12 input-group ">
																<hr>
																<span class="input-group-addon "><i
																	class="fa fa-search search2 top-10"></i></span> <input
																	class="form-control col-md-12 t-indent-10" type="text"
																	id="SearchUser" autocomplete="off"
																	placeholder="Search by users">
																<hr>
															</div>
														</c:if>
													</sec:authorize>
													<section class="card col-md-12" id="repoCard" style="display:none;">
														<div class=" card-text onhover"  data-toggle="slimscroll" data-height="200px" style="border:1px solid #ccc" id="repos" ></div>
													</section>
													<br>
													<div class="col-md-12" id="cardStart" data-toggle="slimscroll" data-height="300px">
														<c:forEach items="${teamUserRepo}" var="user" varStatus="loop">
														<c:if test="${user.getUsers().getEnabled()}">
															<div class='input-group' id=AA${loop.index+1}>
																<span class='input-group-addon'> <sec:authorize
																		access="hasAnyAuthority('TEAM_ADMIN')">
																		<c:if test="${isTA=='yes'}">
																			<c:if test="${userNameDisplay.email!=user.getUsers().getEmail()}">
																				<button type='button' id=BB${loop.index+1}
																					class=' btn-outline-danger btn-none'
																					onclick='DeleteUser(this)'
																					value='${user.getUsers().getEmail()}'>
																					<i class='si si-close'></i>
																				</button>
																			</c:if>
																		</c:if>
																	</sec:authorize>
																	 <sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
																		<button type='button' id=BB${loop.index+1}
																			class=' btn-outline-danger btn-none'
																			onclick='DeleteUser(this)'
																			value='${user.getUsers().getEmail()}'>
																			<i class='si si-close'></i>
																		</button>
																	</sec:authorize></span><label class='form-control'>${user.getUsers().getFirstName()}
																	${user.getUsers().getLastName()} -
																	${user.getUsers().getEmail()}</label>
															</div>
															</c:if>
														</c:forEach>
													</div>
													<div id="cardhidden"></div>
												</div>
											</div>

											
											<div role="tabpanel" class="tab-pane " id="Log">
												<div class="card-text table-responsive">
													<sec:authorize
														access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
														<div class="col-md-12 input-group ">
															<hr>
															<span class="input-group-addon "><i
																class="fa fa-search search2 top-10"></i></span> <input
																class="form-control col-md-12 t-indent-10" type="text"
																id="SearchUser1" autocomplete="off"
																placeholder="Search by repo">
															<hr>
														</div>
													</sec:authorize>
													<section class="card col-md-12" id="repoCard1" style="display:none">
														<div class=" card-text" id="repos1" data-toggle="slimscroll" data-height="200px" style="border:1px solid #ccc"></div>
													</section>
													<br>
													<div class="col-md-12" id="cardStart1">
														<c:forEach items="${falconRepoFroTeam}" var="repo"
															varStatus="loop">
															<div class='input-group' id=AAA${loop.index+1}>
																<span class='input-group-addon'> <sec:authorize
																		access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
																		<button type='button' id=BBB${loop.index+1}
																			class=' btn-outline-danger btn-none'
																			onclick='DeleteRepo(this)'
																			value='${repo.getRepoCreate().getRepoName()}'>
																			<i class='si si-close'></i>
																		</button>
																	</sec:authorize></span><label class='form-control'>${repo.getRepoCreate().getRepoName()} (${repo.getAccessControl()})
																</label>
															</div>
														</c:forEach>
													</div>
													<div id="cardhidden1"></div>
												</div>
											</div>

											<div role="tabpanel" class="tab-pane " id="Tag">
												<div class="card-text table-responsive">
													<sec:authorize
														access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
														<div class="col-md-12 input-group ">
															<hr>
															<span class="input-group-addon "><i
																class="fa fa-search search2 top-10"></i></span> <input
																class="form-control col-md-12 t-indent-10" type="text"
																id="SearchUser2" autocomplete="off"
																placeholder="Search by role">
															<hr>
														</div>
													</sec:authorize>
													<section class="card col-md-12" id="repoCard2" style="display:none">
														<div class="card-text onhover" data-toggle="slimscroll" data-height="200px" style="border:1px solid #ccc" id="repos2"></div>
													</section>
													<br>
													<div class="col-md-12" id="cardStart2">
														<c:forEach items="${roleForTeamRepo}" var="role"
															varStatus="loop">
															<div class='input-group' id=AAAA${loop.index+1}>
																<span class='input-group-addon'> <sec:authorize
																		access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
																		<button type='button' id=BBBB${loop.index+1}
																			class=' btn-outline-danger btn-none'
																			onclick='DeleteRole(this)'
																			value='${role.getRoleName().getRoleName()}'>
																			<i class='si si-close'></i>
																		</button>
																	</sec:authorize></span><label class='form-control'>${role.getRoleName().getRoleName()}
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
								<br>
							</div>
							</div>
							<div class="form-group row">
								<label class="col-md-3 control-label" for="submit"></label>
								<div class="col-md-6 text-center">
									<sec:authorize
										access="hasAnyAuthority('ADMIN','SUPER_ADMIN','TEAM_ADMIN')">
										<button type="submit" class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Update</button>
									</sec:authorize>
									<a href="${pageContext.request.contextPath}/teams" class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Back</a>
									<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
										<a href="${pageContext.request.contextPath}/delete-team?teamName=${team.getTeamName()}"
											class="btn btn-danger DeleteTeamDialog" data-toggle="click-ripple">Delete</a>
									</sec:authorize>
								</div>
							</div>
						</form>
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
	<%@include file="/static/js/pages/Team_CreateAndEditJS.jsp"%>
	<script>
		$('#add-team')
				.formValidation(
						{

							framework : 'bootstrap4',

							fields : {
								teamName : {
									validators : {
										notEmpty : {
											message : 'Team name is required'
										},
										stringLength : {
											min : 3,
											max : 30,
											message : 'Team name must be more than 2 and less than 30 characters long'
										},
										regexp : {
											regexp : /^[a-zA-Z0-9_]+$/,
											message : 'Team name can only consist of alpha-numeric and underscore characters'
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
