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
                <div class="block-content">
	
			
			<div id="fixedSet">
				<c:choose>
					<c:when test="${MODE== 'Add'}">
					<div class="block block-bordered">
		<div class="row">
			<div class="col-md-12">
			<div class="block-header block-header-default "><h5 class="block-title text-uppercase">New File Type</h5>
			</div>
			</div>
			</div>
			<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/fileConfiguration"> File Type Configuration</a>
								</li>
								<li class="breadcrumb-item active">New File Type</li>
							</ul>
						</div>
		<div class="row content">
				<form class="form-horizontal width-100" action=<c:url value='saveFileType' />
					method="post" onSubmit="return checkform(this)">
					<fieldset>
						<div class="form-group ">
							<div class="block-content row pl-0 pr-0">
								<label class="col-md-3 col-lg-2 pr-0 xs-pl-0 text-right control-label " for="en"><b>File Type:</b></label>
							<div class="col-md-5 col-lg-6 mb-15 xs-pl-0 xs-pr-0">
								<input id="en" name="fileTypeName" type="text"
									placeholder="" class="form-control input-md nn1"
									autocomplete="off"  required>
									<small id="fltnError"
									style="color: red; display: none;">File type already exists</small>
							</div>
							<div class="col-md-4 xs-text-center xs-pl-0 xs-pr-0">
								<button id="submit" class="btn  btn-primary mr-sm-2 submit1" data-toggle="click-ripple">
									Submit</button>
								<a href="${pageContext.request.contextPath}/fileConfiguration" class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Back</a>
							</div>
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
					<div class="block block-bordered">
		<div class="row">
			<div class="col-md-12">
			<div class="block-header block-header-default "><h5 class="block-title text-uppercase">Edit File Type</h5>
			</div>
			</div>
			</div>
			<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/fileConfiguration"> File Type Configuration</a>
								</li>
								<li class="breadcrumb-item active">Edit File Type</li>
							</ul>
						</div>
		<div class="row content">
				<form class="form-horizontal width-100" action=<c:url value='editFileType?fileTypeId=${fileType.fileTypeId}' />
					method="post"  onSubmit="return checkform(this)">
					<fieldset>
						<div class="block-content pl-0 pr-0">
							<div class="form-group row">
							<label class="col-md-3 col-lg-2 pr-0 xs-pl-0 text-right control-label" for="en"><b>File type:</b></label>
							<div class="col-md-5 col-lg-6 mb-15 xs-pl-0 xs-pr-0">
								<input id="en" name="fileTypeName" type="text" placeholder=""
									value="${fileType.fileTypeName}" class="form-control input-md nn1"
									autocomplete="off" required>
									<small id="fltnError"
									style="color: red; display: none;">File type already exists</small>
							</div>
							<div class="col-md-4 xs-text-center xs-pl-0 xs-pr-0">
								<button id="submit" class="btn  btn-primary mr-sm-2 submit1" data-toggle="click-ripple">
									Submit</button>
								<a href="${pageContext.request.contextPath}/fileConfiguration" class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Back</a>
							</div>
						</div>

						
						</div>
					</fieldset>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
				</div>
				</div>
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
	<%@include file ="/static/js/pages/Navbar_Settings_FileTypeConfig_AddAndEditJS.jsp"%>
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
