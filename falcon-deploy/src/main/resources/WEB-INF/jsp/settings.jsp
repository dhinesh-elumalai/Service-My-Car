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
			<div class="block">
				<div class="block block-bordered">
					<div class="block-header block-header-default">
						<h3 class="block-title">Settings</h3>
					</div>
					<div class="col-md-12">
							<ul class="bg-none padding-left-0 breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active">Settings</li>
							</ul>
						</div>
					  	<div class="row pl-20" style="padding-bottom: 40px;font-size: 1rem;" id="fixedSet">
					<div class="col-md-4">
						<label class="text-primary pb-0">Application</label>
					      <a class="dropdown-item"   href="${pageContext.request.contextPath}/StorageConfiguration"><i class="si si-drawer mr-5"></i> Path Configuration </a> 
						  <a class="dropdown-item"  href="${pageContext.request.contextPath}/AppBackupAndRestoreConfigPageForAdmin"><i class="si si-docs mr-5"></i> Backup and Restore Configuration</a> 
  							<a class="dropdown-item"   href="${pageContext.request.contextPath}/emailConfiguration"><i class="fa fa-envelope-o"></i>&nbsp; Email Configuration</a>
						  <a class="dropdown-item"   href="${pageContext.request.contextPath}/envConfiguration"><i class="fa fa-envira"></i>&nbsp; Environment Configuration</a>
						  <a class="dropdown-item"   href="${pageContext.request.contextPath}/fileConfiguration"><i class="fa fa-file-o"></i>&nbsp; File Type Configuration</a>
						  <a class="dropdown-item"   href="${pageContext.request.contextPath}/timestampConfiguration"><i class="fa fa-clock-o"></i>&nbsp; Timestamp Configuration</a>
						  <a class="dropdown-item"   href="${pageContext.request.contextPath}/purgeConfiguration"><i class="fa fa-recycle"></i>&nbsp; Purge Configuration</a>
						  <a class="dropdown-item"   href="${pageContext.request.contextPath}/descriptorConfiguration"><i class="fa fa-eye-slash"></i>&nbsp; Show DB Descriptor</a>
						   <a class="dropdown-item"   href="${pageContext.request.contextPath}/localDiskSpaceManagement"><i class="fa fa-archive"></i>&nbsp; Local Disk Space Management</a>
					</div>
					<div class="col-md-4">
							<label class="text-primary pb-0">Deployment</label>
						    <a class="dropdown-item"   href="${pageContext.request.contextPath}/deployPrivilegeManagement"><i class="fa fa-key mr-5"></i> Deploy Privilege Management</a>
						    <a class="dropdown-item"   href="${pageContext.request.contextPath}/approvalManagement"><i class="si si-user-following mr-5"></i> Approval Management</a> 
							<a class="dropdown-item"   href="${pageContext.request.contextPath}/delegateList"><i class="fa fa-database"></i>&nbsp; Save Database Credential</a>
							<a class="dropdown-item"   href="${pageContext.request.contextPath}/delegateUserList"><i class="fa fa-share-alt"></i>&nbsp; Delegate Database Credential</a>
							<a class="dropdown-item"   href="${pageContext.request.contextPath}/showGlobalParams"><i class="fa fa-list-ul mr-5"></i>&nbsp; Session Parameter Management</a>
							<a class="dropdown-item"   href="${pageContext.request.contextPath}/wrapperConfiguration"><i class="fa fa-file-code-o"></i>&nbsp;&nbsp; Wrapper Configuration</a>
							<a class="dropdown-item"   href="${pageContext.request.contextPath}/notificationConfiguration"><i class="fa fa-bell-o"></i>&nbsp;Notification Management</a>
							
					</div>
					<div class="col-md-4">
							<label class="text-primary pb-0">User Preferences</label>
							<a class="dropdown-item"   href="${pageContext.request.contextPath}/EmailManagement"><i class="fa fa-inbox mr-5"></i> Email Notification Preference </a> 
							<label class="text-primary pb-0">MFA</label>
							<a class="dropdown-item"   href="${pageContext.request.contextPath}/MFA_User_management"><i class="si si-users mr-5"></i> MFA User management</a>
							 <a class="dropdown-item"   href="${pageContext.request.contextPath}/MFA_Configuration"><i class="si si-login mr-5"></i> MFA Configuration</a>
					</div>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
</body>
</html>
