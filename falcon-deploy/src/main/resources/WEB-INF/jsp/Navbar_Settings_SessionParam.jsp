<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/sessionadd.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<body>

<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
	<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
	<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

                <!-- Page Content -->
<main id="main-container">
<div id="preloader">
        <i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
       <p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
</div>
<div class="content">
<div class="block block-bordered pb-20">
	<div class="row">
		<div class="col-md-12">
			<div class="block-header block-header-default "><h5 class="block-title text-uppercase">Session Parameter management</h5>
			<div class="block-options xs-pl-0">
				<a href="${pageContext.request.contextPath}/sessionParams?mode=${MODE}" class="btn btn-primary mr-sm-2" data-toggle="click-ripple">Add session parameters</a>
			</div>
		</div>
	</div>
</div>
	<div class="col-md-12">
		<ul class="bg-none padding-left-0 breadcrumb mb-0">
			<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
			<li class="breadcrumb-item active">Session Parameter management</li>
		</ul>
	</div>		
						
				
<div class="col-md-12 mt-15">
<div class="tab">
  <a href="${pageContext.request.contextPath}/showGlobalParams"><button class="${MODE =='GLOBAL'?'tablinks active':'tablinks'} col-md-4" id="gtab" data-toggle="click-ripple">Global</button></a>
  <a href="${pageContext.request.contextPath}/showMapParams"><button  class="${MODE =='MAPPING'?'tablinks active':'tablinks'}  col-md-4" id="mtab" data-toggle="click-ripple">Mapping</button></a>
 <a href="${pageContext.request.contextPath}/showDBParams"><button class="${MODE =='DB'?'tablinks active':'tablinks'}  col-md-4" id="dtab" data-toggle="click-ripple">Database</button></a>
   
  </div>
<div id="myModal12" class="modal fade" role="dialog">
														<div class="modal-dialog modal-lg">
															<div class="modal-content">
																<div class=" block-header block-header-default">
																	<h6 class="mb-0 block-title text-uppercase">
																	<c:if test="${MODE=='DB'}">Database</c:if>
																	<c:if test="${MODE!='DB'}">${MODE}</c:if>
																	 Session Parameter</h6>		
																</div>
																<div class="modal-body">
																	<div class="col-md-12">
																		<form action=<c:url value='updateSession' /> method="post">
																		<br>
																		<div class="form-group row ">
	                                                                		 <label class="col-md-2 control-label text-right" for="submit"><b>Session Parameter:</b></label>
	                                                                		 <div class="col-md-10 ">
																				<textarea id="scriptEdit" class="width-100" cols="4" rows="4" name="script" required></textarea>
																				<input type="hidden" id ="editId" name="id" value="" />
																				<input type="hidden" id ="mode" name="mode" value="${MODE}" />
																			</div>
																			
																		</div>
																		<div class="form-group row" id="ModdescFormTypeDIV">
																				<label class="col-md-2 control-label text-right" for="fn"><b>Type:</b></label>
																		<div class="col-md-8">
																				<select  name="sessionType" class="form-control" id="ModdescFormType">
																					<option value="ORACLE">ORACLE</option>
																					<option value="MYSQL">MySQL</option>
																				</select>
																			</div>
																		</div>
																		
																		<div class="col-md-10 offset-md-2 pl-0 pr-0 mt-10 text-center">
																				<button id="submit" class=" btn btn-primary" data-toggle="click-ripple">Update</button>
																				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
																		</div>
																	</form>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-alt-danger"
																		data-dismiss="modal">Close</button>
																</div>
															</div>
														</div>

													</div>
										<c:choose>
		<c:when test="${MODE=='GLOBAL'}">
					<c:if test="${fn:length(list.content) gt 0}">
					<div class="form-group" >
						<hr>
					<div class="row">
						<div class="col-md-10">
							<div class="row">
			          <div class="input-group col-md-6">
			                <span class="input-group-addon fa fa-search search2" ></span> 
			                 <input id="Search" class=" form-control t-indent-10" type="text" placeholder="Search by parameter" autocomplete="off">
			           </div>			
							</div>
						</div>
					</div>

				</div>

					<div class="no-data text-center" id="emptyDataajax" style="display: none;">
									<p>There is no data to display.</p>
							</div>
					<div class=" table-responsive" id="jsp_table">
						<table class="table table-striped table-bordered col-md-8 ">
							<thead id="thead">
								<tr>
									<th> Session Parameter</th>
									<th> Session Type</th>
									<th class="text-center">Action</th>
								</tr>
							</thead>
							<tbody id="jsp_loaded_data">
								<c:forEach items='${list.content}' var='logs' varStatus="loop">
									<tr id='${logs.sessoionParameterId}'>
	
										<td class="text-center p-0"><textarea id="script" class="width-100 mt-10 mb-10" name="script"  readonly style=" background-color: #e9ecef;">${logs.script}</textarea></td>
										<td class="text-center" style="width: 3%">
										<input type="hidden" value="${logs.getDbType()}" id="dbTypeID">
										<c:if test="${logs.getDbType() =='ORACLE'}">
											<span class="badge badge-success OracleBTN">ORACLE</span>
										</c:if>
										<c:if test="${logs.getDbType() =='MYSQL'}">
											<span class="badge badge-danger MYSQLbTN">MySQL</span>
										</c:if>
										</td>
										<td class="text-center" >
											<div class="btn-group">
												<a  onclick="Edit('${logs.sessoionParameterId}');"><span class="fa fa-pencil btn btn-sm btn-alt-primary"></span></a>
												<a href="${pageContext.request.contextPath}/deleteSession?id=${logs.sessoionParameterId}" class="fa fa-trash btn btn-sm btn-alt-danger DeleteDialog"> </a>
											</div>
										</td>
										
									</tr>
								</c:forEach>
							</tbody>
							<tbody id="Ajax_loaded_data">
							</tbody>
						</table>
					</div>
							<div class=" col-md-12" id="restDataDisplay" style="display: none;"><br></div>
					
				<c:set var="page" value="${list}"></c:set>
					<div class="container-fluid " id="paginationDiv">
                                 <nav aria-label="Page navigation">
                                     <ul class="pagination mt-10" id="pagination"></ul>
                                 </nav>
                           </div>
					</c:if>
					<c:if test="${list.content.size()==0}">
				<div class="no-data text-center" id="emptyDataajax" >
									<p>There is no data to display.</p>
							</div>
					</c:if>
					
</c:when>


	<c:when test="${MODE=='MAPPING'}">
				<c:if test="${list.content.size()==0}">
				<div class="no-data text-center" id="emptyDataajax" >
									<p>There is no data to display.</p>
							</div>
					</c:if>
				<c:if test="${fn:length(list.content) gt 0}">
					<div class="form-group" >
						<hr>
					<div class="row">
						<div class="col-md-10">
							<div class="row">
			          <div class="input-group col-md-6">
			                <span class="input-group-addon fa fa-search search2"></span> 
			                 <input id="MappingSearch" class="form-control t-indent-10" type="text" placeholder="Search by mapping " autocomplete="off" >
			           </div>			
							</div>
						</div>
					</div>

				</div>

				
					<div class="no-data text-center" id="emptyDataajax" style="display: none;">
									<p>There is no data to display.</p>
					</div>
				<div class="" id="jsp_datacard_id">
						<c:forEach items='${list.content}' var='logs' varStatus="loop">
							<div class="block block-bordered">
							<div class="block-header block-header-default"><h5 class="block-title font-w600 color-primary">${logs.mapping} <small style="font-size: 12px;font-style: italic;">(Mapping)</small>
							<c:if test="${logs.enabled}"><span class="badge badge-success">Active</span></c:if>
							<c:if test="${!logs.enabled}"><span class="badge badge-danger">Inactive</span></c:if>
							<c:if test="${logs.dbType=='ORACLE'}"><span class="badge badge-success">${logs.dbType}</span></c:if>
							<c:if test="${logs.dbType=='MYSQL'}"><span class="badge badge-danger">${logs.dbType}</span></c:if>
							</h5></div>
								<div class="teble-responsive" data-toggle="slimscroll" data-height="300px">
									<table class="table table-striped table-bordered ">
							<thead>
								<tr>
									<th>Session Parameter</th>
									<c:if test="${logs.enabled}">
									<th class="text-center">Action</th>
									</c:if>
								</tr>
							</thead>
							<tbody>
							<c:forEach items='${logs.sessionParamDto}' var='logsf' varStatus="loop">
								<tr id='${logsf.id}'>
									<td>
										<textarea id="script" name="script" class="width-100 mt-10 mb-10 " readonly style=" background-color: #e9ecef;"> ${logsf.script}</textarea>
									</td>
									<c:if test="${logs.enabled}">
									<td class="text-center">
										<div class="btn-group">
											<a href="#"  onclick="Edit('${logsf.id}');" class="fa fa-pencil btn btn-sm btn-alt-primary"></a>
											<a href="${pageContext.request.contextPath}/deleteMappingSession?id=${logsf.id}" class="fa fa-trash btn btn-sm btn-alt-danger DeleteDialog"> </a>
										</div>
									</td>
									</c:if>
								</tr>
							</c:forEach>
							</tbody>
						</table>
								</div>
							</div>
						</c:forEach>
					</div>
					
				<div class="" id="restDataDisplay" style="display: none;"></div>
				</c:if>
					<c:set var="page" value="${list}"></c:set>
					<div class="container-fluid " id="paginationDiv">
                                 <nav aria-label="Page navigation">
                                     <ul class="pagination mt-10" id="pagination"></ul>
                                 </nav>
                           </div>
				
</c:when>

			<c:when test="${MODE=='DB'}">
				<c:if test="${list.content.size()==0}">
				<div class="no-data text-center" id="emptyDataajax" >
									<p>There is no data to display.</p>
							</div>
					</c:if>
			<c:if test="${fn:length(list.content) gt 0}">
				<div class="form-group" >
					<hr>
					<div class="row">
						<div class="col-md-10">
							<div class="row">
			          <div class="input-group col-md-6">
			                <span class="input-group-addon fa fa-search search2"></span> 
			                 <input id="DBSearch" class=" form-control t-indent-10" type="text" placeholder="Search by Database " autocomplete="off">
			           </div>			
							</div>
						</div>
					</div>
				</div>

					<div class="no-data text-center" id="emptyDataajax" style="display: none;">
									<p>There is no data to display.</p>
							</div>
				
						<div class="" id="jsp_datacard_id_db">
						<div class="no-data text-center" id="emptyDataajax" style="display: none;">
									<p>There is no data to display.</p>
							</div>
						<c:forEach items='${list.content}' var='logs' varStatus="loop">
							<div class="block block-bordered">
								<div>
									<div class="block-header block-header-default">
										<h5 class="block-title font-w600 color-primary">${logs.link} <small style="font-size: 12px;font-style: italic;">(Database)</small> <c:if test="${logs.dbEnabled}"><span class="badge badge-success">Active</span></c:if>
										<c:if test="${!logs.dbEnabled}"><span class="badge badge-danger">Inactive</span></c:if>
											<c:if test="${logs.dbType=='ORACLE'}"><span class="badge badge-success">${logs.dbType}</span></c:if>
											<c:if test="${logs.dbType=='MYSQL'}"><span class="badge badge-danger">${logs.dbType}</span></c:if>
										</h5> 
									</div>
									<div class="teble-responsive" data-toggle="slimscroll" data-height="300px">
									<table class="table table-striped table-bordered ">
							<thead>
								<tr>
									<th>Session Parameter</th>
									<th class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items='${logs.sessionParamDto}' var='logsf' varStatus="loop">
								<tr id='${logsf.id}'>
									<td>
										<textarea id="script"  name="script" class="width-100 mt-10 mb-10 " readonly style="background-color: #e9ecef;"> ${logsf.script}</textarea>
									</td>
									<td class="text-center">
										<div class="btn-group">
										<a href="#"  onclick="Edit('${logsf.id}');" class="fa fa-pencil btn btn-sm btn-alt-primary" ></a>
										<a href="${pageContext.request.contextPath}/deleteDBSession?id=${logsf.id}" class="fa fa-trash btn btn-sm btn-alt-danger DeleteDialog"> </a>
										</div>
									</td>
								</tr>
											</c:forEach>
											</tbody>
											</table>
											</div>
										
									
								</div>
							</div>
							
						</c:forEach>
						</div>
				<div class="" id="restDataDisplayDb" style="display: none;"></div>
					</c:if>
					
	<c:set var="page" value="${list}"></c:set>
					<div class="container-fluid " id="paginationDiv">
                                 <nav aria-label="Page navigation">
                                     <ul class="pagination mt-10" id="pagination"></ul>
                                 </nav>
                           </div>
</c:when>

</c:choose>
</div>
<div id="dialog-confirm">
		<p id="textForDialog"></p>
	</div>
</div>
</div>
</main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<script src="static/js/plugins/multiselect.min.js"></script>
	<%@include file="/static/js/pages/Navbar_Settings_SessionJS.jsp"%>
</body>
</html>