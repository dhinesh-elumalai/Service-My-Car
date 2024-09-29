<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<head>
<link href="${pageContext.request.contextPath}/static/css/codemirror.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/cobalt.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/blackboard.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/eclipse.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/neat.css" rel="stylesheet">
</head>
<body>
<div id="preloader">
		<!-- <img src="static/img/loader.png"> -->
		<i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
		<p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
	</div>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
	<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
	<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

 <main id="main-container">
                <!-- Page Content -->
                <div class="content">
	<div class="block">
		<div class="block block-bordered">
			<div class=" " id="fixedSet">
				<form action="${pageContext.request.contextPath}/file-create" method="post" id="new-file">
					<div class="col-md-12 pl-0 pr-0">						
					<div class="block-header block-header-default block block-bordered mb-0">
						<ul class="nav navbar-nav width-100">
							<li><label class="mt-5" for="filename"><b>File
									Name:</b></label></li>
							<li><div class="col-12 pr-0">
								<input id="filename" name="fileName" type="text"
									placeholder="Enter file name with extension"
									class="form-control input-md" required style="width:300px">
									
									<input type="hidden" value="${folderpath}" name="folderPATH">
					<input type="hidden" value="${gitstatus}" name="gitSTATUS">
					<input type="hidden" value="${accessControl}" name="accessCONTROL">
					<input type="hidden" value="${externalRepo}" name="externalRepo">
					<input type="hidden" value="${access}" name="access"> <input
						type="hidden" value="${IsA}" name="IsA"> <input
						type="hidden" value="${team}" name="team"> <input
						type="hidden" value="${role}" name="role">
							</div></li>
						</ul>
					</div>
					
					<div class="col-sm-12 pl-0 pr-0">
						<textarea id="editor" name="textAreaValue" class="form-control" style="display:none"></textarea>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<nav class="navbar  navbar-toggleable-xl navbar-light bg-faded">
						<ul class="nav navbar-nav p-10 editor-head">
							<li class="nav-item"><select
													class=" form-control btn-secondary" id="theme"
													onchange="displayTheme()">
														<option value="cobalt">Cobalt</option>
														<option value="blackboard">Blackboard</option>
														<option value="eclipse" selected>Eclipse</option>
														<option value="neat">Neat</option>
												</select></li>
												<li class="nav-item ml-10 mr-10"><select
													class=" form-control btn-secondary" id="code"
													onchange="displayLanguage()">
														<option value="xml">HTML/JSP/XML</option>
														<option value="text/x-java">JAVA</option>
														<option value="text/x-csrc">C</option>
														<option value="text/x-c++src">C++</option>
														<option value="sql" selected>SQL</option>
														<option value="javascript">JAVASCRIPT</option>
														<option value="css">CSS</option>
												</select></li>
												<li class="nav-item mr-10"><select
													class=" form-control btn-secondary language" id="code"
													onchange="displayLanguage()">
														<option value="'Menlo-Regular'">Menlo Regular</option>
														<option value="'PT Mono', monospace">PT Mono</option>
														<option value="'courier-new">Courier New</option>
														<option value="'Roboto Mono', monospace" selected>Roboto Mono</option>														
												</select></li>
												<li class="nav-item mr-10">
												<select class=" form-control btn-secondary fontsize" id="code1">
														<option value="12px">12 px</option>
														<option value="13px">13 px</option>
														<option value="14px" selected>14 px</option>
														<option value="15px">15 px</option>
														<option value="16px">16 px</option>														
												</select></li>
						
						<c:if test="${accessControl=='READ/WRITE'}">
							<button type="submit" class="btn btn-primary ml-auto" data-toggle="click-ripple">Commit</button>
							</ul>
						</c:if>
					</nav>
					</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
	</div>
	</main>
	</div>
	<script>
		function goBack() {
			window.history.back();
		}
	</script>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/Application_open_repo_createNewFileJS.jsp"%>
	<script>
		$('#new-file')
				.formValidation(
						{

							framework : 'bootstrap4',

							fields : {
								fileName : {
									validators : {
										notEmpty : {
											message : ''
										},
										stringLength : {
											min : 2,
											max : 30,
											message : ''
										},
										regexp : {
											regexp : /^[a-zA-Z0-9_.]+$/,
											message : ''
										}
									}
								},
								
							},
							icon : {
								valid : 'fa fa-check',
								invalid : 'fa fa-times-circle',
								validating : 'fa fa-sync-alt'
							},

						});
	</script>
	<script>
$(document).ready(function(){
    $("select.language").change(function(){
        var fontfamily = $(".language option:selected").val();
        $(".CodeMirror").css("font-family" , fontfamily);
    });
    $("select.fontsize").change(function(){
        var size = $(".fontsize option:selected").val();
        $(".CodeMirror").css("font-size" , size);
    });  
});
</script>
</body>