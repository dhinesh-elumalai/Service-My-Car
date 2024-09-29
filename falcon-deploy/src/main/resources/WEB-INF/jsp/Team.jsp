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

		<main id="main-container"> <!-- Page Content -->
		<div class="content">
			<div class="block">
				<div class="block block-bordered">
					<div class="block-header block-header-default">
						<h3 class="block-title">TEAM</h3>
					</div>
					<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active">Team</li>
							</ul>
						</div>
					<div class="col-md-12 p-0" id="fixedSet">

						<div class="block-header">

							<div class="col-md-5 pl-0 xs-pr-0 xs-mb-5">
								<div class="">
									<div class="input-group">
										<span class="input-group-addon fa fa-search search1"
											style="top: 10px"></span> <input id="teamNameForSearch"
											class="t-indent-10 form-control" name="teamName" type="text"
											placeholder="Search by team name" autocomplete="off">
									</div>
								</div>

							</div>
							<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
									<a href="${pageContext.request.contextPath}/addTeam" class="btn btn-primary" role="button" data-toggle="click-ripple"><i class="fa fa-user"></i>+ Create Team</a>
								</sec:authorize>
						</div>


						<div class="col-md-12">
							<c:if test="${page.content.size()==0}">
								<div class="no-data text-center" id="emptyDataajax" >
									<p>There is no data to display.<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')"> please <a href="${pageContext.request.contextPath}/addTeam">Click here</a> to add.</sec:authorize></p>
								</div>
								</c:if>
								<c:if test="${page.content.size()!=0}">
								
							<div class="card card-block" id="nonemptyDataajax">
							<div class="no-data text-center" id="emptyDataajax" style="display: none;">
									<p>There is no data to display.<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')"> please <a href="${pageContext.request.contextPath}/addTeam">Click here</a> to add.</sec:authorize></p>
								</div>
								<div class="table-responsive">
									<table id="myTable3" class="table table-striped table-bordered xs-width-1000 sm-width-1000">
									<thead id="thead">
										<tr>
											<th>Team Name</th>
											<th>Created By</th>
											<th class="text-right">Created Timestamp</th>
											<th>Updated By</th>
											<th class="text-right">Updated Timestamp</th>
										</tr>
									</thead>
									<tbody id="jsp_loaded_data">
										<c:forEach items="${page.content}" var="team">
											<tr>
												<th class=" font-w400"><sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN','TEAM_ADMIN')"><a href="${pageContext.request.contextPath}/edit-team?teamName=${team.getTeamName()}"> <span>${team.getTeamName()}</span>
												</a></sec:authorize><sec:authorize access="hasAnyAuthority('USER')"><span>${team.getTeamName()}</span></sec:authorize></th>
												<td class="text-capitalize">${team.getCreatedBy().firstName} ${team.getCreatedBy().lastName}</td>
												<td class="text-right"><jsp:useBean id="dateValue129"
														class="java.util.Date" /> <jsp:setProperty
														name="dateValue129" property="time"
														value="${team.getCreatedTimestamp().time}" /> <fmt:formatDate
														value="${dateValue129}" pattern="${timestamp}" /></td>
												<td class="text-capitalize">${team.getUpdatedBy().firstName} ${team.getUpdatedBy().lastName}</td>
												<td class="text-right"><jsp:useBean id="dateValue130"
														class="java.util.Date" /> <jsp:setProperty
														name="dateValue130" property="time"
														value="${team.getUpdatedTimestamp().time}" /> <c:if
														test="${team.getUpdatedTimestamp().time!=null}">
														<fmt:formatDate value="${dateValue130}"
															pattern="${timestamp}" />
													</c:if></td>
											</tr>
										</c:forEach>
									</tbody>
									<tbody id="Ajax_loaded_data">
									</tbody>
								</table>
								</div>
							</div>
							
							<div class="container-fluid " id="pagination_div">
                                <div class="row">
                                	<nav aria-label="Page navigation">
                                     	<ul class="pagination mt-10" id="pagination"></ul>
                                 	</nav>
                                </div>
                           </div>
                           </c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/TeamsJS.jsp"%>
</body>
</html>
