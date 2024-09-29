<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
<div id="preloader">
		<!-- <img src="static/img/loader.png"> -->
		<i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
		<p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
	</div>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">		
<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

		<main id="main-container" style="min-height: 596px;"> <!-- Page Content -->
				<div class="content">
	        <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header block-header block-header-default">
								<h4 class="modal-title block-title" id="myModalLabel">Result</h4>
							</div>
							<div class="modal-body">
								<p id="status"></p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-alt-success"
									data-dismiss="modal" data-toggle="click-ripple">Close</button>
							</div>
						</div>
					</div>
	        </div>
				
			<div class="block">
				<div class="block block-bordered">
					<div class="block-header block-header-default p-10">
						<div class="col-lg-7">
							<h3 class="block-title text-uppercase">New Database</h3>
						</div>
			         </div>
			         <div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/databases">Database</a>
								</li>
								<li class="breadcrumb-item active"> Create Database</li>
							</ul>
						</div>
			         
								<div class="mt-5">
									<div class="col-12 text-right">
                                            <label class="css-control css-control-sm  css-control-primary css-switch">
                                                <input type="checkbox" class="css-control-input" id="changeForm">
                                                <span class="css-control-indicator"></span><span id="toggleForm">Use Descriptor</span>
                                            </label>
                                     </div>
                                        <br>
					<form class="form-horizontal col-md-12" action=<c:url value='TNSmanualSubmit' /> method="post" id="MainForm">
								<div class="form-group row">
												<label class="col-md-3 text-right" for="an"><b>Alias name:</b></label>
												<div class="col-md-8 col-lg-6">
													<input id="FormAliasName" name="aliasName" type="text" placeholder="" class="form-control input-md" required>
													<small style="display: none; color:#f00;" id="FormAliasNameErr" > Alias name is required</small>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 text-right" for="hn"><b>Host name:</b></label>
												<div class="col-md-8 col-lg-6">
													<input id="FormHostName" name="hostName" type="text" placeholder="" class="form-control input-md" required>
												 <small style="display: none; color:#f00;" id="FormHostNameErr"> Host name is required</small>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 text-right" for="p"><b>Port:</b></label>
												<div class="col-md-8 col-lg-6">
													<input id="FormPort" name="port" type="text" placeholder="" class="form-control input-md" required>
												<small style="display: none;color:#f00;" id="FormPortErr"> Port is required</small>
												</div>
											</div>
											<div class="form-group row" id="typechoose">
												<label class="col-md-3 text-right" for="typechoose"><b>DB type:</b></label>
												<div class="col-md-8 col-lg-6">
													<select  name="type" class="form-control" onchange="changeView(this)" id="entryFormType">
														<option value="ORACLE" selected="selected">ORACLE</option>
														<option value="MYSQL">MySQL</option>
													</select>
												</div>
											</div>
											<div class="form-group row" id="userchoose">
												<label class="col-md-3 text-right" for="userchoose"><b>Environment:</b></label>
												<div class="col-md-8 col-lg-6">
													<select id="selectBoxUser" name="env" class="form-control">
														<option value="none" selected="selected">Select
															Environment</option>
														<c:forEach var="env" items="${env}">
															<option value="${env.environmentId}">${env.environmentName}</option>
														</c:forEach>
													</select>

												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 text-right" for="sid"><b id="servOrSidName">Service or SID:</b><b id="schema" style="display: none;">Schema:</b></label>
												<div class="col-md-5 col-lg-4">
													<input id="FormSidorServiceIP" name="sidORservice" type="text"placeholder=""class="form-control input-md" required>
												<small style="display: none;color:#f00;" id="FormSidorServiceIPErr"> Service or Sid is required</small>
												</div>

												<div class="col-md-3" id="sidOrServCheck">
													<div class="form-inline xs-mt-5">
													<div class="custom-control custom-radio custom-control-inline mb-5">
													<input id="FormServiceChecked" name="sidORserv" type="radio" value="0" checked
														class="custom-control-input" > <label
														class="custom-control-label" for="FormServiceChecked">Service</label>
												</div>
												<div class="custom-control custom-radio mb-5">
													<input id="FormSidChecked" name="sidORserv" type="radio" value="1"
														class="custom-control-input"> <label
														class="custom-control-label" for="FormSidChecked">Sid</label>
												</div>
												</div>
												</div>
											</div>
											
											<div class="form-group row">
												<div class="col-md-12 text-center">
													<button type="button" onClick="validateFieldsAvailability()" class=" btn btn-primary">Validate</button>
													<button type="submit" id="SubmitFormButtonForm" disabled  class=" btn btn-primary">Submit</button>
												</div>
											</div>
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />
					</form>
					
					
			<form  class="form-horizontal col-md-12" action=<c:url value='TNSDescriptormanualSubmit' /> method="post" style="display: none;" id="DescForm">
										<div class="form-group row">
												<label class="col-md-3 text-right" for="an"><b>Alias name:</b></label>
												<div class="col-md-8 col-lg-6">
													<input id="an" name="aliasName" type="text"placeholder="" class="form-control input-md" required>
													<small style="display: none;color:#f00;" id="anErr" > Alias name should not be empty </small>
												</div>
											</div>
											<div class="form-group row" id="typechoose">
												<label class="col-md-3 text-right" for="typechoose"><b>DB type:</b></label>
												<div class="col-md-8 col-lg-6">
													<select  name="type" class="form-control" id="descFormType">
														<option value="ORACLE" selected="selected">ORACLE</option>
														<option value="MYSQL">MySQL</option>
													</select>

												</div>
											</div>
											<div class="form-group row" id="userchoose">
												<label class="col-md-3 text-right" for="userchoose"><b>Environment:</b></label>
												<div class="col-md-8 col-lg-6">
													<select id="selectBoxUser" name="env" class="form-control">
														<option value="none" selected="selected">Select
															Environment</option>
														<c:forEach var="env" items="${env}">
															<option value="${env.environmentId}">${env.environmentName}</option>
														</c:forEach>
													</select>

												</div>
											</div>
											<div class="form-group row" id="userchoose">
												<label class="col-md-3 text-right" for="userchoose"><b>Connection Descriptor:</b></label>
												<div class="col-md-8 col-lg-6">
													<textarea rows="6" cols="6" id="DecFormDesc" name="descriptor" placeholder="" style="width: 100%; padding:8px 14px;" required></textarea>
                                                    <small style="display: none;color:#f00;" id="DecFormDescErr" > Descriptor should not be empty </small>
												</div>
											</div>
										
											<div class="form-group row">
												<div class="col-md-12 text-center">
													<button type="button" onClick="validateFieldsAvailability()" class=" btn btn-primary" data-toggle="click-ripple">Validate</button>
													<button type="submit" id="SubmitFormButton" disabled  class=" btn btn-primary" data-toggle="click-ripple">Submit</button>
												</div>
											</div>
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										</form>		
						</div>
						</div>
						</div>
						</div>
		 </main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
		<%@include file="/static/js/pages/Databases_NewJS.jsp"%>
		
	
		</body>
</html>