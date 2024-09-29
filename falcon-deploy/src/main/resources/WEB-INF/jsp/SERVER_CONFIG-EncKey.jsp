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
    <link href="${pageContext.request.contextPath}/static/css/serverconfiguration.min.css" rel="stylesheet">
    <%-- <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet"> --%>
 <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/static/img/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/static/img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/static/img/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/static/img/site.webmanifest">
<link rel="mask-icon" href="${pageContext.request.contextPath}/static/img/safari-pinned-tab.svg" color="#283A63">
<meta name="msapplication-TileColor" content="#2b5797">
<meta name="theme-color" content="#ffffff">   
</head>
<body>
<div class="header-section block block-themed">
<div class="block-header bg-gd-sea">
   	<h3 class="block-title">Falcon Deploy Installation and Configuration</h3>
</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			<img src="${pageContext.request.contextPath}/static/img/logo.png" style="margin: 0 auto;display: block;" class="width-11 mt-20"/>
				<div class="block block-bordered mt-20 info-sec">
					<div class="panel-body block block-themed mb-0">
						<div class="block-header bg-gd-sea">
   							<h3 class="block-title">Encryption Key Configuration With Salt</h3>
						</div>
						<div class="p-20 block-content block-content-full bg-info-light">
							<p>
							Use the form below to provide an encryption Key/SALT that will be used to secure credentials used in Falcon Deploy. You need to provide this once during the setup. Falcon Deploy saves the key. Falcon Deploy uses the key during the encryption and decryption process. The key should be kept private.
							</p>
	    					<hr style="border-top: 1px solid #c9cbd0;" class="mt-30"> 
	    					
	    					
	    					<div class="col-md-7 offset-md-3"> 
     <form class="form-horizontal pt-50 pb-50" action=<c:url value='SubmitKey' />  method="post" onsubmit="return checkKey()">
	<fieldset>
	
	<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="key">Enter Key</label>
	     <div class="col-lg-7">
	     <div>
	          <input type="password" class="form-control" id="key" name="key" placeholder="Type salt key">
	          <span class="fa fa-eye eye1 color-primary" onmousedown="mouseDown()" onmouseup="mouseUp()"></span>
	     </div>
	     <small id="keyError" style="color: red; display: none;"></small>
	     </div>
	</div>
	<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="Rkey">Re-enter Key</label>
	     <div class="col-lg-7">
	          <div>
	          <input type="password" class="form-control" id="Rkey" name="Rkey"  autocomplete="off"  placeholder="Re-type salt key">
	          <span class="fa fa-eye eye1 color-primary" onmousedown="mouseDownc()" onmouseup="mouseUpc()"></span>
	          </div>
	         <small id="tnError" style="color: red; display: none;"></small>
	     </div>
	</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="submit"></label>
  <div class="col-md-12 text-center">
    <button type="submit" id="FormSubmit"  class="btn btn-primary">Submit</button>
  </div>
</div>
</fieldset>
</form>
 	 </div>
		</div>
  			</div>
				</div>
			</div>
		</div>
	</div>
<div id="overlaygivBrigtness" style="display:none">
   <i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
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
 <script>
function mouseDownc() {
    document.getElementById("Rkey").type = 'text';
}

function mouseUpc() {
    document.getElementById("Rkey").type = 'password';
}
function mouseDown() {
    document.getElementById("key").type = 'text';
}

function mouseUp() {
    document.getElementById("key").type = 'password';
}

$("#key").focus(function(){
	$('#tnError').hide();
	$('#keyError').hide();
  });
  
   $("#Rkey").focus(function(){
	   $('#tnError').hide();
	   $('#keyError').hide();
  });
</script>
    <script type="text/javascript">
 	function checkKey()
	{
 		var key=$('#key').val();
 		var Rkey=$('#Rkey').val();
 		if(key.length<7||key.length>11)
 			{
 			$('#keyError').empty();
 			$('#keyError').append("Key must be more than 6 and less than 12 characters long");
 			$('#keyError').show();
 			return false;
 			}
 		if(key==Rkey)
 			return true;
 		else
 			{
 			$('#tnError').empty();
 			$('#tnError').append("Key and its confirm are not the same");
 			$('#tnError').show();
 			return false;
 			}
	}
    
    </script>
</body>
</html>
   