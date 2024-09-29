<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<body >
	<div id="page-container" class="sidebar-o side-scroll page-header-fixed main-content-boxed">
		<%@include file="/WEB-INF/jsp/common/sidenav.jsp"%>
		<%@include file="/WEB-INF/jsp/common/navbar.jsp"%>

		<main id="main-container" style="min-height: 596px;"> <!-- Page Content -->
			  <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header block-header block-header-default block-button-result">
								<h4 class="modal-title block-title text-uppercase" id="myModalLabel">Result</h4>
							</div>
							<div class="modal-body">
								<p id="status"></p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-alt-danger"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
	      </div>
				
		<div class="content" id="notempty">
			<div class="block">
				<div class="block block-bordered">
					<div class="block-header block-header-default act-head">
						<div class="col-lg-5 col-sm-5 pl-0 ">
							<h3 class="block-title activity-timeline ">ACTIVITY TIMELINE</h3>
						</div>
						<div class="form-group  col-lg-5 mb-0 act-time" >
						<div class="row">
                         	<span class="col-lg-7 col-sm-7 col-form-label text-right pr-0 xs-pl-0" >Refresh</span>
                              <div class="col-lg-5 col-sm-5 act-timeset xs-mb-5 xs-pl-0 xs-pr-0">
                                 <select class="form-control" id="ref-dif" name="ref-def" >
                                     <option value="5">5 Sec</option>
                                     <option value="10" selected>10 Sec</option>
                                     <option value="15">15 Sec</option>
                                     <option value="20">20 Sec</option>
                                     <option value="manual">Manual</option>
                                 </select>


                                 <div id="otherType" style="position:absolute;display:none">
   									<input type="number" class="form-control" name="specify" placeholder="Sec"/>
   								 </div>

                              </div>
                              
                              
                                </div>
                                
                         </div>
                         <div class="col-lg-2 col-sm-2 pl-0 xs-pl-15 pr-0 xs-pl-0">
                              	<button id="stop" class="act-timeset-btn btn btn-primary width-100" data-toggle="click-ripple">Stop Refresh &nbsp;<!-- <i class="fa fa-stop-circle" aria-hidden="true"></i> --></button>  
                               <button id="now" class="act-timeset-btn btn btn-primary width-100" style="display: none;" data-toggle="click-ripple">Refresh Now &nbsp;<!-- <i class="fa fa-refresh" aria-hidden="true"></i> --></button>
                              </div>
					</div>
					  <!--Jquery will dynamically add contents here...  -->
	     <div class="modal fade" id="changeUN" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

	      </div>
					<div class="block">
						<div class="col-md-12">
							<form class="form-inline" >
								<div class="container-fluid pl-0 pr-0">
									<div class="">
										
										<div class="block mt-20">
											<div class="col-md-12">
												<div class="row">
													<div class="col-sm-5 pl-0 pr-0">
														<div class="row ">
														<div class="col-sm-12">
															<div class='input-group' id='stime'>
															<label>Duration</label>
														<input type='text' id='stimeip' class="form-control  xs-mb-5 ml-10" placeholder="Start time" />
															<div class="input-group-text" style="border-radius: 0px 3px 3px 0px; border-left: 0px;">
																<span class="input-group-addon" style="cursor: pointer">
																	<span class="fa fa-calendar"></span> 
																</span>
															</div>
														</div>
														</div>
														</div>
													</div>
													<div class="col-sm-5">
														<div class="row">
															<div class='input-group col-sm-12 end-time xs-pr-0 xs-mb-5 xs-pl-0' id='etime'>
																<input type='text' class="form-control" id='etimeip' placeholder="End Time" />
															<div class="input-group-text" style="border-radius: 0px 3px 3px 0px; border-left: 0px;">
																<span class="input-group-addon" style="cursor: pointer">
																	<span class="fa fa-calendar"></span> 
																</span>
															</div>
														</div>
														</div>
													</div>
													<div class="col-sm-2 text-right pl-0 pr-0">
														<button id="Filterbtn" type="button" class="btn btn-primary xs-ml-0"  style="display: inline-block;width: 49.5%;" data-toggle="click-ripple">Filter</button>
														<button id="clearField" type="button" class="btn btn-primary " style="display: inline-block;width: 48%;" data-toggle="click-ripple">Clear</button>
													</div>
													
												</div>
												
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="col-md-12 act-filter pt-0">
							<div class="form-inline mb-20">

								<label class="pr-20 sm-mr-0 ">Search</label> 
								<select class="form-control xs-mb-5 col-md-2 col-sm-5" name="material-select" id="SearchOn">
									<option value="RequetID">Request Id</option>
									<option value="Requetor">Requestor</option>
									<option value="Application">Application</option>
									<option value="Database">Database</option>
									<option value="SQL_File">SQL File</option>
									<option value="Status">Status</option>
								</select>
								<div class="relative-section  col-md-7 col-sm-5 act-search xs-pl-0 xs-pr-0">
									<span class="input-group-addon fa fa-search search2 xs-l-15"
										style="top: 9px;"></span> <input
										id="SearchIP"
										class=" form-control t-indent-10 mr-sm-2 width-50"
										name="SearchName" type="text" placeholder="Search"
										autocomplete="off" required="required">

								</div>
							</div>
						</div>
						<div class=" p-0" id="fixedSet">
						<div class="no-data text-center" id="emptyDataajax" style="display: none;">
									<p>There is no data to display.</p>
							</div>
							<div class="col-md-12">
								<div class="content-block ">							
									<div class="table-responsive">
										<table id="myTable3" class="table table-bordered table-striped table-vcenter activity-table " style="min-width:1400px;">
										<thead id="thead">
											<tr>
												<th id="rn" style="width:8%" class="text-right">Request Id <i class="fa fa-sort"></i></th>
												<th id="r" style="width:10%">Requestor <i class="fa fa-sort"></i></th>
												<th id="a" style="width:7%">Application <i class="fa fa-sort"></i></th>
												<th id="db" style="width: 9%;">Database <i class="fa fa-sort"></i></th>
												<th id="sf" style="width: 10%;">Script File <i class="fa fa-sort"></i></th>
												<th id="ss" style="width: 9%; text-align:center">Script Status <i class="fa fa-sort"></i></th>
												<th id="et" style="width: 9%;" class="text-right">Elapsed Time <i class="fa fa-sort"></i></th>
												<th id="dt" style="width: 15%;" class="text-right">Deployment Time <i class="fa fa-sort"></i></th>
											</tr>
										</thead>
										<tbody id="tbody" >
										</tbody>
									</table>
									</div>
								</div>
	<div class="container-fluid ">
	    <div class="row">
	    	<nav aria-label="Page navigation">
	        	<ul class="pagination mt-10 flex-wrap" id="pagination"></ul>
	    	</nav>
	    </div>
	</div>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
		</main>

	</div>


	<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
	<%@include file="/static/js/pages/ActivityJS.jsp"%>
	<script src="static/js/plugins/moment.js"></script>
	<script src="static/js/plugins/bootstrap-datetimepicker.min.js"></script>


	<script>
		$(function() {
			var bindDatePicker = function(eee) {
				$(eee).datetimepicker({
					sideBySide : true,
					maxDate: moment(),
					icons : {
						time : "fa fa-clock-o",
						date : "fa fa-calendar",
						up : "fa fa-arrow-up",
						down : "fa fa-arrow-down",
						next : 'fa fa-arrow-right',
						previous : 'fa fa-arrow-left'
					}
				}).find('input:first').on("blur", function() {
					var date = $(this).val();
					$(this).val(date);
				});
			}

			bindDatePicker('#stime');
			bindDatePicker('#etime');

		});
	</script>
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
