<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<link href="${pageContext.request.contextPath}/static/css/bootstrap-multiselect.css" rel="stylesheet">
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
			<div class=" block block-bordered">
				<!-- container-fluid -->
				<div class="row">
					<div class="col-md-12">
						<div class="block-header block-header-default ">
							<h5 class="block-title"><span class="text-uppercase">Backup and Restore Configuration</span> <br>
					<small class="mb-0 " style="font-size: small;">Note:<span> Backup job schedule is based on the timezone of the server where Falcon Deploy is installed.</span></small>
							</h5>
							<div class="block-options xs-pl-0">
								<div class="form-inline mrg-top-10">
								<c:if test="${enabled==false}">
									<a href="${pageContext.request.contextPath}/enableScheduling">
										<button class="btn  btn-primary mr-sm-1" data-toggle="click-ripple">Enable</button>
									</a> 
									</c:if>
									<c:if test="${enabled==true}">
									<a href="${pageContext.request.contextPath}/disableScheduling">
										<button class="btn  btn-primary " data-toggle="click-ripple">Disable</button>
									</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row padding-10 pr-15">
					<div class="col-md-12" id="fixedSet">
						<!-- container -->
						<section class="card">
						<div class="col-lg-12 col-md-12 col-sm-12 text-right pr-0 xs-pl-5">
											<button onclick="location.href='create_backup_now';"
												class="btn  btn-primary  xs-mb-5 xs-md-0-360" data-toggle="click-ripple">
												<i class="fa fa-files-o"></i> &nbsp;&nbsp;Backup now
											</button>
											<button class=" btn btn-primary" data-toggle="modal"
												data-target="#myModal1" data-toggle="click-ripple">
												<i class="fa fa-calendar"></i>&nbsp;&nbsp;Backup scheduler
											</button>
										</div>
							<header class="card-header card-header-background mt-10">
								<h5 class=" text-left" style="font-weight:normal">Description</h5>
							</header>
							<div class="card-text">
								<div class="row">
									<div class="col-sm-12">
										<div class="card-text text-left mt-10">
											Backup retention is specified in days. Default retention period is 7 days. Backups beyond the retention period are deleted automatically when a new backup is taken.
										</div>
									</div>
								</div>
								<br>
								<div class=" margin-bottom-1em">
									<div class="row">							
										<div class="col-sm-12">
										<div class="card-text text-left mt-10">
											<p><strong>Scheduled to :</strong> ${RETENTION_TIME}</p>
										</div>
									</div>
									</div>
									<div>
								</div>

									<div id="myModal1" class="modal fade" role="dialog">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-header block-header block-header-default">

													<h4 class="block-title">Backup scheduling settings</h4>
												</div>
												<div class="modal-body select-width">
													<ul class="nav nav-tabs" role="tablist">
														<li class="nav-item"><a class="nav-link active"
															href="#monthly" role="tab" data-toggle="tab">Monthly</a></li>
														<li class="nav-item"><a class="nav-link"
															href="#weekly" role="tab" data-toggle="tab">Weekly</a></li>
														<li class="nav-item"><a class="nav-link"
															href="#daily" role="tab" data-toggle="tab">Daily</a></li>
														<li class="nav-item"><a class="nav-link"
															href="#Settings" role="tab" data-toggle="tab">Settings</a>
														</li>
													</ul>
													<div class="tab-content">
														<div role="tabpanel" class="tab-pane active" id="monthly">
															<form action=<c:url value='BackupTimeConfigUpdate' /> method="get">
																<div class="row">
																	<div class="col-sm-6 col-md-6 mrg-top-10">
																		<div class="row">
																			<div class="col-md-4">
																				<label><b>Select date: </b></label>
																			</div>
																			<div class="col-md-6">
																				<select id="DropdownDate" class="form-control "
																					multiple="multiple" required>
																					<option value="1">1</option>
																					<option value="2">2</option>
																					<option value="3">3</option>
																					<option value="4">4</option>
																					<option value="5">5</option>
																					<option value="6">6</option>
																					<option value="7">7</option>
																					<option value="8">8</option>
																					<option value="9">9</option>
																					<option value="10">10</option>
																					<option value="11">11</option>
																					<option value="12">12</option>
																					<option value="13">13</option>
																					<option value="14">14</option>
																					<option value="15">15</option>
																					<option value="16">16</option>
																					<option value="17">17</option>
																					<option value="18">18</option>
																					<option value="19">19</option>
																					<option value="20">20</option>
																					<option value="21">21</option>
																					<option value="22">22</option>
																					<option value="23">23</option>
																					<option value="24">24</option>
																					<option value="25">25</option>
																					<option value="26">26</option>
																					<option value="27">27</option>
																					<option value="28">28</option>
																					<option value="29">29</option>
																					<option value="30">30</option>
																					<option value="31">31</option>
																				</select>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-6 col-sm-6 mrg-top-10">
																		<div class="row">
																			<div class="col-md-5">
																				<label><b>Select weekdays: </b></label>
																			</div>
																			<div class="col-md-7">
																				<select id="DropdownDay" class=" form-control "
																					multiple="multiple" required>
																					<option value="SUN">SUNDAY</option>
																					<option value="MON">MONDAY</option>
																					<option value="TUE">TUESDAY</option>
																					<option value="WED">WEDNESDAY</option>
																					<option value="THU">THURSDAY</option>
																					<option value="FRI">FRIDAY</option>
																					<option value="SAT">SATURDAY</option>
																				</select>
																			</div>
																		</div>
																	</div>
																</div>

																<div class="row">
																	<div class="col-sm-6 col-md-6 mrg-top-10">
																		<div class="row">
																			<div class="col-md-4">
																				<label><b>Select hour's: </b></label>
																			</div>
																			<div class="col-md-6">
																				<select id="DropdownHour" class=" form-control"
																					multiple="multiple" required>
																					<option value="0">0</option>
																					<option value="1">1</option>
																					<option value="2">2</option>
																					<option value="3">3</option>
																					<option value="4">4</option>
																					<option value="5">5</option>
																					<option value="6">6</option>
																					<option value="7">7</option>
																					<option value="8">8</option>
																					<option value="9">9</option>
																					<option value="10">10</option>
																					<option value="11">11</option>
																					<option value="12">12</option>
																					<option value="13">13</option>
																					<option value="14">14</option>
																					<option value="15">15</option>
																					<option value="16">16</option>
																					<option value="17">17</option>
																					<option value="18">18</option>
																					<option value="19">19</option>
																					<option value="20">20</option>
																					<option value="21">21</option>
																					<option value="22">22</option>
																					<option value="23">23</option>
																				</select>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-6 col-sm-6 mrg-top-10">
																		<div class="row">
																			<div class="col-md-5">
																				<label><b>Select minute: </b></label>
																			</div>
																			<div class="col-md-7 count-select">
																				<select name="SelectedMinute"
																					class=" form-control btn-outline-primary" required>
																					<option value="0">00</option>
																					<option value="1">01</option>
																					<option value="2">02</option>
																					<option value="3">03</option>
																					<option value="4">04</option>
																					<option value="5">05</option>
																					<option value="6">06</option>
																					<option value="7">07</option>
																					<option value="8">08</option>
																					<option value="9">09</option>
																					<option value="10">10</option>
																					<option value="11">11</option>
																					<option value="12">12</option>
																					<option value="13">13</option>
																					<option value="14">14</option>
																					<option value="15">15</option>
																					<option value="16">16</option>
																					<option value="17">17</option>
																					<option value="18">18</option>
																					<option value="19">19</option>
																					<option value="20">20</option>
																					<option value="21">21</option>
																					<option value="22">22</option>
																					<option value="23">23</option>
																					<option value="24">24</option>
																					<option value="25">25</option>
																					<option value="26">26</option>
																					<option value="27">27</option>
																					<option value="28">28</option>
																					<option value="29">29</option>
																					<option value="30">30</option>
																					<option value="31">31</option>
																					<option value="32">32</option>
																					<option value="33">33</option>
																					<option value="34">34</option>
																					<option value="35">35</option>
																					<option value="36">36</option>
																					<option value="37">37</option>
																					<option value="38">38</option>
																					<option value="39">39</option>
																					<option value="40">40</option>
																					<option value="41">41</option>
																					<option value="42">42</option>
																					<option value="43">43</option>
																					<option value="44">44</option>
																					<option value="45">45</option>
																					<option value="46">46</option>
																					<option value="47">47</option>
																					<option value="48">48</option>
																					<option value="49">49</option>
																					<option value="50">50</option>
																					<option value="51">51</option>
																					<option value="52">52</option>
																					<option value="53">53</option>
																					<option value="54">54</option>
																					<option value="55">55</option>
																					<option value="56">56</option>
																					<option value="57">57</option>
																					<option value="58">58</option>
																					<option value="59">59</option>
																				</select>
																			</div>
																		</div>
																	</div>
																</div>

																<input name="SelectedDates" type="hidden"
																	id="SelectedDates"> <input name="SelectedDays"
																	type="hidden" id="SelectedDays"> <input
																	name="SelectedHours" type="hidden" id="SelectedHours">
																<div class=" row mrg-top-10">
																	<button id="submit" class="mx-auto btn btn-primary " data-toggle="click-ripple">Update</button>
																</div>
																<input type="hidden" name="${_csrf.parameterName}"
																	value="${_csrf.token}" />
															</form>
														</div>
														<div role="tabpanel" class="tab-pane fade" id="weekly">
															<form action=<c:url value='BackupTimeConfigUpdate' />
																method="get">


																<div class="row">
																	<div class="col-sm-6 col-md-6 mrg-top-10">
																		<div class="row">
																			<div class="col-md-5">
																				<label><b>Select Weekdays: </b></label>
																			</div>
																			<div class="col-md-7">
																				<select id="DropdownDay1" class=" form-control "
																					multiple="multiple" required>
																					<option value="SUN">SUNDAY</option>
																					<option value="MON">MONDAY</option>
																					<option value="TUE">TUESDAY</option>
																					<option value="WED">WEDNESDAY</option>
																					<option value="THU">THURSDAY</option>
																					<option value="FRI">FRIDAY</option>
																					<option value="SAT">SATURDAY</option>
																				</select>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6 col-md-6 mrg-top-10">
																		<div class="row">
																			<div class="col-md-5">
																				<label><b>Select hour's: </b></label>
																			</div>
																			<div class="col-md-7">
																				<select id="DropdownHour1" class=" form-control "
																					multiple="multiple" required>
																					<option value="0">0</option>
																					<option value="1">1</option>
																					<option value="2">2</option>
																					<option value="3">3</option>
																					<option value="4">4</option>
																					<option value="5">5</option>
																					<option value="6">6</option>
																					<option value="7">7</option>
																					<option value="8">8</option>
																					<option value="9">9</option>
																					<option value="10">10</option>
																					<option value="11">11</option>
																					<option value="12">12</option>
																					<option value="13">13</option>
																					<option value="14">14</option>
																					<option value="15">15</option>
																					<option value="16">16</option>
																					<option value="17">17</option>
																					<option value="18">18</option>
																					<option value="19">19</option>
																					<option value="20">20</option>
																					<option value="21">21</option>
																					<option value="22">22</option>
																					<option value="23">23</option>
																				</select>
																			</div>
																		</div>
																	</div>
																</div>




																<div class="row">
																	<div class="col-sm-6 col-md-6 mrg-top-10">
																		<div class="row">
																			<div class="col-md-5">
																				<label><b>Select minute: </b></label>
																			</div>
																			<div class="col-md-7 count-select">
																				<select name="SelectedMinute"
																					class=" form-control btn-outline-primary" required>
																					<option value="0">00</option>
																					<option value="1">01</option>
																					<option value="2">02</option>
																					<option value="3">03</option>
																					<option value="4">04</option>
																					<option value="5">05</option>
																					<option value="6">06</option>
																					<option value="7">07</option>
																					<option value="8">08</option>
																					<option value="9">09</option>
																					<option value="10">10</option>
																					<option value="11">11</option>
																					<option value="12">12</option>
																					<option value="13">13</option>
																					<option value="14">14</option>
																					<option value="15">15</option>
																					<option value="16">16</option>
																					<option value="17">17</option>
																					<option value="18">18</option>
																					<option value="19">19</option>
																					<option value="20">20</option>
																					<option value="21">21</option>
																					<option value="22">22</option>
																					<option value="23">23</option>
																					<option value="24">24</option>
																					<option value="25">25</option>
																					<option value="26">26</option>
																					<option value="27">27</option>
																					<option value="28">28</option>
																					<option value="29">29</option>
																					<option value="30">30</option>
																					<option value="31">31</option>
																					<option value="32">32</option>
																					<option value="33">33</option>
																					<option value="34">34</option>
																					<option value="35">35</option>
																					<option value="36">36</option>
																					<option value="37">37</option>
																					<option value="38">38</option>
																					<option value="39">39</option>
																					<option value="40">40</option>
																					<option value="41">41</option>
																					<option value="42">42</option>
																					<option value="43">43</option>
																					<option value="44">44</option>
																					<option value="45">45</option>
																					<option value="46">46</option>
																					<option value="47">47</option>
																					<option value="48">48</option>
																					<option value="49">49</option>
																					<option value="50">50</option>
																					<option value="51">51</option>
																					<option value="52">52</option>
																					<option value="53">53</option>
																					<option value="54">54</option>
																					<option value="55">55</option>
																					<option value="56">56</option>
																					<option value="57">57</option>
																					<option value="58">58</option>
																					<option value="59">59</option>
																				</select>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-12">
																		<div class="row">
																			<div class="col-sm-12">
																				<input name="SelectedDates" type="hidden"> <input
																					name="SelectedDays" type="hidden"
																					id="SelectedDays1"> <input
																					name="SelectedHours" type="hidden"
																					id="SelectedHours1">
																					
																				<div class="row" style="margin-top: 10px;">
																					<button id="submit" class="mx-auto btn btn-primary" data-toggle="click-ripple">Update</button>
																					<input type="hidden" name="${_csrf.parameterName}"
																						value="${_csrf.token}" />
																				</div>
																			</div>
																			<div class="col-sm-6"></div>
																		</div>
																	</div>
																</div>


															</form>
														</div>
														<div role="tabpanel" class="tab-pane fade" id="daily">
															<form action=<c:url value='BackupTimeConfigUpdate' />
																method="get">
																<div class="row">
																	<div class="col-sm-6 mrg-top-10">
																		<div class="row">
																			<div class="col-md-5">
																				<label><b>Select hour's: </b></label>
																			</div>
																			<div class="col-md-7">
																				<select id="DropdownHour2" class=" form-control "
																					multiple="multiple" required>
																					<option value="0">0</option>
																					<option value="1">1</option>
																					<option value="2">2</option>
																					<option value="3">3</option>
																					<option value="4">4</option>
																					<option value="5">5</option>
																					<option value="6">6</option>
																					<option value="7">7</option>
																					<option value="8">8</option>
																					<option value="9">9</option>
																					<option value="10">10</option>
																					<option value="11">11</option>
																					<option value="12">12</option>
																					<option value="13">13</option>
																					<option value="14">14</option>
																					<option value="15">15</option>
																					<option value="16">16</option>
																					<option value="17">17</option>
																					<option value="18">18</option>
																					<option value="19">19</option>
																					<option value="20">20</option>
																					<option value="21">21</option>
																					<option value="22">22</option>
																					<option value="23">23</option>
																				</select>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6 mrg-top-10">
																		<div class="row">
																			<div class="col-md-5">
																				<label><b>Select minute: </b></label>
																			</div>
																			<div class="col-md-7 count-select">
																				<select name="SelectedMinute"
																					class=" form-control btn-outline-primary" required>
																					<option value="0">00</option>
																					<option value="1">01</option>
																					<option value="2">02</option>
																					<option value="3">03</option>
																					<option value="4">04</option>
																					<option value="5">05</option>
																					<option value="6">06</option>
																					<option value="7">07</option>
																					<option value="8">08</option>
																					<option value="9">09</option>
																					<option value="10">10</option>
																					<option value="11">11</option>
																					<option value="12">12</option>
																					<option value="13">13</option>
																					<option value="14">14</option>
																					<option value="15">15</option>
																					<option value="16">16</option>
																					<option value="17">17</option>
																					<option value="18">18</option>
																					<option value="19">19</option>
																					<option value="20">20</option>
																					<option value="21">21</option>
																					<option value="22">22</option>
																					<option value="23">23</option>
																					<option value="24">24</option>
																					<option value="25">25</option>
																					<option value="26">26</option>
																					<option value="27">27</option>
																					<option value="28">28</option>
																					<option value="29">29</option>
																					<option value="30">30</option>
																					<option value="31">31</option>
																					<option value="32">32</option>
																					<option value="33">33</option>
																					<option value="34">34</option>
																					<option value="35">35</option>
																					<option value="36">36</option>
																					<option value="37">37</option>
																					<option value="38">38</option>
																					<option value="39">39</option>
																					<option value="40">40</option>
																					<option value="41">41</option>
																					<option value="42">42</option>
																					<option value="43">43</option>
																					<option value="44">44</option>
																					<option value="45">45</option>
																					<option value="46">46</option>
																					<option value="47">47</option>
																					<option value="48">48</option>
																					<option value="49">49</option>
																					<option value="50">50</option>
																					<option value="51">51</option>
																					<option value="52">52</option>
																					<option value="53">53</option>
																					<option value="54">54</option>
																					<option value="55">55</option>
																					<option value="56">56</option>
																					<option value="57">57</option>
																					<option value="58">58</option>
																					<option value="59">59</option>
																				</select>
																			</div>
																		</div>
																	</div>
																</div>
																<input name="SelectedDates" type="hidden"> <input
																	name="SelectedDays" type="hidden"> <input
																	name="SelectedHours" type="hidden" id="SelectedHours2">
																<div class="row mrg-top-10">
																	<button id="submit" class="mx-auto btn btn-primary" data-toggle="click-ripple">Update</button>

																	<input type="hidden" name="${_csrf.parameterName}"
																		value="${_csrf.token}" />
																</div>
															</form>
														</div>
														<div role="tabpanel" class="tab-pane fade" id="Settings">
															<div class="form-inline mrg-top-10">
																<a href="${pageContext.request.contextPath}/enableScheduling"><button
																		class="btn  btn-outline-primary mr-sm-4" data-toggle="click-ripple">Enable
																		scheduling</button></a> <a href="${pageContext.request.contextPath}/disableScheduling"><button
																		class="btn  btn-outline-primary " data-toggle="click-ripple">Disable
																		scheduling</button></a>
															</div>
														</div>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-alt-danger"
														data-dismiss="modal" data-toggle="click-ripple">Close</button>
												</div>
											</div>

										</div>
									</div>

									<!-- End Model -01 -->
								</div>
							</div>
						</section>
						<div class="row">

							<c:if test="${PRIMARY_REPO_BACKUP_RETENTION ne null}">

								<div class="text-center  col-md-12"
									id="backuprepoRetentionTable">
									<div class="example2"></div>
									<table
										class="table table-responsive-1 table-striped table-bordered  ">
										<thead>
											<tr>
												<th class="text-left">Retention for</th>
												<th class="text-right">Retention in days</th>

												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:set  value='${PRIMARY_REPO_BACKUP_RETENTION}' var='logs'/>
												<tr>
													<td class="text-left"><c:out
															value='${logs.getRetentionFor()}' /></td>
													<td class="text-right"><c:out
															value='${logs.getDays()}' /></td>
													<td>
														<div class="">
															<button id="submit" data-toggle="modal"
																data-target="#myModal" class="btn btn-primary" data-toggle="click-ripple">Update</button>
															<div id="myModal" class="modal fade" role="dialog">
																<div class="modal-dialog modal-lg">

																	<div class="modal-content">

																		<div class="modal-header block-header block-header-default">
																			
																			<h4 class="col-md-12 modal-title text-left block-title">

																				Retention in days</h4>
																		</div>
																		<div class="modal-body">
																			<form action=<c:url value='BackupConfigUpdate' />
																				method="post">
																				<div class="form-group row required">
																					<label class="col-md-3 control-label text-right"
																						for="nn"><b>Number of days:</b></label>
																					<div class="col-md-6">
																						<input id="nn" name="days" type="text"
																							placeholder=""
																							value='${logs.getDays()}'
																							class="form-control input-md nn1">
																					</div>
																					<div class="col-md-2">
																						<button id="submit" class=" btn btn-primary submit1">Update</button>

																						<input type="hidden" name="${_csrf.parameterName}"
																							value="${_csrf.token}" />
																					</div>
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
													</td>
												</tr>
										</tbody>
									</table>
								</div>
							</c:if>
						</div>

						<div class="form-group row">
							<div class="col-md-12">
								<div class="card-text">
									<div class="table-responsive">
										<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th class="text-right">S.no</th>
												<th class="border-right-none">
													 Backup folder name <b
													class="align-middle"></b>
												</th>
												<th><a href="${pageContext.request.contextPath}/RestoreFromBackUp"
													style="float: right;"><button class="btn btn-primary" data-toggle="click-ripple">Select a backup to restore</button></a></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items='${BackupFolderNames}' var='logs'
												varStatus="loops">
												<tr style="height: 50px;">
													<td class="text-right"><c:out value='${loops.index+1}' /></td>
													<td style="border-right-color:transparent"><c:out value='${logs}' /></td>
													<td></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
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
	<script src="static/js/plugins/bootstrap-multiselect.js"></script>
	<%@include file="/static/js/pages/Navbar_Settings_BackupConfigJS.jsp"%>
</body>
</html>