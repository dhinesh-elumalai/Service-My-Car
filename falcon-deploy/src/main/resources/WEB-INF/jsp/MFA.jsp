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
                                    Falcon Deploy provides MFA (Multi-Factor Authentication) to enhance security. A user is authenticated in 2 steps. The first step authenticates using a username and password. Then the user is authenticated via OTP (One Time Password). Questions on MFA?   
<a href="https://docs.f-d.io/docs/mfa" target="_blank" style="color: #68aff7;">Checkout our documentation.</a>
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
                                    <h1 class="h4 font-w700 mt-30 mb-10">Multi-factor authentication</h1>
                                </div>
                                <div class="col-12">
                                  <form class="js-validation-signin px-30" id="login-form" role="form"  action='${pageContext.request.contextPath}/verify2facode'  method="post">
                                <fieldset>
                                    <div class="form-group row">
                                        <label for="email">Enter your authentication code below to sign-in</label>
                                        <input type="number" class="form-control" name="otp" required > 
                                    </div>
                                    <div class="form-group row">
                                        <button type="submit" class="color-blue btn btn-sm btn-hero btn-alt-primary" data-toggle="click-ripple">
                                            <i class="si si-login mr-10"></i> Verify
                                        </button>
                                    </div>
                                    
                                    <div class="form-group row">
                                     <div class="">
                                    	<sec:authorize access="hasAnyAuthority('SUPER_ADMIN')">
                                            <a class="link-effect text-muted mr-10 mb-5 d-inline-block" href="${pageContext.request.contextPath}/resend_secret_key">
                                                <i class="fa fa-mail-forward mr-5"></i> Resend secret key
                                            </a>
                                      </sec:authorize>
                                         <sec:authorize access="hasAnyAuthority('TEAM_ADMIN','ADMIN','USER')"> 
                                              Unable to login using OTP for existing secret key? 
                                            <a class="link-effect d-inline-block" href="${pageContext.request.contextPath}/requestAdminToResetSecretKey" >
                                                Email administrators</a> to generate new key.
                                            </sec:authorize>
                                        </div>
                                    </div>                                    
                                </fieldset>
							 <c:if test="${status ne null}">
							    ${status}
							</c:if>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        	</form> 
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

<script src="${pageContext.request.contextPath}/static/js/plugins/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/jstz.js"></script>

<!-- theme scripts -->
<script src="${pageContext.request.contextPath}/static/js/codebase.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/select2/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/dateFormatter.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/form-validation/js/formValidation.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/form-validation/js/bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/jquery-ui/jquery.ui.touch-punch.min.js"></script>

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
            	otp:{
                   	 validators: {
                            notEmpty: {
                                message: 'OTP code is required'
                            },
                            stringLength: {
                                min: 6,
                                max: 6,
                                message: 'OTP code should be of 6 digit number'
                            },
                            regexp: {
                            	 regexp: /^[0-9]+$/,
                            	 message: 'OTP code format is not valid'
                            }
                        }
                   },
            	
             }
           
        });
    });
  
</script> 
</body>
</html>
