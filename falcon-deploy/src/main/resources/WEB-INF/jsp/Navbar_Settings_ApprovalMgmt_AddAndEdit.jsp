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
			<div id="fixedSet">
				<c:choose>
					<c:when test="${MODE== 'Add'}">
					<div class="block-header block-header-default">
							<h3 class="block-title text-uppercase">Assign Approvers</h3>
						</div>
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/approvalManagement"> Approval Management</a>
								</li>
								<li class="breadcrumb-item active">Assign Approvers</li>
							</ul>
						</div>
							<div class="block-content">
							<form id="add-mapping">
								<div class="form-group row">
								<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Mapping Name:</b></label>
								<div class="col-lg-6 col-md-8">
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
							</form>
							</div>
							
							<div class="col-lg-12 mb-20" id="continueBtn">
								<div class="d-flex justify-content-center">
									<button class="btn btn-primary" onclick="checkThisEntry()" data-toggle="click-ripple">Continue</button>
								</div>
							</div>
							<div id="hideAndShow" class="col-md-12" style="display: none;"> 
							
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
									for="emailSearch"><b>Select User:</b></label>
								   <div class="col-lg-6 col-md-8">
									  <select id="UserSearch" class="js-select2 form-control" style="width: 100%;" data-placeholder="" required>
											<option></option>											
									  </select>
									  <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="user-small">User is required</small>
								    </div>
								</div>
		
								<div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Approver Level:</b></label>
								   <div class="col-lg-6 col-md-8">
									  <select id="levelid" class="js-select2 form-control" style="width: 100%;" data-placeholder="" required>
											<option></option>
										<option value="1">1</option>
                               			<option value="2">2</option>
  										<option value="3">3</option>
  										<option value="4">4</option>
  										<option value="5">5</option>
  										<option value="6">6</option>
  										<option value="7">7</option>
  										<option value="8">8</option>
  										<option value="9">9</option>
  										<option value="10">10</option>
  										<option value="11">11</option>	
  										<option value="12">12</option>	
  										<option value="13">13</option>	
  										<option value="14">14</option>	
  										<option value="15">15</option>	
  										<option value="16">16</option>	
  										<option value="17">17</option>	
  										<option value="18">18</option>	
  										<option value="19">19</option>	
  										<option value="20">20</option>	
									  </select>
									  <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="level-small">Level is required</small>
								    </div>
								    
								</div>
								
									<div class="col-md-12 text-center">
										<div class="form-group">
											<div class="align-middle">
												<button class="btn btn-sm btn-primary" onclick="submit()" data-toggle="click-ripple">
													<i class="fa fa-plus"></i> Add
												</button>
											</div>
										</div>
									</div>
						
						
							<div id="table-hide" style="display: none;">							
								<div class="row">
						
									<div id="repos11" class="col-md-12 mt-50"></div>
								
								</div>
								<div class="col-lg-12">
									
									<div class="d-flex justify-content-center">
										<a href="${pageContext.request.contextPath}/approvalManagement" class="btn btn-primary mb-20" data-toggle="click-ripple">Complete</a>
									</div>
								</div>
								</div>
								
							</div>
					</c:when>
					<c:when test="${MODE == 'Edit'}">
							<div class="block-header block-header-default">
								<h3 class="block-title text-uppercase">Edit Approvers</h3>
							</div>
							<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/approvalManagement"> Approval Management</a>
								</li>
								<li class="breadcrumb-item active">Edit Approvers</li>
							</ul>
						</div>
							<div class="block-content">
								<div class="form-group row">
								<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Mapping Name:</b></label>
								<div class="col-md-6">
									<input name="email" type="text" id="mappingSearch"
										value="${mapping}" class="form-control input-md"
										autocomplete="off" readonly>
								</div>
							</div>
								
							</div>
							<div id="hideAndShow" class="col-md-12">
							
							<div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Select Database:</b></label>
								   <div class="col-md-6">
								   		
									  <select id="selectedDb" class="js-select2 form-control" style="width: 100%;" data-placeholder="" disabled>
											<option selected value="${Dbid}">${DbLink}</option>											
									  </select>
								    </div>
								</div>
									<div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Select User:</b></label>
								   <div class="col-md-6">
									  <select id="UserSearch" class="js-select2 form-control" style="width: 100%;" data-placeholder="" required>
											<option></option>											
									  </select>
									  <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="user-small">User is required</small>
								    </div>
								</div>
						
							<div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Approver Level:</b></label>
								   <div class="col-md-6">
									  <select id="levelid" class="js-select2 form-control" style="width: 100%;" data-placeholder="" required>
											<option></option>
										<option value="1">1</option>
                               			<option value="2">2</option>
  										<option value="3">3</option>
  										<option value="4">4</option>
  										<option value="5">5</option>
  										<option value="6">6</option>
  										<option value="7">7</option>
  										<option value="8">8</option>
  										<option value="9">9</option>
  										<option value="10">10</option>
  										<option value="11">11</option>	
  										<option value="12">12</option>	
  										<option value="13">13</option>	
  										<option value="14">14</option>	
  										<option value="15">15</option>	
  										<option value="16">16</option>	
  										<option value="17">17</option>	
  										<option value="18">18</option>	
  										<option value="19">19</option>	
  										<option value="20">20</option>	
									  </select>
									   <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="level-small">Level is required</small>
								    </div>
								   
								</div>
									
									<div class="col-md-12 text-center">
										<div class="form-group">
											<div class="align-middle">
												<button class="btn btn-sm btn-primary" onclick="submit()" data-toggle="click-ripple">
													<i class="fa fa-plus"></i> Add
												</button>
											</div>
										</div>
									</div>
						<div id="table-hide">
								<div class="row">
									
									<div class="col-md-12 table-responsive mt-50">
										<table class="table table-striped table-bordered ">
										<thead>
									<tr>
									<th class="">DATABASE</th>
									<th class="">STATUS</th>
									<th class="">USER</th>
									<th class="text-center">LEVEL</th>
									<th class="text-center">ACTION</th></tr>
									</thead>
			  				         <tbody id="tbody">
			  				      
										
						<c:forEach items="${approval}" var="dep" varStatus="loop">
						<c:if test="${dep.getUsers().getEnabled()}">
						<tr id="div${dep.getUsers().getId()}">
						
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
						<c:if test="${dep.getDatabases().enableStatus}">
						     <td><span class="badge badge-success">Active</span></td>
						</c:if>
						<c:if test="${!dep.getDatabases().enableStatus}">
						     <td><span class="badge badge-danger">Inactive</span></td>
						</c:if>
			  					<td>${dep.getUsers().firstName} ${dep.getUsers().lastName} - ${dep.getUsers().email}</td>
			  					<td class="text-center">${dep.level}</td>
			  					<td class='text-center'>
			  					<button type='button' id="${dep.getUsers().getId()}" class='btn btn-sm btn-alt-danger' onclick='deletePrivilegeOnEdit(this)'><span class='fa fa-trash'></span>
			  					</button>
			  					</td>
			  					</tr>
			  					</c:if>
				       </c:forEach>
									   </tbody>
			  				         </table>		
							</div>
								</div>
								<div class="row">		
									<div id="repos11" class="col-md-12 "></div>
								</div>
								<div class="col-lg-12">
									<div class="d-flex justify-content-center">
										<a href="${pageContext.request.contextPath}/approvalManagement" class="btn btn-primary mb-20" data-toggle="click-ripple">Complete</a>
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
	<%@include file="/static/js/pages/Navbar_Settings_ApprovalMgmt_AddAndEditJS.jsp"%>
		
</body>
</html>