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
			<div class="" id="fixedSet">			
				<c:choose>
					<c:when test="${MODE== 'Add'}">
						<div class="block-header block-header-default">
							<h3 class="block-title ">NEW DEPLOY PRIVILEGE<br>
							<small>User should have privileges on a repository in order to grant deploy privilege on database target that is mapped to the repository.</small>
							</h3>							
						</div>
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/deployPrivilegeManagement"> Deploy Privilege Management</a>
								</li>
								<li class="breadcrumb-item active">New Deploy Privilege</li>
							</ul>
						</div>
							
							<div class="block-content">
								<form id="choose-map">
									<div class="form-group row">
										<label class="col-md-3 control-label text-right"
											for="emailSearch"><b>Mapping Name:</b></label>
										<div class="col-lg-6 col-md-8">
										<input name="email" type="text" id="mappingSearch"
												placeholder=""
												class="form-control input-md" autocomplete="off" required>
										<section class="card onhover" style="display: none; z-index: 3;" id="repoCard1">
											<div class=" card-text" id="repos1"></div>
										</section>
										<div  id="userChooseDiv" style="display: none;">
											<small style="color: red;">Mapping name is invalid</small>
										</div>
										</div>
									</div>
								</form>
							</div>
							
							<div class="col-lg-12 mb-20" id="continueBtn">
								<div class="d-flex justify-content-center">
									<button class="btn btn-primary" onclick="checkThisEntry()" data-toggle="click-ripple">Continue</button>
								</div>
							</div>
							<div id="hideAndShow" style="display: none;" class="block-content pt-0">
								<div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Select Database:</b></label>
								   <div class="col-lg-6 col-md-8">
									  <select id="selectedDb" class="js-select2 form-control" style="width: 100%;" data-placeholder="" required>
											<option></option>											
									  </select>
									  <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="db-small">Database is required</small>
								    </div>
								</div>
		
								<div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Users:</b></label>
									
								   <div class="col-lg-6 col-md-8">
									  <select id="UserSearch" class="js-select2 form-control" style="width: 100%;" data-placeholder="" required>
											<option></option>											
									  </select>
									  <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="user-small">User is required</small>
								    </div> 
						
								</div>
	
								<div class="row mx-auto">							
								
									<div class="col-md-12">
									
										<div class="form-group">
											<div class="text-center">
												<button class="btn btn-sm btn-primary" onclick="submit()" data-toggle="click-ripple">
													<i class="fa fa-plus"> </i> Add
												</button>
											</div>
										</div>
									</div>
								</div>
								
								<div id="table-hide" style="display: none;">
									<div class="block">
										<div id="repos11" class="mt-50"></div>
									</div>
									
								
								<div class="col-lg-12">
									<div class="d-flex justify-content-center">
										<a href="${pageContext.request.contextPath}/deployPrivilegeManagement" class="btn btn-primary mb-20" data-toggle="click-ripple">Complete</a>
									</div>
								</div>
								</div>
							</div>
					</c:when>
					<c:when test="${MODE == 'Edit'}">
						<div class="block-header block-header-default">
						<h3 class="block-title ">EDIT DEPLOY PRIVILEGE<br>
							<small>User should have privileges on a repository in order to grant deploy privilege on database target that is mapped to the repository.</small>
						</h3>
						</div>
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/deployPrivilegeManagement"> Deploy Privilege Management</a>
								</li>
								<li class="breadcrumb-item active">Edit Deploy Privilege</li>
							</ul>
						</div>							
							<div class="col-md-12">
								<div class="form-group row mt-15">
								<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Mapping Name:</b></label>
								<div class="col-md-6">
									<input name="email" type="text" id="mappingSearch"
										value="${mapping}" class="form-control input-md" autocomplete="off" readonly>
								</div>
							</div>
							<div id="hideAndShow">

						<div class="form-group row">
						<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Select Database:</b></label>
								   <div class="col-md-6">
									  <select id="selectedDb" class="js-select2 form-control" style="width: 100%;" data-placeholder="" disabled>
											<option value='${Dbid}' selected>${DbLink}</option>											
									  </select>
								    </div>
								</div>
		
								<div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>User:</b></label>
								 <div class="col-lg-6 col-md-8">
									  <select id="UserSearch" class="js-select2 form-control" style="width: 100%;" data-placeholder="" required>
											<option></option>											
									  </select>
									  <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="user-small">User is required</small>
								    </div> 
									
								</div>
					
				
									<div class="col-md-12">
										<div class="form-group">
										
											<div class="text-center">
												<button class="btn btn-sm btn-primary" onclick="submit()" data-toggle="click-ripple">
													<i class="fa fa-plus"></i> Add
												</button>
											</div>
										</div>
									</div>
							
								
								<div id="table-hide">
								<div class="" id="onAddRechg">
									<div class="col-md-12 mt-50">
									<div class="table-responsive">
						<table class="table table-striped table-bordered xs-width-500px sm-width-1000">
										<thead>
									<tr>
									<th class="text-left">DATABASE</th>
									<th class="text-left">STATUS</th>
									<th class="text-left">USER</th>
									<th class="text-center">ACTION</th>
									</tr>
									</thead>
			  				         <tbody id="tbody">
			  				      
										
						<c:forEach items="${depoyPrivilege}" var="dep" varStatus="loop">
						<c:if test="${dep.getUser().getEnabled()}">
						<tr id="div${dep.getUser().getId()}">
						
						<c:if test="${empty dep.getDatabases().aliasName}">
								<c:if test="${empty dep.getDatabases().sid}">
								<td>${dep.getDatabases().hostName}:${dep.getDatabases().getPort()}/${dep.getDatabases().service}</td>
								</c:if>
								<c:if test="${empty dep.getDatabases().service}">
								<td>${dep.getDatabases().hostName}:${dep.getDatabases().getPort()}:${dep.getDatabases().sid}</td>
								</c:if>
						</c:if>
				
						<c:if test="${not empty dep.getDatabases().aliasName}">
						     <td> ${dep.getDatabases().aliasName}</td>
						</c:if>
						<td><c:if test="${dep.getDatabases().enableStatus}"><span class="badge badge-success">Active</span></c:if>
						<c:if test="${!dep.getDatabases().enableStatus}"><span class="badge badge-danger">Inactive</span></c:if>
						</td>
			  					<td><span class="text-capitalize">${dep.getUser().firstName} ${dep.getUser().lastName}</span>  - ${dep.getUser().email}</td>
			  					<td class='text-center'>
			  						<button type='button' id="${dep.getUser().getId()}" class='btn btn-sm btn-alt-danger' onclick='deletePrivilegeOnEdit(this)'><span class='fa fa-trash'></span>
			  					</button>
			  					</td>
			  					</tr>
			  					</c:if>
				       </c:forEach>
									   </tbody>
			  				         </table>	
									</div>
									</div>
								</div>
								
									
									<div id="repos11" class="col-md-12 "></div>

								
								<div class="col-lg-12">
									<div class="d-flex justify-content-center">
										<a href="${pageContext.request.contextPath}/deployPrivilegeManagement" class="btn btn-primary mb-20" data-toggle="click-ripple">Complete</a>
									</div>

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
	<%@include file="/static/js/pages/Navbar_Settings_DeployPrivilege_AddAndEditJS.jsp"%>
		
</body>
</html>