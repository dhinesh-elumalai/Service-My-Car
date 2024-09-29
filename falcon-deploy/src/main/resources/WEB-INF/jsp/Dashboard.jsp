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
                	<div class="row rowfafari gutters-tiny invisible mb-10" data-toggle="appear">
                		<form class="form-inline col-md-12" action="${pageContext.request.contextPath}/dashboard" method="get">
								<div class="container-fluid pl-0 pr-0">
									<div class="row">
										<div class="col-md-11 row rowfafari ml-auto pr-10 xs-pr-15 sm-pl-0">
										<div class="input-group col-md-2 col-sm-12 sm-pl-0 mt-5 sm-mb-10 xs-pull-right">
										<div class="custom-control custom-checkbox ">
											<input class="custom-control-input" type="checkbox"  id="history" name="selected" value="true" <c:if test="${selected}">checked</c:if>>
                                            <label class="custom-control-label" for="history" style="margin-top:1px">From History</label>
                                        </div>
										
                                                    
										</div>
										  
											<div class="input-group col-md-4 pl-0 xs-mb-5">
											<label style="margin-top:0">Start Date  &nbsp;</label>
											    <jsp:useBean id="dateValue125" class="java.util.Date" /> 
                                                   <jsp:setProperty name="dateValue125" property="time" value="${sdate.getTime()}" />
	                                             <input id="date" type="text" class="js-datepicker form-control js-datepicker-enabled" name="fdate" data-provide="datepicker"
	                                              <c:if test="${sdate!=null}">value='<fmt:formatDate value="${dateValue125}"  pattern="MM-dd-yyyy"/>'</c:if> autocomplete="Off">
	                                             <span  class="input-group-addon cal-icon1" ><i class="fa fa-calendar"></i></span>
	                                     </div>
	                                     <div class="input-group row col-md-4 pr-0 xs-mb-5">
											<label style="margin-top:0">End Date  &nbsp;&nbsp;&nbsp;</label>
											 <jsp:useBean id="dateValue126" class="java.util.Date" /> 
                                                <jsp:setProperty name="dateValue126" property="time" value="${edate.getTime()}" />
	                                             <input id="date1" type="text" class="js-datepicker form-control js-datepicker-enabled" name="tdate" data-provide="datepicker" <c:if test="${edate!=null}">value='<fmt:formatDate value="${dateValue126}"  pattern="MM-dd-yyyy"/>'</c:if> autocomplete="Off">
	                                             <span  class="input-group-addon cal-icon1 r-10 xs-r-10" ><i class="fa fa-calendar"></i></span>
	                                     </div>
	                                     <div class="input-group row col-md-2 col-sm-2  ml-10 pr-0 xs-btn-width-right sm-ml-5">
	                                     <button type="submit" class="btn btn-alt-primary width-100" data-toggle="click-ripple"> Filter</button>
	                                     </div>
										</div>	    
									</div>
								</div>
							</form>
                	</div>
                    <div class="row rowfafari gutters-tiny invisible" data-toggle="appear">
                        <!-- Row #1 -->
                        <div class="col-6 col-xl-3">
                            <div class="block block-link-shadow text-right" >
                                <div class="block-content block-content-full clearfix">
                                    <div class="float-left mt-10 d-none d-sm-block">
                                        <i class="fa fa-users fa-3x" style="color:#324a7e"></i>
                                    </div>

                                   <div class="float-right">
                                   	 <div class="font-size-h3 text-primary font-w600 sm-text-right xs-text-right" data-toggle="countTo" data-speed="1000" data-to="${dashboardData.userCount}">0</div>
                                    <div class="font-size-sm font-w600 text-uppercase text-muted">Users</div>
                                   </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6 col-xl-3">
                            <div class="block block-link-shadow text-right" >
                                <div class="block-content block-content-full clearfix">
                                    <div class="float-left mt-10 d-none d-sm-block">
                                        <i class="fa fa-list-ul fa-3x text-body-bg-success" style="color:#519C61"></i>
                                    </div>

                                    <div class="float-right">
                                    <div class="font-size-h3 font-w600 sm-text-right xs-text-right" style="color:#519C61"><span data-toggle="countTo" data-speed="1000" data-to="${dashboardData.requestCount}">0</span></div>
                                    <div class="font-size-sm font-w600 text-uppercase text-muted">Requests</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6 col-xl-3">
                            <div class="block block-link-shadow text-right">
                                <div class="block-content block-content-full clearfix">
                                    <div class="float-left mt-10 d-none d-sm-block">
                                        <i class="fa fa-database fa-3x text-danger"></i>
                                    </div>

                                    <div class="float-right">
                                    <div class="font-size-h3 font-w600 text-danger sm-text-right xs-text-right" data-toggle="countTo" data-speed="1000" data-to="${dashboardData.deploymentCount}">0</div>
                                    <div class="font-size-sm font-w600 text-uppercase text-muted" >Deployments</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6 col-xl-3">
                            <div class="block block-link-shadow text-right" >
                                <div class="block-content block-content-full clearfix">
                                    <div class="float-left mt-10 d-none d-sm-block">
                                        <i class="fa fa-file-text fa-3x" style="color:#F39649"></i>
                                    </div>

                                    <div class="float-right">
                                    <div class="font-size-h3 font-w600 sm-text-right xs-text-right"  style="color:#F39649" data-toggle="countTo" data-speed="1000" data-to="${dashboardData.scriptCount}">0</div>
                                    <div class="font-size-sm font-w600 text-uppercase text-muted">Scripts</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END Row #1 -->
                    </div>
                    <div class="row rowfafari gutters-tiny invisible" data-toggle="appear">
                        <!-- Row #2 -->
                        <div class="col-md-6">
                            <div class="block">
                                <div class="block-header">
                                    <h3 class="block-title">
                                       Top Requestor
                                    </h3>
                                   
                                </div>
                                <div class="block-content block-content-full">
                                    <div class="pull-all">
                                        <!-- Lines Chart Container -->
                                       <canvas class="js-chartjs-dashboard-lines chartjs-render-monitor"></canvas>
                                    </div>
                                </div>
                               
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="block">
                                <div class="block-header">
                                    <h3 class="block-title">
                                        Top Application
                                    </h3>
                                   
                                </div>
                                <div class="block-content block-content-full">
                                    <div class="pull-all">
                                        <!-- Lines Chart Container -->
                                        <canvas class="js-chartjs-dashboard-lines2 chartjs-render-monitor"></canvas>
                                    </div>
                                </div>
                               
                            </div>
                        </div>
                        <!-- END Row #2 -->
                    </div>
                    
                     <div class="row rowfafari gutters-tiny invisible" data-toggle="appear">
                     	<div class="col-md-6">
                            <div class="block">
                                <div class="block-header block-header-default">
                                    <h3 class="block-title">
                                        Top Requestor
                                    </h3>                                   
                                </div>
                                <div class="table-responsive">
                                	<table class="table table-borderless table-striped table-vcenter xs-width-500px">
                                <thead>
                                    <tr>
                                        <th>User</th>
                                        <th class="text-right">Request Count</th>
                                        <th class="d-none d-sm-table-cell text-right">Deployment Count</th>
                                        <th class="text-right">Scripts Count</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${dashboardData.top10Requestor}" var="reqtr">
                                    <tr>
                                        <td class="font-w400 text-capitalize p-10">${reqtr.userName}</td>
                                        <td class="text-right">${reqtr.requestCount}</td>
                                        <td class="text-right">${reqtr.deploymentCount}</td>
                                        <td class="text-right">${reqtr.scriptCount}</td>
                                    </tr>
                                 </c:forEach>    
                                </tbody>
                            </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="block">
                                <div class="block-header block-header-default">
                                    <h3 class="block-title">
                                        Top Application
                                    </h3>                                   
                                </div>
                                <div class="table-responsive">
                                	<table class="table table-borderless table-striped table-vcenter xs-width-500px">
                                <thead>
                                    <tr>
                                        <th>Application</th>
                                        <th class="text-right">Request Count</th>
                                        <th class="d-none d-sm-table-cell text-right">Deployment Count</th>
                                        <th class="text-right">Scripts Count</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${dashboardData.top10Application}" var="app">
                                    <tr>
                                        <td class="font-w400 p-10">${app.repoName}</td>
                                        <td class="text-right">${app.requestCount}</td>
                                        <td class="text-right">${app.deploymentCount}</td>
                                        <td class="text-right">${app.scriptCount}</td>
                                    </tr>
                                 </c:forEach>    
                                </tbody>
                            </table>
                                </div>
                            </div>
                        </div>
                     </div>  
                </div>
                <c:choose>
					<c:when test="${!FilesResoterdList.isEmpty()||!FolderRestoredList.isEmpty()}">
								<div class="modal fade" id="memberModal" tabindex="-1"
									role="dialog" aria-labelledby="memberModalLabel"
									aria-hidden="true">
									<div class="modal-dialog  modal-lg">
										<div class="modal-content">
											<div class="modal-header block-header block-header-default">
												
												<h4 class="modal-title col-md-12 block-title"
													id="memberModalLabel">
													Following files are successfully restored at repo <span class="color-primary">${repoName}.</span>
												</h4>

											</div>
											<div class="modal-body">
												<table
													class="table table-striped table-bordered table-responsive">
													<thead>
														<tr>
															<th style="width:65%">File Name</th>
															<th style="width:28%">File Restored path inside - ${repoName}</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items='${FilesResoterdList}'
															var="FilesResoterdList">
															<tr>
																<th><span class="fa fa-file-code-o">
																		${FilesResoterdList.getFileName()}</span></td>
																<td>${FilesResoterdList.getFilePath()}</td>
															</tr>
														</c:forEach>
														<c:forEach items='${FolderRestoredList}'
															var="FolderRestoredList">
															<tr>
																<td><span class="fa fa-folder-o "></span>
																		${FolderRestoredList.getFileName()}</td>
																<td>${FolderRestoredList.getFilePath()}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-alt-danger"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
							</c:when>
						</c:choose>
                <!-- END Page Content -->
            </main>

	</div>


	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<script src="static/js/plugins/chartjs/Chart.bundle.min.js"></script>
		<script src="static/js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
    <!-- Page JS Code -->
  <%@include file="/static/js/pages/DashboardJS.jsp"%>
</body>
</html>