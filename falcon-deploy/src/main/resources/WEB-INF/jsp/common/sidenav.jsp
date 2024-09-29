
<nav id="sidebar">
	<!-- Sidebar Scroll Container -->
	<div id="sidebar-scroll">
		<!-- Sidebar Content -->
		<div class="sidebar-content">
			<!-- Side Header -->
			<div class="content-header content-header-fullrow px-15">

				<!-- Normal Mode -->
				<div class="content-header-section text-center align-parent sidebar-mini-hidden">
					<!-- Close Sidebar, Visible only on mobile screens -->
					<!-- Layout API, functionality initialized in Codebase() -> uiApiLayout() -->
					<button type="button"
						class="btn btn-circle btn-dual-secondary d-lg-none align-v-r"
						data-toggle="layout" data-action="sidebar_close">
						<i class="fa fa-times text-danger"></i>
					</button>
					<!-- END Close Sidebar -->
					<!-- Logo -->
					<div class="content-header-item">
						<a class="font-w700" href="${pageContext.request.contextPath}/dashboard"> <!-- <i
							class="si si-layers text-primary"></i>  -->
							<span class="font-size-xl text-dual-primary-dark"> <img src="${pageContext.request.contextPath}/static/img/logo.png" class="main-logo"/></span>
							<!-- <span class="font-size-xl text-primary"> Deploy</span> -->
						</a>
					</div>
					<!-- END Logo -->
				</div>
				<!-- END Normal Mode -->
			</div>
			<!-- END Side Header -->
			<!-- Side User -->
			<div
				class="content-side content-side-full content-side-user px-10 align-parent">
				<!-- Visible only in normal mode -->
				<div class="sidebar-mini-hidden-b text-center">
					<a class="img-link" href="${pageContext.request.contextPath}/myprofile"> <img class="img-avatar"
						onclick="modalFunction(this);"
						src="${pageContext.request.contextPath}/image/${userNameDisplay.getId()}" alt="">
					</a>
					<ul class="list-inline mt-10">
						<li class="list-inline-item"><a
							class="link-effect text-dual-primary-dark font-size-xs font-w700 text-uppercase"
							href="${pageContext.request.contextPath}/myprofile">${ userNameDisplay.firstName} ${ userNameDisplay.lastName}</a>
						</li>
						<li class="list-inline-item">
							<!-- Layout API, functionality initialized in Codebase() -> uiApiLayout() -->
							<!-- <a class="link-effect text-dual-primary-dark"
							data-toggle="layout" data-action="sidebar_style_inverse_toggle"
							href="javascript:void(0)"> <i class="si si-drop"></i>
						</a> -->
						</li>

					</ul>
				</div>
				<!-- END Visible only in normal mode -->
			</div>
			<!-- END Side User -->
			<!-- Side Navigation -->
			<div class="content-side content-side-full">
				<ul class="nav-main">
					<li><a <c:if test='${dashboard}'>class="active"</c:if> href="${pageContext.request.contextPath}/dashboard"> <i
							class="fa fa-area-chart"></i> <span class="sidebar-mini-hide">Dashboard </span>
					</a></li>
						<li><a <c:if test='${activity}'>class="active"</c:if> href="${pageContext.request.contextPath}/home"> <i
							class="fa fa-tachometer"></i> <span class="sidebar-mini-hide">Activity</span>
					</a></li>
					<li><a <c:if test='${report}'>class="active"</c:if> href="${pageContext.request.contextPath}/report"> <i
							class="fa fa-line-chart"></i> <span class="sidebar-mini-hide">Report</span>
					</a></li>
					
			<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
					<li><a <c:if test='${settings}'>class="active"</c:if> id="popoverset" href="${pageContext.request.contextPath}/settings" title="Settings" > <i
							class="fa fa-gears"></i> <span class="sidebar-mini-hide">Settings</span>
					</a></li>
					<div id="popover_content_wrapper" style="display: none;" class="col-md-12">
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
							<a class="dropdown-item"   href="${pageContext.request.contextPath}/showGlobalParams"><i class="fa fa-list-ul "></i>&nbsp; Session Parameter Management</a>
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
					</sec:authorize>
					
					
					<li class="nav-main-heading"><span
						class="sidebar-mini-visible">PEOPLE</span> <span
						class="sidebar-mini-hidden">PEOPLE</span></li>
					<li><a <c:if test='${users}'>class="active"</c:if> href="${pageContext.request.contextPath}/user"> <i
							class="fa fa-user"></i> <span class="sidebar-mini-hide">Users</span>
					</a></li>
					<li><a <c:if test='${teams}'>class="active"</c:if> href="${pageContext.request.contextPath}/teams"> <i
							class="fa fa-users"></i> <span class="sidebar-mini-hide">Teams</span>
					</a></li>
					<li><a <c:if test='${roles}'>class="active"</c:if> href="${pageContext.request.contextPath}/roles"> <i
							class="fa fa-sitemap"></i> <span class="sidebar-mini-hide">Roles</span>
					</a></li>


					<li class="nav-main-heading"><span
						class="sidebar-mini-visible">PROJECT</span> <span
						class="sidebar-mini-hidden">PROJECT</span></li>
					<li>
					<li><a <c:if test='${repo}'>class="active"</c:if> href="${pageContext.request.contextPath}/application"> <i
							class="fa fa-folder"></i> <span class="sidebar-mini-hide">Applications</span>
					</a></li>
					<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
						<li><a <c:if test='${db}'>class="active"</c:if> href="${pageContext.request.contextPath}/databases"> <i
								class="fa fa-database"></i> <span class="sidebar-mini-hide">Databases</span>
						</a></li>
					</sec:authorize>
					<li><a <c:if test='${map}'>class="active"</c:if> href="${pageContext.request.contextPath}/mappings"> <i
							class="fa fa-puzzle-piece"></i> <span class="sidebar-mini-hide">Mappings</span>
					</a></li>
					<li <c:if test='${newReq||allReq||openReq||openUnassignedReq||openedByMe||assignedToMe}'>class="open"</c:if>>
                          <a class="nav-submenu" data-toggle="nav-submenu" href="#"><i
							class="fa fa-th-list"></i>Request</a>
                                            <ul>
                                                <li>
                                                    <a <c:if test='${allReq}'>class="active"</c:if> href="${pageContext.request.contextPath}/request">All requests <small>(closed & open)</small></a>
                                                </li>
                                                <li>
                                                    <a <c:if test='${openReq}'>class="active"</c:if> href="${pageContext.request.contextPath}/requestOpen">Open requests</a>
                                                </li>
                                                <li>
                                                    <a <c:if test='${openUnassignedReq}'>class="active"</c:if> href="${pageContext.request.contextPath}/requestWaiting">Open Unassigned</a>
                                                </li>
                                                <li>
                                                    <a <c:if test='${openedByMe}'>class="active"</c:if> href="${pageContext.request.contextPath}/requestByMe">Opened by me <small>(closed & open)</small></a>
                                                </li>
                                                <li>
                                                    <a <c:if test='${assignedToMe}'>class="active"</c:if> href="${pageContext.request.contextPath}/requestToMe">Assigned to me <small>(closed & open)</small></a>
                                                </li>
                                            </ul>
                                        </li>
				</ul>
			</div>
			<!-- END Side Navigation -->
		</div>
		<!-- Sidebar Content -->
	</div>
	<!-- END Sidebar Scroll Container -->
</nav>
<!-- END Sidebar -->

<!-- Side Overlay -->

<aside id="side-overlay">
                <!-- Side Overlay Scroll Container -->
                <div class="slimScrollDiv " style="position: relative; width: auto; height: 573px;">
                <div id="side-overlay-scroll" data-toggle="slimscroll" class="over-flow-auto" style=" width: auto; height: 573px;">
                    <!-- Side Header -->
                    <div class="content-header  content-header-fullrow">
                        <div class="content-header-section align-parent">
                            <!-- Close Side Overlay -->
                            <!-- Layout API, functionality initialized in Codebase() -> uiApiLayout() -->
                            <button type="button" class="btn btn-circle btn-dual-secondary align-v-r" data-toggle="layout" data-action="side_overlay_close">
                                <i class="fa fa-times text-danger"></i>
                            </button>
                            <!-- END Close Side Overlay -->

                            <!-- User Info -->
                            <div class="content-header-item">
                                <span class="align-middle link-effect text-primary-dark font-w600">Notification</span>
                            </div>
                            <!-- END User Info -->
                        </div>
                    </div>
                    <!-- END Side Header -->

                    <!-- Side Content -->
                    <div class="content-side">

                   <sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
                        <!-- Mini Stats -->
                       <div class="block pull-r-l">
                            <div class="block-content block-content-full block-content-sm bg-body-light">
                                <div class="row">
                                    <div class="col-6 text-center">
                                        <div class="font-size-sm font-w600 text-uppercase text-muted ">Notify</div>
                                        <div class="font-size-h4" id="NotifyCount"></div>
                                    </div>
                                    <div class="col-6 text-center">
                                        <div class="font-size-sm font-w600 text-uppercase text-muted">Approve</div>
                                        <div class="font-size-h4" id="ApproveCount"></div>
                                    </div>
                              
                                </div>
                            </div>
                        </div>
                        <!-- END Mini Stats -->
                  </sec:authorize>


                        <!-- Activity -->
                        <div class="block pull-r-l  block-mode-loading" id="NotifyDetailShower"><!-- block-mode-loading -->
                            <div class="block-header bg-body-light">
                                <div class="row width-100">
                                	<h3 class="block-title col-10">
                                    <i class="fa fa-fw fa-clock-o font-size-default mr-5"></i>Activity
                                	</h3>
                                <div class="block-options col-2">
                                    <button type="button" class="btn-block-option" id="refreshData" >
                                        <i class="si si-refresh"></i>
                                    </button>
                                   
                                </div>
                                </div>
                            </div>
                            <div class="block-content">
                                <ul class="list list-activity" id="bindDetail">
              
                                </ul>
                            </div>
                        </div>
                        <!-- END Activity -->



                    </div>
                    <!-- END Side Content -->
                </div><div class="slimScrollBar" style="background: rgb(205, 205, 205); width: 4px; position: absolute; top: 0px; opacity: 0.9; display: none; border-radius: 7px; z-index: 99; right: 0px; height: 186.763px;"></div><div class="slimScrollRail" style="width: 4px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 1; z-index: 90; right: 0px;"></div></div>
                <!-- END Side Overlay Scroll Container -->
            </aside>
<!--End Of Side Overlay -->
		 <div class="modal fade" id="aboutPageModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header block-header block-header-default">
								<h4 class="modal-title block-title" >About</h4>
							</div>
							<div class="modal-body text-center">
								<img src="${pageContext.request.contextPath}/static/img/logo.png" class="main-logo" style="width: 250px;margin-bottom: 22px;"/>
								<p class="mb-10">Version : <span id="Aboutstatus"></span></p>
								<div class="about-link">
									 		<ul class="list-inline">
									 	 		<li><a href="https://f-d.io/" target="blank">Learn more</a></li>
									 	 		<li><a href="https://f-d.io/contact" target="blank">Contact us</a></li>
									 	 		<li><a href="https://docs.f-d.io" target="blank">Documentation</a></li>
									 	 	</ul>
								</div>
								<span class="">&copy;  2018  Falcon Deploy. All rights reserved.</span>
							</div>
							<div class="modal-footer">
							<button type="button" class="btn btn btn-alt-danger"  data-dismiss="modal" data-toggle="click-ripple">Close</button>
						</div>
					</div>
	      </div>
	      </div>
         <div class="modal fade" id="modal-popin" role="dialog" aria-labelledby="modal-popin" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header block-header block-header-default">
								<h4 class="modal-title block-title " >Server Maintenance Notification</h4>
							</div>
							<div class="modal-body">
							<p><span>Dear user,</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This is an important Alert! Falcon Deploy administrators have initiated an application maintenance. Please save your work right away. Please do not start or submit a new request. Your session will be logged out in a few minutes. </p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-alt-danger"
									data-dismiss="modal" data-toggle="click-ripple">Close</button>
							</div>
						</div>
					</div>
	      </div>