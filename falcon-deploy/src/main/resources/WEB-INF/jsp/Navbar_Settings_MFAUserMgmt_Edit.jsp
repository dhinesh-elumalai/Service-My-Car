<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<body>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

		<main id="main-container"> 
		<div class="content">
			<div class="">
				<div class="block block-bordered">
					<div class="block-header block-header-default">
					 <sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
						<h3 id="requestheader" class="block-title">MFA edit user
						</h3>
					</sec:authorize>
					<sec:authorize access="hasAnyAuthority('TEAM_ADMIN','USER')">
						<h3 id="requestheader" class="block-title">MFA configuration
						</h3>
					</sec:authorize>
				    </div>	
				    <sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
				    <div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb">
								<li class="breadcrumb-item"><a href="/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item">
									<a href="/MFA_User_management"> MFA User Management</a>
								</li>
								<li class="breadcrumb-item active">Edit User</li>
							</ul>
						</div>
						</sec:authorize>
				    <c:choose>
						<c:when test="${isupdated||resetted}">
								<div class="modal fade" id="memberModal" tabindex="-1"
									role="dialog" aria-labelledby="memberModalLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header block-header block-header-default">
												<h4 class="modal-title block-title col-md-12 pl-0 pr-0 "
													id="memberModalLabel">
													 Status
												</h4>

											</div>
											<div class="modal-body">
											<c:if test="${resetted}">
												<span>MFA key reset successfully!</span>
												</c:if>
												<c:if test="${isupdated}">
												<span>User account unlocked successfully!</span>
												</c:if>
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
							<fieldset style="margin-top: 40px;">
								  <div class="form-group row">
                                        <label class="col-md-4 control-label text-right" for="email">Firstname :</label>
                                        <div class="col-md-6 col-lg-4 text-center">
                                        <input type="text"  class="form-control" value="${user.firstName}" readonly required > 
                                        </div>
                                    </div>
                                      <div class="form-group row">
                                        <label class="col-md-4 control-label text-right" for="email">Lastname :</label>
                                        <div class="col-md-6 col-lg-4 text-center">
                                        <input type="text" class="form-control" value="${user.lastName}" readonly required > 
                                        </div>
                                    </div>
                                      <div class="form-group row">
                                        <label class="col-md-4 control-label text-right" for="email">Email :</label>
                                        <div class="col-md-6 col-lg-4 text-center">
                                        <input type="text" class="form-control" value="${user.email}" readonly required > 
                                        </div>
                                    </div>
                                      <div class="form-group row">
                                        <label class="col-md-4 control-label text-right" for="email">Status :</label>
                                        <div class="col-md-6 col-lg-4 text-left">
                                        <c:if test="${user.getMfaLocked()}"><span class="badge badge-warning" style="margin-top: 7px;background-color:#f1a564;">Locked</span></c:if>
										<c:if test="${!user.getMfaLocked()}"><span class="badge badge-success" style="margin-top: 7px;">Active</span></c:if>
										</div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-4 control-label text-right" for="email">Secret Key :</label>
                                        <div class="col-md-6 col-lg-4 text-center">
                                        <c:set var = "string1" value = "${decrypt.decrypt(user.getTotpSecret())}"/>
      									<c:set var = "string2" value = "${fn:substring(string1, fn:length(string1)-4, fn:length(string1))}" />
                                        <input type="text" class="form-control"  value="XXXXXXXXXX${string2}" readonly required > 
                                        </div>
                                    </div>
                                  
								<div class="form-group row">
									<label class="col-md-4 control-label text-right" for="fn"></label>
									<div class="col-md-6 col-lg-4 text-center">
							<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
							<c:if test="${user.getMfaLocked()}">
							<a href="${pageContext.request.contextPath}/releaselock_MFA_user?userid=${user.id}" id="releaselockbtn" class="btn btn-alt-success mr-sm-2" data-toggle="click-ripple">Unlock account</a>
						   	</c:if>
						   	</sec:authorize>
						   	<a href="${pageContext.request.contextPath}/resetTOTPKey?userid=${user.id}" id="resetTotpKey" class="btn btn-alt-primary mr-sm-2" data-toggle="click-ripple">Reset MFA secret key</a>
											
									</div>		
								</div>
								<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
								  <div class="mx-4 ">
                                    <p>
                                    If administrators receive a secret key reset email, check with the user directly before you reset the secret key. Upon reset, a new key will be generated and sent to the users email address. If the users email has been compromised, then generating a new key can be potentially dangerous as the user can now generate a new password and OTP.
                                   </p>
                                   </div>
                                   </sec:authorize>
							</fieldset>
					<c:if test="${content.size()!=0}">
						<div class="col-md-12">
						<div class="block-header  ">
							<h5 class="block-title text-uppercase">Audit Trail</h5>
						</div>
							<div class="card card-block" >
								<div class="table-responsive">
									<table id="myTable3" class="table table-striped table-bordered xs-width-1000 sm-width-1000">
									<thead id="thead">
										<tr>
											<th>Event</th>
											<th>Event Description</th>
											<th class="text-right">Event Timestamp</th>
											<th>User</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${content}" var="event">
											<tr>
												<th>${event.event}</th>
												<th>${event.eventDesc}</th>
												<th class="text-right">
												<jsp:useBean id="dateValue129" class="java.util.Date" /> 
												<jsp:setProperty name="dateValue129" property="time" value="${event.eventTimestamp.getTime()}" />
												 <fmt:formatDate value="${dateValue129}" pattern="${timestamp}" />
												</th>
												<th>${event.byUser.firstName} ${event.byUser.lastName} - ${event.byUser.email}</th>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								</div>
							</div>               
						</div>
					 </c:if>
				</div>
			</div>
			</div>
			<div id="dialog-confirm"><p id="textForDialog"></p></div>
		</main>
	</div>

	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
		<c:choose>
		<c:when test="${isupdated||resetted}">
		<script>
		 $(window).on('load',function(){
			    $('#memberModal').modal('show');
			});
		</script>
		</c:when>
	</c:choose>	
	<script>
	  $(function () {
		    $('#releaselockbtn').on("click", function (e) {
		        var link = this;
		        $('#textForDialog').text('Are you sure you want to unlock user account?'); 
		        e.preventDefault();
		       
		        $('#dialog-confirm').dialog({
		        	resizable: false,
		            height: 200,
		            width: 400,
		            fluid: true,
		            modal: true,
		            open: function() {
		                $('.ui-widget-overlay').addClass('custom-overlay');
		                $('.ui-widget-header').css({ 'background-color': 'rgb(245, 245, 245)' });
	    	            $('.ui-dialog-titlebar').css({ 'background-color': 'rgb(245, 245, 245)' });
		            },
		            close: function() {
		                $('.ui-widget-overlay').removeClass('custom-overlay');
		            },     
		        	 buttons: [
		        	           {
		        	               text: "Ok",
		        	               "class": ' btn btn-sm btn-alt-success',
		        	               click: function() {
		        	            	   window.location = link.href;
		        	                    $(this).dialog("close");
		        	               }
		        	           },
		        	           {
		        	               text: "Cancel",
		        	               "class": ' btn btn-sm btn-alt-danger',
		        	               click: function() {
		        	            	   $(this).dialog("close");
		        	               }
		        	           }
		        	 ]	

		        }); 
		    });
		});
	  $(function () {
		    $('#resetTotpKey').on("click", function (e) {
		        var link = this;
		        $('#textForDialog').text('Are you sure you want to reset MFA secret key for this User?'); 
		        e.preventDefault();
		       
		        $('#dialog-confirm').dialog({
		        	resizable: false,
		            height: 200,
		            width: 400,
		            fluid: true,
		            modal: true,
		            open: function() {
		                $('.ui-widget-overlay').addClass('custom-overlay');
		                $('.ui-widget-header').css({ 'background-color': 'rgb(245, 245, 245)' });
	    	            $('.ui-dialog-titlebar').css({ 'background-color': 'rgb(245, 245, 245)' });
		            },
		            close: function() {
		                $('.ui-widget-overlay').removeClass('custom-overlay');
		            },     
		        	 buttons: [
		        	           {
		        	               text: "Ok",
		        	               "class": ' btn btn-sm btn-alt-success',
		        	               click: function() {
		        	            	   window.location = link.href;
		        	                    $(this).dialog("close");
		        	               }
		        	           },
		        	           {
		        	               text: "Cancel",
		        	               "class": ' btn btn-sm btn-alt-danger',
		        	               click: function() {
		        	            	   $(this).dialog("close");
		        	               }
		        	           }
		        	 ]	

		        }); 
		    });
		});
	  
	</script>
	
</body>
</html>