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
    <!-- Page Content -->
    <div id="myModal12" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static" >
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header block-header block-header-default">
					<h4 class="col-md-12 pl-0 pr-0 block-title" >Notification process <br></h4>
						 <span id="prog">Inprogress</span>&nbsp; <i class="fa fa-2x fa-spinner fa-spin " style="color:green" id="ICOprog" ></i> 
                         <span id="bug"> Error</span>&nbsp; <span class="fa fa-2x fa-close" style="color:red" id="ICObug" ></span>
                         <span id="suc"> Completed</span>&nbsp; <span class="fa fa-2x fa-check" style="color:green" id="ICOsuc" ></span>
						<br>
				</div>
				<div class="modal-body pt-0">
				<div class="col-md-12">
					<h6 class=" text-center" style="color: red;"></h6>
				</div>
				<div  id="primaryLocForm">
						<div class=" block-content" >
                            <p id="Copydata"></p>
                          </div>

						<div class="form-group">
							<label class="col-md-1 col-sm-1 xs-pl-0 text-right" ><b></b></label>
							<small id="tnError" style="color: red; display:none;" class="tnError"></small>
						</div>
						</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-alt-danger" data-dismiss="modal" data-toggle="click-ripple" id="closeModal" style="display: none;">Close</button>
						</div>
					</div>
				</div>
			</div>
			
    <div class="content">
	<div class="block block-bordered">
	<div class="row">
			<div class="col-md-12">
			<div class="block-header block-header-default "><h5 class="block-title text-uppercase">Select a backup to restore</h5>
			
			<div class="block-options">
			<c:choose>
					<c:when test="${MODE=='backup_list_page'}">
				<a 	href="${pageContext.request.contextPath}/ConfigurePrimaryBakUpRepo" class="btn btn-alt-danger" data-toggle="click-ripple">Back</a>
				</c:when>
				<c:otherwise>
				<a 	href="javascript:void(0)" onclick="goBack();" class="btn btn-alt-danger" data-toggle="click-ripple">Back</a>
				</c:otherwise>
		 </c:choose>
			</div>
			
			</div>
		
			</div>
		</div>
		<div class="col-md-12">
			<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
			<div class=" padding-left-0 padding-right-0   col-md-12 height-500 " id="fixedSet">
				<c:choose>
					<c:when test="${MODE=='backup_list_page'}">
					
						<div class="form-group ">
							<div class="">
								<div class="card" >
									<div class="card-text" >
										<table class=" table  table-striped table-bordered  ">
											<thead>
												<tr>
													<th class="text-right">S.NO</th>
													<th>Backup Folder Name</th>
													<th class="text-center">Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items='${BackupFolderNames}' var='logs' varStatus="loops">
													<c:url value="RepoRestoreWithFolder" var="url">
                                                                  <c:param name="backupFolder" value="${logs}" />
                                                     </c:url>
													<tr style="height:40px;">
														<td class="text-right" style="width: 13%;"><c:out value='${loops.index+1}' /></td>
														<td><a class="" href="${pageContext.request.contextPath}/${url}"><c:out value='${logs}'/></a></td>
													    <td class="text-center"><button class="btn btn-sm btn-primary DeleteTeamDialog" id="${logs}" type="button">Restore</button></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</c:when>


<c:when test="${MODE=='list_files_in_backup'}">
			<div class="form-group">
							<div class="col-md-12 pl-0 pr-0">
								<div>
									<div class="card" >
											<ul class="bg-none padding-left-0 breadcrumb">
												<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/RestoreFromBackUp"><i class="fa fa-home"></i>&nbsp;Backup home</a></li>
												<li class="breadcrumb-item active">${backupFolderName}</li>
											</ul>
										<div class="block block-bordered">
											<div class="col-md-12">
												<header class="marg-bottom-10 mt-10 card-header form-inline card-header-background">
										</header>
										<small id="showErr" style="color:red; display:none; margin-bottom:10px;">Please select atleast one repo</small>
										<div class="card-text height-500 table-responsive">
											<table class=" table  table-striped table-bordered  ">
											<thead>
											<tr>
											<td>Folder Name</td>
											<td class="text-center"> Action</td>
											</tr>
											</thead>
												<tbody>
													<c:forEach items='${BackupRepoFolderNames}' var='logs' varStatus="loops">
														<tr>
															<td>
															<label class="css-control css-control-sm css-control-primary css-checkbox">
                                               <c:if test="${logs.getName()=='stage_dir'||logs.getName()=='logs_dir'}"> 
                                                <c:url value="checkFilesBeforeRestore" var="url">
                                                      <c:param name="path" value="${logs.getAbsolutePath()}" />
                                                      <c:param name="backupName" value="${backupFolderName}" />
                                                 </c:url>
                                                  </c:if> 
                                            <c:if test="${logs.getName()=='repo_dir'}">
                                                <c:url value="repoDirRestore" var="url">
                                                      <c:param name="path" value="${logs.getAbsolutePath()}" />
                                                      <c:param name="backupName" value="${backupFolderName}" />
                                                 </c:url>
                                                 </c:if>
                                             
                                                <span class="css-control-indicator"></span> <a class="" href="${pageContext.request.contextPath}/${url}">
                                                <c:out value='${logs.getName()}' /></a>
                                            </label>
															</td>
															<td style="width: 10%" class="text-center">
															<button class="btn btn-sm btn-primary RestoreMainDirFromBackup" type="button" id="${logs.getName()}"> Restore</button>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" /> <input type="hidden"
												name="backupFolderName" value="${backupFolderName}" />
										</div>
											</div>
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</c:when>



<c:when test="${MODE=='ReposInBackup'}">

						<div class="form-group row">
							<div class="col-md-12">
								<form action="${pageContext.request.contextPath}/restoringSelectedFilesFromBackup" method="post">
									<div class="card" >
									<ul class="bg-none padding-left-0 breadcrumb">
												<li class="breadcrumb-item"><a
													href="${pageContext.request.contextPath}/RestoreFromBackUp"><i class="fa fa-home"></i>
															Backup home</a></li>
												<c:url value="RepoRestoreWithFolder" var="url">
                                                      <c:param name="backupFolder" value="${backupName}" />         
                                                 </c:url>

												<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/${url}">${backupName}</a></li>
												<c:forEach items="${breadcumbPath}" var="breadcumbPath" varStatus="loop">
												<c:if test="${loop.last==loop.first}">
												<c:set var="isRepo" value="true"></c:set>
												</c:if>
												<c:if test="${loop.last!=loop.first}">
												<c:set var="isRepo" value="false"></c:set>
												</c:if>
										
												<c:if test="${!loop.last}">
												<c:url value="repoDirRestore" var="url">
                                                      <c:param name="path" value="${breadcumbPath.getPath()}" />
                                                      <c:param name="backupName" value="${backupName}" />
                                                 </c:url>
														<li class="breadcrumb-item">
														<a href="${pageContext.request.contextPath}/${url}">${breadcumbPath.getPathName()}</a>
														</li>
													</c:if>
													<c:if test="${loop.last}">
														<li class="breadcrumb-item active">
															${breadcumbPath.getPathName()}</li>
													</c:if>
												</c:forEach>
											</ul>
										<header class="marg-bottom-10 card-header form-inline card-header-background">
										<c:if test="${!isRepo}">
										<label class="css-control css-control-sm css-control-primary css-checkbox">
                                                <input type="checkbox" class="css-control-input"  onclick="toggle(this);">
                                                <span class="css-control-indicator"></span> Select All
                                            </label>
											<button type="button" class="btn  btn-primary ml-auto" onclick="validateandsubmit();">Restore Selected</button>
											</c:if>
										</header>
										<small id="showErr" style="color:red; display:none; margin-bottom:10px;">Please select atleast one file</small>
										<div class="card-text">
											<table class=" table  table-striped table-bordered  ">
												<tbody>
													<c:forEach items='${BackupFolderNames}' var='logss' varStatus="loops">
														<c:if test="${logss.isDirectory()=='true' && (logss.getName()!='.git')&&(logss.getName()!='git')}">
															<tr>
																<td><label class="css-control css-control-sm css-control-primary css-checkbox">
																 <c:if test="${!isRepo}"> <input type="checkbox" class="css-control-input" name="RestoreList" value="${logss.getName()}"></c:if>
																		 <span class="css-control-indicator"></span> <span class="css-control-description"></span> 
																			<c:url value="repoDirRestore" var="url">
                                                                                 <c:param name="path" value="${logss.getAbsolutePath()}" />   
                                                                                 <c:param name="backupName" value="${backupName}" />       
                                                                             </c:url>
																	<a class="" href="${pageContext.request.contextPath}/${url}" style="color: #bd0101; text-decoration: underline;">${logss.getName()}</a>
																</label>
																</td>
																<c:if test="${isRepo}">
																<td class="text-center" style="width: 20%"><button type="button" class="btn btn-sm btn-primary RestoreRepoFromBackup" id="${logss.getName()}"> Restore</button></td>
															   </c:if>
															</tr>
														</c:if>
														<c:if test="${logss.isFile()=='true' }">
															<tr>
																<td>
											<label class="css-control css-control-sm css-control-primary css-checkbox">
                                               <c:if test="${!isRepo}"> <input type="checkbox" class="css-control-input" name="RestoreList" value="${logss.getName()}"></c:if>
                                                <c:url value="editorCheckRestoreFile" var="url">
                                                      <c:param name="path" value="${logss.getAbsolutePath()}" />         
                                                 </c:url>
                                                <span class="css-control-indicator"></span> <a class="" href="${pageContext.request.contextPath}/${url}">${logss.getName()}</a>
                                            </label>
																</td>
															</tr>
														</c:if>
													
													</c:forEach>
												</tbody>
											</table>
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" /> <input type="hidden"
												name="pathForbackup" value="${backupFolderName}" /> <input
												type="hidden" name="backupFolderName" value="${backupName}" />
										</div>
									</div>							
								</form>
							</div>
						</div>
					</c:when>

					<c:when test="${MODE=='FilesInRepo'}">
						<div class="form-group row">
							<div class="col-md-12">
								<form action="${pageContext.request.contextPath}/restoringSelectedFilesFromBackup" method="post">
									<div class="card" >
									<ul class="bg-none padding-left-0 breadcrumb">
												<li class="breadcrumb-item"><a
													href="${pageContext.request.contextPath}/RestoreFromBackUp"><i class="fa fa-home"></i>
															Backup home</a></li>
												<c:url value="RepoRestoreWithFolder" var="url">
                                                      <c:param name="backupFolder" value="${backupName}" />         
                                                 </c:url>
												<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/${url}">${backupName}</a></li>
												<c:forEach items="${breadcumbPath}" var="breadcumbPath" varStatus="loop">
												<c:if test="${!loop.last}">
												<c:url value="checkFilesBeforeRestore" var="url">
                                                      <c:param name="path" value="${breadcumbPath.getPath()}" />
                                                      <c:param name="backupName" value="${backupName}" />
                                                 </c:url>
														<li class="breadcrumb-item">
														<a href="${pageContext.request.contextPath}/${url}">${breadcumbPath.getPathName()}</a>
														</li>
													</c:if>
													<c:if test="${loop.last}">
														<li class="breadcrumb-item active">
															${breadcumbPath.getPathName()}</li>
													</c:if>
												</c:forEach>
											</ul>
										<header class="marg-bottom-10 card-header form-inline card-header-background">
										
										<label class="css-control css-control-sm css-control-primary css-checkbox">
                                                <input type="checkbox" class="css-control-input"  onclick="toggle(this);">
                                                <span class="css-control-indicator"></span> Select All
                                            </label>
											<button type="button" class="btn  btn-primary ml-auto" onclick="validateandsubmit();">Restore Selected</button>
											
										</header>
										<small id="showErr" style="color:red; display:none; margin-bottom:10px;">Please select atleast one file</small>
										<div class="card-text">
											<table class=" table  table-striped table-bordered  ">
												<tbody>
													<c:forEach items='${BackupFolderNames}' var='logss'
														varStatus="loops">
														<c:if test="${logss.isDirectory()=='true' && (logss.getName()!='.git')&&(logss.getName()!='git')}">
															<tr>
																<td><label class="css-control css-control-sm css-control-primary css-checkbox">
																		<input type="checkbox" name="RestoreList" class="css-control-input" value='${logss.getName()}'>
																		 <span class="css-control-indicator"></span> <span class="css-control-descriptor"></span> 
																			<c:url value="checkFilesBeforeRestore" var="url">
                                                                                 <c:param name="path" value="${logss.getAbsolutePath()}" />   
                                                                                 <c:param name="backupName" value="${backupName}" />       
                                                                             </c:url>
																	<a class="" href="${pageContext.request.contextPath}/${url}" style="color: #bd0101; text-decoration: underline;">${logss.getName()}</a>
																</label>
																</td>
															</tr>
														</c:if>
														<c:if test="${logss.isFile()=='true' }">
															<tr>
																<td>
											<label class="css-control css-control-sm css-control-primary css-checkbox">
                                                <input type="checkbox" class="css-control-input" name="RestoreList" value="${logss.getName()}">
                                                <c:url value="editorCheckRestoreFile" var="url">
                                                      <c:param name="path" value="${logss.getAbsolutePath()}" />         
                                                 </c:url>
                                                <span class="css-control-indicator"></span> <a class="" href="${pageContext.request.contextPath}/${url}">${logss.getName()}</a>
                                            </label>
																</td>
															</tr>
														</c:if>
													</c:forEach>
												</tbody>
											</table>
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" /> <input type="hidden"
												name="pathForbackup" value="${backupFolderName}" /> <input
												type="hidden" name="backupFolderName" value="${backupName}" />
										</div>
									</div>							
								</form>
							</div>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
</div>
<div id="dialog-confirm">
			<p id="textForDialog"></p>
</div>
</main>
</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/Navbar_Settings_BackupConfig_RestoreListJS.jsp"%>
	 <script>
	 var intVar;
  $(function () {

	    $('.DeleteTeamDialog').on("click", function (e) {
	        var link = this;
	        $('#textForDialog').text('Are you sure you want to restore this backup?'); 

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
	        	            	   popupResultOfFullRestore(link);
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
	    $('.RestoreMainDirFromBackup').on("click", function (e) {
	        var link = this;
	        $('#textForDialog').text('Are you sure you want to restore this directory from backup?'); 

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
	        	            	   restorDirectoryFromBackup(link);
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
	    $('.RestoreRepoFromBackup').on("click", function (e) {
	        var link = this;
	        $('#textForDialog').text('Are you sure you want to restore this application from backup?'); 

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
	        	            	   restoreRepoFromBackup(link);
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
  
	<script>
	function restoreRepoFromBackup(path)
	{
	    	  $.ajax({ 
	              url: 'restoreRepoFromBackup',
	              data: {path:path.id,backup:'${backupName}'},
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
	        	  $("#closeModal").hide();
	        	  $("#Copydata").append("Restore process is scheduled to start in 3 minutes.");
	      		$("#myModal12").modal("show");
	        	  intVar = setInterval(progressStatus, 20000);  
	        	}).fail(function() {
	      	            console.log('Failed');
	        	});
		
	}
	function restorDirectoryFromBackup(path)
	{
	    	  $.ajax({ 
	              url: 'restorDirectoryFromBackup',
	              data: {path:path.id,backup:'${backupFolderName}'},
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
	        	  $("#closeModal").hide();
	        	  $("#Copydata").append("Restore process is scheduled to start in 3 minutes.");
	      		$("#myModal12").modal("show");
	        	  intVar = setInterval(progressStatus, 20000);  
	        	}).fail(function() {
	      	            console.log('Failed');
	        	});
		
	}
	function popupResultOfFullRestore(path)
	{
	    	  $.ajax({ 
	              url: 'restorePrimaryFromBackup',
	              data: {path:path.id},
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
	        	  $("#closeModal").hide();
	        	  $("#Copydata").append("Restore process is scheduled to start in 3 minutes.");
	      		$("#myModal12").modal("show");
	        	  intVar = setInterval(progressStatus, 20000);  
	        	}).fail(function() {
	      	            console.log('Failed');
	        	});
		
	}
	function validateandsubmit()
	{
		var a = $('form').find("input[type='checkbox']");
		var b = false;
		for (var i = 0; i<a.length; i++ )
			{
			console.log(a[i]);
			if (a[i].checked == true){
				$("#showErr").css("display", "none");
		       b=true;
		       break;
		    }
			}
		if (b==true)
			{
			$('form').submit();
			}
		else
			{
			$("#showErr").css("display", "block");
			}
		console.log(a)
	}
	</script>
	<script>
	function progressStatus()
	{
	   	  $.ajax({ 
	             url: 'changePrimaryLocationStatus',
	             data: {},
	             type: 'get'
	         }).done(function(responseData)
	       		{
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
	              	  $("#closeModal").show();
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
	                	  $("#closeModal").show();
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
	             	 $("#closeModal").hide();
	            		 $("#Copydata").append(req+"<br>");
	            	  }
	        	});
	       		}).fail(function() {
	     	            console.log('Failed');
	       	});
	}
$(document).ready(function(){
    $('.submit1').attr('disabled',true);
    $('.nn1').keyup(function(){
        if($(this).val().length !=0)
            $('.submit1').attr('disabled', false);            
        else
            $('.submit1').attr('disabled',true);
    })
});
</script>
</body>
</html>