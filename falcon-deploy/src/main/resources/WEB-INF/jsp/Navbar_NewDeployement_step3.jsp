<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<style>
.ui-helper {
    width: 100% !important;
}
.ui-sortable-helper {
    display: table!important;
}
.placeholder-style{
  background-color: white!important;
  height:80px!important;
}
</style>
<body>
<div id="preloader">
        <i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
       <p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
</div>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>
		
	  <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header block-header block-header-default">
								<h4 class="modal-title block-title" id="myModalLabel">Result</h4>
							</div>
							<div class="modal-body">
								<p id="status"></p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn btn-alt-danger" id="closebtnmodal" data-dismiss="modal" data-toggle="click-ripple">Close</button>
							</div>
						</div>
					</div>
	      </div>
	      <!--Jquery will dynamically add contents here...  -->
	     <div class="modal fade" id="changeUN" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

	      </div>
		<main id="main-container"> 
		<div class="content">
			<div class="block block-bordered">
				<div class="block-header block-header-default">
					<h3 class="block-title font-w600">
						DEPLOYMENT - ${repoName}
					</h3>
					<div class="block-options xs-text-right">
					<form action="${pageContext.request.contextPath}/updateDeployRequestRollbackFiles" method="post">
					<input type="hidden" name="reponame" value='${repoName}'>
					<input type="hidden" name="reqid" value='${requestId}'>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<button class="btn btn-primary" type="submit" data-toggle="click-ripple">Previous</button>
					<button type="button" class="btn btn-primary" onclick="submitAll()" data-toggle="click-ripple">Next</button>
					<a href="${pageContext.request.contextPath}/deleteRequest?reqid=${requestId}"><button class="btn btn-danger" type="button" data-toggle="click-ripple">Cancel</button></a>
					</form>	
					</div>
				</div>
				<div class="col-md-12 mt-15">
					<div class="block block-bordered ">
						<div class="block-header block-header-default">
							<h3 class="block-title">Select Database</h3>
						</div>
						<div class="block-content pb-20">
						<c:forEach items="${dbList}" var="db">
							<div class="col-md-12 ">
								<label class="css-control css-control-primary css-control-sm css-checkbox">
									<input type="checkbox" value="${db.getId()}---${db.getLink()}---${db.showCredentialViewOnDeployRequest}" class="chkbox css-control-input" id="section-hider"> <span class="css-control-indicator"></span>
									${db.getLink()}
								</label>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!--Contents will be added dynamically here using jquery  -->
				<div class="box-hider" id="add">

				</div>
			</div>
		</div>
		<!-- END Page Content --> </main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/Navbar_NewDeployement_step3JS.jsp"%>
</body>
</html>
