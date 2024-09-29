<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<meta name="viewport" content="width=device-width, initial-scale=1">

<body>
<div id="page-container" class="main-content-boxed">
            <!-- Main Container -->
            <main id="main-container">
                <!-- Page Content -->
                <div class="bg-body-dark bg-pattern" style="background-image: url('${pageContext.request.contextPath}/static/img/various/bg-pattern-inverse.png');">
                    <div class="row mx-0 justify-content-center">
                        <div class="hero-static col-lg-6 col-xl-4">
                            <div class="content content-full overflow-hidden">
                                <!-- Header -->
                                <div class="marg-top marg-bottom py-30 text-center">
                                    <a class="link-effect font-w700" >
                                    <img src="${pageContext.request.contextPath}/static/img/logo.png" class="login-logo">          
                                    </a>
                                    <h1 class="h4 font-w700 mt-30 mb-10">Request Access</h1>
                                    <h2 class="h5 font-w400 text-muted mb-0">Submit form to notify administrators</h2>
                                </div>
                                <!-- END Header -->

                                <!-- Sign Up Form -->
                                <form class=" js-validation-signup" id="contact" action="${pageContext.request.contextPath}/send_request" method="post" accept-charset="UTF-8">
                                    <div class="block block-themed block-rounded block-shadow">
                                        <div class=" block-header bg-gd-primary">
                                            <h3 class="block-title">Please add your details</h3>
                                           
                                        </div>
                                        <div class="mrg-bottom-6 block-content">
                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <label for="signup-username">First Name</label>
                                                    <input type="text" class="form-control" name="firstName" tabindex="1" required autofocus>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <label for="signup-username">Last Name</label>
                                                    <input type="text" class="form-control" name="lastName"	tabindex="1" required autofocus>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <label for="signup-email">Email</label>
                                                    <input type="email" class="form-control" name="email" tabindex="2" required>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <label for="signup-password">Comments</label>                                                    
                                                    <textarea class="form-control" name="comment" tabindex="5" ></textarea>
                                                </div>
                                            </div>
                                           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        </div>
                                        <div class="block-content bg-body-light">
                                            <div class="form-group text-center">
                                                <div class="col-12">
                                                    <button type="submit" class="color-blue btn btn-alt-success" data-toggle="click-ripple">
                                                        <i class="fa fa-plus mr-10"></i> Submit Request
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!-- END Sign Up Form -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END Page Content -->
            </main>
            <!-- END Main Container -->
        </div>
        <%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
        <script>
	$(document).ready(function () {
 $('#contact').formValidation({

        framework: 'bootstrap4',     
        icon: {
           valid: 'fa fa-check',
           invalid: 'fa fa-times-circle',
           validating: 'fa fa-sync-alt'
               },
            fields: {
            	firstName: {
            		 validators: {
                         notEmpty: {
                             message: 'First name is required'
                         },
               stringLength: {
                   min: 2,
                   max: 30,
                   message: 'First name must be more than 2 and less than 30 characters long'
               },
               regexp: {
                   regexp: /^[a-zA-Z0-9_]+$/,
                   message: 'First name can only consist of alphabetical, number and underscore'
               }
                     }    
                },lastName: {
                   validators: {
                       notEmpty: {
                           message: 'Last name is required'
                       },
                       stringLength: {
                           min: 2,
                           max: 30,
                           message: 'Last name must be more than 2 and less than 30 characters long'
                       },
                       regexp: {
                           regexp: /^[a-zA-Z0-9_]+$/,
                           message: 'Last name can only consist of alphabetical, number and underscore'
                       }
                   }               
               },
               email:{
                 	 validators: {
                          notEmpty: {
                              message: 'Email is required'
                          },
                          
                          regexp: {
                              regexp: /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,4})$/,
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
