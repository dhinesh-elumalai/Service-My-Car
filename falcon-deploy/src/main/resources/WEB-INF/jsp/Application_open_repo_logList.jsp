<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
<div id="preloader">
		<!-- <img src="static/img/loader.png"> -->
		<i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
		<p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
	</div>
	<<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

		<main id="main-container"> <!-- Page Content -->
		<div class="content">
			<div class="block">
				<div class="block block-bordered">
					<div class="block-header block-header-default">
						<h3 class="block-title">LOGS</h3>
					</div>
					<div class="" id="fixedSet">
						<div class="col-md-12">
							<div class="col-md-5 row input-group mt-20">
								<span class="input-group-addon search2" style="top:6px"><i class="fa fa-search"></i></span>
								<input class="form-control t-indent-10" type="text" id="myInput"
									onkeyup="myFunction2()" placeholder="Search by committer name">
							</div>
						</div>
						<div>
							<br>
						</div>
						<div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-striped table-bordered "
									id='myTable'>
									<thead>
										<tr>
											<th class="text-center">No</th>
											<th>Committer Name</th>
											<th class="text-left">Commit Id</th>
											<th>Message</th>
											<th class="text-right">Time</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items='${loger}' var='logs' varStatus='loops'>
											<tr>
												<th class="text-center" style="font-weight:normal">${loops.index+1}</th>
												<td class="text-capitalize" style="width:15%"><c:out
														value='${logs.getCommitterIdent().getName()}' /></td>
												<td><c:out value='${logs.name()}' /></td>
												<td><c:out value='${logs.getFullMessage()}' /></td>
												<td class="text-right" style="width:20%"><jsp:useBean id="dateValue129"
														class="java.util.Date" /> <jsp:setProperty
														name="dateValue129" property="time"
														value="${logs.getCommitterIdent().getWhen().getTime()}" />
													<fmt:formatDate value="${dateValue129}"
														pattern="${timestamp}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/Application_open_repo_logListJS.jsp"%>

</body>
</html>