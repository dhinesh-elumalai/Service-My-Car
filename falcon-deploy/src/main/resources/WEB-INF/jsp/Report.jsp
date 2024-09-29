<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

		<main id="main-container"> <!-- Page Content -->
		<div class="content">
			 <!-- Block Tabs Animated Slide Right -->
			  <div class="block">
			   <div>
					             <div class="block-header block-header-default">
						           <h3 class="block-title">REPORT</h3>
					              </div>
					              
                     <div class="block">
						 <div class="mt-10  mb-10">
                			<form class="form-inline col-md-12" action="${pageContext.request.contextPath}/report" method="get">
                			<div class="container-fluid">
									<div class="row">

									<div class="col-md-11 row ml-auto pr-10 xs-pr-15 sm-pl-0">
										 <div class="input-group col-md-2 col-sm-12 sm-pl-0  mt-5 pr-0 sm-mb-5 xs-pull-right">
										<div class="custom-control custom-checkbox ">
											<input class="custom-control-input" type="checkbox"  id="history" name="selected" value="true" <c:if test="${selected}">checked</c:if>>
                                            <label class="custom-control-label" for="history">From History</label>
                                        </div>
										
                                                    
										</div> 

											<div class="input-group col-md-4 xs-mb-5 xs-pr-0 pr-0 pl-0">
											<div class="row" style="width:100%">
											<div class="col-md-4 pl-0 pr-0 mt-5 ">
											<label>Start Date  &nbsp;</label>
											</div>
											    <div class="col-md-8 pl-0 pr-0">
											    <jsp:useBean id="dateValue125" class="java.util.Date" /> 
                                                   <jsp:setProperty name="dateValue125" property="time" value="${sdate.getTime()}" />
	                                             <input style="width:100%" id="fdate" class="form-control" name="fdate" data-provide="datepicker" 
	                                              <c:if test="${sdate!=null}">value='<fmt:formatDate value="${dateValue125}"  pattern="MM-dd-yyyy"/>'</c:if> autocomplete="off">

	                                             <span  class="input-group-addon cal-icon" ><i class="fa fa-calendar"></i></span>
											    </div>
											</div>
	                                     </div>

	                                     <div class="input-group col-md-4 xs-mb-5 xs-pr-0 pr-0 pl-0">
											<div class="row" style="width:100%">
												<div class="col-md-4 pl-0 pr-0 mt-5">
													<label>End Date &nbsp;</label>
												</div>
											<div class="col-md-8 pl-0 pr-0">
												 <jsp:useBean id="dateValue126" class="java.util.Date" /> 
                                                <jsp:setProperty name="dateValue126" property="time" value="${edate.getTime()}" />

	                                             <input style="width:100%" id="tdate" class="form-control" name="tdate" data-provide="datepicker"  <c:if test="${edate!=null}">value='<fmt:formatDate value="${dateValue126}"  pattern="MM-dd-yyyy"/>'</c:if> autocomplete="off">
	                                             <span  class="input-group-addon cal-icon xs-r-8" ><i class="fa fa-calendar"></i></span>
											</div>
											</div>
	                                     </div>


	                                     <div class="input-group row ml-10 col-md-2 pl-0 xs-btn-width-right xs-r-15">
	                                     <button type="submit" class="btn btn-alt-primary width-100 " data-toggle="click-ripple"> Filter</button>
	                                     </div>    
									</div>
							</div>
							</div>
							</form>
                		
                	</div> 
                	
                	
                	
                	
                	<div class="">
                		<div class="col-md-12 ">
                			<div class="block block-bordered pt-10 pb-10">
                	<div class="form-group mb-0">              	
                                            <div class="col-12 ">
                                            <label class="xs-block sm-display-block"><strong>Filter By : </strong></label>
                                                <div class="custom-control custom-checkbox custom-control-inline mb-5 xs-inline-block xs-width-40 sm-width-30">
                                                    <input class="custom-control-input" name="chkbx" type="checkbox"  id="script" value="script" >
                                                    <label class="custom-control-label" for="script">Script</label>
                                                </div>
                                                <div class="custom-control custom-checkbox custom-control-inline mb-5 xs-inline-block xs-width-40 sm-width-30">
                                                    <input class="custom-control-input" name="chkbx" type="checkbox"  id="app" value="app">
                                                    <label class="custom-control-label" for="app">Application</label>
                                                </div>
                                                 <div class="custom-control custom-checkbox custom-control-inline mb-5 xs-inline-block xs-width-40 sm-width-30">
                                                    <input class="custom-control-input" name="chkbx" type="checkbox"  id="db" value="db">
                                                    <label class="custom-control-label" for="db">Database</label>
                                                </div>
                                                <div class="custom-control custom-checkbox custom-control-inline mb-5 xs-inline-block xs-width-40 sm-width-30">
                                                    <input class="custom-control-input" name="chkbx" type="checkbox"  id="team" value="team">
                                                    <label class="custom-control-label" for="team">Team</label>
                                                </div>
                                                <div class="custom-control custom-checkbox custom-control-inline mb-5 xs-inline-block xs-width-40 sm-width-30">
                                                    <input class="custom-control-input" name="chkbx" type="checkbox"  id="user" value="user">
                                                    <label class="custom-control-label" for="user">User</label>
                                                </div>
                                                <div class="custom-control custom-checkbox custom-control-inline mb-5 xs-inline-block xs-width-40 sm-width-30">
                                                    <input class="custom-control-input" name="chkbx" type="checkbox"  id="env" value="env">
                                                    <label class="custom-control-label" for="env">Environment</label>
                                                </div>
                                        </div>
                   </div>
                   <div class="block mb-0 col-md-12 search-drop pr-30  ">
							<form class="row " >
								     <div class="col-md-4 col-sm-6 pr-0 mb-10" id="appDiv"  style="display: none;">
								     <label for="selectedApp">Application</label>
									  <select id="selectedApp" class="js-select2 form-control" multiple  required >	
									  <c:forEach items='${repoList}' var='repolist' varStatus="loop">
									  <option value="${repolist.repoName}">${repolist.repoName}</option>
									  </c:forEach>	
									   </select>
									  </div>
									 
									  <div class="col-md-4 col-sm-6 pr-0 mb-10" id="dbDiv"  style="display: none;">
									  <label for="selectedDb">Database</label>
									  <select id="selectedDb" class="js-select2 form-control"  multiple required>
									<c:forEach items='${dbList}' var='dblist' varStatus="loop">
									  <option value="${dblist.id}">${dblist.link}</option>
									  </c:forEach>														
									  </select>
								    </div>
								   
								    <div class="col-md-4 col-sm-6 mb-10 pr-0" id="teamDiv"  style="display: none;">
								    <label for="selectedTeam">Team</label>
									  <select id="selectedTeam" class="js-select2 form-control" multiple  required>
										<c:forEach items='${tmList}' var='tmlist' varStatus="loop">
									  <option value="${tmlist.teamName}">${tmlist.teamName}</option>
									  </c:forEach>							
									  </select>
									  </div>

									  <div class="col-md-4 col-sm-6 pr-0 mb-10" id="userDiv"  style="display: none;">
									  <label for="selectedUser">User</label>
									  <select id="selectedUser" class="js-select2 form-control"  multiple required>
									 <c:forEach items='${usList}' var='uslist' varStatus="loop">
									  <option value="${uslist.id}">${uslist.firstName}</option>
									  </c:forEach>									
									  </select>
								    </div>
								     <div class="col-md-4 col-sm-6 pr-0 mb-10" id="envDiv"  style="display: none;">
								     <label for="selectedEnv">Environment</label>
									  <select id="selectedEnv" class="js-select2 form-control"  multiple required>
											 <c:forEach items='${envList}' var='enlist' varStatus="loop">
									  <option value="${enlist.environmentId}">${enlist.environmentName}</option>
									  </c:forEach>												
									  </select>

								    </div>

								    <div class="col-md-4 col-sm-6 mb-10 pr-0" id="scriptDiv"  style="display: none;">
								    <label for="selectedApp">Script</label>
									  <select id="selectedScript" class="js-select2 form-control" multiple  required>
											 <c:forEach items='${scList}' var='sclist' varStatus="loop">
									  <option value="${sclist.fileName}">${fn:replace(sclist.fileName, '\\\\','\\')}</option>
									  </c:forEach>											
									  </select>

								    </div>
								    <div class="col-md-4 col-sm-6 mt-10 align-self-center" style="display: none;" id="filtrbtn">
								
								    	<button type="button" class="btn btn-alt-primary" style="margin-top: 6px;padding: 6px 14px;" onclick="submitForFilter(0)">Filter</button>
								    	 <button type="button" class="btn btn-alt-danger" style="margin-top: 6px;padding: 6px 14px;" onclick="clearOptions()">Clear All</button> 
								    </div>
								    
								
							</form>
						</div>
                	</div>
                		</div>
                	</div>
                	
						
						</div >
                        <div class="col-md-12">
                        <c:if test="${list.content.size()==0}">
                        <div class="no-data text-center" id="emptyDataajax" >
									<p>There is no data to display.</p>
							</div>
						</c:if>
						 <c:if test="${list.content.size()>0}">
						   <div class="no-data text-center" id="emptyDataajax" style="display: none;">
									<p>There is no data to display.</p>
							</div>
                         <div class="table-responsive">
                             <div id="data-loader" class="loader-height"  style="display: none;">
 									<div style="display:table-cell; vertical-align:middle;">
 										<i class="fa fa-2x fa-cog fa-spin" style="color:#324a7e"></i>
									<p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
 									</div>
						     </div> 
                                       	<table class="table table-hover table-bordered xs-width-1000 sm-width-1000">
                                    <thead id="thead" >
                                       <tr>
										<th>SCRIPT</th>
										<th>APPLICATION-REQUEST-DATABASE</th>
										<th class="text-right">DEPLOYED_TIMESTAMP</th>
										<th>ENVIRONMENT</th>
										<th class="text-center">SCRIPT STATUS</th>
										<th>USER</th>				
									</tr>
									</thead>
							<tbody id="jsptbody">
							 
							<c:forEach items='${list.content}' var='sc' varStatus="loop">
							<tr <c:if test='${(loop.index%2)!=0}'>class="table-active"</c:if> >
							<td rowspan="${sc.reportDetail.size()+1}">${sc.script} - <b class="text-primary">${sc.reportDetail.size()}</b></td>
							</tr>
							<c:forEach items='${sc.reportDetail}' var='dr' varStatus="loops">
							<tr <c:if test='${(loop.index%2)!=0}'>class="table-active"</c:if> >
							<td>${dr.repoName} - ${dr.reqid} - ${dr.db}</td>
							<td class="text-right">${dr.deployedTime}</td>
							<td>${dr.env}</td>
							<td class="text-center">
							<a href="${pageContext.request.contextPath}/DeployLog/${dr.logUrl}"  target="_blank" 
							<c:if test="${dr.scriptStatus=='Successful'}">class="badge badge-success "</c:if>
							<c:if test="${dr.scriptStatus=='Needs Verification'}">class="badge badge-warning"</c:if>
							<c:if test="${dr.scriptStatus=='Failed'}">class="badge badge-danger"</c:if>
							<c:if test="${dr.scriptStatus=='Killed'}">class="badge badge-info"</c:if>
							>${dr.scriptStatus}</a></td>
							<td class="text-capitalize">${dr.userName}</td>
							</tr>
							</c:forEach>		
							</c:forEach>
							</tbody>
							
							<tbody id="ajaxtbody" style="display: none; ">
							</tbody>
							
							
						</table>
                         </div>
                         </c:if>
                          <c:if test="${list.content.size()>0}">
						<div class="col-md-12" id="jsp_total_script_count">
						<p class="text-right"><strong>Total Scripts : </strong><span id="jsp_totalScripts">${list.totalElements}</span> </p>
						</div>
						</c:if>
						<div class="col-md-12" id="ajax_total_script_count" style="display: none;">
						<p class="text-right"><strong>Total Scripts : </strong><span id="ajax_totalScripts"></span> </p>
						</div>
                                    
                            <!-- END Block Tabs Animated Slide Right -->
	                       <div class="pb-20 " id="pagination_div_jsp">
                               <nav aria-label="Page navigation">
                                     <ul class="pagination mt-10 rowfafari" id="pagination_jsp"></ul>
                                 </nav>
                           </div>
                           <div class="container-fluid " id="pagination_div_ajax" style="display: none;">
                              <div class="row">
                              	 <nav aria-label="Page navigation">
                                   <ul class="pagination mt-10 flex-wrap" id="pagination_ajax"></ul>
                               </nav>
                              </div>
                           </div>
		</div></div>
			
		</div>
		
	</div>
	</main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/ReportJS.jsp"%>
	<script type="text/javascript">
    $(document).ready(function() {
    	displaySpinner();
    	 $("#data-loader").show();
    	 $("#data-loader").hide();
    });
    function displaySpinner()
    {
        var divHeight = $('.table-responsive').height(); 
        $('.loader-height').css('height', divHeight+'px');
        
        var divWidth = $('.table-responsive').width(); 
        $('.loader-height').css('width', divWidth+'px');
    }
  </script>
</body>
</html>
