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
	<div class="block">
		<div class="block block-bordered">
			<div  id="fixedSet">
				
				<c:choose>
					<c:when test="${MODE== 'Add'}">
					<div class="block-header block-header-default">
						<h3 class="block-title text-uppercase">Delegate Database Credential</h3>
					</div>
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/delegateUserList"> Delegated Database Credential</a>
								</li>
								<li class="breadcrumb-item active">Delegate Database Credential</li>
							</ul>
						</div>
					
					<div class="block-content">
							<div class="form-group row">
								<label class="col-md-3 control-label text-right"
									for="mappingSearch"><b>Mapping Name:</b></label>
								<div class="col-md-8 col-lg-6">
									<input name="email" type="text" id="mappingSearch" placeholder="" class="form-control input-md" autocomplete="off" required>
									<section class="card onhover" id="repoCard1">
										<div class=" card-text" id="repos1"></div>
									</section>
									<div  id="userChooseDiv" style="display: none;">
								<small style="color: red;">Please Choose valid Mapping before proceed</small>
							</div>
								</div>
							</div>

							
					</div>
					<div class="col-md-12" id="continueBtn">
						<div class="d-flex justify-content-center">
									<button class="btn btn-primary mb-20" onclick="checkThisEntry()" data-toggle="click-ripple">Continue</button>
								</div>
					</div>
							
							
							<div id="hideAndShow" class="col-md-12"  style="display: none;"> 
							<div class="form-group row"  >
								<label class="col-md-3 control-label text-right" for="selectBox"><b> Database:</b></label>
								<div class="col-md-8 col-lg-6">
									 <select id="selectBox" class="js-select2 form-control" style="width: 100%;" data-placeholder="" required>
											<option></option>											
									  </select>
									 <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="db-small">Database is required</small>
								</div>
							</div>
							<div class="form-group row"  >
								<label class="col-md-3 control-label text-right" for="selectBoxUser"><b>Database user Name:</b><br><small>(Saved Credential)</small></label>
								<div class="col-md-8 col-lg-6">
								 <select id="selectBoxUser" class="js-select2 form-control" style="width: 100%;" data-placeholder="" required>
											<option></option>											
								</select>
								 <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="dbun-small">Database username is required</small>
								</div>
							</div>
							<div class="form-group row" >
								<label class="col-md-3 control-label text-right" for="userSearch"><b> User (Grantee):</b></label>
									<div class="col-md-8 col-lg-6">
									<select id="userSearch" class="js-select2 form-control" style="width: 100%;" data-placeholder="" required>
											<option></option>											
								</select>
								 <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="user-small">User is required</small>	
								</div>
							</div>
							<div class="col-md-12">
								<div class="d-flex justify-content-center pb-30">
									 <button class="btn btn-primary"  onclick="addDatabasePassword()" data-toggle="click-ripple"><i class="fa fa-plus"></i> Add</button>
								</div>
						  </div>
						<div id="table-hide" style="display: none;">
						<div class=" mt-50">
									<div id="repos11" class=""></div>
						</div>
						<div class="col-lg-12"  id="finish" >
									<div class="d-flex justify-content-center">
										<a href="${pageContext.request.contextPath}/delegateUserList" class="btn btn-primary mb-15" data-toggle="click-ripple">Complete</a>
									</div>
						</div>
						</div>
							</div>	
					</c:when>
				</c:choose>
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
	<script src="static/js/plugins/multiselect.min.js"></script>
	<%@include file="/static/js/pages/Navbar_Settings_DelegateUser_AddAndEditJS.jsp"%>
</body>

</html>