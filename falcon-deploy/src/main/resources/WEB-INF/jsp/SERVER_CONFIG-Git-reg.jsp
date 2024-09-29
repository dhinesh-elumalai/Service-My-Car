
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/plugins/select2/select2.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/plugins/select2/select2-bootstrap.min.css">
     <link href="${pageContext.request.contextPath}/static/css/themes/falcon.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/serverconfiguration.min.css" rel="stylesheet">
 <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/static/img/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/static/img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/static/img/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/static/img/site.webmanifest">
<link rel="mask-icon" href="${pageContext.request.contextPath}/static/img/safari-pinned-tab.svg" color="#283A63">
<meta name="msapplication-TileColor" content="#2b5797">
<meta name="theme-color" content="#ffffff">    
</head>
<body>
 <div class="header-section block block-themed ">
 	<div class=""> 
     <form class="form-horizontal" action=<c:url value='Server-config-repo' />  method="post">
	<fieldset>
	<div class="block block-themed">
	<div class="block-header bg-gd-sea">
   	<h3 class="block-title">Falcon Deploy Installation and Configuration</h3>
</div>
</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			<img src="${pageContext.request.contextPath}/static/img/logo.png" style="margin: 0 auto;display: block;" class="width-11 "/>
				<div class="block block-bordered mt-20 info-sec">
					<div class="panel-body block block-themed mb-0">
					<div class="block-header bg-gd-sea">
   							<h3 class="block-title">Primary and Backup Location Configuration</h3>
						</div>
						<div class="p-20 block-content block-content-full bg-info-light">
						<p>Use the form below to configure the directories used by Falcon Deploy. 
The Primary and Backup directories should be from different storage volumes that are created from a separate set of physical disks. We recommend using volumes that can survive disk failures. Please meet the requirements listed in the install document.
The Primary and Backup directories should be empty. Operating system user 'falcon' should have write permission on the directories.
Oracle home location should be the path for SQL*Plus Instant Client executable. MySQL home location should be the path for MySQL Command-Line Client executable. MySQL Command-Line Client executable will be automatically added by Falcon Deploy.
  </p>
  <h3 class="block-title mb-10"> Example:</h3>
  <div class="col-md-12 row">
  <div class="col-md-6">
  <h3 class="block-title mb-10">For Windows</h3>
    <ul>
    	<li class="mb-5"><b>Primary Location:</b> C:\falcon_deploy\primary</li>
    	<li class="mb-5"><b>Backup Location:</b> C:\falcon_deploy\backup</li>
    	<li class="mb-5"><b>ORACLE_HOME Location:</b> C:\app\oracle\12.1.0\client_1</li>
    	<li class="mb-5"><b>MYSQL_HOME Location:</b> C:\program files\MySQL\bin</li>
    </ul>
    </div>
    <div class="col-md-6">
    <h3 class="block-title mb-10">For Linux</h3>
    <ul>
    	<li class="mb-5"><b>Primary Location:</b> /falcon_deploy/primary</li>
    	<li class="mb-5"><b>Backup Location:</b> /falcon_deploy/backup</li>
    	<li class="mb-5"><b>ORACLE_HOME Location:</b> /u01/app/oracle/12.1.0/client_1</li>
    	<li class="mb-5"><b>MYSQL_HOME Location:</b> /var/lib/mysql/bin</li>
    </ul>
    </div>
   </div>
     <hr style="border-top: 1px solid #c9cbd0;" class="mt-30">   
    <div class="col-md-9 offset-md-2 pt-30 pb-50" id="backup-validate">    
<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="ln">Primary  Location:</label>
	     <div class="col-lg-7">
	          <input id="ln" name="primary"  autocomplete="off" type="text"  class="form-control input-md" required>
	          <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="ln-small">Primary location is required</small>
	     </div>
	</div>
<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="passwrd"> Backup  Location:</label>
	     <div class="col-lg-7">
	          <input name="backup" type="text"  autocomplete="off"   id="bc"  class="form-control input-md" required>
	          <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="bc-small">Backup location is required</small>
	          
	     </div>
</div>	
<div class="form-group row">
	     <label class="col-lg-3 col-form-label text-right" for="passwrd"> Deployment DB types:</label>
				<div class="col-lg-7" >
					  <select id="selectedTypes" class="js-select2 form-control" multiple  required >	
									  <option value="MYSQL" selected>MySQL</option>
									   <option value="ORACLE" selected>ORACLE</option>
					  </select>
					 <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="dbtype-small">Atleast one location is required</small>
				</div>
</div>

<div class="form-group row" id="ORACLE_DIV">
		<div class="col-lg-3 ">
	    	 <label class="col-form-label text-right" for="passwrd">ORACLE_HOME  Location:</label>
	    	 <div style="float: right;">
	   			 <small>(client)</small>
	   		 </div>
	    </div>
	    
	     <div class="col-lg-7">
	          <input name="oracleHome" type="text"  autocomplete="off"    class="form-control input-md" id="or" >
	          <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="or-small">ORACLE_HOME  Location is required</small>
	     </div>
</div>

<div class="form-group row" id="MYSQL_DIV" >
		<div class="col-lg-3 ">
	     <label class="col-form-label text-right" for="passwrd">MYSQL_HOME Location:</label>
	      <div style="float: right;">
	   			 <small>(client)</small>
	   		 </div>
	   	</div>
	     <div class="col-lg-7">
	          <input name="mysqlHome" type="text"  autocomplete="off"  value="${MySQL_Path}"  class="form-control input-md" id="or1" >
	          <small style="color:red; display:inline-block; margin-top:10px; display:none;" id="or1-small">MYSQL_HOME Location is required</small>
	     </div>
</div>
	
<div class="form-group">
  <label class="col-md-4 control-label" for="submit"></label>
  <div class="col-md-12 text-center">
  <input name="type" type="hidden" value="${type}" id="type" required>
   <button type="button" class="btn btn-primary text-right mr-md-2 xs-ml-5"  id="validate"> Validate</button>
    <button type="submit" disabled id="FormSubmit" class="btn btn-primary">Submit</button>
  </div>
</div>
</div>
         </div>
  </div>
				</div>
			</div>
		</div>
	</div>

</fieldset>
</form>
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
 	
<script src="${pageContext.request.contextPath}/static/js/plugins/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/codebase.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/select2/select2.full.min.js"></script>

     <script type="text/javascript">
     
     $('#selectedTypes').on('change', function() {
    	 var val=$("#selectedTypes").select2("val");
    	 $('#MYSQL_DIV').hide();
    	 $('#ORACLE_DIV').hide();
    
    	 $('#dbtype-small').hide();
    	$.each(val, function(i, selected) {
    			console.log(selected)
    			if(selected=='MYSQL')
    				{$('#MYSQL_DIV').show();}
    			else if(selected=='ORACLE')
    				{$('#ORACLE_DIV').show();}
    			})
    			if(val.length==0)
    				{$('#dbtype-small').show();}
     });
		$("#selectedTypes").select2({
			  multiple : true,
			  width: '100%',
			  placeholder: "",
			});
		
		$('#ln').keyup(function(){
	    	   $('#ln-small').hide();
	    	   $('#FormSubmit').prop("disabled",true); 
	       });
		$('#bc').keyup(function(){
	    	   $('#bc-small').hide();
	    	   $('#FormSubmit').prop("disabled",true); 
	       });
		$('#or').keyup(function(){
	    	   $('#or-small').hide();
	    	   $('#FormSubmit').prop("disabled",true);  
	       });
		$('#or1').keyup(function(){
	    	   $('#or1-small').hide();
	    	   $('#FormSubmit').prop("disabled",true);  
	       });
		
    $(document).ready(function(){
	    $("#validate").on('click', function postinput(){
	        var primary = $('[name="primary"]').val(); 
	        var backup = $('[name="backup"]').val(); 
	        var oracleHome=$('[name="oracleHome"]').val();
	        var mysqlHome=$('[name="mysqlHome"]').val();
	        var type=$('[name="type"]').val();
	        var proceed=$("#ORACLE_DIV").is(":visible")||$("#MYSQL_DIV").is(":visible");
	        var val=$("#selectedTypes").select2("val");
	        if(proceed)
	        	$('#dbtype-small').hide();
	        else
	        	$('#dbtype-small').show();
	        
	        if(!$("#ORACLE_DIV").is(":visible"))
	       	 $('#or').val("");
	        if(!$("#MYSQL_DIV").is(":visible"))
	    	 $('#or1').val("");
	        
	        $.each(val, function(i, selected) {
    			console.log(selected)
    			if(selected=='MYSQL')
    			{
    				var c=$("#or1").val();
    				if(!$.trim(c).length>0)
    				{
    					proceed=false;
    					$('#or1-small').show();
    				}	
    			}
    			else if(selected=='ORACLE')
    				{
    				var c=$("#or").val();
    				if(!$.trim(c).length>0)
    					{
    						proceed=false;
    						$('#or-small').show();
    					}	
    				}
    			})
	        
			if(primary.length == 0)  
	    		$('#ln-small').show();
			else
				$('#ln-small').hide();

	        if(backup.length == 0)  
	    		$('#bc-small').show();            
			else
				$('#bc-small').hide();

	

	       
			
	     if($.trim(primary).length>0&&$.trim(backup).length>0&&proceed)
	    	 {
	        $('#overlaygivBrigtness').show();
	     if(primary==backup)
	    	 {
	    	 $('#overlaygivBrigtness').hide();
	    	 $('#status').text("Primary and Backup should have different locations");
	           $('#myModal').modal('show');
	    	 }
	     else
	    	 {
	        $.ajax({ 
	            url: 'validate_File_path',
	            data: {primary :primary,backup :backup,oracleHome:oracleHome,mysqlHome:mysqlHome},
	            type: 'get'
	        }).done(function(responseData) {  
	        	$('#overlaygivBrigtness').hide();
	        	if(responseData=='Success')
	        		{
	        		 $('#FormSubmit').removeAttr("disabled");
	        		 $('#status').text("Validation Successful!");
	        		}
	        	else
	        	{
	        		$('#status').text(responseData);
	        	}
	           $('#myModal').modal('show');
	         }).fail(function() {
	            console.log('Failed');
	            $('#status').text("There is some network issue.Please check your internet access.");
		           $('#myModal').modal('show');
		           $('#overlaygivBrigtness').hide();
	        });
	    	 }
	      }
	    });
	   
	});
    </script>
</body>
</html>
   