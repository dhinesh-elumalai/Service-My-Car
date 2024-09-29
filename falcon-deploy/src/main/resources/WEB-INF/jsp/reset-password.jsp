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
                                <div class="marg-top marg-bottom mt-50 text-center">
                                    <a class="link-effect font-w700" >
                                        <img src="${pageContext.request.contextPath}/static/img/logo.png" class="login-logo">
                                    </a>
                                    <h1 class="h4 font-w700 mt-30 mb-10"></h1>                                 
                                </div>
                                <!-- END Header -->

                                
               <c:if test="${isError}">
                  <form class="js-validation-signup" >
                      <div class="block block-themed block-rounded block-shadow">
                                        <div class="bg-gd-primary  block-header ">
                                            <h3 class="block-title"></h3>
                                            <div class="block-options">
                                               
                                            </div>
                                        </div>
                                          <div class="mrg-bottom-6 block-content">
                                            <div class="form-group row">
                                                <div class="col-12">
                                                   <p>${error}</p>
                                                </div>
                                            </div>
                                        </div>
                                       </div> 
                                </form>
                       </c:if>               
                                
                     <c:if test="${!isError}">
                                <!-- Sign Up Form bg-gd-primary -->
                                <form class=" js-validation-signup mt-50" id="forgot-password" action="${pageContext.request.contextPath}/${formUrl}" method="post" accept-charset="UTF-8" >
                                    <div class="block block-themed block-rounded block-shadow">
                                        <div class="bg-gd-primary  block-header ">
                                            <h3 class="block-title">${Headbutton} Password</h3>
                                            

                                        </div>
                                        <div class="mrg-bottom-6 block-content">
                                            <div class="form-group">
                                                <label for="password">Enter New Password</label>
                                                <input type="password" class="form-control" id="password" name="password" >
                                            </div>
                                        </div>
                                        <div class="mrg-bottom-6 block-content">
                                            <div class="form-group">
                                                <label for="Rpassword">Re-enter New Password</label>
                                                <input type="password" class="form-control" id="Rpassword" name="Rpassword" >
                                            </div>
                                        </div>
                                        <div class="block-content bg-body-light">
                                            <div class="form-group text-center">
                                                <div class="col-12">
                                                    <button type="submit"   class="btn btn-primary" data-toggle="click-ripple"> ${Headbutton} </button>
                                                       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                       <input type="hidden" name="token" value="${token}">
                                                       <input type="hidden" name="userid" value="${userid}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                </c:if>
                                <!-- END Sign Up Form -->
                               
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
	<c:if test="${!isError}">
	<script>
	$(document).ready(function () {
 $('#forgot-password').formValidation({

        framework: 'bootstrap4',     
        icon: {
           valid: 'fa fa-check',
           invalid: 'fa fa-times-circle',
           validating: 'fa fa-sync-alt'
               },
            fields: {
            	password: {
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
                 Rpassword: {
                     validators: { 
                    	 notEmpty: {
                             message: 'Password is required'
                         },
                         stringLength: {
                             min: 6,
                             max: 12,
                             message: 'Password must be more than 6 and less than 12 characters long'
                         },
                         identical: {
                             field: 'password',
                             message: 'Password do not match'
                        } 
                     }                
                 },
             }
           
        });
    });
  
</script>
</c:if>
</body>
</html>