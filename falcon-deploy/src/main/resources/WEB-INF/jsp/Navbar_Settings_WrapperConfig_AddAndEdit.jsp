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
						<h3 class="block-title text-uppercase">New wrapper configuration</h3>
					</div>
					<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/wrapperConfiguration"> Wrapper Configuration</a>
								</li>
								<li class="breadcrumb-item active">New Wrapper Configuration</li>
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
									<div class="" id="userChooseDiv" style="display: none;">
								
								<small style="color: red;">Mapping Name is invalid</small>
							</div>
								</div>
							</div>
							
							</div>
							
							<div class="col-sm-12 text-center" id="continueBtn">
								<button class="btn btn-primary mb-20" onclick="checkThisEntry()" data-toggle="click-ripple">Continue</button>
							</div>
							<div id="hideAndShow" class="block-content pt-0" style="display: none;"> 
							
							<div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Select Database:</b></label>
								   <div class="col-md-8 col-lg-6">
									  <select id="selectedDb" class="js-select2 form-control" style="width: 100%;" data-placeholder="" required>
											<option></option>											
									  </select>
									  <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="db-small">Database is required</small>
								    </div>
								</div>
								
								<div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b> File:</b></label>
								   <div class="col-md-8 col-lg-6">
									  <select id="FileSearch" class="js-select2 form-control" style="width: 100%;" data-placeholder="" required>
											<option></option>											
									  </select>
									   <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="file-small">File is required</small>
								    </div>
								</div>
									
									<div class="col-md-12 text-center">
										<div class="form-group">
											<button class="btn btn-sm btn-primary" onclick="submit()" data-toggle="click-ripple">
													<i class="fa fa-plus"></i> ADD
											</button>										
										</div>
									</div>
					
								
								<div id="table-hide" style="display: none;"> 	
									<div id="repos11" class="mt-50"></div>
								
								<div class="col-lg-12">
									<div class="d-flex justify-content-center">
										<a href="${pageContext.request.contextPath}/wrapperConfiguration" class="btn btn-primary mb-20" data-toggle="click-ripple">Complete</a>
									</div>
								</div>
								</div>
							</div>
					</c:when>
					<c:when test="${MODE == 'Edit'}">
							<div class="block-header block-header-default">
								<h3 class="block-title text-uppercase">Edit wrapper configuration</h3>
							</div>
							<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/wrapperConfiguration"> Wrapper Configuration</a>
								</li>
								<li class="breadcrumb-item active">Edit Wrapper Configuration</li>
							</ul>
						</div>
							<div class="cc block-content">
								<div class="form-group row">
								<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Mapping Name:</b></label>
								<div class="col-md-8 col-lg-6">
									<input name="email" type="text" id="mappingSearch"
										value="${mapping}" class="form-control input-md"
										autocomplete="off" readonly>
								</div>
							</div>
							</div>
							<div id="hideAndShow" class="col-md-12 pt-0">
								<div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b>Select Database:</b></label>
								   <div class="col-md-8 col-lg-6">
									  <select id="selectedDb" class="js-select2 form-control" style="width: 100%;" data-placeholder="" required>
											<option></option>	
											<c:forEach items="${database}" var="db">
											<option value="${db.getId()}">${DBlistService.convertDbDTOToString(db)}</option>
											</c:forEach>										
									  </select>
									   <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="db-small">Database is required</small>
								    </div>
								</div>
								
								<div class="form-group row">
									<label class="col-md-3 control-label text-right"
									for="emailSearch"><b> File:</b></label>
								   <div class="col-md-8 col-lg-6">
									  <select id="FileSearch" class="js-select2 form-control" style="width: 100%;" data-placeholder="" required>
											<option></option>											
									  </select>
									   <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="file-small">File is required</small>
								    </div>
								</div>
								
						
									

									<div class="col-md-12 text-center">
										<button class="btn btn-sm btn-primary  mb-20" onclick="submit()" data-toggle="click-ripple">
													<i class="fa fa-plus"> </i> ADD
												</button>
									</div>
					<div id="table-hide">	
								<div class="" id="onjsp">
								
								<div class="table-responsive  mt-50">
										<table class="table table-striped table-bordered xs-width-500px sm-width-1000">
										<thead>
									<tr>
									<th>DATABASE</th>
									<th>STATUS</th>
									<th>FILE NAME</th>
									<th class="text-center">ACTION</th></tr>
									</thead>
			  				         <tbody id="tbody">			
						<c:forEach items="${wrapper}" var="dep" varStatus="loop">
						
						<tr id="div_${loop.index}">
								<td>${dep.dbName}</td>
					<c:if test="${dep.dbEnabled}">
						     <td><span class="badge badge-success">Active</span></td>
					</c:if>
					<c:if test="${!dep.dbEnabled}">
						     <td><span class="badge badge-danger">Inactive</span></td>
					</c:if>
			  					<td>${dep.fileName}</td>
			  					<td class='text-center'>
			  					<button type='button' id="${dep.fileName}----${dep.dbid}----${loop.index}" class='btn btn-sm btn-alt-danger' onclick='deletePrivilegeOnEdit(this)'><span class='fa fa-trash'></span>
			  					</button>
			  					</td>
			  					</tr>
				       </c:forEach>
									   </tbody>
			  				         </table>		
							</div>
								</div>
								
									<div id="repos11" class=""></div>
								
								<div class="col-lg-12">
									<div class="d-flex justify-content-center mb-20">
										<a href="${pageContext.request.contextPath}/wrapperConfiguration" class="btn btn-primary" data-toggle="click-ripple">Complete</a>
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
	<%@include file="/static/js/pages/Navbar_Settings_WrapperConfig_AddAndEditJS.jsp"%>

</body>
</html>