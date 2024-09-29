
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jstl/core_rt" %>

<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache"> 
    <meta http-equiv="Cache-Control" content="no-cache"> 
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
    <title>Falcon Deploy Server Config</title>
     <link href="${pageContext.request.contextPath}/static/css/themes/falcon.min.css" rel="stylesheet">
    <%-- <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet"> --%>  
    <link href="${pageContext.request.contextPath}/static/css/serverconfiguration.min.css" rel="stylesheet">
 <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/static/img/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/static/img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/static/img/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/static/img/site.webmanifest">
<link rel="mask-icon" href="${pageContext.request.contextPath}/static/img/safari-pinned-tab.svg" color="#283A63">
<meta name="msapplication-TileColor" content="#2b5797">
<meta name="theme-color" content="#ffffff">   
 <style type="text/css">
     .css-switch .css-control-input~.css-control-indicator {
     background-color: #b7b2b2;
     }
     </style>
</head>
<body>
<div class="header-section block">
 	<div class=""> 
	<fieldset>
	<div class="block block-themed">
	<div class="block-header bg-gd-sea">
   		<h3 class="block-title">Falcon Deploy Installation and Configuration</h3>
	</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			<img src="${pageContext.request.contextPath}/static/img/logo.png" style="margin: 0 auto;display: block;" class="width-11"/>
				<div class="block block-bordered mt-20 info-sec">
				   <div class="panel-body block block-themed mb-0">
					   <div class="block-header bg-gd-sea">
   							<h3 class="block-title">Email And Password Encryption Key Configuration</h3>
						</div>
						<div class="p-20 block-content block-content-full bg-info-light">
						    <p>Use the form below to configure email used by Falcon Deploy. A validation email will be sent upon successful configuration.</p>  
						   
						<hr style="border-top: 1px solid #c9cbd0;" class="mt-30">    
						    
 <form method="post" action="${pageContext.request.contextPath}/submitEmail" novalidate>
 
  				<div class="col-12 text-right">
                         <label class="css-control css-control-sm  css-control-primary css-switch">
                             <input type="checkbox" class="css-control-input" id="changeForm" name="ntlmcheck" value="false">
                             <span class="css-control-indicator"></span><span id="toggleForm">NTLM Credential (Exchange server)</span>
                         </label>
 				 </div>
 
<div class="col-md-7 offset-md-3 pt-30"> 
<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="Host">Host:</label>
	     <div class="col-lg-7">
	          <input id="Host" name="Host" autocomplete="off" type="text"  class="form-control input-md" required autocomplete="off">
	   		  <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="host-small">Host address is required</small>
	     </div>
	</div>
</div>
<div class="col-md-7 offset-md-3"> 
<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="Port">Port:</label>
	     <div class="col-lg-7">
	          <input id="Port" name="Port" autocomplete="off" type="number"  class="form-control input-md" required autocomplete="off">
	    		<small style="color:red; display:inline-block; margin-top:10px; display:none;" id="port-small">Port number is required</small>
	     </div>
	</div>
</div>

<div class="col-md-7 offset-md-3"> 
<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" >Authentication:</label>
	            <div class="col-lg-7">
	                      <div class="">
                                        <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="auth" value="none" >
                                                <span class="css-control-indicator"></span> NONE
                                            </label>
                                            <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="auth" value="req" checked>
                                                <span class="css-control-indicator"></span> Required
                                            </label>	  
                               </div>
                     </div>
	</div>
</div>

<div class="col-md-7 offset-md-3" id="userDiv"> 
<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="Username">User Email:</label>
	     <div class="col-lg-7">
	          <input id="Username" name="Username" autocomplete="off" type="text"  class="form-control input-md" required autocomplete="off">
	     </div>
	</div>
</div>

<div class="col-md-7 offset-md-3" id="passDiv"> 
<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="Password">Password:</label>
	     <div class="col-lg-7">
	          <input id="Password" name="Password" autocomplete="off" type="password"  class="form-control input-md" required autocomplete="off">
	     </div>
	</div>
</div>

<div class="col-md-7 offset-md-3" id="NTLMDiv" style="display: none;"> 
<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="NTLM">NTLM domain:</label>
	     <div class="col-lg-7">
	          <input id="NTLM" name="NTLMDOMAIN" autocomplete="off"  class="form-control input-md" required autocomplete="off">
	     </div>
	</div>
</div>
<div class="col-md-7 offset-md-3" id="NTLMUserDiv" style="display: none;"> 
<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="NTLMUSER">NTLM user:</label>
	     <div class="col-lg-7">
	          <input id="NTLMUSER" name="NTLMUSER" autocomplete="off"  class="form-control input-md" required autocomplete="off">
	     </div>
	</div>
</div>

<div class="col-md-7 offset-md-3"> 
<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" >Security:</label>
	     <div class="col-lg-7">
              <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="security" value="none" checked>
                                                <span class="css-control-indicator"></span> NONE
                                            </label>
                                            <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="security" value="ssl">
                                                <span class="css-control-indicator"></span> SSL
                                            </label>
                                             <label class="css-control css-control-sm css-control-primary css-radio">
                                                <input type="radio" class="css-control-input" name="security" value="tls">
                                                <span class="css-control-indicator"></span> TLS
                                            </label>   
        </div>
</div>
<div class="form-group">
  <div class="col-md-12 text-center">  
    <button type="button" class="btn btn-primary text-right mr-md-2 xs-ml-5"  id="validate" >Validate</button>
    <button type="submit" id="FormSubmit" class="btn btn-primary" disabled>Submit</button>
  </div>
</div>
</div>
</form>
                        </div>
                   </div>
				</div>
			</div>
		</div>
	</div>

</fieldset>
 	 </div>
 	 
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header block-header block-header-default">
        
        <h4 class="modal-title block-title" id="myModalLabel">Result</h4>
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

<div id="overlaygivBrigtness" style="display:none">
	<i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e; animation: fa-spin 2s infinite linear;"></i>
	<p>Loading Please Wait...</p>
</div>  
<div class="container-fluid">
<div class="row">
<div class="col-md-9" style="padding:10px 15px">
	<span class="">&copy;  2018  Falcon Deploy. All rights reserved.</span>
</div>
<div class="col-md-3 ">
 	<div class="footer-link">
 		<ul class="list-inline">
 	 		<li><a href="https://f-d.io/" target="blank">Learn more</a></li>
 	 		<li><a href="https://f-d.io/contact" target="blank">Contact</a></li>
 	 		<li><a href="https://docs.f-d.io" target="blank">Documentation</a></li>
 	 	</ul>
 	 </div>
 </div>
</div>
</div>
 </div>
 <script src="static/js/plugins/jquery-1.11.1.min.js"></script>
<script src="static/js/codebase.min.js"></script>
</body>
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
	     $('#overlaygivBrigtness').show();
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
	           $('#overlaygivBrigtness').hide();

	           $('#myModal').modal('show');
	         }).fail(function() {
	            console.log('Failed');
	            $('#status').text("There is some network issue.Please check your internet access.");
		           $('#myModal').modal('show');
		           $('#overlaygivBrigtness').hide();
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
</html>