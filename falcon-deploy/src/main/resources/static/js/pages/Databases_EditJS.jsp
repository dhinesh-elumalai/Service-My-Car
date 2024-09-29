 <script>
 function uploading()
 {
	 document.getElementById('overlay').style.display='block';
     return true;
 }
</script>
<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')"> 
<script>
document.getElementById('sid').onclick = function() {
	 if (document.getElementById('SubmitFormButtonForm').hasAttribute("disabled")) 
		 {
    document.getElementById('service').readOnly = true;
    document.getElementById('sid').readOnly = false;
    document.getElementById('sid').value=document.getElementById('service').value;
    document.getElementById('service').value="";
		 }
};
document.getElementById('service').onclick = function() {
	 if (document.getElementById('SubmitFormButtonForm').hasAttribute("disabled")) 
		 {
    document.getElementById('sid').readOnly = true;
    document.getElementById('service').readOnly = false;
    document.getElementById('service').value=document.getElementById('sid').value;
    document.getElementById('sid').value="";
		 }
};




</script>
</sec:authorize>
   <script type="text/javascript">
          $(function () {
        	  $('.DeleteTnsDialogPermanenet').on("click", function (e) {
      	        var link = this;
      	        $('#textForDialog').text('All associated configurations for this database target (passwords, session parameters, etc.) will be deleted. Proceed with deleting the target?'); 
      	        e.preventDefault();
      	       
      	        $('#dialog-confirm').dialog({
      	        	resizable: false,
      	            height: 220,
      	            width: 500,
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
      	        	            	   window.location = link.href;
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
        	    $('.DeleteTnsDialog').on("click", function (e) {
        	        var link = this;
        	        $('#textForDialog').text('Are you sure you want to change status of this TNS entry?'); 
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
        	        	            	   window.location = link.href;
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
          
        	$(window).resize(function () {
        	    fluidDialog();
        	});
        	$(document).on("dialogopen", ".ui-dialog", function (event, ui) {
        	    fluidDialog();
        	});

        	function fluidDialog() {
        	    var $visible = $(".ui-dialog:visible");
        	    $visible.each(function () {
        	        var $this = $(this);
        	        var dialog = $this.find(".ui-dialog-content").data("ui-dialog");
        	        if (dialog.options.fluid) {
        	            var wWidth = $(window).width();
        	            if (wWidth < (parseInt(dialog.options.maxWidth) + 50))  {
        	                $this.css("max-width", "90%");
        	            } else {
        	                $this.css("max-width", dialog.options.maxWidth + "px");
        	            }
        	            dialog.option("position", dialog.options.position);
        	        }
        	    });

        	}

        	$("#changeForm").change(function() {
        	    if($(this).is(":checked")) {
        	    	$('#hn1').hide();
        	    	$('#port1').hide();
        	    	$('#service1').hide();
        	    	$('#sid1').hide();
        	    	$('#descriptor1').show();
        	    	$("#toggleForm").text("Use Form Fields");
        	    }
        	    else
        	    	{
        	    	$('#hn1').show();
        	    	$('#port1').show();
        	    	$('#service1').show();
        	    	$('#sid1').show();
        	    	$('#descriptor1').hide();
        	    	$("#toggleForm").text("Use Descriptor");
        	    	}
        	});
        	
        	
        	
        	
        	function validateFieldsAvailability()
        	{
        		var descForm=$("#changeForm").is(":checked");
        		if(!descForm)
        			{
        			var aliasName=$('#an').val();
        			var portNum=$('#port').val();
        			var hostname=$('#hn').val();
        			var service=$('#service').val();
        			var sid=$('#sid').val();

        			if((aliasName.trim().length==0)||(portNum.trim().length==0)||(hostname.trim().length==0)&&(service.trim().length==0||sid.trim().length==0))
        				{
        				var err='';
        				aliasName.trim().length==0?$('#anErr').show():$('#anErr').hide();
        				portNum.trim().length==0?$('#portErr').show():$('#portErr').hide();
        				hostname.trim().length==0?$('#hnErr').show():$('#hnErr').hide();
        				if(service.trim().length==0||sid.trim().length==0)
        					{
        					$('#serviceErr').show();
        					$('#sidErr').show();  
        					$('#descriptorErr').hide();
        					}
        				else
        					{
        					$('#serviceErr').hide();
        					$('#sidErr').hide(); 
        					$('#descriptorErr').hide();
        					}
        				}
        			else
        			{
        				$('#anErr').hide();
        				$('#portErr').hide();
        				$('#hnErr').hide();
        				$('#serviceErr').hide();
        				$('#sidErr').hide();
        				$('#descriptorErr').hide();
        				validateAndSubmit();
        			}
        		}
        		else
        			{
        			   var aliasName=$('#an').val();
        			   var desc=$('#descriptor').val();
        			   if(desc.trim().length==0||aliasName.trim().length==0)
        				{
        				 aliasName.trim().length==0?$('#anErr').show():$('#anErr').hide(); 
        				 desc.trim().length==0?$('#descriptorErr').show():$('#descriptorErr').hide();
        				 $('#portErr').hide();
         				$('#hnErr').hide();
         				$('#serviceErr').hide();
         				$('#sidErr').hide();
        				}
        			else
        				{
        				$('#descriptorErr').hide();
        				$('#anErr').hide();
        				$('#portErr').hide();
        				$('#hnErr').hide();
        				$('#serviceErr').hide();
        				$('#sidErr').hide();
        				validateAndSubmit();
        				}
        			}
        	}


        	function validateAndSubmit()
        	{
        		var descriptor='';
        		var descForm=$("#changeForm").is(":checked");
        		$("#preloader").show();
        		if(!descForm)
        			{
        		
        			var aliasName=$('#an').val();
        			var portNum=$('#port').val();
        			var hostname=$('#hn').val();
        			var service=$('#service').val();
        			var sid=$('#sid').val();
					var type=$('#type').val();
        			if(service.trim().length!=0&sid.trim().length==0)
        				descriptor+=hostname+':'+portNum+'/'+service;
        		    else if(service.trim().length==0&sid.trim().length!=0)
        		    	descriptor+=hostname+':'+portNum+':'+sid;	
        			
        			  $.ajax({ 
        			        url: 'validateDatabase',
        			        data: {descriptor: descriptor.trim(),type:type,'${_csrf.parameterName}':'${_csrf.token}'},
        			        type: 'post'
        			    }).done(function(responseData) {
        			if(responseData=='Success')
        				{
        				$("#preloader").hide();
        				$('#descriptor').val('');
        				$('#an').prop('readonly', true);
        				$('#port').prop('readonly', true);
        				$('#hn').prop('readonly', true);
        				$('#service').prop('readonly', true);
        				$('#sid').prop('readonly', true);	
        				 $('#status').text("Ping Successfull!");
        			     $('#myModal').modal('show');
        			     $('#SubmitFormButtonForm').removeAttr("disabled");
        				}
        			  else
        				  {
        				  $("#preloader").hide();
        					 $('#status').text(responseData);
        				     $('#myModal').modal('show');
        				  }
        			   }).fail(function() {
        				   $("#preloader").hide();
        			        console.log('Failed');
        			    }); 
        			
        			}
        		else
        			{
        			descriptor=$('#descriptor').val();
        			var type=$('#type').val();
        			  $.ajax({ 
        			        url: 'validateDatabase',
        			        data: {descriptor: descriptor.trim(),type:type,'${_csrf.parameterName}':'${_csrf.token}'},
        			        type: 'post'
        			    }).done(function(responseData) {
        			if(responseData=='Success')
        				{
        				$("#preloader").hide();
        				$('#port').val('');
        				$('#hn').val('');
        				$('#service').val('');
        				$('#sid').val('');
        				
        				$('#an').prop('readonly', true);
        				$('#descriptor').prop('readonly', true);
        				 $('#status').text("Ping Successfull!");
        			     $('#myModal').modal('show');
        			     $('#SubmitFormButtonForm').removeAttr("disabled");
        				}
        			  else
        				  {
        				  $("#preloader").hide();
        					 $('#status').text(responseData);
        				     $('#myModal').modal('show');
        				  }
        			   }).fail(function() {
        				   $("#preloader").hide();
        			        console.log('Failed');
        			    });
        			}
        		


        	} 
          </script>    