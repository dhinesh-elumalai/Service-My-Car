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
		<div class="content">
			<div class="block block-bordered">
				<div class="block-header block-header-default">
					<h3 class="block-title font-w600">
						DEPLOYMENT - ${repoName}<br><small>Select the scripts for this deployment</small>
					</h3>
					<div class="block-options xs-text-right">
					<form action="${pageContext.request.contextPath}/PrivDeployement_step1" method="post">
					<input type="hidden" name="reponame" value='${repoName}'>
					<input type="hidden" name="reqid" id="reqid" value='${requestId}'>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<button class="btn btn-primary" type="submit" data-toggle="click-ripple">Previous</button>
				    <button  class="btn btn-primary" type="button" id="enablenext" onclick="submitNextForm()" disabled data-toggle="click-ripple">Next</button>
					<a href="${pageContext.request.contextPath}/deleteRequest?reqid=${requestId}"><button class="btn btn-danger" type="button" data-toggle="click-ripple">Cancel</button></a>
					</form>			
					</div>
				</div>
					<form action="${pageContext.request.contextPath}/submitFile_step2" method="post" id="nextForm">
					<input type="hidden" name="reponame" value='${repoName}'>
					<input type="hidden" name="reqid" value='${requestId}'>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

							
				<div class="block-content">
					<div class="form-group row">
						<div class="col-md-4">
							<div class="">
							<label for="material-select2">Select Script Input Type</label>
								<select class="form-control mySelect section-changer" id="scriptType"
									name="type">
									<option value="select-box" selected>Select Box</option>
									<option value="text-box">Text Box</option>
								</select> 
							</div>
						</div>
					</div>
					
				</div>
				<div class="">
					<div class="block block-borderd block-header">
						<div class="box-changer width-100" id="select-box">
						<div class="block block-bordered">
						<div class="col-md-12">
							<div class="pt-20 pb-20">
								<div class="row">
									<h3 class="block-title col-md-8">Select from script files below</h3>
									<div class="col-md-4 text-right">
								<button type="button" class="btn btn-primary " onclick="validateSelectedFiles()" data-toggle="click-ripple">
										Validate selected scripts</button>
								</div>
								</div>
								
								
							</div>
						</div>
					</div>
							<div class="form-horizontal width-100">
								<div class="row">
									<div class="col-sm-5">
									<input type="text" class="col-md-12" placeholder="Select script files" id="DbUnselected" /> 
										<select  id="multiselect2" class="form-control table-scroll"
											size="8" multiple="multiple">
											<c:forEach items="${files}" var='files'>
											<option value="${files}">${files}</option>
											</c:forEach>
										</select>
									</div>

									<div class="col-sm-2 mt-30 mb-30">
										<button type="button" id="multiselect2_rightAll"
											class="btn btn-block btn-alt-primary">
											<i class="fa fa-forward"></i>
										</button>
										<button type="button" id="multiselect2_rightSelected"
											class="btn btn-block btn-alt-primary">
											<i class="fa fa-chevron-right"></i>
										</button>
										<button type="button" id="multiselect2_leftSelected"
											class="btn btn-block btn-alt-primary">
											<i class="fa fa-chevron-left"></i>
										</button>
										<button type="button" id="multiselect2_leftAll"
											class="btn btn-block btn-alt-primary">
											<i class="fa fa-backward"></i>
										</button>
									</div>

									<div class="col-sm-5">
									<input type="text" class="col-md-12" placeholder="Selected script files" id="Dbselected" />
									<select name="selectedFiles" id="multiselect2_to" class="form-control table-scroll" size="8" multiple="multiple">
									
									</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row box-changer col-lg-12" id="text-box">
						<div class="block block-bordered">
						<div class="col-md-12">
							<div class="row">
								<div class="block-header width-100">
									<h3 class="block-title">Insert script files</h3>
									<button type="button" class="btn btn-primary"
										onclick="validateSelectedFiles()">
										Validate</button>
								</div>
							</div>
						</div>
					</div>
							<div class="">
								<textarea rows="10" cols="100" class="area-change col-12" name="textArea" placeholder="Type File name with Comma (,) or (new line) as separator." id="textAreaBox"></textarea>
							</div>
						</div>
					</div>

					<div class="col-md-12" id="dependentFileDiv" style="display: none;">
							<div class=" block block-bordered">
							<div class="block-header block-header-default">
                              <h3 class="block-title">Scripts validation status</h3>
                           </div>
                           <div class="block-header" id="dependentFileUL">
                       
                           </div>
                           </div>
						</div>
				</div>
				</form>
				</div>
				</div>
			<div id="dialog-confirm">
				<p id="textForDialog"></p>
			</div>
		</main>

	</div>


	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<script src="static/js/plugins/multiselect.min.js"></script>
	<%@include file="/static/js/pages/Navbar_NewDeployement_step2JS.jsp"%>

	
</body>
</html>
