<c:if test="${not empty pingStatus}">
	<script>
		$(document).ready(function() {
			$('#memberModal').modal('show');
		});
	</script>
</c:if>
<c:if test="${not empty showUpdateSTS}">
<script>
		$(document).ready(function() {
			$('#memberModal').modal('show');
		});
	</script>
</c:if>
<script>
	$("#FormAliasName").blur(function() {
		var typedValue = $("#FormAliasName").val();
		$("#preloader").show();
		$.ajax({
			url : 'check_for_aliasname_already_present',
			data : {
				name : typedValue
			},
			type : 'get'
		}).done(function(responseData) {
			$("#preloader").hide();
			if (responseData == 'present') {
				$('#FormAliasNameErr').show();
				$('#SubmitFormButtonForm').prop("disabled", true);
			} else {
				$('#FormAliasNameErr').hide();
				$('#SubmitFormButtonForm').prop("disabled", false);
			}

		}).fail(function() {
			$("#preloader").hide();
			console.log('Failed');
		});
	});

	function clearSelectBox() {
		$('#selectBoxService').empty();
	}
	
	function validateAndsubmitAJAX(){
		$("#MainForm").formValidation('validate');
	}

	function submitCreateForm(){

		$("#preloader").show();
		var form = $("#MainForm")[0];
		
		var file = new FormData(form);
		$.ajax({
			url : 'autonomousDBcreate',
			enctype : 'multipart/form-data',
			data : file,
			type : 'post',
			processData : false,
			contentType : false,
			cache : false,
			timeout : 1000000,
			success : function(data) {
				if (data == 'success') {
					window.location.href = 'autonomousDBcreateRedirect';
				} else {
					$("#preloader").hide();
					$("#upload_status").empty();
					$("#upload_status").text(data);
					$('#memberModal').modal('show');
				}
			},
			error : function(err) {
				$("#preloader").hide();
				$("#upload_status").empty();
				$("#upload_status").text("Something went wrong!");
				$('#memberModal').modal('show');
			}
		});

	}
	function getServiceList() {
		var credfile = $('#credfile');
		if (credfile[0].files.length > 0) {
			$("#preloader").show();
			var form = $("#MainForm")[0];
			var file = new FormData(form);
			console.log("form data " + file);
			$.ajax({
				url : 'getServiceListFromZip',
				enctype : 'multipart/form-data',
				data : file,
				type : 'post',
				processData : false,
				contentType : false,
				cache : false,
				timeout : 1000000,
				success : function(data) {
					console.log(data);
					if (data.status == 'SUCCESS') {
						$("#preloader").hide();
						$('#selectBoxService').empty();
						$.each(data.serviceList, function(i, service) {
							$('#selectBoxService').append(
									$('<option></option>').val(service).text(
											service));
						});
					} else {
						$("#preloader").hide();
						$("#upload_status").empty();
						$("#upload_status").text(data.status);
						$('#memberModal').modal('show');
					}
				},
				error : function(err) {
					$("#preloader").hide();
				}
			});
		} 
	}
	function emptySelectBox() {
		$("#fileupstat").hide();
		$("#fileupstat1").hide();
		$('#ModalselectBoxService').empty();
	}
	$('#ModalselectBoxService').change(function () {    
		$("#fileupstat1").empty();
		$("#fileupstat1").hide();
	});  
	

	$("#FormAliasName").focus(function() {
		$('#FormAliasNameErr').hide();
	});
	$(document)
			.ready(
					function() {
						$('#chooseService')
								.formValidation(
										{
											framework : 'bootstrap4',
											icon : {
												valid : 'fa fa-check',
												invalid : 'fa fa-times-circle',
												validating : 'fa fa-sync-alt'
											},
											fields : {
												service : {
													validators : {
														notEmpty : {
															message : 'Service name is required'
														}
													}
												}
											}
										});

						$('#MainForm')
								.formValidation(
										{
											framework : 'bootstrap4',
											icon : {
												valid : 'fa fa-check',
												invalid : 'fa fa-times-circle',
												validating : 'fa fa-sync-alt'
											},
											fields : {
												credfile : {
													validators : {
														notEmpty : {
															message : 'Credential file is required'
														},
														file : {
															maxTotalSize : 2097152,
															message : 'Credential file is not valid'
														}
													}
												},
												aliasName : {
													validators : {
														notEmpty : {
															message : 'Connection name is required'
														},
														stringLength : {
															min : 2,
															maxl : 30,
															message : 'Connection name must be more than 2 and less than 30 characters long'
														},
														regexp : {
															regexp : /^[a-zA-Z0-9_]+$/,
															message : 'Connection name can only consist of alpha-numeric and underscore characters'
														}
													}
												},
												service : {
													validators : {
														notEmpty : {
															message : 'Service name is required'
														}
													}
												}
											}
										}).on('success.form.fv', function(e) {
										    // Prevent form submission
										    e.preventDefault();
										    submitCreateForm();
										    return false; 
										});

						 $('#MainFormEdit')
								.formValidation(
										{
											framework : 'bootstrap4',
											icon : {
												valid : 'fa fa-check',
												invalid : 'fa fa-times-circle',
												validating : 'fa fa-sync-alt'
											},
											fields : {
												aliasName : {
													validators : {
														notEmpty : {
															message : 'Connection name is required'
														},
														stringLength : {
															min : 2,
															maxl : 30,
															message : 'Connection name must be more than 2 and less than 30 characters long'
														},
														regexp : {
															regexp : /^[a-zA-Z0-9_]+$/,
															message : 'Connection name can only consist of alpha-numeric and underscore characters'
														}
													}
												}											
											}
										}); 
					});

	$(function() {
		$('.DeleteTnsDialogPermanenet')
				.on(
						"click",
						function(e) {
							var link = this;
							$('#textForDialog')
									.text(
											'All associated configurations for this database target (passwords, session parameters, etc.) will be deleted. Proceed with deleting the target?');
							e.preventDefault();

							$('#dialog-confirm')
									.dialog(
											{
												resizable : false,
												height : 220,
												width : 500,
												fluid : true,
												modal : true,
												open : function() {
													$('.ui-widget-overlay')
															.addClass(
																	'custom-overlay');
													$('.ui-widget-header')
															.css(
																	{
																		'background-color' : 'rgb(245, 245, 245)'
																	});
													$('.ui-dialog-titlebar')
															.css(
																	{
																		'background-color' : 'rgb(245, 245, 245)'
																	});
												},
												close : function() {
													$('.ui-widget-overlay')
															.removeClass(
																	'custom-overlay');
												},
												buttons : [
														{
															text : "Ok",
															"class" : ' btn btn-sm btn-alt-success',
															click : function() {
																window.location = link.href;
																$(this)
																		.dialog(
																				"close");
															}
														},
														{
															text : "Cancel",
															"class" : ' btn btn-sm btn-alt-danger',
															click : function() {
																$(this)
																		.dialog(
																				"close");
															}
														} ]

											});
						});
		$('.DeleteTnsDialog')
				.on(
						"click",
						function(e) {
							var link = this;
							$('#textForDialog')
									.text(
											'Are you sure you want to change status of this TNS entry?');
							e.preventDefault();

							$('#dialog-confirm')
									.dialog(
											{
												resizable : false,
												height : 200,
												width : 400,
												fluid : true,
												modal : true,
												open : function() {
													$('.ui-widget-overlay')
															.addClass(
																	'custom-overlay');
													$('.ui-widget-header')
															.css(
																	{
																		'background-color' : 'rgb(245, 245, 245)'
																	});
													$('.ui-dialog-titlebar')
															.css(
																	{
																		'background-color' : 'rgb(245, 245, 245)'
																	});
												},
												close : function() {
													$('.ui-widget-overlay')
															.removeClass(
																	'custom-overlay');
												},
												buttons : [
														{
															text : "Ok",
															"class" : ' btn btn-sm btn-alt-success',
															click : function() {
																window.location = link.href;
																$(this)
																		.dialog(
																				"close");
															}
														},
														{
															text : "Cancel",
															"class" : ' btn btn-sm btn-alt-danger',
															click : function() {
																$(this)
																		.dialog(
																				"close");
															}
														} ]

											});
						});
	});

	$(window).resize(function() {
		fluidDialog();
	});
	$(document).on("dialogopen", ".ui-dialog", function(event, ui) {
		fluidDialog();
	});

	function fluidDialog() {
		var $visible = $(".ui-dialog:visible");
		$visible.each(function() {
			var $this = $(this);
			var dialog = $this.find(".ui-dialog-content").data("ui-dialog");
			if (dialog.options.fluid) {
				var wWidth = $(window).width();
				if (wWidth < (parseInt(dialog.options.maxWidth) + 50)) {
					$this.css("max-width", "90%");
				} else {
					$this.css("max-width", dialog.options.maxWidth + "px");
				}
				dialog.option("position", dialog.options.position);
			}
		});

	}
</script>

	<c:if test="${MODE=='EDIT'}">
	<script>
	function changeDescriptor(){
		$("#preloader").show();
		$("#updateButtonForm").prop('disabled', true);
		var service=$('#selectBoxService').val();
		console.log(service)
		$.ajax({
			url : 'getDescriptor',
			data : {
				dbid : '${autodb.id}',
				service : service
			},
			type : 'get'
		}).done(function(responseData) {
			$("#preloader").hide();
			if (responseData.status == 'SUCCESS') {
				$('#textAreaDB').empty();
				$.each(responseData.serviceList, function(i, service) {
					$('#textAreaDB').append(service)
				});
			} else {
				
			}

		}).fail(function() {
			$("#preloader").hide();
			console.log('Failed');
		});
	}
	function pingTest() {
		$("#preloader").show();
		var service=$('#selectBoxService').children("option:selected").val();
		$.ajax({
			url : 'pingTest',
			data : {
				tns_id : '${autodb.id}',
				service:service
			},
			type : 'get'
		}).done(function(responseData) {
			$("#preloader").hide();
			if (responseData == 'SUCCESS') {
				$("#updateButtonForm").prop("disabled",false);
				$("#upload_status").empty();
				$("#switchSizeModal").removeClass("modal-lg")
				$("#upload_status").text("Ping Successfull!");
				$('#memberModal').modal('show');
			} else {
				$("#updateButtonForm").prop("disabled",true);
				$("#switchSizeModal").addClass("modal-lg");
				$("#upload_status").empty();
				$("#upload_status").text(responseData);
				$('#memberModal').modal('show');
			}

		}).fail(function() {
			$("#preloader").hide();
			console.log('Failed');
		});
	}
	
	
	function submitFileUploadModal(){
        $("#updateFile").addClass("fa fa-2x fa-cog fa-spin");
		$("#preloader").show();
		var form = $("#chooseService")[0];
		var file = new FormData(form);
		var credfile = $('#fileSave');
		if (credfile[0].files.length > 0) {
		$.ajax({
			url : 'uploadNewCredFile',
			enctype : 'multipart/form-data',
			data : file,
			type : 'post',
			processData : false,
			contentType : false,
			cache : false,
			timeout : 1000000,
			success : function(data) {
				if (data == 'SUCCESS') {
					$("#preloader").hide();
					 $("#updateFile").removeClass("fa fa-2x fa-cog fa-spin");	
					 window.location = "update-databases-autonomouss?tns_id="+${autodb.id};
				} else {
					$("#preloader").hide();
					 $("#updateFile").removeClass("fa fa-2x fa-cog fa-spin");
					$("#fileupstat1").empty();
					$("#fileupstat1").append(data);
					$("#fileupstat1").show();
				}
			},
			error : function(err) {
				$("#preloader").hide();
			}
		});
		}
		else
			{
			$("#preloader").hide();
			$("#fileupstat").empty();
			$("#fileupstat").append("Credential file is required");
			$("#fileupstat").show();
			}
	}

	function changeCredFileandUpload() {
		$("#preloader").show();
		var form = $("#chooseService")[0];
		var file = new FormData(form);
		var credfile = $('#fileSave');
		if (credfile[0].files.length > 0) {
		$.ajax({
			url : 'getServiceListFromZip',
			enctype : 'multipart/form-data',
			data : file,
			type : 'post',
			processData : false,
			contentType : false,
			cache : false,
			timeout : 1000000,
			success : function(data) {
				if (data.status == 'SUCCESS') {
					$("#preloader").hide();
					$('#ModalselectBoxService').empty();
					$.each(data.serviceList, function(i, service) {
						$('#ModalselectBoxService').append(
								$('<option></option>').val(service).text(
										service));
					});
					$("#fileupstat").hide();
					$("#serviceModalBox").show();
				} else {
					$("#preloader").hide();
					$("#fileupstat").empty();
					$("#fileupstat").append(data.status);
					$("#fileupstat").show();
				}
			},
			error : function(err) {
				$("#preloader").hide();
			}
		});
		}
		else
			{
			$("#preloader").hide();
			$("#fileupstat").empty();
			$("#fileupstat").append("Credential file is required");
			$("#fileupstat").show();
			}

	}
	</script>
	
	</c:if>



