<script>
function changeView(ele)
{
	if(ele.value=='MYSQL')
	{
		$('#servOrSidName').hide();
		$('#schema').show();
		$('#sidOrServCheck').hide();
	}
	else if(ele.value=='ORACLE')
	{
		$('#servOrSidName').show();
		$('#schema').hide();
		$('#sidOrServCheck').show();
	}
}
	
$("#changeForm").change(function() {
    if($(this).is(":checked")) {
    	$("#DescForm").show();
    	$("#MainForm").hide();
    	$("#toggleForm").text("Use Form Fields");
    }
    else
    	{
    	$("#MainForm").show();
    	$("#DescForm").hide();
    	$("#toggleForm").text("Use Descriptor");
    	}
});

function validateFieldsAvailability()
{
	var descForm=$("#changeForm").is(":checked");
	if(!descForm)
		{
		var aliasName=$('#FormAliasName').val();
		var portNum=$('#FormPort').val();
		var hostname=$('#FormHostName').val();
		var sidOrService=$('#FormSidorServiceIP').val();
		var serviceIsChecked=$("#FormServiceChecked").is(":checked");
		var sidIsChecked=$("#FormSidChecked").is(":checked");	
		if((aliasName.trim().length==0)||(portNum.trim().length==0)||(hostname.trim().length==0)||(sidOrService.trim().length==0)&&(sidIsChecked||serviceIsChecked))
			{
			var err='';
			aliasName.trim().length==0?$('#FormAliasNameErr').show():$('#FormAliasNameErr').hide();
			portNum.trim().length==0?$('#FormPortErr').show():$('#FormPortErr').hide();
			hostname.trim().length==0?$('#FormHostNameErr').show():$('#FormHostNameErr').hide();
			sidOrService.trim().length==0?$('#FormSidorServiceIPErr').show():$('#FormSidorServiceIPErr').hide();
			}
		else
		{
			$('#FormSidorServiceIPErr').hide();
			$('#FormHostNameErr').hide();
			$('#FormPortErr').hide();
			$('#FormAliasNameErr').hide();
			validateAndSubmit();
		}
	}
else
	{
		   var aliasName=$('#an').val();
		   var desc=$('#DecFormDesc').val();
		   if(desc.trim().length==0||aliasName.trim().length==0)
			{
			 aliasName.trim().length==0?$('#anErr').show():$('#anErr').hide(); 
			 desc.trim().length==0?$('#DecFormDescErr').show():$('#DecFormDescErr').hide();
			}
		else
			{
			$('#DecFormDescErr').hide();
			$('#anErr').hide();
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
		var aliasName=$('#FormAliasName').val();
		var portNum=$('#FormPort').val();
		var hostname=$('#FormHostName').val();
		var sidOrService=$('#FormSidorServiceIP').val();
		var type=$('#entryFormType').find(":selected").text();
		var serviceIsChecked=$("#FormServiceChecked").is(":checked");
		var sidIsChecked=$("#FormSidChecked").is(":checked");
		if(type=='ORACLE')
			{
		if(serviceIsChecked)
			descriptor+=hostname+':'+portNum+'/'+sidOrService;
	    else if(sidIsChecked)
	    	descriptor+=hostname+':'+portNum+':'+sidOrService;	
			}
		else
			{
			descriptor+=hostname+':'+portNum+'/'+sidOrService;
			}
		
		  $.ajax({ 
		        url: 'validateDatabase',
		        data: {descriptor: descriptor.trim(),type:type,'${_csrf.parameterName}':'${_csrf.token}'},
		        type: 'post'
		    }).done(function(responseData) {
		if(responseData=='Success')
			{
			$("#preloader").hide();
			$('#FormAliasName').prop('readonly', true);
			$('#FormPort').prop('readonly', true);
			$('#FormHostName').prop('readonly', true);
			$('#FormSidorServiceIP').prop('readonly', true);
			$('#FormServiceChecked').prop('readonly', true);
			$('#FormSidChecked').prop('readonly', true);
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
		descriptor=$('#DecFormDesc').val();
		var type=$('#descFormType').find(":selected").text();
		  $.ajax({ 
		        url: 'validateDatabase',
		        data: {descriptor: descriptor.trim(),type:type,'${_csrf.parameterName}':'${_csrf.token}'},
		        type: 'post'
		    }).done(function(responseData) {
		if(responseData=='Success')
			{
			  $("#preloader").hide();
			$('#an').prop('readonly', true);
			$('#DecFormDesc').prop('readonly', true);
			 $('#status').text("Ping Successfull!");
		     $('#myModal').modal('show');
		     $('#SubmitFormButton').removeAttr("disabled");
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