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
						<h3 id="requestheader" class="block-title">MFA management</h3>
				    </div>	
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
					<form class="form-horizontal mt-30 mb-30 col-md-12" action=<c:url value='update_MFA_Config' /> method="post"  autocomplete="off" >
							<fieldset>

								<div class="form-group row">
									<label class="col-md-4 control-label text-right" for="fn"><b>Retry count :</b></label>
									<div class="col-md-6 col-lg-4">
										<input id="fn" name="retrycount" type="number" placeholder="" value="${MFAcount}" class="form-control input-md" autocomplete="off" >
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-4 control-label text-right" for="fn"><b>Lock hours :</b></label>
									<div class="col-md-6 col-lg-4">
										<input id="fn" name="MFAlockhour" type="number" placeholder="" value="${MFAlockhour}" class="form-control input-md" autocomplete="off" >
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-4 control-label text-right" for="status"><b>MFA :</b></label>
									<div class="col-md-6  xs-mt-5">
										<div class="form-inline">
												<label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" value="true" name="status" <c:if test="${isMFAenabled==true}">checked</c:if>>
                                                <span class="css-control-indicator"></span> Enable
                                            </label>
                                            <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" value="false" name="status" <c:if test="${isMFAenabled==false}">checked</c:if>>
                                                <span class="css-control-indicator"></span> Disable
                                            </label>
											</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-8 offset-md-2 text-center">
										<button type="submit" class="btn btn-primary mr-sm-2"  data-toggle="click-ripple">Submit</button>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</div>
								</div>
							</fieldset>
						</form>
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
												<th>${event.user.firstName} ${event.user.lastName} - ${event.user.email}</th>
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