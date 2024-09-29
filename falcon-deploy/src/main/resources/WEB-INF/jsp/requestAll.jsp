<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<!-- <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet"> -->

<body>
<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

		<main id="main-container"> <!-- Page Content -->
		<div class="content">
			<div class="">
				<div class="block block-bordered">
					<div class="block-header block-header-default">
						<h3 id="requestheader" class="block-title"></h3>
					</div>


					<div class="block mb-0">
						<div class="block-content">
							<div class="form-inline mb-20" >
								<label class="pr-10">Filter</label> <select class="form-control"
									id="requestBasedOn" name="material-select">
									<option value="RequestName">Request Name</option>
									<option value="Requestor">Requestor</option>
									<option value="Application">Application</option>
								</select>
								<div class="relative-section xs-pl-0 xs-pr-0 xs-mt-5 col-md-6">
									<span class="input-group-addon fa fa-search search2 xs-l-15"
										style="top: 10px;"></span> <input
										id="requestsearchkey"
										class="form-control t-indent-10 mr-sm-2 width-100-imp"
										name="SearchName" type="text" placeholder="Search by request name or requestor or application"
										autocomplete="off">
								</div>
							</div>
						</div>
						   <div class="no-data text-center" id="emptyDataajax" style="display: none;">
									<p>There is no data to display.</p>
							</div>
						<div class="block">                 
                        <div class="block-content block-content-full">
                            <!-- DataTables init on table by adding .js-dataTable-simple class, functionality initialized in js/pages/be_tables_datatables.js -->
						<div class="table-responsive">
						 <div id="data-loader" class="loader-height" >
 									<div style="display:table-cell; vertical-align:middle;">
 										<i class="fa fa-2x fa-cog fa-spin" style="color:#324a7e"></i>
									<p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
 									</div>
						  </div> 
						 
							<table class="table table-bordered table-striped table-vcenter js-dataTable-simple xs-width-1000 sm-width-1000">
                                <thead id="thead" style="display: none;">
                                    <tr>
                                        <th id="rn" class="">Request Name <i class="fa fa-sort"></i></th>
                                        <th id="ad">Requestor <i class="fa fa-sort"></i></th>
                                        <th id="ap" class="d-sm-table-cell">Application <i class="fa fa-sort"></i></th>
                                        <th id="op" class="d-sm-table-cell text-right mr-10" style="width: 21%;">Opened <i class="fa fa-sort ml-10"></i></th>
                                        <th id="st" class="text-center" style="width: 15%;">Status <i class="fa fa-sort"></i></th>
                                    </tr>
                                </thead>
                                <tbody id="tbody">
                                </tbody>
                            </table>
							
						</div>
                        </div>
                    </div>
					</div>
					<div class="container-fluid">
    <nav aria-label="Page navigation">
        <ul class="pagination flex-wrap" id="pagination"></ul>
    </nav>
</div>
				</div>
			</div>
			</div>
		</main>
	</div>

	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
		<%@include file="/static/js/pages/RequestAllJS.jsp"%>
	<script type="text/javascript">
    $(document).ready(function() {
    	displaySpinner();
    });
    function displaySpinner()
    {
        var divHeight = $('.table-responsive').height(); 
        $('.loader-height').css('height', divHeight+'px');
        
        var divWidth = $('.table-responsive').width(); 
        $('.loader-height').css('width', divWidth+'px');
    }
  </script>

</body>
</html>