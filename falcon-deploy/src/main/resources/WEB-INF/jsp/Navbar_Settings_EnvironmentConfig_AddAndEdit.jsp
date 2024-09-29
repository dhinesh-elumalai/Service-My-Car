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
	<div class="block block-bordered">
			<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
				<c:choose>
					<c:when test="${MODE== 'Add'}">
					<div class="block-header block-header-default width-100">
						<h5 class="block-title text-uppercase">New Environment</h5>
					</div>
					<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/envConfiguration"> Environment Configuration</a>
								</li>
								<li class="breadcrumb-item active">New Environment</li>
							</ul>
						</div>
					<div class="row block-content">
					
					<div class="container padding-10 col-lg-12 height-300" id="fixedSet">
						<form class="form-horizontal" action=<c:url value='saveEnv' />
							method="post" onSubmit="return checkform(this)">
							<fieldset>
						<div class="form-group row">
						
							<label class="col-md-3 col-lg-3 control-label text-right" for="en"><b>Environment
									Name:</b></label>	
							<div class="col-md-5 col-lg-6">
								<input id="en" name="environmentName" type="text"
									placeholder="" class="form-control input-md nn1"
									autocomplete="off"  required>
									<small id="fltnError"
									style="color: red; display: none;">Environment name already present</small>
							</div>
							<div class="col-md-4 col-lg-3 xs-mt-5 xs-text-right sm-mt-10 sm-text-center">
							<button id="submit" class="btn btn-primary mr-sm-2 submit1" data-toggle="click-ripple">
									Submit</button>
								<a href="${pageContext.request.contextPath}/envConfiguration" class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Back</a>
							</div>
						</div>
					</fieldset>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
				</div>
				</div>
				</c:when>
					<c:when test="${MODE == 'Edit'}">
				<form class="form-horizontal" action=<c:url value='editEnv?envId=${dbEnv.environmentId}' />
					method="post"  onSubmit="return checkform(this)">
					<fieldset>
					<div class="block-header block-header-default width-100">
						<h5 class="block-title text-uppercase">Edit Environment</h5>
					</div>
					<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/envConfiguration"> Environment Configuration</a>
								</li>
								<li class="breadcrumb-item active">Edit Environment</li>
							</ul>
						</div>
						

						<div class="form-group ">
							<div class="block-content row">
								<label class="col-md-3 col-lg-3 control-label text-right" for="en"><b>Environment
									Name:</b></label>
							<div class="col-md-5 col-lg-6">
								<input id="en" name="environmentName" type="text"
									value="${dbEnv.environmentName}" class="form-control input-md nn1"
									autocomplete="off" required>
									<small id="fltnError"
									style="color: red; display: none;">Environment name already present</small>
							</div>
							<div class="col-md-4 col-lg-3 xs-mt-5 xs-text-right sm-mt-10 sm-text-center">
								<button id="submit" class="btn  btn-primary mr-sm-2 submit1" data-toggle="click-ripple">
									Submit</button>
								<a href="${pageContext.request.contextPath}/envConfiguration" class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Back</a>
							</div>
							</div>
						</div>
					</fieldset>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
				</c:when>
				</c:choose>
			
		
	</div>
	<div id="dialog-confirm">
		<p id="textForDialog"></p>
	</div>
	</div>
	</main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file ="/static/js/pages/Navbar_Settings_EnvironmentConfig_AddAndEditJS.jsp"%>
	<script>
$(document).ready(function(){
    $('.submit1').attr('disabled',true);
    $('.nn1').keyup(function(){
        if($(this).val().length !=0)
            $('.submit1').attr('disabled', false);            
        else
            $('.submit1').attr('disabled',true);
    })
});
</script>
</body>
</html>
