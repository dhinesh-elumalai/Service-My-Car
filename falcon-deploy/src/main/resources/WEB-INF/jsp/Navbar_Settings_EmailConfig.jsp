<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<!-- <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet"> -->
 <style type="text/css">
     .css-switch .css-control-input~.css-control-indicator {
     background-color: #b7b2b2;
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

		<main id="main-container"> <!-- Page Content -->
		<div class="content">
			<div class="">
				<div class="block block-bordered">
					<div class="block-header block-header-default">
						<h3  class="block-title text-uppercase">Email Configuration</h3>
					</div>
	<div class="col-md-12">
		<ul class="bg-none padding-left-0 breadcrumb mb-0">
			<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
			<li class="breadcrumb-item active">Email Configuration</li>
		</ul>
	</div>

<div>
<form novalidate method="post" action="${pageContext.request.contextPath}/updateEmailConfig" class="pt-50 pb-50 xs-pr-15 xs-pl-15 sm-pr-15 sm-pl-15" id="email-config">
<div class="col-md-12 form-group  text-right">
         <label class="css-control css-control-sm  css-control-primary css-switch">
              <input type="checkbox" class="css-control-input" id="changeForm" name="ntlmcheck" <c:choose><c:when test="${ntlm}">value="true" checked</c:when><c:otherwise>value="false"</c:otherwise></c:choose>>
                   <span class="css-control-indicator"></span><span id="toggleForm">NTLM Credential (Exchange server)</span>
                </label>
 </div>
<div class="form-group row">
	     <label class="col-md-3 control-label text-right" for="ln"><b>Host:</b></label>
	     <div class="col-md-8 col-lg-6">
	          <input id="Host" name="Host" value="${host}" autocomplete="off" type="text"  class="form-control input-md" required autocomplete="off">
	     </div>
	</div>
<div class="form-group row">
	     <label class="col-md-3 control-label text-right" for="ln"><b>Port:</b></label>
	     <div class="col-md-8 col-lg-6">
	          <input id="Port" name="Port" value="${port}" autocomplete="off" type="number"  class="form-control input-md" required autocomplete="off">
	     </div>
	</div>



<div class="form-group row">
	     <label class="col-md-3 control-label text-right" for="ln"><b>Authentication:</b></label>
	            <div class="col-md-8 col-lg-6">
	                      <div class="">
                                        <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="auth" value="none" <c:if test='${!authReq}'>checked</c:if> >
                                                <span class="css-control-indicator"></span> NONE
                                            </label>
                                            <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="auth" value="req" <c:if test='${authReq}'>checked</c:if>>
                                                <span class="css-control-indicator"></span> Required
                                            </label>	  
                               </div>
                     </div>
	</div>
	
<div class="form-group row" <c:if test='${!authReq}'>style="display: none;"</c:if> id="userDiv">
	     <label class="col-md-3 control-label text-right" for="ln"><b>User email:</b></label>
	     <div class="col-md-8 col-lg-6">
	          <input id="Username" name="Username" autocomplete="off" value="${username}" type="text"  class="form-control input-md" required autocomplete="off">
	     </div>
	</div>


<div class="form-group row" id="passDiv">
	     <label class="col-md-3 control-label text-right" for="ln"><b>Password:</b></label>
	     <div class="col-md-8 col-lg-6">
	          <input id="Password" name="Password" autocomplete="off" type="password"  class="form-control input-md" required autocomplete="off">
	     </div>
	</div>
	
<div class="form-group row" id="NTLMDiv" 	<c:if test="${!ntlm}">style="display:none"</c:if>>
	     <label class="col-lg-3 control-label text-right" for="NTLM"><b>NTLM domain:</b></label>
	     <div class="col-md-8 col-lg-6">
	          <input id="NTLM" name="NTLMDOMAIN" autocomplete="off" <c:if test='${ntlmdomain!="null"}'>value="${ntlmdomain}"</c:if> class="form-control input-md" required autocomplete="off">
	     </div>
</div>
<div class="form-group row" id="NTLMUserDiv" <c:if test="${!ntlm}">style="display:none"</c:if>>
	     <label class="col-lg-3 control-label text-right" for="NTLMUSER"><b>NTLM user:</b></label>
	     <div class="col-md-8 col-lg-6">
	          <input id="NTLMUSER" name="NTLMUSER" autocomplete="off" <c:if test='${ntlmuser!="null"}'>value="${ntlmuser}"</c:if> class="form-control input-md" required autocomplete="off">
	     </div>
	</div>
	
		
<div class="form-group row">
	     <label class="col-md-3 control-label text-right" for="ln"><b>Security:</b></label>
	     <div class="col-md-8 col-lg-6">
                              <div class="">
                                            <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="security" value="none" <c:if test='${noSec}'>checked</c:if>>
                                                <span class="css-control-indicator"></span> NONE
                                            </label>
                                            <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="security" value="ssl" <c:if test='${sslReq}'>checked</c:if>>
                                                <span class="css-control-indicator"></span> SSL
                                            </label>
                                             <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="security" value="tls" <c:if test='${tlsReq}'>checked</c:if>>
                                                <span class="css-control-indicator"></span> TLS
                                            </label>
                                        </div>	    
        </div>
</div>
<div class="col-md-6 offset-md-3"> 

<div class="form-group">
  <label class="col-md-4 control-label" for="submit"></label>
  <div class="col-md-12 text-center">  
    <button type="button" class="btn btn-primary text-right mr-md-2 xs-ml-5"  id="validate" data-toggle="click-ripple"> Validate</button>
    <button type="submit" id="FormSubmit" class="btn btn-primary" disabled data-toggle="click-ripple">Submit</button>
  </div>
</div>
</div>

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</div>

			
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header block-header block-header-default">
        
        <h4 class="modal-title block-title " id="myModalLabel">Result</h4>
      </div>
      <div class="modal-body">
       <p id="status"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-alt-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
				</div>
			</div>
			</div>
							
		</main>
	</div>

	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>

 	<c:if test="${not empty updatedMSG}">
		<script>
 $(window).on('load',function(){
	 $('#status').text('${updatedMSG}');
     $('#myModal').modal('show');
});

</script>
	</c:if> 

		<script type="text/javascript">
    $('input[type=radio][name=security]').change(function() {
   	 $('#FormSubmit').prop("disabled",true); 
   });

   $('input[type=radio][name=auth]').change(function() {
   	 $('#FormSubmit').prop("disabled",true); 
       if (this.value == 'none') {
         $("#passDiv").hide();
         $("#userDiv").hide(); 
         $('[name="Username"]').val(''); 
     	  $('[name="Password"]').val(''); 
       }
       else if (this.value == 'req') {
           $("#passDiv").show();
           $("#userDiv").show();  
       }
   });
   $('#Host').keyup(function(){
   	$("#host-small").hide();
   	$('#FormSubmit').prop("disabled",true); 
   });
   $('#Port').keyup(function(){
   	   $("#port-small").hide();
   	   $('#FormSubmit').prop("disabled",true); 
   });

   $('#Username').keyup(function(){
   	   $('#FormSubmit').prop("disabled",true); 
   });
   $('#Password').keyup(function(){
   	   $('#FormSubmit').prop("disabled",true); 
   });
       $(document).ready(function(){
   	    $("#validate").on('click', function postinput(){
   	    	
   	    	var host=$('[name="Host"]').val(); 
   	    	var port=$('[name="Port"]').val(); 
   	    	var username=$('[name="Username"]').val(); 
   	    	var password=$('[name="Password"]').val(); 
   	    	var security=$('[name="security"]:checked').val(); 
   	    	var auth=$('[name="auth"]:checked').val(); 
  	    	var toggle=$("#changeForm").is(":checked");
	    	var ntlmdomain=$("#NTLM").val();
	    	var ntlmuser=$("#NTLMUSER").val();
   	if(host.length>0&&port.length>0)
   		{
   		$("#preloader").show();
   	        $.ajax({ 
   	            url: 'validate_email',
 	            data: {host:host,port:port,username:username,password:password,security:security,auth:auth,ntlm:toggle,ntlmdomain:ntlmdomain,ntlmuser:ntlmuser},
   	            type: 'get'
   	        }).done(function(responseData) {   
   	        	if(responseData=='Success')
   	        		{
   	        		$('#FormSubmit').removeAttr("disabled");	
   	 	           $('#status').text("Validation Successful!");
   	        		}
   	        	else
   	        		{
   	 	           $('#status').text(responseData);	
   	        		}
   	           $("#preloader").hide();

   	           $('#myModal').modal('show');
   	         }).fail(function() {
   	            console.log('Failed');
   	            $('#status').text("There is some network issue.Please check your internet access.");
   		           $('#myModal').modal('show');
   		           $("#preloader").hide();
   	        });
   		}
   	else
   		{
   		if(host.length==0)
   			$("#host-small").show();
   		if(port.length==0)
   			$("#port-small").show();
   		 $('#FormSubmit').prop("disabled",true);
   		}
   	    });
   	    
   	   
   	});
       $("#changeForm").change(function() {
    	    if($(this).is(":checked")) {
    	    	$("#NTLMDiv").show();
    	    	$("#NTLMUserDiv").show();
    	    	$(this).val('true');
    	    }
    	    else
    	    	{
    	    	$(this).val('false');
    	    	$('#NTLM').val('');
    	    	$('#NTLMUSER').val('');
    	    	$("#NTLMDiv").hide();
    	    	$("#NTLMUserDiv").hide();
    	    	}
    	});  
    </script>
	

</body>
</html>