<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
<div id="page-container" class="main-content-boxed">
            <!-- Main Container -->
            <main id="main-container">
                <!-- Page Content -->
                <div class="bg-image" style="background-image: url('static/img/photos/falcon1@2x.jpg');">
                    <div class="row mx-0 bg-black-op">
                        <div class="hero-static col-md-6 col-lg-8 d-none d-md-flex align-items-md-end">
                            <div class="p-30 " data-toggle="appear">
                                <p class="font-size-h6 font-w400 text-white">
                                    User accounts are created by Administrators. If you are an
					existing user, please sign in with credentials obtained from your
					Falcon Deploy administrator. If you are not an existing user and would
					like to request access to the application, please click 'Request
					Access' button below and submit the form. The administrators will
					be notified of your request.
                                </p>

                            </div>
                        </div>
                        <div class="hero-static col-md-6 col-lg-4 d-flex align-items-center bg-white">
                            <div class="content content-full">
                                <!-- Header -->
                                <div class="px-30 py-10">
                                    <a class="link-effect font-w700" href="javascript:void(0);">
                                    <img src="static/img/logo.png" class="login-logo">
                                    </a>
                                    <h1 class="h4 font-w700 mt-30 mb-10">Welcome to Falcon Deploy!</h1>
                                    <c:if test="${show=='login'}">
                                    <h2 class="h5 font-w400 text-muted mb-0">Please sign in</h2>
                                    </c:if>
                                     <c:if test="${show=='maintenance'}">
                                   <h2 class="h5 font-w400 text-muted mb-0">Server is under maintenance. Please try again after sometime.</h2>
                                   </c:if>
                                </div>
                                <div class="col-12">
                                 <c:if test="${show=='login'}">
                                  <form class="js-validation-signin px-30" id="login-form" role="form"  action='${pageContext.request.contextPath}/'  method="post">
                                <fieldset>
                                    <div class="form-group row">
                                        <label for="email">Email</label>
                                        <input type="email" class="form-control" name="EMAIL" type="email" required> 
                                    </div>
                                    <div class="form-group row">
                                        <label for="signup-password">Password</label>
                                        <input type="password" class="form-control" name="PASSWORD"  required>
                                    </div>

                                    <div class="form-group row">
                                        <button type="submit" class="color-blue btn btn-sm btn-hero btn-alt-primary" data-toggle="click-ripple">
                                            <i class="si si-login mr-10"></i> Sign In
                                        </button>
                                    </div>
                                      <p class="small row">By logging in, you agree to our&nbsp;<a href="https://f-d.io/terms" target="_blank"> Terms and Conditions</a> </p>
                                    
                                    <div class="form-group row">
                                    
                                    	<div class="">
                                            <a class="link-effect text-muted mr-10 mb-5 d-inline-block" href="${pageContext.request.contextPath}/request_For_access">
                                                <i class="fa fa-plus mr-5"></i> Request Access
                                            </a>

                                            <a class="link-effect text-muted mr-10 mb-5 d-inline-block" href="${pageContext.request.contextPath}/reset" >
                                                <i class="fa fa-warning mr-5"></i> Forgot Password
                                            </a>
                                        </div>
                                    </div>
                                </fieldset>
                            <c:if test="${param.error ne null}">
							    <div class=" error-msg alert-danger text-center ">
							         ${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}
							    </div>
							</c:if>
							<c:if test="${passwordReset}">
							 <div class=" error-msg alert-success text-center ">
							       Password reset successfully!
							    </div>
							</c:if>
							<c:if test="${signupSuccessFull}">
							 <div class=" error-msg alert-success text-center ">
							       Signup successful!
							    </div>
							</c:if>
							<c:if test="${resetPassCheckMail}">
							 <div class=" error-msg alert-success text-center ">
							       E-mail sent successfully!
							    </div>
							</c:if>
							<c:if test="${passwordset}">
							 <div class=" error-msg alert-success text-center ">
							      Password set successfully!
							    </div>
							</c:if>
							<c:if test="${requestAccessNotify}">
							 <div class=" error-msg alert-success text-center ">
							      Request has submitted successfully!
							    </div>
							</c:if>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        	</form> 
                        	</c:if>
                        	</div>
                            <!-- END Sign In Form -->
                        </div>
                    </div>
                </div>
                </div>
            <!-- END Page Content -->
            </main>
        <!-- END Main Container -->
        </div>
    <!-- END Page Container -->
    <%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
    <script>
	$(document).ready(function () {
 $('#login-form').formValidation({

        framework: 'bootstrap4',     
        icon: {
           valid: 'fa fa-check',
           invalid: 'fa fa-times-circle',
           validating: 'fa fa-sync-alt'
               },
            fields: {
            	EMAIL:{
                   	 validators: {
                            notEmpty: {
                                message: 'Email is required'
                            },
                            
                            regexp: {
                                regexp: /^[_a-z,A-Z,0-9-]+(\.[_a-z,A-Z,0-9-]+)*@[a-z,A-Z,0-9-]+(\.[a-z,A-Z,0-9-]+)*(\.[a-z,A-Z]{2,4})$/,
                                message: 'Email format is not valid'
                            }
                        }
                   },
            	PASSWORD: {
                   validators: {
                       notEmpty: {
                           message: 'Password is required'
                       }
                   }               
               },
             }
           
        });
    });
  
</script>
</body>
</html>
