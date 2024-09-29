
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/sessionadd.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<body>

<div id="preloader">
        <i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
       <p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
</div>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
	<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
	<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

                <!-- Page Content -->
 <main id="main-container">
 <div class="content">
	<div class="block block-bordered">
		<div class="col-md-12 mb-20">
                <div class="block-header block-header-default row">		
				<h3 class="block-title text-uppercase">Add Session Parameters</h3>
				</div>
				<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/showGlobalParams"> Session Parameter Management</a>
								</li>
								<li class="breadcrumb-item active">Add Session Parameters</li>
							</ul>
						</div>
				<div class="tab mt-20">
  <button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">Global</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')" id="defaultMap">Mapping</button>
  <button class="tablinks" onclick="openCity(event, 'Tokyo')" id="defaultDB">Database</button>
  <input type="hidden" id ="mode" value="${MODE}" /> 
</div>
	

<div id="London" class="tabcontent p-0">
				<div class="block-header block-header-default">		
					<h3 class="block-title">Add Global Session Parameters</h3>
				</div>
  
  	<form class="form-horizontal mt-30 mb-30" action=<c:url value='saveSessionParams' /> method="post" id="globalParam">
							<fieldset class="col-md-12">

								<div class="form-group row">
									<label class="col-md-3 control-label text-right" for="fn"><b>Global Parameter:</b></label>
									<div class="col-md-6">
										<textarea id="globalScript" name="script" placeholder="" class="form-control input-md"
											autocomplete="off" required></textarea>
									</div>
									<input type="hidden" id ="g" name="mode" value="${MODE}" /> 
								</div>
								
								<div class="form-group row">
									<label class="col-md-3 control-label text-right" for="fn"><b>Type:</b></label>
									<div class="col-md-6">
										<select  name="sessionType" class="form-control" id="descFormType">
														<option value="ORACLE" selected="selected">ORACLE</option>
														<option value="MYSQL">MySQL</option>
										</select>
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-md-5 control-label" ></label>
									<div class="col-md-4  xs-text-center">
										<button class="btn  btn-primary mr-sm-2" data-toggle="click-ripple" type="submit">
											Submit</button>
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" /> <a href="${pageContext.request.contextPath}/showGlobalParams"
											class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Back</a>
									</div>
								</div>
								</fieldset>
 </form>
</div>

<div id="Paris" class="tabcontent p-0">
				<div class="block-header block-header-default">		
					<h3 class="block-title">Add mapping level session parameter</h3>
				</div>
  
  <form class="form-horizontal mt-30 mb-30" action=<c:url value='saveSessionParams' /> method="post" id="mappingParam">
							<fieldset class="col-md-12">
					<div class="form-group row">
									<label class="col-md-3 control-label text-right" for="fn"><b>Mapping:</b></label>
									<div class="col-md-6">
										<input id="mapping" name="mapping" 
											placeholder="" class="form-control input-md"
											autocomplete="off" required>
											<section class="card onhover block block-bordered">
										<div class=" card-text" id="repos1" style="min-height:100px"></div>
									</section>
									</div>
									<input type="hidden" id ="m" name="mode" value="${MODE}" /> 
									
								</div>
								<div class="form-group row">
									<label class="col-md-3 control-label text-right" for="fn"><b>Session Parameter for Mapping:</b></label>
									<div class="col-md-6">
										<textarea id="globalScript" name="script"  placeholder="" class="form-control input-md" autocomplete="off"></textarea>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-5 control-label"></label>
									<div class="col-md-4 xs-text-center">
										<button type="submit" class="btn  btn-primary mr-sm-2" data-toggle="click-ripple">
											Submit</button>
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" /> <a href="${pageContext.request.contextPath}/showMapParams"
											class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Back</a>
									</div>
								</div>
								</fieldset>
	</form>
</div>

<div id="Tokyo" class="tabcontent p-0">
				<div class="block-header block-header-default">		
					<h3 class="block-title">Add Database level session parameter</h3>
				</div>
   <form class="form-horizontal mt-30 mb-30" action=<c:url value='saveSessionParams' /> method="post" id="databaseParam">
							<fieldset class="col-md-12">
					<div class="form-group row">
									<label class="col-md-3 control-label text-right" for="fn"><b>Database:</b></label>
									<div class="col-md-6">
										<input id="db" name="link" 
											placeholder="" class="form-control input-md"
											autocomplete="off" required>
											<input type="hidden" id="dbId" name="db">
												<section class="card onhover block block-bordered">
										<div class=" card-text" id="repos2"  data-toggle="slimscroll" data-height="200px" ></div>
									</section>
									</div>
									<input type="hidden" id ="d" name="mode" value="${MODE}" /> 
									<section class="card col-md-12"
										style="height: auto; overflow-y: scroll; display: none; z-index: 3; position: absolute;"
										id="repoCard2">
										<div class=" card-text" id="repos2"></div>
									</section>
								</div>
								<div class="form-group row">
									<label class="col-md-3 control-label text-right" for="fn"><b>Session Parameter for Database:</b></label>
									<div class="col-md-6">
										<textarea id="globalScript" name="script" 
											placeholder="" class="form-control input-md"
											autocomplete="off" required></textarea>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-5 control-label"></label>
									<div class="col-md-4  xs-text-center">
										<button type="submit" class="btn  btn-primary mr-sm-2" data-toggle="click-ripple">
											Submit</button>
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" /> <a href="${pageContext.request.contextPath}/showDBParams"
											class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Back</a>
									</div>
								</div>
								</fieldset>
	</form>
</div>

						</div>
	</div> 
 </div>
 </main>
		</div>

	<div id="dialog-confirm">
		<p id="textForDialog"></p>
	</div>
	

	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<script src="static/js/plugins/multiselect.min.js"></script>
	<%@include file="/static/js/pages/Navbar_Settings_SessionAddJS.jsp"%>

<script>
		$('#globalParam').formValidation(
						{
							framework : 'bootstrap4',
							fields : {
								
								script : {
									validators : {
										notEmpty : {
											message : 'Global Parameter is required'
										},
										
										
									}
								},
							},
							icon : {
								valid : 'fa fa-check',
								invalid : 'fa fa-times-circle',
								validating : 'fa fa-sync-alt'
							},

						});
		
		$('#mappingParam').formValidation(
				{
					framework : 'bootstrap4',

					fields : {
						
						mapping : {
							validators : {
								notEmpty : {
									message : 'Mapping is required'
								},
								
								
							}
						},
						script : {
							validators : {
								notEmpty : {
									message : 'Session Parameter is required'
								},
								
								
							}
						},
					},
					icon : {
						valid : 'fa fa-check',
						invalid : 'fa fa-times-circle',
						validating : 'fa fa-sync-alt'
					},

				});
		
		$('#databaseParam').formValidation(
				{
					framework : 'bootstrap4',
					fields : {
						link : {
							validators : {
								notEmpty : {
									message : 'Database is required'
								},
								
								
							}
						},
						script : {
							validators : {
								notEmpty : {
									message : 'Session parameter is required'
								},
								
								
							}
						},
						
					},
					icon : {
						valid : 'fa fa-check',
						invalid : 'fa fa-times-circle',
						validating : 'fa fa-sync-alt'
					},

				});
	</script>
</body>
</html>