
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
	<div id="preloader">
		<!-- <img src="static/img/loader.png"> -->
		<i class="fa fa-3x fa-cog fa-spin" style="color: #324a7e"></i>
		<p>
			Loading <br>
			<small style="text-transform: capitalize">Please Wait</small>
		</p>
	</div>
	
						<c:choose>
							<c:when test="${not empty modelStatus}">
								<div class="modal fade" id="memberModal" tabindex="-1"
									role="dialog" aria-labelledby="memberModalLabel"
									aria-hidden="true">
									<div class="modal-dialog ">
										<div class="modal-content">
											<div class="modal-header block-header block-header-default">
											
												<h4 class="modal-title col-md-12 block-title"
													id="memberModalLabel">
													<c:if test="${not empty modelStatus}">Status</c:if>
												</h4>
											</div>
											<div class="modal-body">
												<div class="block-content text-center">
													<p>
														${modelStatus}
													</p>
													<div class="text-center">
														<a href="${pageContext.request.contextPath}/dashboard">
															<button class="btn btn-primary">Go to homepage</button>
														</a>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn  btn-alt-success" data-dismiss="modal" >Close</button>
											</div>
										</div>
									</div>
								</div>
							</c:when>
						</c:choose>
	
	<div id="page-container"
		class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

		<main id="main-container"> <!-- Page Content -->
		<div class="content">
			<div class="block">
				<div class="block block-bordered">
					<div class="" id="fixedSet">
						<div class="block-header block-header-default">
							<h3 class="block-title">DATABASE</h3>
						</div>
						<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb mb-0">
								<li class="breadcrumb-item"><a
									href="${pageContext.request.contextPath}/dashboard"><i
										class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active">Database</li>
							</ul>
						</div>

						<div class="form-inline">
							<div class="col-md-12 col-lg-5">
								<div class="form-inline">
									<div class="form-group ">
										<select class="form-control width-100-imp" name="searchOn"
											id="TNSSearchBasedOn" style="background-color: #ffffff;">
											<option value="Alias" selected>Alias</option>
											<option value="Host">Host</option>
											<option value="Service">Service</option>
											<option value="Sid">Sid</option>
										</select>

									</div>
									<div class="relative-sec form-group  xs-width-100"
										style="width: 77% !important;">
										<span class="input-group-addon fa fa-search search2 xs-l-15"></span>
										<input id="TNSsearchkey"
											class="form-control t-indent-10 width-100-imp ml-sm-3"
											name="TNSsearchkey" type="text"
											placeholder="Search by Alias or Host or Service or SID"
											autocomplete="off">
									</div>
								</div>
							</div>
							<div class="col-md-12 col-lg-7	 mt-sm-1">
								<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
									<button class="btn  btn-primary text-right xs-ml-5 xs-mb-5"
										data-toggle="modal" data-target="#myModal"
										style="float: right" data-toggle="click-ripple">
										<i class="fa fa-upload"></i> Upload Oracle TNS File
									</button>
									<button id="submit"
										onclick="window.location.href='newDatabase';"
										class="btn  btn-primary text-right mr-sm-2"
										style="float: right" data-toggle="click-ripple">
										<i class="fa fa-plus-circle"></i> New Database
									</button>
									<button id="submit"
										onclick="window.location.href='newAutonomousDatabase';"
										class="btn  btn-primary text-right mr-sm-3"
										style="float: right" data-toggle="click-ripple">
										<i class="fa fa-plus-circle"></i> New Autonomous Database
									</button>

								</sec:authorize>
							</div>
						</div>


						<div id="myModal" class="modal fade" role="dialog"
							aria-labelledby="modalLabelLarge">
							<div class="modal-dialog ">
								<div class="modal-content">
									<div class="modal-header block-header block-header-default">
										<h4 class="block-title text-uppercase">TNS File Upload</h4>
									</div>
									<div class="modal-body">
										<form class="form-horizontal" id="fileUploadForm"
											action=<c:url value='upload-tns-file' /> method="post"
											enctype="multipart/form-data">
											<div class="row">
												<div class="col-md-9 pr-0">
													<input type="file"
														style="border: 1px solid #bbb; padding: 3px; width: 100%"
														name="fileSave"
														accept=".doc,.txt,.html,.xml,.java,.xhtml,.css,.js,.json,.asp,.aspx,.bat,.php,.sql,.jsp,.ora,.tns">
												</div>
												<div class="col-md-3">
													<button type="submit" class="btn btn-primary"
														data-toggle="click-ripple">Upload</button>
												</div>
											</div>
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-alt-danger"
											data-dismiss="modal" data-toggle="click-ripple">Close</button>
									</div>
								</div>
							</div>
						</div>
						<div class="block col-12 mt-10" id="table_card_id">
							<div>
								<div class=" table-responsive" id="jsp_table">

									<table
										class="table table-striped table-bordered col-md-8 xs-width-1000 sm-width-1000">
										<thead class="text-left">
											<tr>
												<th>Alias name</th>
												<th>Hostname</th>
												<th class="text-center">Port</th>
												<th>Service</th>
												<th>SID</th>
												<th>Descriptor</th>
												<th>DB Type</th>
												<th>Environment</th>
												<th class="text-center" style="width: 10%">Status</th>
												<th class="text-center" style="width: 10%">Autonomous</th>
												<th class="text-center">Update</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items='${page.content}' var='logs'
												varStatus="loop">
												<tr>
													<td class="text-left table-scroll">${logs.getAliasName()}</td>
													<td class="text-left"><c:out
															value='${logs.getHostName()}' /></td>
													<td class="text-center" style='width: 5%;'><c:out
															value='${logs.getPort()}' /></td>
													<td class="text-left" style='width: 10%;'><c:out
															value='${logs.getService()}' /></td>
													<td class="text-left"><c:out value='${logs.getSid()}' /></td>
													<td style='width: 30%;'><textArea cols="2" rows="2"
															class="col-md-12" readonly>${logs.getDescriptor().trim()}</textArea></td>
													<td  class="text-center">
														<c:if test="${logs.dbType.trim()=='ORACLE'}"><span class="badge badge-danger OracleBTN" >ORACLE</span></c:if>
														<c:if test="${logs.dbType.trim()=='MYSQL'}"><span class="badge badge-success MYSQLbTN" >MySQL</span></c:if>
													</td>
													<td class="text-left" style='width: 10%'><c:out
															value='${logs.databaseEnvironment.environmentName}' /></td>
													<td class="text-center" style="width: 10%"><c:if
															test='${logs.isEnableStatus()}'>
															<span class="badge badge-success">Active</span>
														</c:if>
														<c:if test='${!logs.isEnableStatus()}'>
															<span class="badge badge-danger">Inactive</span>
														</c:if></td>
														<td class="text-center" style="width: 10%"><c:if
															test='${logs.getautonomous()}'>
															<span class="badge badge-success">Yes</span>
														</c:if>
														<c:if test='${!logs.getautonomous()}'>
															<span class="badge badge-danger">No</span>
														</c:if></td>
													<td class='text-center' style='width: 5%'>
												
													<c:if test='${!logs.getautonomous()}'>
														<a href="${pageContext.request.contextPath}/update-databases-tns?tns_id=${logs.getId()}">
																<span class="fa fa-pencil-square-o" style="font-size: 18px;"></span>
														</a>
													</c:if>
													<c:if test='${logs.getautonomous()}'>
															<a href="${pageContext.request.contextPath}/update-databases-autonomous?tns_id=${logs.getId()}">
															<span class="fa fa-pencil-square-o" style="font-size: 18px;"></span>
															</a>
													</c:if>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="no-data text-center" id="emptyData"
							style="display: none;">
							<p>
								There is no data to display.
								<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')"> please <a
										href="${pageContext.request.contextPath}/newDatabase">Click
										here</a> to add.</sec:authorize>
							</p>
						</div>
						<div class="card card-block mt-10 col-md-12" id="table_card_id1"
							style="display: none">

							<div class=" table-responsive" id="jsp_table1">
								<table class="table table-striped table-bordered col-md-8 ">
									<thead class="text-left" id="thead">
										<tr>
											<th>AliasName</th>
											<th>HostName</th>
											<th class="text-center">Port</th>
											<th>Service</th>
											<th>SID</th>
											<th>Descriptor</th>
											<th>DB Type</th>
											<th>Environment</th>
											<th class="text-center" style="width: 10%">Status</th>
											<th class="text-center" style="width: 10%">Autonomous</th>
											<th class="text-center">Update</th>
										</tr>
									</thead>
									<tbody id="table_body">
									</tbody>
								</table>
							</div>
						</div>
						<div>
							<div class="container-fluid " id="jsp_pagination">
								<nav aria-label="Page navigation flex-wrap">
									<ul class="pagination mt-10" id="pagination"></ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
	<script>
		function uploading() {
			document.getElementById('overlay').style.display = 'block';
			return true;
		}
	</script>

	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/DatabasesJS.jsp"%>

	<script>
		$(document).ready(function() {
			$('#fileUploadForm').formValidation({
				framework : 'bootstrap4',
				icon : {
					valid : 'fa fa-check',
					invalid : 'fa fa-times-circle',
					validating : 'fa fa-sync-alt'
				},
				fields : {
					fileSave : {
						validators : {
							notEmpty : {
								message : 'Atleast 1 file should be selected'
							},
							file : {
								maxTotalSize : 2097152, // 2048 * 1024
								message : 'The selected file is not valid'
							}
						}
					}
				}
			});
		});
	</script>
</html>