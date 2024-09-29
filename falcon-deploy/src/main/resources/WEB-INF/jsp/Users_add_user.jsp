<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
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
			<div class="">
				<div class="block block-bordered">
					<div class="" id="fixedSet">
						<div class="block-header block-header-default">
							<h3 class="block-title">CREATE USER</h3>
						</div>
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/user"> Users</a>
								</li>
								<li class="breadcrumb-item active"> Create Users</li>
							</ul>
						</div>
						
						<form class="form-horizontal mt-30 mb-30 col-md-12"
							action=<c:url value='save-user' /> method="post" id="user-add" autocomplete="off" >
							<fieldset>

								<div class="form-group row">
									<label class="col-md-3 control-label text-right" for="fn"><b>First Name:</b></label>
									<div class="col-md-8 col-lg-6">
										<input id="fn" name="firstName" type="text"
											placeholder="" class="form-control input-md"
											autocomplete="off" >
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 control-label text-right" for="ln"><b>Last Name:</b></label>
									<div class="col-md-8 col-lg-6">
										<input id="ln" name="lastName" type="text"
											placeholder="" class="form-control input-md"
											autocomplete="off" > 
									</div>
								</div>

								<div class="form-group row ">
									<label class="col-md-3 control-label text-right" for="emailid"><b>Email:</b></label>

									<div class="col-md-8 col-lg-6">
										<input id="emailid" name="email" type="email" placeholder="" class="form-control input-md" autocomplete="off" >
										<small id="tnError" style="color: red; display: none;">Email ID already exists</small>
									</div>
								</div>
								<!-- <div class="form-group row ">
									<label class="col-md-3 control-label text-right" for="passwrd"><b>Password:</b></label>
									<div class="col-md-8 col-lg-6">
										<input id="passwrd" name="password" type="password" placeholder=" enter new password" class="form-control input-md" autocomplete="off" >
									</div>
								</div> -->
								<div class=" form-group row  ">
									<label class="col-md-3 control-label text-right" for="rle"><b>Select Role:</b></label>
									<div class="col-md-8 col-lg-6">
										<select class="custom-select" id="team--role" name="role">
											<option value="ADMIN">ADMIN</option>
											<option value="USER">USER</option>
											<option value="TEAM_ADMIN">TEAM_ADMIN</option>
											<sec:authorize access="hasAnyAuthority('SUPER_ADMIN')">
											<option value="SUPER_ADMIN">SUPER_ADMIN</option>
											</sec:authorize>
										</select>
									</div>
								</div>
								<input id="stats" name="enabled" type="hidden" value="true" class="form-control input-md">


								<div class=" form-group row  " id="privileges"
									style="display: none;">
									<label class="col-md-3 control-label text-right" for="rle"><b>Teams and Privileges:</b></label>
									<div class="col-md-8 col-lg-6">
										<div class="">
											<section class="height-add-user block block-bordered ">
												<div class="col-md-12 padding-left-0 padding-right-0">

													<ul class="nav nav-tabs  " data-toggle="tabs" role="tablist">
														<li
															class="nav-item col-md-4 padding-right-0 padding-left-0"><a
															class="nav-link active text-center" href="#File"
															role="tab" data-toggle="tab">Teams</a></li>

														<li
															class="nav-item col-md-4 padding-left-0 padding-right-0"><a
															class="nav-link text-center" href="#Log" role="tab"
															data-toggle="tab">Direct Grants</a></li>
														<li
															class="nav-item col-md-4 padding-left-0 padding-right-0"><a
															class="nav-link text-center" href="#Tag" role="tab"
															data-toggle="tab">Role Grants</a></li>

													</ul>

													<div class="tab-content ">

														<div role="tabpanel" class="tab-pane active" id="File">

															<div class="card-text col-md-12 mt-10">

																<div class="input-group ">
																	<span class="input-group-addon search1"><i
																		class="fa fa-search"></i></span> <input
																		class="form-control  col-md-12 t-indent-10"
																		type="text" id="SearchUser" autocomplete="off"
																		placeholder="Search for teams">
																</div>

																<section
																	class="repoCard-padding-0 card auto-search col-md-12 name1"
																	id="repoCard">
																	<div class="card-text onhover" data-toggle="slimscroll"
																		data-height="200px" id="repos"></div>
																</section>
																<br>
																<div id="cardStart" data-toggle="slimscroll"
																	data-height="400px" class=""></div>
																<div id="cardhidden"></div>
															</div>
														</div>


														<div role="tabpanel" class="tab-pane" id="Log">
															<div class="card-text col-md-12 mt-10">

																<div class="input-group ">

																	<span class="input-group-addon search1"><i
																		class="fa fa-search"></i></span> <input
																		class="form-control col-md-12 t-indent-10" type="text"
																		id="SearchUser1" autocomplete="off"
																		placeholder="Search for repo">
																</div>
																
																<section class="repoCard-padding-0 card auto-search"
																	style="" id="repoCard1">
																	<div class="repos-border card-text" id="repos1"
																		data-toggle="slimscroll" data-height="200px"></div>
																</section>

																<br>
																<div class="">
																	<div id="cardStart1" data-toggle="slimscroll"
																		data-height="200px"></div>

																	<div id="cardhidden1"></div>
																</div>
															</div>
														</div>

														<div role="tabpanel" class="tab-pane " id="Tag">
															<div class="card-text col-md-12 mt-10">

																<div class="input-group ">

																	<span class="input-group-addon search1"><i
																		class="fa fa-search"></i></span> <input
																		class="form-control col-md-12 t-indent-10" type="text"
																		id="SearchUser2" autocomplete="off"
																		placeholder="Search for role">
																</div>
																<!--  repos-border -->
																
																<section class="card auto-search" id="repoCard2">
																
																	<div class=" card-text onhover" id="repos2"
																		data-toggle="slimscroll" data-height="200px"></div>
																</section>
																<br>
																<div class="">
																	<div id="cardStart2" data-toggle="slimscroll"
																		data-height="200px"></div>
																	<div id="cardhidden2"></div>
																</div>
															</div>
														</div>


													</div>
												</div>
											</section>
										</div>
									</div>
								</div>


								<input id="cmpny" name="companyId" type="hidden" value="1001"
									placeholder="" class="form-control input-md">

								<div class="form-group row">
									<div class="col-md-8 offset-md-2 text-center">
										<button type="submit" class="btn btn-primary mr-sm-2" id="userCreationSubmitButton" data-toggle="click-ripple">Submit</button>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <a href="${pageContext.request.contextPath}/user"
											class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Back</a>
									</div>
								</div>
							</fieldset>

						</form>
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
	<%@include file="/static/js/pages/Users_add_userJS.jsp"%>
	<script>
		$('#user-add')
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
											regexp : /^[a-zA-Z]+$/,
											message : 'Last name can only consist of alphabets'
										}
									}
								},
								email:{
					               	 validators: {
					                        notEmpty: {
					                            message: 'Email is required'
					                        },
					                        
					                        regexp: {
					                            regexp: /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-z0-9-]+)*(\.[a-zA-Z]{2,4})$/,
					                            message: 'Email format is not valid'
					                        }
					                    }
					               } 
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
