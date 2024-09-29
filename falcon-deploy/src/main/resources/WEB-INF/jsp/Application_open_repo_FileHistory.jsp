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
					<div class="block-header block-header-default">
							<h5 class="text-center">FILE HISTORY</h5>
							<div class="block-options">
								<button class="btn btn-sm btn-alt-danger" onClick="goBack();" data-toggle="click-ripple">Back</button>
							</div>
						</div>
				<div>
					
				</div>
				
				<div class="col-sm-12" >


					<div class=" table-responsive mt-20">
						<table class="table table-striped table-bordered col-md-8 ">
							<thead>
								<tr>
									<th style="width:20%;">Committer name</th>
									<th style="width:25%;">Commit Id</th>
									<th style="">Message</th>
									<th style="width:20%;" class="text-right">Timestamp</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items='${loger}' var='logs'>
									<tr>
										<td class="text-capitalize"><c:out value='${logs.getCommitterIdent().getName()}' /></td>
										<td><c:out value='${logs.name()}' /></td>
										<td><c:out value='${logs.getFullMessage()}' /></td>
										<td class="text-right">
									<jsp:useBean id="dateValue129" class="java.util.Date" />
								<jsp:setProperty name="dateValue129" property="time" value="${logs.getCommitterIdent().getWhen().getTime()}" /> 
								<fmt:formatDate value="${dateValue129}" pattern="${timestamp}" />
										</td>
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
	<script>
		function goBack() {
			window.history.back();
		}
	</script>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
</body>
</html>