<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
<div id="page-container" class="main-content-boxed">
<main id="main-container">
<!-- Page Content -->
<div class="bg-image" >
<div class="row mx-0 bg-black-op">
<div class="hero-static col-md-6 col-sm-12 col-xl-8 d-none d-md-flex align-items-md-end" style="background-image: url('${pageContext.request.contextPath}/static/img/photos/falcon1@2x.jpg');background-position: 21% 39%;   background-size: cover;">
<div class="px-30 pb-100 invisible" data-toggle="appear">
<p class="font-size-h3 font-w600 text-white mb-5">About Super Admin</p>
<p class="font-size-h5 text-white"> <i class="fa fa-angles-right"></i>Super Administrator is the first user to 'Sign Up' and has access to all the features in the application. This is the user who typically establishes the application for the enterprise. Think of it as an 'Admin' of all 'Administrators' and 'Users' in the application. </p>                                
</div>
</div>
<div class="hero-static col-md-6 col-sm-12 col-xl-4 d-flex align-items-center bg-white">
<div class="content content-full">
<!-- Header -->
<div class="px-30 py-">
<a class="link-effect font-w700" ><img src="${pageContext.request.contextPath}/static/img/logo.png" class="login-logo"> </a>
<h1 class="h3 font-w700 mt-30">Super Admin Sign Up Form</h1>
<!-- <h2 class="h5 font-w400 text-muted mb-0">Please add your details</h2> -->
</div>

<!-- END Header -->
<!-- Sign Up Form -->
<!-- jQuery Validation (.js-validation-signup class is initialized in js/pages/op_auth_signup.js) -->
<!-- For more examples you can check out https://github.com/jzaefferer/jquery-validation -->

<div class="col-md-12">
<form class="js-validation-signup form-horizontal px-30" id="signup-form" action='${pageContext.request.contextPath}/SA-reg'  method="post">
<fieldset>
<div class="form-group row">

<label for="fn">First Name</label>
<input type="text" class="form-control" id="fn" name="firstName1">

</div>
<div class="form-group row">
<label for="ln">Last Name</label>
<input type="text" class="form-control"  id="ln" name="lastName1">
</div>
<div class="form-group row">
<label for="email">Email</label>
<input type="email" class="form-control" id="email" name="email1" > 
</div>
<div class="form-group row">
<div class="col-md-12 col-lg-6 col-sm-12 pl-0 xs-pr-0 pr-md-0">
<label for="signup-password">Password</label>
<span class="fa fa-eye signup-eye color-primary" onmousedown="upc()" onmouseup="downc()"></span>
<input type="password" class="form-control" id="passwrd1" name="password1" >

</div>
<div class="col-md-12 col-lg-6 col-sm-12 pr-0 xs-pl-0 pl-md-0 pl-15">
<label for="signup-password-confirm">Confirm Password</label>
<span class="fa fa-eye signup-eye color-primary" onmousedown="upcc()" onmouseup="downcc()"></span>
<input type="password" class="form-control" id="passwrd2" name="password2" >
</div>
</div>

<div class="form-group row">
<label for="company">Company</label>
<input type="text" class="form-control" id="Company" name="companyName1">
</div>
<div class="form-group row">
<label for="add1">Address 1</label>
<input type="text" class="form-control" id="add1" name="address11">
</div>
<div class="form-group row">
<label for="add2">Address 2</label>
<input type="text" class="form-control" id="add2" name="address21">
</div>
<div class="form-group row">
<div class="col-md-12 col-lg-6 col-sm-12 pl-0 pr-0 pr-md-0">
<label for="zip123">Zip Code</label>
<input type="text" class="form-control" id="zip" name="zip1">
</div>
<div class="col-md-12 col-lg-6 col-sm-12 pr-0 xs-pl-0 pl-md-0 pl-15">
<label for="city123">City</label>
<input type="text" class="form-control" id="city" name="city1">
</div>
</div>

<div class="form-group row">
<div class="col-md-12 col-lg-6 col-sm-12 pl-0 pr-0 pr-md-0">
<label for="state123">State</label>
<input type="text" class="form-control" id="state" name="state1">
</div>
<div class="col-md-12 col-lg-6 col-sm-12 pr-0 xs-pl-0 pl-md-0 pl-15">
<label for="country123">Country</label>
<input type="text" class="form-control" id="country" name="country1">
</div>
</div>
<div class="form-group row pt-10">
<button type="submit" class="color-blue btn btn-sm btn-hero btn-alt-success" data-toggle="click-ripple"> <i class="fa fa-plus"></i> Submit </button>
</div>
</fieldset>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</div>

	</div>
	</div>
	</div>	
	</div>
	</main>
	</div>
		
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/SA-SignupJS.jsp"%>
	<script>
	$(document).ready(function () {
 $('#signup-form').formValidation({

        framework: 'bootstrap4',     
        icon: {
           valid: 'fa fa-check',
           invalid: 'fa fa-times-circle',
           validating: 'fa fa-sync-alt'
               },
            fields: {
            	firstName1: {
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
                },
                lastName1:{
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
                email1:{
               	 validators: {
                        notEmpty: {
                            message: 'Email is required'
                        },
                        
                        regexp: {
                            regexp: /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,4})$/,
                            message: 'Email format not accepted.'
                        }
                    }
               },
               password1: {
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
               password2: {
                   validators: { 
                	   notEmpty: {
                           message: 'Password is required'
                       },
                       identical: {
                           field: 'password1',
                           message: 'Passwords do not match'
                      } 
                   }                
               },
               companyName1:{
            	   validators: {
                       notEmpty: {
                           message: 'Company name is required'
                       },
            	   }
               },
               address11: {
            	   validators: {
                       notEmpty: {
                           message: 'Address is required'
                       },
                       stringLength: {
                           min: 8,
                           max: 40,
                           message: 'Address must be more than 8 and less than 40 characters long'
                       },
            	   }
            	},
            	zip1:{
            		validators: {
                        notEmpty: {
                            message: 'Zip is required'
                        },
            		}
            	},
            	city1:{
            		validators: {
                        notEmpty: {
                            message: 'City is required'
                        },
            		}
            	},
            	state1:{
            		validators: {
                        notEmpty: {
                            message: 'State is required'
                        },
            		}
            	},
            	country1:{
            		validators: {
                        notEmpty: {
                            message: 'Country is required'
                        },
            		}
            	}
            }
        });
    });
  
</script>
<script>
function upc() {
    document.getElementById("passwrd1").type = 'text';
}
function downc() {
    document.getElementById("passwrd1").type = 'password';
}
function upcc() {
    document.getElementById("passwrd2").type = 'text';
}
function downcc() {
    document.getElementById("passwrd2").type = 'password';
}
</script>
</body>
</html>
