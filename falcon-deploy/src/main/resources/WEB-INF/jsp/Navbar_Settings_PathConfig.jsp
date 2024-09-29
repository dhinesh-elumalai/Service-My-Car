<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body>

<div id="preloader">
		<i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
		<span id="loaderNormal"><p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p></span>
		<span id="PathChangeStatus" style="display: none;"><p>In Progress <br><small style="text-transform:capitalize">Copying files</small></p></span>
</div>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

		<main id="main-container"> 
		<div class="content">
			<div class="">
				<div class="  ">
					
					<div class="" id="fixedSet">
						<div class="col-md-12 pl-0 pr-0">
						<div class="block-header block-header-default" style="background-color:#fff">
							<h3 class="block-title">PATH CONFIGURATION</h3>
						</div>
						</div>

						<div class="">
						<div><br></div>
							<div class="">
							<div class="form-group">
								<div class="col-sm-12 pl-0 pr-0 text-left">
									<section class="block block-bordered">
										<header class="card-header form-inline card-header-background col-md-12 mt-10">
											<h4 class="block-title mb-10">Application deployed location</h4>
										</header>
										<div class="card-block col-md-12">
											<div class="card-text" style="overflow: auto">
												<table class=" table  table-striped table-bordered  ">
													<thead>
														<tr>
															<th>App home</th>
														</tr>
													</thead>
													<tbody>
														<th>
															<c:out value='${app_home}' />
														</th>
													</tbody>
												</table>
											</div>
										</div>
									</section>
								</div>
							</div>
								<div class="form-group">
									<div class="col-sm-12 pl-0 pr-0 text-left">
										<section class="block block-bordered ">
											<header class="card-header form-inline card-header-background mb-20 mt-10 col-md-12">
												<h5 class="mb-0 block-title">Primary  location</h5>
												<div class=" ml-auto">
													<button id="submit" data-toggle="modal"
														data-target="#myModal12" class="btn btn-primary" data-toggle="click-ripple">
														Change location</button>
													<div id="myModal12" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static" >
														<div class="modal-dialog modal-lg">

															<div class="modal-content">
																<div
																	class="modal-header block-header block-header-default">

																	<h4 class="col-md-12 pl-0 pr-0 block-title" >
																		Change primary  location <br>
																		<small class="mb-0 " style="font-size: small;"><span style="color:red"><span class="fa fa-warning"></span> Warning: Changing this path will logout all users forcefully in 5 minutes. Users cannot login until this process completes. Please use an empty directory for the new path.</span></small>
																	</h4>
																	<br>
																</div>
																<div class="modal-body pt-0">
																	<div class="col-md-12">
																		<h6 class=" text-center" style="color: red;"></h6>
																	</div>
																	<div  id="primaryLocForm">
																		<div class="form-group">
																			<label class="col-md-1 col-sm-1 xs-pl-0 text-right" for="nn"><b>Path:</b></label>

																			<input id="nn" name="path" type="text" placeholder="" value='${primary_directory}'
																				class="form-control col-md-8 col-sm-8 nn1">
                                                                           
																			<div class="col-md-2 col-sm-2 xs-pl-0 xs-mt-5">
																				<button  type="button" onclick="checkPrimaryPath('primaryLocForm')" class=" btn btn-primary " data-toggle="click-ripple">Change</button>
                                                                                <input type="hidden" value="${primary_directory}" id="old">
																				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
																			</div>
																		</div>
																		<br>
																		<div class="block block-bordered" id="CopydataDiv" style="display: none;">
																		<div class="block-header block-header-default">
                                   											 <h3 class="block-title">Process</h3>
                                   											<span id="prog">Inprogress</span>&nbsp; <i class="fa fa-2x fa-spinner fa-spin " style="color:green" id="ICOprog" ></i> 
                                   											<span id="bug"> Error</span>&nbsp; <span class="fa fa-2x fa-close" style="color:red" id="ICObug" ></span>
                                   											<span id="suc"> Completed</span>&nbsp; <span class="fa fa-2x fa-check" style="color:green" id="ICOsuc" ></span>
                               											 </div>
																		<div class=" block-content" >
                                   											 <p id="Copydata"></p>
                               											 </div>
                               											 </div>
																		<div class="form-group">
																			<label class="col-md-1 col-sm-1 xs-pl-0 text-right" ><b></b></label>
																		<small id="tnError" style="color: red; display:none ;" class="tnError"></small>
																		</div>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-alt-danger" data-dismiss="modal" data-toggle="click-ripple">Close</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</header>
											<div class="card-block col-md-12 ">
												<div class="card-text" style="overflow: auto">
													<table class=" table  table-striped table-bordered  ">
														<thead>
															<tr>
																<th>Primary  directory</th>
															</tr>
														</thead>
														<tbody>
															<th>
																<c:out value='${primary_directory}' />
															</th>
														</tbody>
													</table>
												</div>
											</div>
										</section>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-12 text-left pl-0 pr-0">
									<section class="block block-bordered">
										<header
											class="card-header form-inline card-header-background mb-10 col-md-12 mt-10">
											<h5 class="mb-0 block-title"> Backup location</h5>
											<div class=" ml-auto">
												<button id="submit" data-toggle="modal"
													data-target="#myModal" class="btn btn-primary" data-toggle="click-ripple">Change
													location</button>
												<div id="myModal" class="modal fade" role="dialog">
													<div class="modal-dialog modal-lg">
														<div class="modal-content">
															<div
																class="modal-header block-header block-header-default">
																<h4 class="col-md-12 block-title pl-0 pr-0">Change backup
																	location</h4>
															</div>
															<div class="modal-body">
																<form action=<c:url value='changeBackupLocation' /> method="post" id="backupLocForm">
																	<div class="form-group">
																		<label class="col-md-1 xs-pl-0 col-sm-1 text-right" for="nn"><b>Path:</b></label>

																		<input id="nn" name="path" type="text"
																			placeholder=""
																			value='${backup_directory}'
																			class="form-control col-md-8 col-sm-8 nn1">
                                                                       <input type="hidden" value="${backup_directory}" id="old">
																		<div class="col-md-2 xs-pl-0 xs-mt-5 col-sm-2">
																			<button  type="button" onclick="checkPathAndSubmit('backupLocForm')" class=" btn btn-primary"
																			data-toggle="click-ripple">Change</button>

																			<input type="hidden" name="${_csrf.parameterName}"
																				value="${_csrf.token}" />
																		</div>
																	</div>
																	<div class="form-group">
																			<label class="col-md-1 col-sm-1 xs-pl-0 text-right" ><b></b></label>
																		<small id="tnError" style="color: red; display:none;" class="tnError"></small>
																		</div>
																</form>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-alt-danger"
																	data-dismiss="modal" data-toggle="click-ripple">Close</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</header>
										<div class="card-block col-md-12">
											<div class="card-text" style="overflow: auto">
												<table class=" table  table-striped table-bordered  ">
													<thead>
														<tr>
															<th>Backup directory</th>
														</tr>
													</thead>
													<tbody>
														<th>
															<c:out value='${backup_directory}' />
														</th>
													</tbody>
												</table>
											</div>
										</div>
									</section>
								</div>
							</div>



							<div class="form-group">
								<div class="col-sm-12 pl-0 pr-0 text-left">
									<section class="block block-bordered ">
										<header
											class="card-header form-inline card-header-background mb-10 col-md-12 mt-10">
											<h5 class="mb-0 block-title">Oracle home location</h5>
											<div class=" ml-auto">
												<button id="submit" data-toggle="modal"
													data-target="#myModal1" class="btn btn-primary" data-toggle="click-ripple">
													Change location</button>
												<div id="myModal1" class="modal fade" role="dialog">
													<div class="modal-dialog modal-lg">

														<div class="modal-content">
															<div
																class="modal-header block-header block-header-default">
																<h4 class="col-md-12 pl-0 pr-0 block-title">Change
																	oracle home location</h4>
															</div>
															<div class="modal-body">
																<form action=<c:url value='changeOracleHomeLocation' /> method="post"  id="homeLocForm">
																	<div class="form-group">
																		<label class="col-md-1 col-sm-1 xs-pl-0 text-right" for="nn"><b>Path:</b></label>

																		<input id="nn" name="path" type="text"
																			placeholder=""
																			value='${oracle_home}' class="form-control col-md-8 col-sm-8 nn1">
                                                                            <input type="hidden" value="${oracle_home}" id="old">
																		<div class="col-md-2 col-sm-2 xs-pl-0">
																			<button class="xs-mt-5 btn btn-primary " type="button" onclick="checkPathAndSubmit('homeLocForm')" data-toggle="click-ripple">Change</button>

																			<input type="hidden" name="${_csrf.parameterName}"
																				value="${_csrf.token}" />
																		</div>
																	</div>
																	<div class="form-group">
																			<label class="col-md-1 col-sm-1 xs-pl-0 text-right" ><b></b></label>
																		<small id="tnError" style="color: red; display:none;" class="tnError"></small>
																	</div>
																</form>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-alt-danger"
																	data-dismiss="modal" data-toggle="click-ripple">Close</button>
															</div>
														</div>

													</div>
												</div>
											</div>
										</header>
										<div class="card-block col-md-12">

											<div class="card-text" style="overflow: auto">
												<table class=" table  table-striped table-bordered  ">
													<thead>
														<tr>
															<th>Oracle home</th>
														</tr>
													</thead>
													<tbody>
														<th>
															<c:out value='${oracle_home}' />
														</th>
													</tbody>
												</table>
											</div>
										</div>
									</section>
								</div>
							</div>


						<div class="form-group">
								<div class="col-sm-12 pl-0 pr-0 text-left">
									<section class="block block-bordered ">
										<header class="card-header form-inline card-header-background mb-10 col-md-12 mt-10">
											<h5 class="mb-0 block-title">MySQL home location</h5>
											<div class=" ml-auto">
												<button id="submit" data-toggle="modal"
													data-target="#myModal111" class="btn btn-primary" data-toggle="click-ripple">
													Change location</button>
												<div id="myModal111" class="modal fade" role="dialog">
													<div class="modal-dialog modal-lg">

														<div class="modal-content">
															<div
																class="modal-header block-header block-header-default">
																<h4 class="col-md-12 pl-0 pr-0 block-title">Change
																	MySQL home location</h4>
															</div>
															<div class="modal-body">
																<form action=<c:url value='changeMysqlHomeLocation' /> method="post"  id="mysqlHomeLocForm">
																	<div class="form-group">
																		<label class="col-md-1 col-sm-1 xs-pl-0 text-right" for="nn"><b>Path:</b></label>

																		<input id="nn" name="path" type="text" placeholder="" value='${mysql_home}' class="form-control col-md-8 col-sm-8 nn1">
                                                                         <input type="hidden" value="${mysql_home}" id="old">
																		<div class="col-md-2 col-sm-2 xs-pl-0">
																			<button class="xs-mt-5 btn btn-primary " type="button" onclick="checkPathAndSubmit('mysqlHomeLocForm')" data-toggle="click-ripple">Change</button>

																			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
																		</div>
																	</div>
																	<div class="form-group">
																			<label class="col-md-1 col-sm-1 xs-pl-0 text-right" ><b></b></label>
																		<small id="tnError" style="color: red; display:none;" class="tnError"></small>
																	</div>
																</form>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-alt-danger"
																	data-dismiss="modal" data-toggle="click-ripple">Close</button>
															</div>
														</div>

													</div>
												</div>
											</div>
										</header>
										<div class="card-block col-md-12">

											<div class="card-text" style="overflow: auto">
												<table class=" table  table-striped table-bordered  ">
													<thead>
														<tr>
															<th>MySQL home</th>
														</tr>
													</thead>
													<tbody>
														<th>
															<c:out value='${mysql_home}' />
														</th>
													</tbody>
												</table>
											</div>
										</div>
									</section>
								</div>
							</div>
							
							
							<div><br></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${showpopup ne null}">
          <c:if test="${showpopup=='true'}">
		<div id="waitModal" class="modal fade" role="dialog">
				<div class="modal-dialog ">
                    <div class="modal-content">
						<div class="modal-header block-header block-header-default">
						<h4 class="col-md-12 pl-0 pr-0 block-title">Notification</h4>
					   </div>
				<div class="modal-body">
		            <h7>Below fields will be updated only after the completion of file copy.</h7>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-alt-danger" data-dismiss="modal" data-toggle="click-ripple">Close</button>
				</div>
			</div>
      </div>
</div>
				</c:if>
				</c:if>								
												
		
		</main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
<script>
var intVar;
function checkPrimaryPath(formid)
{
  var path=$('#'+formid).find("[name='path']").val();
  var oldPath=$('#'+formid).find("#old").val();
  if(path!=oldPath.substring(0, oldPath.length-1)&&path!=oldPath)
	  {
	  $.ajax({ 
          url: 'validate_File_path',
          data: {path:path,formid:formid},
          type: 'get'
      }).done(function(responseData)
    	{
    	  console.log(responseData);
    	  if(responseData=='Success')
		  {
    		  $('#'+formid).find("#tnError")
    	  $.ajax({ 
              url: 'changePrimaryLocation',
              data: {path:path},
              type: 'get'
          }).done(function(responseData)
        	{
        	  $("#Copydata").empty();
        	  $("#prog").show();
        	  $("#ICOprog").show();
        	  $("#bug").hide();
        	  $("#ICObug").hide();
        	  $("#suc").hide();
        	  $("#ICOsuc").hide();
        	  $("#CopydataDiv").show();
        	  $("#Copydata").append("The FALCON DEPLOY PRIMARY directory change is scheduled to start in 3 minutes.");
        	  intVar = setInterval(progressStatus, 20000);  
        	}).fail(function() {
      	            console.log('Failed');
        	});
    	  
		  }
    	  else
    		  {
    		  $('#'+formid).find("#tnError").empty();
    		  $('#'+formid).find("#tnError").append(responseData);
    		  $('#'+formid).find("#tnError").show();
    		  }
    		}).fail(function() {
    	            console.log('Failed');
    	      });
	  }
  else
	  {
	  $('#'+formid).find("#tnError").empty();
	  $('#'+formid).find("#tnError").append("Change the path and continue");
	  $('#'+formid).find("#tnError").show();
	  }
}

function progressStatus()
{
   	  $.ajax({ 
             url: 'changePrimaryLocationStatus',
             data: {},
             type: 'get'
         }).done(function(responseData)
       		{
        	 console.log(responseData);
        	 $("#CopydataDiv").show();
       		 $("#Copydata").empty();
        	$.each(responseData, function(i, req) {	
        	if(req=='err-stop')
        	{
        	  $("#prog").hide();
          	  $("#ICOprog").hide();
          	  $("#suc").hide();
         	  $("#ICOsuc").hide();	
          	  $("#bug").show();
          	  $("#ICObug").show();
          		clearInterval(intVar);
        	}
        	if(req=='stop')
        	 {
        		 $("#prog").hide();
             	  $("#ICOprog").hide();
        		  $("#bug").hide();
              	  $("#ICObug").hide();
        		 $("#suc").show();
            	  $("#ICOsuc").show();	
        		 clearInterval(intVar);
        	 }
           else
        	 {
        	  $("#prog").show();
         	  $("#ICOprog").show();
         	  $("#bug").hide();
         	  $("#ICObug").hide();
         	  $("#suc").hide();
         	  $("#ICOsuc").hide();
        		 $("#Copydata").append(req+"<br>");
        	  }
        	});
       		}).fail(function() {
     	            console.log('Failed');
       	});
}

function checkPathAndSubmit(formid)
{
	
  var path=$('#'+formid).find("[name='path']").val();
  var oldPath=$('#'+formid).find("#old").val();
  console.log(path); console.log(oldPath);
  if(path!=oldPath.substring(0, oldPath.length-1)&&path!=oldPath)
	  {
	  $.ajax({ 
          url: 'validate_File_path',
          data: {path:path,formid:formid},
          type: 'get'
      }).done(function(responseData)
    		  {
    	  console.log(responseData)
    	  if(responseData=='Success')
    		  {
    		  console.log($('#'+formid))
    		  $('form#'+formid).submit();
    		  }
    	  else
    		  {
    		  $('#'+formid).find("#tnError").empty();
    		  $('#'+formid).find("#tnError").append(responseData);
    		  $('#'+formid).find("#tnError").show();
    		  }
    		  }).fail(function() {
    	            console.log('Failed');
    	      });
	  }
  else
	  {
	  $('#'+formid).find("#tnError").empty();
	  $('#'+formid).find("#tnError").append("Change the path and continue");
	  $('#'+formid).find("#tnError").show();
	  }
	}
$('form').find("[name='path']").on('focus',function(e){
	      $(".tnError").empty();    
});
</script>
<c:if test="${showpopup ne null}">
<c:if test="${showpopup=='true'}">
<script>
$(document).ready(function(){
	$('#waitModal').modal('show');
});
</script>
</c:if>
</c:if>
</body>
</html>