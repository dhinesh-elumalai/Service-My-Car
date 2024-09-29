
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/plugins/form-validation/css/formValidation.min.css">
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
   							<h3 class="block-title">Database Configuration</h3>
						</div>
						<div class="p-20 block-content block-content-full bg-info-light">
							<p>This page is used to configure the database connection properties. Use the form below to configure the 'falcon' schema.</p>
							<h3 class="block-title mb-10">Note<span style="color: red;">*</span>:<small> We currently support the Oracle and MySQL Databases only.</small></h3> 
	    					<h3 class="block-title mb-10">Example:</h3>
	    					<div class="row col-md-12">
	    					
	    					<div class="col-md-6">
	    					<h6 class="block-title mb-10">ORACLE</h6>
						    <ul>
						    	<li class="mb-5"><b>Database URL:</b> jdbc:oracle:thin:@localhost:1521:FALCON</li>
						    	<li class="mb-5"><b>Database Username:</b> falcon</li>
						    	<li class="mb-5"><b>Database Password:</b> *******</li>
						    </ul>
						    </div>
						    
						    <div class="col-md-6">
						    <h6 class="block-title mb-10">MySQL</h6>
						    <ul>
						    	<li class="mb-5"><b>Database URL:</b> jdbc:mysql://localhost:3306/FALCON</li>
						    	<li class="mb-5"><b>Database Username:</b> falcon</li>
						    	<li class="mb-5"><b>Database Password:</b> *******</li>
						    </ul>
						    </div>
						    
						    </div>
						    
						    <hr style="border-top: 1px solid #c9cbd0;" class="mt-30">
						    <div class="col-12 text-right">
                                            <label class="css-control css-control-sm  css-control-primary css-switch">
                                                <input type="checkbox" class="css-control-input" id="changeForm">
                                                <span class="css-control-indicator"></span><span id="toggleForm">Oracle Autonomous database</span>
                                            </label>
                             </div>
						    <div class="col-md-8 offset-md-2"> 
						    	
     <form class="form-horizontal pt-30 pb-50" action=<c:url value='Server-config-database' />  method="post" id="NormForm">
	<fieldset>
									
	<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="fn">Database URL:</label>
	     <div class="col-lg-7">
	          <input type="text" class="form-control" id="fn" name="DB_url" value='${dburl}'  required>
	          <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="dburl-small">Database url is required</small>
	     </div>
	</div>
	<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="ln">Database User Name:</label>
	     <div class="col-lg-7">
	          <input type="text" class="form-control" id="ln" name="username" autocomplete="off" value='${un}'  required>
	          <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="dbun-small">Database user name is required</small>
	     </div>
	</div>
	<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="pass">Database Password:</label>
	     <div class="col-lg-7">
	          <input type="password" class="form-control" id="pass" name="password" value='${pass}'  autocomplete="off"  required>
	           <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="dbupass-small">Database password is required</small> 
	     </div>
	</div>
<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="db_type">Database Type:</label>
	     <div class="col-lg-7">
	                <select class="custom-select" id="db_type" name="type">
											<option value="ORACLE">ORACLE</option>
											<option value="MYSQL">MySQL</option>
					</select>
	           <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="db_type-small">Database type is required</small> 
	     </div>
	</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="submit"></label>
  <div class="col-md-12 text-center">
  
  <button type="button" class="btn btn-primary text-right mr-md-2 xs-ml-5"  id="validate" > Validate</button>
    <button type="submit" id="FormSubmit" disabled class="btn btn-primary">Submit</button>
  </div>
</div>


</fieldset>

</form>






<form class="form-horizontal pt-30 pb-50"   id="MainForm" style="display:none">
<fieldset>							
	<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="fn">Credential zip file:</label>
	     <div class="col-lg-7">
			<input type="file" onChange="clearSelectBox()" style="border:1px solid #dedede;background: white; padding:3px ; width:100%" name="credfile" accept=".zip" id="credfile" required>
	     </div>
	     <button type="button" onClick="getServiceList()"  class=" btn  btn-alt-primary">Upload</button>
	</div>
	
	<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="fn">Service:</label>
	     <div class="col-lg-7">
					<select id="selectBoxService" name="service" class="form-control">
					</select>
	     </div>
	</div>
	
	<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="lns">Database User Name:</label>
	     <div class="col-lg-7">
	          <input type="text" class="form-control" id="lns" name="username" autocomplete="off"   required>
	     </div>
	</div>
	
	<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="passs">Database Password:</label>
	     <div class="col-lg-7">
	          <input type="password" class="form-control" id="passs" name="password"  autocomplete="off"  required>
	     </div>
	</div>
	
	<div class="form-group">
 		 <label class="col-md-4 control-label" for="submit"></label>
		  <div class="col-md-12 text-center">
   			 <button type="button" id="SubmitFormButtonForm" onclick="validateAndsubmitAJAX()" class="btn btn-primary">Submit</button>
  		</div>
	</div>
</fieldset>
<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
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
<script src="${pageContext.request.contextPath}/static/js/plugins/form-validation/js/formValidation.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/form-validation/js/bootstrap4.min.js"></script>
 
    <script type="text/javascript">
	function validateAndsubmitAJAX(){
		$("#MainForm").formValidation('validate');
	}
	function clearSelectBox() {
		$('#selectBoxService').empty();
	}
	
	function submitCreateForm(){
	
		$("#overlaygivBrigtness").show();
		var form = $("#MainForm")[0];
		
		var file = new FormData(form);
		$.ajax({
			url : 'autonomousDBcreate',
			enctype : 'multipart/form-data',
			data : file,
			type : 'post',
			processData : false,
			contentType : false,
			cache : false,
			timeout : 1000000,
			success : function(data) {
				console.log(data);
				if (data == 'success') {
					$("#overlaygivBrigtness").hide();
					window.location.href = 'Server-config';
				} else {
					$("#overlaygivBrigtness").hide();
					$("#status").empty();
					$("#status").text(data);
					$('#myModal').modal('show');
				}
			},
			error : function(err) {
				$("#overlaygivBrigtness").hide();
				$("#status").empty();
				$("#status").text("Something went wrong!");
				$('#myModal').modal('show');
			}
		});
	}
    
    
	function getServiceList() {
		var credfile = $('#credfile');
		if (credfile[0].files.length > 0) {
			$("#overlaygivBrigtness").show();
			var form = $("#MainForm")[0];
			var file = new FormData(form);
			console.log("form data " + file);
			$.ajax({
				url : 'getServiceListFromZip',
				enctype : 'multipart/form-data',
				data : file,
				type : 'post',
				processData : false,
				contentType : false,
				cache : false,
				timeout : 1000000,
				success : function(data) {
					console.log(data);
					if (data.status == 'SUCCESS') {
						$("#overlaygivBrigtness").hide();
						$('#selectBoxService').empty();
						$.each(data.serviceList, function(i, service) {
							$('#selectBoxService').append(
									$('<option></option>').val(service).text(
											service));
						});
					} else {
						$("#overlaygivBrigtness").hide();
						$("#status").empty();
						$("#status").text(data.status);
						$('#myModal').modal('show');
					}
				},
				error : function(err) {
					$("#overlaygivBrigtness").hide();
				}
			});
		} 
	}
    
    $('#fn').keyup(function () {
    	 $('#FormSubmit').prop("disabled",true); 
    	 $('#dburl-small').hide();
    });
    $('#ln').keyup(function () {
   	 $('#FormSubmit').prop("disabled",true); 
   	 $('#dbun-small').hide();
   });
    $('#pass').keyup(function () {
   	 $('#FormSubmit').prop("disabled",true); 
   	 $('#dbupass-small').hide();
   });
    
    $("#changeForm").change(function() {
        if($(this).is(":checked")) {
        	$("#MainForm").show();
        	$("#NormForm").hide();
        	$("#toggleForm").text("Non-Autonomous database");
        }
        else
        	{
        	$("#NormForm").show();
        	$("#MainForm").hide();
        	$("#toggleForm").text("Autonomous database");
        	}
    });

    $(document).ready(function(){
    	
    	$('#MainForm').formValidation(
				{
					framework : 'bootstrap4',
					icon : {
						valid : 'fa fa-check',
						invalid : 'fa fa-times-circle',
						validating : 'fa fa-sync-alt'
					},
					fields : {
						credfile : {
							validators : {
								notEmpty : {
									message : 'Credential file is required'
								},
								file : {
									maxTotalSize : 2097152,
									message : 'Credential file is not valid'
								}
							}
						},
						username : {
							validators : {
								notEmpty : {
									message : 'User name is required'
								}
							}
						},
						password : {
							validators : {
								notEmpty : {
									message : 'Password is required'
								}
							}
						},
						service : {
							validators : {
								notEmpty : {
									message : 'Service name is required'
								}
							}
						}
					}
				}).on('success.form.fv', function(e) {
				    // Prevent form submission
				    e.preventDefault();
				   // alert("success")
				    submitCreateForm();
				    return false; 
				});
    	
    	
    	
    	
	    $("#validate").on('click', function postinput(){	
	        var url = $('[name="DB_url"]').val(); 
	        var uname = $('[name="username"]').val(); 
	        var upass = $('[name="password"]').val(); 
	        var utype=$('[name="type"]').val(); 
	     if(url.length>0&&uname.length>0&&upass.length>0)
	    	 {
		     $('#overlaygivBrigtness').show();
	        $.ajax({ 
	            url: 'validate_db',
	            data: {url: url,uname:uname,upass:upass,utype:utype},
	            type: 'get',  
	        }).done(function(responseData) {   
	        	 $('#overlaygivBrigtness').hide();
	        	if(responseData=='Success')
	        		{
	        		$('#FormSubmit').removeAttr("disabled");
	        		$('#status').text("Validation Successful!");
	        		}
	        	else
	        		$('#status').text(responseData);
	           $('#myModal').modal('show');
	         }).fail(function() {
	            $('#overlaygivBrigtness').hide();
	            $('#status').text("There is some network issue.Please check your internet access.");
		           $('#myModal').modal('show');
	        });
	   
	    }
	    else
	    	{
	    	if(url.length == 0)  
	    		$('#dburl-small').show();
			else
				$('#dburl-small').hide();

	        if(uname.length == 0)  
	    		$('#dbun-small').show();
			else
				$('#dbun-small').hide();
	        if(upass.length == 0)  
	    		$('#dbupass-small').show();
			else
				$('#dbupass-small').hide();
	    	}
	});
    });
    </script>
    
</body>
</html>
   