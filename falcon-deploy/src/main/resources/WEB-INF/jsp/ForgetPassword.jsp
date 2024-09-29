<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<div id="page-container" class="main-content-boxed">

            <!-- Main Container -->
            <main id="main-container">
                <!-- Page Content -->
                <div class="bg-body-dark bg-pattern" style="background-image: url('${pageContext.request.contextPath}/static/img/various/bg-pattern-inverse-key.png');">
                    <div class="row mx-0 justify-content-center">
                        <div class="hero-static col-lg-6 col-xl-4">
                            <div class="content content-full overflow-hidden">
                                <!-- Header -->
                                <div class="marg-top marg-bottom py-30 mt-50 text-center">
                                    <a class="link-effect font-w700" >
                                        <img src="${pageContext.request.contextPath}/static/img/logo.png"  class="mb-10 login-logo">
                                    </a>
                                    <h1 class="h4 font-w700 mt-30 mb-10">Forgot Password?</h1>
                                    <h2 class="h5 font-w400 text-muted mb-0">We will send the instructions for password recovery to the email address on file for your account.</h2>
                                </div>
                                <!-- END Header -->

                                <!-- Sign Up Form bg-gd-primary -->
                                <form class=" js-validation-signup" id="forgot-password" action="${pageContext.request.contextPath}/send_password" method="get" onsubmit="return checkEmail();" accept-charset="UTF-8">
                                    <div class="block block-themed block-rounded block-shadow">
                                        <div class="bg-gd-primary block-header ">
                                            <h3 class="block-title">Please enter your email</h3>
                                            
                                        </div>
                                        <div class="mrg-bottom-6 block-content">
                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <label for="signup-username">Email</label>
                                                    <input type="email" class="form-control" id="emailInput" name="PEmailId" required>
                                                    <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="email-small"></small>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="block-content">
                                            <div class="form-group text-center">
                                                <div class="col-12">
                                                    <button type="submit" value="Send My Password"  class="color-blue btn btn-alt-success" data-toggle="click-ripple">
                                                      Send Instructions </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!-- END Sign Up Form -->
                                <input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END Page Content -->
            </main>
            <!-- END Main Container -->
        </div>
        <script>
		function goBack() {
			window.history.back();
		}
	</script>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<script>
	   $('#emailInput').keyup(function () {
	    	 $('#email-small').hide();
	    });
	function checkEmail()
	{
		var email=$("#emailInput").val();
		var c=validate(email)
		if(c=='success')
			return true;
		else
			{
			if(email.length>0)
				{
			$("#email-small").empty();
			$("#email-small").append(c);
			$("#email-small").show();
				}
			return false;
			}	
	}
	function validate(email)
	{
		var red=false;
		$.ajax({ 
	         url: 'userValid',
	         data: {email:email},
	         type: 'get',
	         async:false
	     }).done(function(responseData) {
			red=responseData;	 
	     }).fail(function() {
	         console.log('Failed');
	     });
		return red;
	}
	$(document).ready(function () {
 $('#forgot-password').formValidation({

        framework: 'bootstrap4',     
        icon: {
           valid: 'fa fa-check',
           invalid: 'fa fa-times-circle',
           validating: 'fa fa-sync-alt'
               },
            fields: {
            	PEmailId:{
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
             }
           
        });
    });
  
</script>
</body>
</html>