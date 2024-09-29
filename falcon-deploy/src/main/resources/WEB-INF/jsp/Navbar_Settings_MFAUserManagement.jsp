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
		<div class="content">
			<div class="">
				<div class="block block-bordered">
					<div class="block-header block-header-default">
						<h3 class="block-title">MFA USER MANAGEMENT</h3>
						
					</div>
					
					<div class="" id="fixedSet">
						<div class="block-header">
							<div class="col-md-5 pl-0 xs-mb-5">
								<div class="">
									<div class="input-group">
										<span class="input-group-addon fa fa-search search1"
											style="top: 10px"></span> <input id="SearchUserName"
											class=" form-control t-indent-10" name="SearchName"
											type="text"
											placeholder="Search by email or first name or last name "
											autocomplete="off">
									</div>
								</div>

							</div>
						</div>

				
						<div class="block col-12">
							<div class="no-data text-center" id="emptyDataajax" style="display: none;">
									<p>There is no data to display.</p>
							</div>
							<div class=" table-responsive">
							 <div id="data-loader" class="loader-height" style="display: none;">
 									<div style="display:table-cell; vertical-align:middle;">
 										<i class="fa fa-2x fa-cog fa-spin" style="color:#324a7e"></i>
									<p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
 									</div>
						     </div>
								<table class="table table-striped table-bordered text-left sm-width-1000">
									<thead id="thead">
										<tr>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Email Id</th>
											<th class="text-center">MFA status</th>
											<th>MFA Secret Key</th>
											<th class="text-center">Action</th>
										</tr>
									</thead>
									<tbody id="jsp_loaded_data">
										<c:forEach var="user" items="${page.content}">
											<tr>
												<td class="text-capitalize">${user.firstName}</td>
												<td class="text-capitalize">${user.lastName}</td>
												<td>${user.email}</td>
												<td class="text-center">
													<c:if test="${user.getMfaLocked()}"><span class="badge badge-warning" style="background-color:#f1a564;">Locked</span></c:if>
													<c:if test="${!user.getMfaLocked()}"><span class="badge badge-success">Active</span></c:if>
												</td>
												<c:set var = "string1" value = "${decrypt.decrypt(user.getTotpSecret())}"/>
      											<c:set var = "string2" value = "${fn:substring(string1, fn:length(string1)-4, fn:length(string1))}" />
												<td>XXXXXXXXXX${string2}</td>
												<td class="text-center"><a href="/edit-mfa-user?id=${user.id}"><span class="fa fa-pencil-square-o" style="font-size:18px;"></span></a></td>
											</tr>
										</c:forEach>
									</tbody>
									<tbody id="Ajax_loaded_data">
									</tbody>
								</table>
							</div>
							<div class="container-fluid " id="pagination_div">
                                <div class="row">
                                	<nav aria-label="Page navigation">
                                     <ul class="pagination mt-10 flex-wrap" id="pagination"></ul>
                                 </nav>
                                </div>
                           </div>
						</div>
							
				
						<c:choose>
							<c:when
								test="${not empty updateStatus||not empty deleteStatus||not empty signup_status||not empty MFAlockReleaseStatus}">
								<div class="modal fade" id="memberModal" tabindex="-1"
									role="dialog" aria-labelledby="memberModalLabel"
									aria-hidden="true">
									<div class="modal-dialog  ">
										<div class="modal-content">
											<div class="modal-header block-header block-header-default">
											
												<h4 class="modal-title col-md-12 block-title"
													id="memberModalLabel">
													<c:if test="${not empty updateStatus}"> User Account</c:if>
													<c:if test="${not empty MFAlockReleaseStatus}">User Account</c:if>
													<c:if test="${not empty signup_status}">User Account</c:if>
												</h4>
											</div>
											<div class="modal-body">
												<div class="block-content text-center">
													<p>
														<c:if test="${not empty updateStatus}">User account updated successfully <br> <span class="mark">${firstName} ${lastName} - ${email}</span></c:if>
														
														<c:if test="${not empty signup_status}">User account created successfully <br> <span class="mark">${firstName} ${lastName} - ${email}</span></c:if>
														
													  <c:if test="${not empty MFAlockReleaseStatus}">User account released form MFA lock successfully <br> <span class="mark">${firstName} ${lastName} - ${email}</span></c:if>
														
													</p>
													<div class="text-center">
														<c:if test="${not empty signup_status}">
															<a href="${pageContext.request.contextPath}/newuser">
																<button class="btn btn-primary">Create another user</button>
															</a>
														</c:if>
														<a href="${pageContext.request.contextPath}/dashboard">
															<button class="btn btn-primary">Go to homepage</button>
														</a>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button"
													class="btn  btn-alt-success"
													data-dismiss="modal" >Close</button>
											</div>
										</div>
									</div>
								</div>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
			<div id="dialog-confirm">
				<p id="textForDialog"></p>
			</div>
		</div>
		</main>
	</div>

	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/Navbar_Settings_MFAUserManagementJS.jsp"%>
		<script type="text/javascript">
    $(document).ready(function() {
    	displaySpinner();
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