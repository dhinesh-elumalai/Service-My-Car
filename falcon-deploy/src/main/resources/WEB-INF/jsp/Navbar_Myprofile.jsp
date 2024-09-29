<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
<div id="preloader">
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
					<div class="block-header block-header-default">
						<h3 class="block-title font-w600 text-uppercase">Profile</h3>
					</div>
					<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								
								<li class="breadcrumb-item active">Profile</li>
							</ul>
						</div>
					<div class="bg-image bg-image-center" style="background-image:url('static/img/photos/falcon1@2x.jpg');">
                    <div class="bg-primary-dark-op py-30">
                        <div class="content content-full text-center">
                            <!-- Avatar -->
                            <div class="mb-15 profile-img-area">
                                <a class="img-link" href="${pageContext.request.contextPath}/crop" >
                                    <img class="img-avatar img-avatar96 img-avatar-thumb" src="profile/${userNameDisplay.getId()}" alt="">
                                    
                                </a>
                               <a href="${pageContext.request.contextPath}/crop">
                                <div class="edit-profile">
                               		<i class="fa fa-pencil"></i>
                                </div>
                                </a>
                                
                            </div>

                            <!-- Personal -->
                            <h1 class="h3 text-white font-w700 mb-10 text-capitalize">${userNameDisplay.firstName}  ${userNameDisplay.lastName}</h1>
                            <h2 class="h5 text-white-op">
                                <a style="color:#fff" href="javascript:void(0)">${userNameDisplay.email}</a>
                            </h2>
                            
                            <!-- Actions -->
                            <button type="button" class="btn btn-rounded btn-hero btn-sm btn-alt-primary
                             mb-5" data-toggle="modal" data-target="#myModal2">
                                <i class="fa fa-pencil mr-5"></i>Edit
                            </button>                           
                            <!-- END Actions -->
                        </div>
                    </div>
                </div>

                <div id="myModal2" class="modal fade" role="dialog"
									aria-labelledby="modalLabelLarge">
									<div class="modal-dialog modal-lg">

										<div class="modal-content">
											<div class="modal-header block-header block-header-default">
												
												<h4 class="modal-title  block-title text-uppercase">Edit Profile</h4>
											</div>
											<div class="modal-body">
												<form class="form-horizontal" onsubmit="return uploadingcheckpass();" action=<c:url value='update-myprofile' /> method="post" id="profile-edit">
													<div class="form-group row">
														<label class="col-md-3 control-label text-right" for="fn"><b>First
																name:</b></label>
														<div class="col-md-7 pl-0 pr-0">
															<input id="fno" name="firstName" type="text" value='${userNameDisplay.firstName}' class="form-control" autocomplete="off">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 control-label text-right" for="ln"><b>Last name:</b></label>
														<div class="col-md-7 pl-0 pr-0">
															<input id="lno" name="lastName" type="text" value='${userNameDisplay.lastName}' class="form-control" autocomplete="off">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 control-label text-right" for="emailo"><b>Email:</b></label>
														<div class="col-md-7 pl-0 pr-0">
															<input id="emailo" name="email" type="email" value='${userNameDisplay.email}' class="form-control" autocomplete="off">
														</div>
													</div>
													<div id="appendData">
													
                                                    </div>
													<div class="form-group row ">
														<label class="col-md-3" for="cpass"><b></b></label>
														<button type="button" onclick="showFields()" id="cpassbtn" style="display: block;" class=" btn btn-primary mr-sm-1">Change Password</button>&nbsp;
														<button type="submit" id="updateSubmitBtn"class=" btn btn-primary">Update</button>
													</div>
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												</form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-alt-danger"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
				</div>
			</div>
		</div>
	</main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<script>
			$('#profile-edit').formValidation(
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
								email:{
					               	 validators: {
					                        notEmpty: {
					                            message: 'Email is required'
					                        },
					                        
					                        regexp: {
					                        	 regexp: /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-z0-9-]+)*(\.[a-zA-Z]{2,4})$/,
					                            message: 'Email format not accepted'
					                        }
					                    }
					               },
					               newPassword: {
					                   validators: {
					                       notEmpty: {
					                           message: 'Password is required'
					                       },
					                       stringLength: {
					                           min: 6,
					                           max: 12,
					                           message: 'Password must be more than 6 and less than 12 characters long'
					                       },
					                   }               
					               },
					               conformPassword: {
					                   validators: {                     
					                       identical: {
					                           field: 'newPassword',
					                           message: 'Password do not match'
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
	<%@include file="/static/js/pages/Navbar_MyprofileJS.jsp"%>
</body>
</html>