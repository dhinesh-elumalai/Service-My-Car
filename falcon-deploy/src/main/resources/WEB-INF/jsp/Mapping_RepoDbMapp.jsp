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

 <main id="main-container">
                <!-- Page Content -->
                <div class="content">
		<div class="block">
		<div class="block block-bordered">

			<div class="" id="fixedSet">
				
				<c:choose>
					<c:when test="${MODE== 'Add'}">
					<div class="block-header block-header-default">
							<h3 class="block-title">MAPPING CONFIGURATION
								<br>
								<span class="small">(For each application, add databases to the configuration. The combination of repository and databases constitute a mapping.)</span>
							</h3>
						</div>
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/mappings">Mappings</a>
								</li>
								<li class="breadcrumb-item active"> Create Mapping</li>
							</ul>
						</div>
						
						
						<form class="form-horizontal mt-20" action=<c:url value='TargetCreation' /> method="post" id="add-mapping" onsubmit="return validateForm(); ">
							<div class="col-md-12">
								<div class="form-group row xs-pl-15 xs-pr-15">
									<label class="col-md-3 control-label text-right" for="targetName"><b>Mapping Name:</b></label>
									<div class="col-md-6">
									<input name="targetName" type="text" id="targetName"
										placeholder="" class="form-control input-md" autocomplete="off"  onkeyup="hide()">
									<small id="tnError" style="color: red; display: none;">
									Mapping name already exists</small>
									<small id="mapping_name_error" style="display:none; color:red;">Mapping name is required</small>
									</div>
								</div>
								
								<div class="form-group row xs-pl-15 xs-pr-15">
									<label class="col-md-3 control-label text-right" for="targetName"><b>Mapping Type:</b></label>
									<div class="col-md-6">
												<select  name="type" class="form-control" onchange="changeMapType(this)" id="changemaptype" >
														<option value="ORACLE" selected="selected">ORACLE</option>
														<option value="MYSQL">MySQL</option>
												</select>									
									</div>
								</div>
								
							<div class="form-group row xs-pl-15 xs-pr-15">
								<label class="col-md-3 control-label text-right" for="matchRepo"><b>Repository
										Name:</b></label>
								<div class="col-md-6">
									<input name="ReposSelected" type="text" id="matchRepo"
										placeholder="" class="form-control input-md" autocomplete="off" onkeyup="hide1()">
								<small id="repo_name_error" style="display:none; color:red;">Repository name is required</small>
									<section class="card onhover no-team-border" id="repoCard" style="display:none">
										<div class=" card-text" id="repos" data-toggle="slimscroll"></div>
									</section>
								</div>
							</div>
							</div>	
							<div class="col-md-12">
								<div class="row">
								<div class="col-lg-5">
									<h6 class="mt-20" style="color:#575757"><b>Available Database:</b></h6>
									
									<div style="position:relative">
									<input type="text" class="col-md-12 pl-30 form-control "
										placeholder="Search available database" id="DbUnselected" /> <select
										id="DbUnselectedDropDownList" class="multiselect form-control"
										size="8" multiple="multiple"
										data-right="#DbselectedDropDownList"
										data-right-all="#right_All_1"
										data-right-selected="#right_Selected_1"
										data-left-all="#left_All_1"
										data-left-selected="#left_Selected_1" name="unSelected">
									 	<c:forEach items="${dbforOption}" var='logsf'>
											<c:if test="${empty logsf.aliasName}">
												<c:if test="${empty logsf.sid}">
													<option value="${logsf.getId()}" ondblclick="hide2()">
														${logsf.hostName}:${logsf.getPort()}/${logsf.service}</option>
												</c:if>
												<c:if test="${empty logsf.service}">
													<option value="${logsf.getId()}" ondblclick="hide2()">
														${logsf.hostName}:${logsf.getPort()}:${logsf.sid}</option>
												</c:if>

											</c:if>
											<c:if test="${not empty logsf.aliasName}" >
												<option value="${logsf.getId()}" ondblclick="hide2()">${logsf.aliasName}</option>
											</c:if>
										</c:forEach> 
									</select>
									<span class="input-group-addon fa fa-search search1 " style="top:8px"></span>
									</div>
								</div>
								<div class="col-lg-2 mt-50">
									<div class="mt-30"></div>
									<button type="button" id="right_All_1" class="btn btn-block btn-alt-primary" onclick="hide2()">
										<i class="fa fa-forward"></i>
									</button>
									<button type="button" id="right_Selected_1"
										class="btn btn-block btn-alt-primary" onclick="hide2()">
										<i class="fa fa-chevron-right"></i>
									</button>
									<button type="button" id="left_Selected_1"
										class="btn btn-block btn-alt-primary" onclick="hide2()">
										<i class="fa fa-chevron-left"></i>
									</button>
									<button type="button" id="left_All_1" class="btn btn-block btn-alt-primary" onclick="hide2()">
										<i class="fa fa-backward"></i>
									</button>
								</div>
								<div class="col-lg-5">
								<h6 class="mt-20" style="color:#575757"><b>Selected Database:</b></h6>
									<div style="position:relative">
										<input type="text" class="col-md-12 pl-30 form-control "
										placeholder="Search selected database" id="Dbselected" /> 
										<select id="DbselectedDropDownList" name="DatabasesSelected" id="multiselect_to_1" class="form-control" size="8"
										multiple="multiple"></select>
										<span class="input-group-addon fa fa-search search1 " style="top:8px"></span>
										<small id="select_name_error" style="display:none; color:red;">Select at least 1 database</small>
									</div>
								</div>
							</div>
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="col-lg-12">
								<br>
								<div class="text-center mb-20">
									<button type="submit" class="btn btn-primary mr-sm-2" data-toggle="click-ripple" >Submit</button>
									<a href="${pageContext.request.contextPath}/mappings" class="btn btn-primary " data-toggle="click-ripple">Back</a>
								</div>
							</div>
						</form>

					</c:when>
					<c:when test="${MODE == 'Edit'}">
						<div class="block-header block-header-default">
							<h3 class="block-title">EDIT MAPPING</h3>
						</div>
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="${pageContext.request.contextPath}/mappings">Mappings</a>
								</li>
								<li class="breadcrumb-item active"> Edit Mapping</li>
							</ul>
						</div>
						
<form class="form-horizontal col-md-12 mt-20" action=<c:url value='RepoDatabaseManualUpdate' /> method="post" onsubmit="return validateFormEdit() ">
							<div class="form-group row">
								<label class="col-md-3 control-label text-right" for="fn"><b>Mapping
										Name:</b></label>
								<div class="col-md-8 col-lg-6">
									<input name="targetName" type="text" value="${target.getTargetName()}" class="form-control input-md" autocomplete="off" readonly >
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-md-3 control-label text-right" for="fn"><b>Mapping
										Type:</b></label>
								<div class="col-md-8 col-lg-6">
									<input  type="text" value="${target.getMapType()}" class="form-control input-md" autocomplete="off" readonly >
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-md-3 control-label text-right" for="fn"><b>Repo
										Name:</b></label>
								<div class="col-md-8 col-lg-6">
									<input type="text" name="repoName"
										placeholder="Type and select Repo.." value="${repoName}"
										class="form-control input-md" autocomplete="off" readonly>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-3 control-label text-right" for="createdBy"><b>Created
										By:</b></label>
								<div class="col-md-8 col-lg-6">
									<input type="text" value='${target.getCreatedBy().firstName} ${target.getCreatedBy().lastName}'
										class="form-control input-md" readonly>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-3 control-label text-right"
									for="createdTimestamp"><b>Created Timestamp:</b></label>
								<div class="col-md-8 col-lg-6">
									<jsp:useBean id="dateValue125" class="java.util.Date" />
									<jsp:setProperty name="dateValue125" property="time"
										value="${target.getCreatedTimestamp().getTime()}" />
									<input type="text"
										value='<fmt:formatDate value="${dateValue125}"  pattern="${timestamp}"/>'
										class="form-control input-md" readonly>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-3 control-label text-right" for="updatedBy"><b>Updated
										By:</b></label>
								<div class="col-md-8 col-lg-6">
									<input type="text" value='${target.getUpdatedBy().firstName } ${target.getUpdatedBy().lastName }'
										class="form-control input-md" readonly>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-md-3 control-label text-right"
									for="updatedTimestamp"><b>Updated Timestamp:</b></label>
								<div class="col-md-8 col-lg-6">
									<input id="updatedAt123" type="hidden"
										value='${target.getUpdatedTimestamp()}'>
									<jsp:useBean id="dateValue126" class="java.util.Date" />
									<jsp:setProperty name="dateValue126" property="time"
										value="${target.getUpdatedTimestamp().getTime()}" />
									<input id="updatedAt" type="text"
										value='<fmt:formatDate value="${dateValue126}"  pattern="${timestamp}"/>'
										class="form-control input-md" readonly>
									<script type="text/javascript">
										var d = document
												.getElementById('updatedAt123').value;
										if (d == null || d == "") {
											document
													.getElementById('updatedAt').value = "";
										}
									</script>
								</div>
							</div>
							<div class="col-md-12 mt-50">
								<div class="row">
								<div class="col-lg-5">
									<div style="position:relative">
										<input type="text" class="col-md-12 pl-30 form-control" placeholder="Search select database" id="DbUnselected" />
									
<select name="unSelected" id="DbUnselectedDropDownList" class="multiselect form-control" size="8" multiple="multiple" data-right="#DbselectedDropDownList"
data-right-all="#right_All_1" data-right-selected="#right_Selected_1" data-left-all="#left_All_1" data-left-selected="#left_Selected_1" >

										<c:forEach items="${dbforOptionSelect}" var='logsf'>
											<c:if test="${empty logsf.aliasName}">
												<c:if test="${empty logsf.sid}">
													<option value="${logsf.getId()}" onclick="hide3()">
														${logsf.hostName}:${logsf.getPort()}/${logsf.service}</option>
												</c:if>
												<c:if test="${empty logsf.service}">
													<option value="${logsf.getId()}" onclick="hide3()">
														${logsf.hostName}:${logsf.getPort()}:${logsf.sid}</option>
												</c:if>
											</c:if>
											<c:if test="${not empty logsf.aliasName}">
												<option value="${logsf.getId()}" onclick="hide3()">${logsf.aliasName}</option>
											</c:if>
										</c:forEach>
									</select>
									<span class="input-group-addon fa fa-search search1" style="top:8px;"></span>
									</div>
								</div>
								<div class="col-lg-2">
									<br>
									<button type="button" id="right_All_1" class="btn btn-block btn-alt-primary" onclick="hide3()">
										<i class="fa fa-forward"></i>
									</button>
									<button type="button" id="right_Selected_1"
										class="btn btn-block btn-alt-primary" onclick="hide3()">
										<i class="fa fa-chevron-right"></i>
									</button>
									<button type="button" id="left_Selected_1"
										class="btn btn-block btn-alt-primary" onclick="hide3()">
										<i class="fa fa-chevron-left"></i>
									</button>
									<button type="button" id="left_All_1" class="btn btn-block btn-alt-primary" onclick="hide3()">
										<i class="fa fa-backward"></i>
									</button>
								</div>
								<div class="col-lg-5 xs-mt-15">
									<div style="position:relative">
										<input type="text" class="col-md-12 pl-30 form-control"
										placeholder="Search selected database" id="Dbselected" /> <select
										id="DbselectedDropDownList" name="DatabasesSelected"
										id="multiselect_to_1" class="form-control" size="8"
										multiple="multiple">
										<c:forEach items="${dbSelected}" var='logsf'>
											<c:if test="${empty logsf.getDatabases().aliasName}">
												<c:if test="${empty logsf.getDatabases().sid}">
													<option value="${logsf.getDatabases().getId()}" ondblclick="hide3()">
														${logsf.getDatabases().hostName}:${logsf.getDatabases().getPort()}/${logsf.getDatabases().service}</option>
												</c:if>
												<c:if test="${empty logsf.getDatabases().service}">
													<option value="${logsf.getDatabases().getId()}" ondblclick="hide3()">
														${logsf.getDatabases().hostName}:${logsf.getDatabases().getPort()}:${logsf.getDatabases().sid}</option>
												</c:if>
											</c:if>
											<c:if test="${not empty logsf.getDatabases().aliasName}">
												<option value="${logsf.getDatabases().getId()}" ondblclick="hide3()">${logsf.getDatabases().aliasName}</option>
											</c:if>
										</c:forEach>
									</select>
									<span class="input-group-addon fa fa-search search1 " style="top:8px;"></span>
									<small id="select_name_error1" style="display:none; color:red;">Select at least 1 database</small>
									</div>
								</div>
							</div>
							</div>
							
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="col-lg-12 m-20">
								
								<div class="text-center ml-minus-4">
									<button type="submit" id="validate-btn" class="btn btn-primary mr-sm-2" data-toggle="click-ripple" >Update</button>
									<a href="${pageContext.request.contextPath}/mappings" class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Back</a> 
									<button id="${target.getTargetName()}" class="btn btn-danger deleteTarget" data-toggle="click-ripple">Delete</button>
								</div>
							</div>
						</form>
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
	<%@include file="/static/js/pages/Mapping_RepoDbMappJS.jsp"%>
	
	<script>
		function validateForm(){
			
			var card = document.getElementById("targetName").value;
			var cardOne = document.getElementById("matchRepo").value;
			var dropdown = document.getElementById("DbselectedDropDownList");
			if(card.length==0){
				document.getElementById("mapping_name_error").style.display="block";
			}
			else{				
				document.getElementById("mapping_name_error").style.display="none";
			}
			
			if(cardOne.length==0){
				document.getElementById("repo_name_error").style.display="block";
			}
			else{
				
				document.getElementById("repo_name_error").style.display="none";
			}
			if(dropdown.options.length == 0){
				document.getElementById("select_name_error").style.display="block";
			}
			else{
				document.getElementById("select_name_error").style.display="none";
			}
			if(card.length > 0 && cardOne.length > 0 && dropdown.options.length > 0)
				return true;
			else
				return false;
			}
		
		function hide(){
			document.getElementById("mapping_name_error").style.display="none";
		}
		function hide1(){
			document.getElementById("repo_name_error").style.display="none";
		}
		function hide2(){
			document.getElementById("select_name_error").style.display="none";
		}
		
		
		
		
	</script>
	<script>
	function validateFormEdit(){
		var box = document.getElementById("DbselectedDropDownList");
		
		if(box.options.length == 0){
			document.getElementById("select_name_error1").style.display="block";
			return false;
		}
		else{
			document.getElementById("select_name_error1").style.display="none";
			return true;
		}
		
	}
	function hide3(){
		document.getElementById("select_name_error1").style.display="none";
	}
	</script>
	
</body>
</html>