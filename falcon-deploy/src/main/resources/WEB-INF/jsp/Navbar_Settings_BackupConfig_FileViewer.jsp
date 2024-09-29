
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
			
			<div id="fixedSet">
				
				<div class='block-header block-header-default'>
					<h3 class="block-title">${FileName}</h3>
					<div class="block-options">
						<a href="javascript:void(0);" class="btn btn-alt-danger" onclick="goBack()" data-toggle="click-ripple">Back</a>
					</div>
				</div>
				
				
				<div class="col-md-12 pl-0 pr-0">
				
					<textarea id="editor" name="textAreaValue" class="form-control"  style="display:none"><c:forEach items='${textAreaValue}' var='reader'>${reader}<%out.print("\n");%></c:forEach></textarea>
				<nav class="navbar  navbar-toggleable-xl navbar-light bg-faded p-10"
					style="border: 1px solid #ccc;">
					<ul class="nav navbar-nav ">
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
												<li class="nav-item mr-10 mt-1">
													<button type="button" class="btn btn-sm btn-primary" data-toggle="click-ripple" onClick="saveChanges()">Set as default</button>
												</li>					
					</ul>
				</nav>
				</div>
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
	<%@include file="/static/js/pages/Navbar_Settings_BackupConfig_FileViewerJS.jsp"%>
</body>
</html>