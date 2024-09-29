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
	<div class="row">
			<div class="col-md-12">
			<div class="block-header block-header-default "><h5 class="block-title">Show DB Descriptor Configuration
			<br><small>Show database connection descriptor in mapping page.</small>
			</h5>
			
			</div>
			
			</div></div>
			<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active">Show DB Descriptor Configuration</li>
							</ul>
			</div>
			 <c:choose>
			<c:when test="${updateStatus=='SUCCESS'}">
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
<div class="container">
<div class="col-md-12" id="fixedSet">
						<form method="post" action="${pageContext.request.contextPath}/SubmitDescriptorConfiguration" class="pt-50 pb-50 xs-pr-15 xs-pl-15 sm-pr-15 sm-pl-15"
							id="disp_config">
							<div class="col-md-4"></div>
							<div class="col-md-8 form-group  ml-auto">
											<label class=" control-label">Display Connection Descriptor : &nbsp;</label>  
                                            <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="dispCheck" value="true" <c:if test='${ischecked}'>checked</c:if>>
                                                <span class="css-control-indicator"></span> SHOW
                                            </label>
                                             <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="dispCheck" value="false" <c:if test='${!ischecked}'>checked</c:if>>
                                                <span class="css-control-indicator"></span> HIDE
                                            </label>
							</div>
							<div class="col-md-7 offset-md-3">
								<div class="form-group">
									<label class="col-md-5 control-label" for="submit"></label>
									<div class="col-md-7 text-center">
										<button type="submit" id="FormSubmit" class="btn btn-primary"
											data-toggle="click-ripple">Submit</button>
									</div>
								</div>
							</div>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
						<div id="dialog-confirm">
							<p id="textForDialog"></p>
						</div>
			</div>
		</div>
	</div>
	</div>
	</main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
<script type="text/javascript">
$(document).on('click', '#FormSubmit', function(e) {
    e.preventDefault(); 
    $('#textForDialog').text('Are you sure you want to change?'); 
    $('#deleteRepo').modal('hide');

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
    	            	   $('#disp_config').submit();
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

</script>	
	<c:choose>
		<c:when test="${updateStatus=='SUCCESS'}">
		<script>
		 $(window).on('load',function(){
			    $('#memberModal').modal('show');
			});
		</script>
		
		</c:when>
	</c:choose>	
</body>
</html>