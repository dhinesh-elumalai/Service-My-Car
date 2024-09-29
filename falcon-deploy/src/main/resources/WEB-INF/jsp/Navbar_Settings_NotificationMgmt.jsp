<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<!-- <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet"> -->

<body>
<div id="preloader">
        <i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
       <p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
</div>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

		<main id="main-container"> <!-- Page Content -->
		
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
			<div class="">
				<div class="block block-bordered">
					<div class="block-header block-header-default">
						<h3 id="requestheader" class="block-title ">NOTIFICATION MANAGEMENT<br>
						<small>(Falcon Deploy sends deployment-related email notifications. The administrators and deployment requestor get notified by default. In this page, you can choose to include all users with access to the repository to get notified on deployment requests created from an application repository to which they have access.)</small></h3>
					</div>
					<div class="col-md-12">
						<ul class="bg-none padding-left-0 breadcrumb mb-0">
							<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
							<li class="breadcrumb-item active">Notification Management</li>
						</ul>
					</div>


					<div class="">
						<div class="">
<form method="post" action="${pageContext.request.contextPath}/updateNotify">
<div class="col-md-7 offset-md-3"> 
<div class="form-group row mt-50">
	     <label class="col-lg-2 col-md-3 pr-0 col-form-label text-right" for="ln" style="    margin-top: 8px;">Notify to:</label>
	     <div class="col-lg-10 col-md-9 col-form-label pl-0">
	     <div class="col-12">
               <div class="custom-control custom-checkbox custom-control-inline mb-5">
                     <input class="custom-control-input" type="checkbox" id="example-inline-checkbox1"  disabled checked>
                      <label class="custom-control-label" for="example-inline-checkbox1" style="padding-top:3px">Admin</label>
                </div>
                 <div class="custom-control custom-checkbox custom-control-inline mb-5">
                        <input class="custom-control-input" type="checkbox" id="example-inline-checkbox2"  disabled checked>
                        <label class="custom-control-label" for="example-inline-checkbox2" style="padding-top:3px">Requestor</label>
                </div>
                 <div class="custom-control custom-checkbox custom-control-inline mb-5">
                       <input class="custom-control-input" type="checkbox"  id="example-inline-checkbox3" value="true" name="checked"<c:if test='${checked}'>checked</c:if> >
                        <label class="custom-control-label" for="example-inline-checkbox3" style="padding-top:3px">All users with access to repo</label>
                 </div>
          </div>
                                  
        </div>
</div>
<div class="form-group">
  
  <div class="col-md-12 text-center">  
    <button type="submit" id="FormSubmit" class="btn btn-primary" data-toggle="click-ripple">Update</button>
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  </div>
</div>
</div>
</form>
						</div>
						

					</div>
					<div class="container-fluid">
    <nav aria-label="Page navigation">
        <ul class="pagination" id="pagination"></ul>
    </nav>
</div>
				</div>
			</div>
			</div>
		</main>
	</div>

	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
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