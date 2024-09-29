<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>
<main id="main-container"> 
					<c:choose>
						<c:when test="${isupdated}">
								<div class="modal fade" id="memberModal" tabindex="-1"
									role="dialog" aria-labelledby="memberModalLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header block-header block-header-default">
												<h4 class="modal-title block-title col-md-12 pl-0 pr-0 "
													id="memberModalLabel">
													Update Status
												</h4>

											</div>
											<div class="modal-body">
												<span>Updated successfully!</span>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-alt-danger"
													data-dismiss="modal" data-toggle="click-ripple">Close</button>
											</div>
										</div>
									</div>
								</div>
							</c:when>
						</c:choose>
		<div class="content">
						<div class="block block-bordered">
							<div class="block-header block-header-default">
								<h3 class="block-title font-w600">
									Local Disk Space Management<br><small>This functionality will free up local disk space by cleaning up unused/idle remote repository contents on local disk. If a repository is active, no clean up will be performed. If a repository is unused beyond the configured number of days, Falcon Deploy will remove it to free up space on local disk. The remote repository will be cloned the next time it is used. Scheduler will run every day at 3:00 A.M</small>
								</h3>
							<!-- 	<div class="block-options xs-text-right">
									<button type="submit" class="btn btn-primary" id="val"  data-toggle="click-ripple">Next</button>
								</div> -->
							</div>
							<div class="col-md-12">
						<ul class="bg-none padding-left-0 breadcrumb mb-0">
							<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
							<li class="breadcrumb-item active">Local Disk Space Management</li>
						</ul>
					</div>
<br><br>
		<form method="post" action="${pageContext.request.contextPath}/updateTouchDownDays">
		<div class=" form-group row required ">
							<label class="col-md-6 col-lg-5 control-label text-right pr-0" for="rle"><b>Idle time in Days : </b></label>
							<div class="col-md-2">
								<select class="custom-select" name="days" required >
								<option <c:if test="${LOCAL_DISK_SPACE_MANAGEMENT=='2'}">selected</c:if>value="2">2</option>
								<option <c:if test="${LOCAL_DISK_SPACE_MANAGEMENT=='3'}">selected</c:if> value="3">3</option>
								<option <c:if test="${LOCAL_DISK_SPACE_MANAGEMENT=='4'}">selected</c:if> value="4">4</option>
								<option <c:if test="${LOCAL_DISK_SPACE_MANAGEMENT=='5'}">selected</c:if> value="5">5</option>	
								<option <c:if test="${LOCAL_DISK_SPACE_MANAGEMENT=='6'}">selected</c:if> value="6">6</option>
								<option <c:if test="${LOCAL_DISK_SPACE_MANAGEMENT=='7'}">selected</c:if> value="7">7</option>
								<option <c:if test="${LOCAL_DISK_SPACE_MANAGEMENT=='8'}">selected</c:if> value="8">8</option>
								<option <c:if test="${LOCAL_DISK_SPACE_MANAGEMENT=='9'}">selected</c:if> value="9">9</option>
								<option <c:if test="${LOCAL_DISK_SPACE_MANAGEMENT=='10'}">selected</c:if> value="10">10</option>
							</select>
							</div>
							<div class="col-md-3 xs-mt-5 xs-text-center sm-mt-10">
								<button id="submit" class="btn  btn-primary mr-sm-2" data-toggle="click-ripple" type="submit">Update</button>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
							</div>
			</div>
		</form>
<br><br>
</div>
<div id="dialog-confirm">
		<p id="textForDialog"></p>
</div>
</div>
			<!-- END Page Content -->
		</main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
		<script src="static/js/plugins/multiselect.min.js"></script>
		<c:choose>
		<c:when test="${isupdated}">
		<script>
		 $(window).on('load',function(){
			    $('#memberModal').modal('show');
			});
		</script>
		
		</c:when>
	</c:choose>	
</body>
</html>
