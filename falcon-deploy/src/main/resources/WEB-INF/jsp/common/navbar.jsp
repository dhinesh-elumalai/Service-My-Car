<!-- Header -->
<header id="page-header">
	<!-- Header Content -->
	<div class="content-header">
		<!-- Left Section -->
		<div class="content-header-section">
			<!-- Toggle Sidebar -->
			<!-- Layout API, functionality initialized in Codebase() -> uiApiLayout() -->
			<button type="button" id="table-width" class="btn btn-circle btn-dual-secondary"
				data-toggle="layout" data-action="sidebar_toggle">
				<i class="fa fa-navicon"></i>
			</button>
			<!-- END Toggle Sidebar -->
		</div>
		<!-- END Left Section -->
		<!-- Right Section -->
		<div class="content-header-section rowfafari">
			<!-- Deploy Button -->
			<a href="${pageContext.request.contextPath}/NewDeployement_step1"
				class="btn btn-sm btn-square btn-primary" data-toggle="click-ripple"><span class=" fa fa-upload"> </span> New Deployment</a>
			<!-- Settings Dropdown -->
			
					<sec:authorize access="hasAnyAuthority('USER','TEAM_ADMIN')">
			<div class="btn-group" role="group">

					
					<button type="button" class="btn btn-circle btn-dual-secondary "
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fa fa-gears"></i>
					</button>
					<div class="dropdown-menu dropdown-menu-right min-width-150"
						aria-labelledby="page-header-user-dropdown">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/EmailManagement"><i class="fa fa-inbox mr-5"></i> Email Notification Preference </a> 
						</div>
						</div>
			</sec:authorize>	
		
			<!-- END Settings Dropdown -->
			<!-- User Profile Dropdown -->
			<div class="btn-group" role="group">
				<button type="button" class="btn btn-rounded btn-dual-secondary"
					id="page-header-user-dropdown" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">

					<div><p class="user-xs text-capitalize">${ userNameDisplay.firstName} ${ userNameDisplay.lastName} </p></div>
					
				</button>
				<a href="javascript:void(0);" id="page-header-user-dropdown" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">
					<img class="img-avatar-thumb d-block d-sm-none" src="${pageContext.request.contextPath}/profile/${userNameDisplay.getId()}" alt="" style="height:32px;width:32px; border-radius:100%">
				</a>
				
				
				<button type="button" class="btn btn-circle btn-dual-secondary" id="notifyToggler" data-toggle="layout" data-action="side_overlay_toggle">
                            <i class="fa fa-bell"></i>
                            <span class="badge badge-notify" id="notifyCountNav"></span>
      </button>
  


				<div class="dropdown-menu min-width-150 xs-login"
					aria-labelledby="page-header-user-dropdown">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/myprofile"> <i
						class="si si-user mr-5"></i> Profile
					</a>
					<div class="dropdown-divider"></div>
					<span class="dropdown-item" style="cursor: pointer;" onClick="showModalForAbout()"> <i class="si si-info mr-5"></i> About</span>
					<!-- END Side Overlay -->
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/logout"> <i
						class="si si-logout mr-5"></i> Sign Out
					</a>
				</div>
			</div>
			<!-- END User Profile Dropdown -->
		</div>
		<!-- END Right Section -->
	</div>

</header>
<!-- END Header -->


	

