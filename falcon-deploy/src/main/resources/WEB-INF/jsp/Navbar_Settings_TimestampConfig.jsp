<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
<div id="preloader">
        <i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
       <p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
</div>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
	<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
	<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

 <main id="main-container">
 <div class="content">

 <div class="block block-bordered">
                <!-- Page Content -->
                <div class="">
	<div class="row">
			<div class="col-md-12">
			<div class="block-header block-header-default "><h5 class="block-title text-uppercase">Timestamp Configuration</h5>
			</div>
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

			</div></div>
			
				
			<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active">Timestamp Configuration</li>
							</ul>
						</div>
		
			<div class="container height-300 col-lg-12" id="fixedSet">
					<h6 class="text-center" style="color: green;">Current timeStamp format is  <span style="color: red;">${selctedTimestamp}</span></h6>
					
						<form class="form-horizontal" action=<c:url value='save_selected_timestamp' /> method="post">
						<div class=" form-group row required ">
							<label class="col-md-4 col-lg-3 control-label text-right pr-0" for="rle"><b>Select desired timestamp format:</b></label>
							<div class="col-md-5 col-lg-6 pr-0 xs-pr-15">
								<select class="  custom-select" name="format" required >
								<option <c:if test="${selctedTimestamp=='MM/dd/yyyy hh:mm:ss aaa'}">selected</c:if>value="MM/dd/yyyy hh:mm:ss aaa">MM/dd/yyyy hh:mm:ss aaa      		 &emsp;Example:- 01/31/1990 11:00:00 PM</option>
								<option <c:if test="${selctedTimestamp=='MM-dd-yyyy hh:mm:ss aaa'}">selected</c:if> value="MM-dd-yyyy hh:mm:ss aaa">MM-dd-yyyy hh:mm:ss aaa         	 &emsp;Example:-  01-31-1990 11:00:00 PM</option>
								<option <c:if test="${selctedTimestamp=='MM/dd/yyyy HH:mm:ss'}">selected</c:if> value="MM/dd/yyyy HH:mm:ss">MM/dd/yyyy HH:mm:ss 		     		 &emsp;Example:- 01/31/1990 23:00:00</option>
								<option <c:if test="${selctedTimestamp=='MM-dd-yyyy HH:mm:ss'}">selected</c:if> value="MM-dd-yyyy HH:mm:ss">MM/dd/yyyy HH:mm:ss 		     		 &emsp;Example:- 01-31-1990 23:00:00</option>	
								<option <c:if test="${selctedTimestamp=='MM/dd/yyyy hh:mm:ss aaa z'}">selected</c:if> value="MM/dd/yyyy hh:mm:ss aaa z">MM/dd/yyyy hh:mm:ss aaa z  		 &emsp;Example:- 01/31/1990 11:00:00 PM EST</option>
								<option <c:if test="${selctedTimestamp=='MM-dd-yyyy hh:mm:ss aaa z'}">selected</c:if> value="MM-dd-yyyy hh:mm:ss aaa z">MM-dd-yyyy hh:mm:ss aaa z  		 &emsp;Example:- 01-31-1990 11:00:00 PM EST</option>
								<option <c:if test="${selctedTimestamp=='MM/dd/yyyy HH:mm:ss z'}">selected</c:if> value="MM/dd/yyyy HH:mm:ss z">MM/dd/yyyy HH:mm:ss z          		 &emsp;Example:-  01/31/1990 23:00:00 EST</option>
								<option <c:if test="${selctedTimestamp=='MM-dd-yyyy HH:mm:ss z'}">selected</c:if> value="MM-dd-yyyy HH:mm:ss z">MM-dd-yyyy HH:mm:ss z          		 &emsp;Example:- 01/31/1990 23:00:00 EST</option>
								<option <c:if test="${selctedTimestamp=='dd MMMM yyyy hh:mm:ss aaa'}">selected</c:if> value="dd MMMM yyyy hh:mm:ss aaa">dd MMMM yyyy hh:mm:ss aaa   		 &emsp;Example:- 31 January 1990 11:00:00 PM </option>
								<option <c:if test="${selctedTimestamp=='dd MMMM yyyy HH:mm:ss'}">selected</c:if> value="dd MMMM yyyy HH:mm:ss">dd MMMM yyyy HH:mm:ss         		 &emsp;Example:- 31 January 1990 23:00:00</option>
								<option <c:if test="${selctedTimestamp=='dd MMM yyyy hh:mm:ss aaa'}">selected</c:if> value="dd MMM yyyy hh:mm:ss aaa">dd MMM yyyy hh:mm:ss aaa    		 &emsp;Example:- 31 Jan 1990 11:00:00 PM </option>
								<option <c:if test="${selctedTimestamp=='dd MMM yyyy HH:mm:ss'}">selected</c:if> value="dd MMM yyyy HH:mm:ss">dd MMM yyyy HH:mm:ss           		 &emsp;Example:- 31 Jan 1990 23:00:00</option>
								<option <c:if test="${selctedTimestamp=='E, dd MMM yyyy hh:mm:ss aaa z'}">selected</c:if> value="E, dd MMM yyyy hh:mm:ss aaa z">E, dd MMM yyyy hh:mm:ss aaa z  &emsp;Example:- Thu, 31 Feb 1990 11:00:00 PM EST</option>
								<option <c:if test="${selctedTimestamp=='E, dd MMM yyyy HH:mm:ss z'}">selected</c:if> value="E, dd MMM yyyy HH:mm:ss z">E, dd MMM yyyy HH:mm:ss z          &emsp;Example:- Thu, 31 Feb 1990 23:00:00 EST</option>

							</select>
							</div>
							<div class="col-md-3 xs-mt-5 xs-text-center sm-mt-10">
								<button id="submit" class="btn  btn-primary mr-sm-2" data-toggle="click-ripple">
									Update</button>
									<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
								
							</div>
						</div>
						<br>
							
						</form>
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
