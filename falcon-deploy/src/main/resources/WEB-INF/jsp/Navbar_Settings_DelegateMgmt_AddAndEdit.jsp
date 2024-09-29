
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
	

		<div class="row">			
			<div class="height-300 col-lg-12 " id="fixedSet">
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header block-header block-header-default">
								
								<h4 class="modal-title block-title" id="myModalLabel">Result</h4>
							</div>
							<div class="modal-body">
								<p id="status" ></p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-alt-danger"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				
				<c:choose>
					<c:when test="${MODE== 'Add'}">
					<div class="block block-bordered">
						<div class="row">
					<div class="col-md-12">
			<div class="block-header block-header-default "><h5 class="block-title text-uppercase">Save Database Credential</h5>
									</div>
			</div></div>
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/delegateList"> Saved Database Credential</a>
								</li>
								<li class="breadcrumb-item active">Save Database Credential</li>
							</ul>
						</div>
							<div class="block-content">
							<div class="form-group row ">
								<label class="col-md-3 control-label text-right"
									for="mappingSearch"><b>Mapping Name:</b></label>
								<div class="col-md-8 col-lg-6">
									<input name="email" type="text" id="mappingSearch"
										placeholder=""
										class="form-control input-md" autocomplete="off" required>
									<section class="card onhover" id="repoCard1">
										<div class=" card-text" id="repos1"></div>
									</section>
									<div class="" id="userChooseDiv" style="display: none;">
									<small style="color: red;">Mapping name is invalid</small>
							</div>
								</div>
								
							
							</div>
							</div>
							
							<div class="col-md-12 mb-15 text-center" id="continueBtn">
								<button class="btn btn-primary" onclick="checkThisEntry()" data-toggle="click-ripple">Continue</button>
							</div>
							
							
							
							
							<div id="hideAndShow" class="block-content pt-0" style="display: none;">
                               
                               
                               <div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Select Database:</b></label>
								   <div class="col-md-8 col-lg-6">
									  <select id="db" class="js-select2 form-control" style="width: 100%;" data-placeholder="" required>
											<option></option>											
									  </select>
									   <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="db-small">Database is required</small>
								    </div>
								</div>	
					  <div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Database Username:</b><br><small>(Saved credential)</small></label>
					              <div class="col-md-8 col-lg-6">
									 <input class="form-control col-md-12" type="text" id="username" autocomplete="off" placeholder="">
									 <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="dbun-small">Database username is required</small>
								    </div>
						</div>
								
						<div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Database Password:</b></label>
								   <div class="col-md-8 col-lg-6">
									  <input class="form-control col-md-12" type="password" id="password" autocomplete="off" placeholder="">
									  <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="dbpass-small">Database password is required</small>
								    </div>
						</div>
									
							<div class="col-md-12 text-center mt-15 mb-15">
								<button class="btn btn-primary" id="addPassword" data-toggle="click-ripple"><i class="fa fa-plus"></i> Add</button>												
								
					       </div>
								<div id="table-hide" style="display: none;">
								<div class="row">
									<div id="repos11" class="col-md-12"></div>
								</div>
								<div class="col-lg-12">
									<div class="d-flex justify-content-center mb-20">
										<a href="${pageContext.request.contextPath}/delegateList" class="btn btn-primary " data-toggle="click-ripple">Complete</a>
									</div>
								</div>
								</div>
							</div>
							</div>
					</c:when>
					<c:when test="${MODE == 'Edit'}">
					<div class="block block-bordered">
							<div class="row">
								<div class="col-md-12">
									<div class="block-header block-header-default "><h5 class="block-title text-uppercase">Edit Database Credential</h5>
									</div>
								</div>
							</div>
							<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/delegateList"> Saved Database Credential</a>
								</li>
								<li class="breadcrumb-item active">Edit Database Credential</li>
							</ul>
						</div>
							
							    <div class="col-md-12 mt-30">
							    	<div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Mapping Name:</b></label>
								   <div class="col-md-8 col-lg-6">
									 <input name="email" type="text" id="mappingSearch"value="${delegate.targetName.targetName}" class="form-control input-md" autocomplete="off" readonly>
								    </div>
								</div>
							    <div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Select Database:</b></label>
								   <div class="col-md-8 col-lg-6">
									  <select id="db" class="js-select2 form-control" style="width: 100%;" data-placeholder="" disabled>
											<option value="${dbid}">${dblink}</option>											
									  </select>
								    </div>
								</div>
							<div id="hideAndShow">
								
						<div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Database Username:</b><br><small>(Saved credential)</small></label>
					              <div class="col-md-8 col-lg-6">
									 <input class="form-control col-md-12" type="text" id="username" autocomplete="off" placeholder="" value='${delegate.userName}' readonly>
								    <input class="form-control col-md-12" type="text" id="oldusername" style="display: none;"  value='${delegate.userName}' readonly>
								    </div>
						</div>
								
						<div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Database Password:</b></label>
								   <div class="col-md-8 col-lg-6">
									  <input class="form-control col-md-12" type="password" id="password" autocomplete="off" placeholder="">
									  <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="dbpass-small">Database password is required</small>
								    </div>
						</div>
								
								
									<div class="col-md-12 text-center mt-15">
										<button class="btn btn-primary"  id="validate" data-toggle="click-ripple">
													<i class="fa fa-plus"></i> Update
										</button>										
									</div>	
								<div id="table-hide">
									<div id="repos11" class="col-md-12"></div>
								
								<div class="col-lg-12">
									<br>
									<div class="d-flex justify-content-center">
										<a href="${pageContext.request.contextPath}/delegateList" id="finishTab" style="display :none" class="btn btn-primary mb-20" data-toggle="click-ripple">Complete</a>
									</div>

								</div>
								
								</div>
								
							</div>
							    </div>
							</div>
					</c:when>
				</c:choose>
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
	<%@include file="/static/js/pages/Navbar_Settings_DelegateConfig_AddAndEditJS.jsp"%>
</body>
</html>