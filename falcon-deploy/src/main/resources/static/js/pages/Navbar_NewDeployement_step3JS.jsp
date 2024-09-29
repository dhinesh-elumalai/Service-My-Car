<script>
var fixHelperModified = function(e, tr) {
    var $originals = tr.children();
    var $helper = tr.clone();
    $helper.children().each(function(index) {
      $(this).width($originals.eq(index).width())
    });
    return $helper;
  },
  updateIndex = function(e, ui) {
    $('td.index', ui.item.parent()).each(function(i) {
      $(this).html(i + 1);
    });
  };

$(".sorttable tbody").sortable({
	 helper: fixHelperModified,
	 cursor: "move",
	  stop: updateIndex,
	  placeholder: "placeholder-style",
	  start  : function(event, ui){
		  	$(this).find('.placeholder-style  td:nth-child(4)').css('display', 'none')
		  	$(this).find('.placeholder-style  td:nth-child(5)').css('display', 'none')
		  	$(this).find('.placeholder-style  td:nth-child(7)').css('display', 'none')
	        $(ui.helper).addClass("ui-helper");
	        ui.helper.css('display', 'table');
	    }
	}).disableSelection();

$('.del-btn').click(function(){
    $(this).parents('tr').first().remove();
});


function makeOption(priorityLength){
    var str = '';
    var $select = $('[name="priority"]');
    $select.find('option').remove();
    for(var i = 1; i <=priorityLength ; i++ ){
      str += '<option value='+i+'>'+i+'</option>';
    }
    $select.append(str);
    return str;
  }
function boxDisable(e, t) {
    if (t.is(':checked')) {
          $('#'+e).find('.'+e+'displayJquery').hide();
    } 
    else {
    	$('#'+e).find('.'+e+'displayJquery').show();
    	$("#preloader").show();
    	 $.ajax({ 
             url: 'listDelegatePasswordDeployment',
             data: {dpId: e,repo:'${repoName}','${_csrf.parameterName}':'${_csrf.token}'},
             type: 'post'
         }).done(function(responseData) { 
        		$("#preloader").hide();
            var str='';
         	$.each(responseData, function(i, obj) {
         		str += '<option value='+obj.userName+'>'+obj.userName+'</option>';
        	    });
         	$('#'+e).find("[name='DelegateCredentialUN']").empty();
        	$('#'+e).find("[name='DelegateCredentialUN']").append(str);
          }).fail(function() {
        	  $("#preloader").hide();
             console.log('Failed');
             $('#status').text("There is some network issue.Please check your internet access.");
 	           $('#myModal').modal('show');
         });
    	
    }
}



function saveUNandPW(id)
{
	var uname = $('#'+id).find("[name='un']").val();
	var upass = $('#'+id).find("[name='pw']").val();
	var dbid=id;
	 if(( !uname == "" && uname.length>1) && (!upass == "" && upass.length>1)){	
		 $("#preloader").show();
	        $.ajax({ 
	            url: 'validate_db',
	            data: {id: id,uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
	            type: 'post'
	        }).done(function(responseData) { 
	           if(responseData=='Success'){
	        	   $("#preloader").hide();
	        	   $.ajax({ 
	                   url: 'save_own_Password',
	                   data: {dbid: id,repoName:'${repoName}',uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
	                   type: 'post'
	               }).done(function(responseData) { 
	                if(responseData=='success'){
	             	   $.ajax({ 
	                        url: 'pass_to_encoder',
	                        data: {upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
	                        type: 'post'
	                    }).done(function(responseData1)
	                 		   {
	                 	   $("#preloader").hide();
	                 	   $('#status').text('Password saved successfully!');
	                 	   $('#closebtnmodal').removeClass('btn-alt-danger');$('#closebtnmodal').addClass('btn-alt-success');
	                        $('#myModal').modal('show');
	                        $('#'+id).find("[name='"+id+"_Delegated']").html('false');
	                        $('#'+id).find("[name='"+id+"_saved']").html('false');
	                        $('#'+id). find("[name='"+id+"_selecteduser']").show();
	                        $('#'+id).find("[name='"+id+"_selecteduser']").html(uname);
	                        $('#'+id).find("[name='"+id+"_selecteduserpass']").val(responseData1);
	                    }).fail(function() {
	                   	    $("#preloader").hide();
	                          console.log('Failed');
	                         $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
	                          $('#status').text("There is some network issue.Please check your internet access.");
	          	           $('#myModal').modal('show');
	                  });
	                }
	                else
	             	   {
	             	   $("#preloader").hide();
	             	   $('#status').text(responseData);
	             	 $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
	                    $('#myModal').modal('show');
	             	   }
	                }).fail(function() {
	                   console.log('Failed');
	                   $('#status').text("There is some network issue.Please check your internet access.");
	                  $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
	       	           $('#myModal').modal('show');
	               });
	           }
	           else
	        	   {
	        	   $("#preloader").hide();
	        	   $('#status').text(responseData);
	        	  $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
	               $('#myModal').modal('show');
	        	   }
	         }).fail(function() {
	        	 $("#preloader").hide();
	            console.log('Failed');
	           $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
	            $('#status').text("There is some network issue.Please check your internet access.");
		           $('#myModal').modal('show');
	        });
	     }
	    else
	    	{
	    	 $('#status').text("Please fill username and password field.");
	    	$('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
	         $('#myModal').modal('show');
	    	}
	
}

function validateUNandPW(id)
{
	var uname = $('#'+id).find("[name='un']").val();
	var upass = $('#'+id).find("[name='pw']").val();
    if(( !uname == "" && uname.length>1) && (!upass == "" && upass.length>1)){	
    	$("#preloader").show();
        $.ajax({ 
            url: 'validate_db',
            data: {id: id,uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
            type: 'post'
        }).done(function(responseData) { 
           if(responseData=='Success'){
        	   $.ajax({ 
                   url: 'pass_to_encoder',
                   data: {upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
                   type: 'post'
               }).done(function(responseData1)
            		   {
            	   $("#preloader").hide();
            	   $('#status').text('Validation successful!');
            	    $('#closebtnmodal').removeClass('btn-alt-danger');$('#closebtnmodal').addClass('btn-alt-success');
                   $('#myModal').modal('show');
                   $('#'+id).find("[name='"+id+"_Delegated']").html('false');
                   $('#'+id).find("[name='"+id+"_saved']").html('false');
                   $('#'+id). find("[name='"+id+"_selecteduser']").show();
                   $('#'+id).find("[name='"+id+"_selecteduser']").html(uname);
                   $('#'+id).find("[name='"+id+"_selecteduserpass']").val(responseData1);
               }).fail(function() {
              	    $("#preloader").hide();
                     console.log('Failed');
                    $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
                     $('#status').text("There is some network issue.Please check your internet access.");
     	           $('#myModal').modal('show');
             });
           }
           else
        	   {
        	   $("#preloader").hide();
        	   $('#status').text(responseData);
        	  $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
               $('#myModal').modal('show');
        	   }
         }).fail(function() {
        	 $("#preloader").hide();
            console.log('Failed');
           $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
            $('#status').text("There is some network issue.Please check your internet access.");
	           $('#myModal').modal('show');
        });
     }
    else
    	{
    	 $('#status').text("Please fill username and password field.");
    	$('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
         $('#myModal').modal('show');
    	}
}





function validateDelegate(id)
{
	var uname = $('#'+id).find("[name='DelegateCredentialUN']").val();
    if( !uname == "" && uname.length>1){
    	$("#preloader").show();
        $.ajax({ 
            url: 'validateDelegate',
            data: {id: id,repoName:'${repoName}',uname:uname,'${_csrf.parameterName}':'${_csrf.token}'},
            type: 'post'
        }).done(function(responseData) { 
       	 var toSplit = responseData.split(",");
           if(toSplit[0]=='Success'){
        	   $("#preloader").hide();
               $('#status').text('Validation successful!');
                $('#closebtnmodal').removeClass('btn-alt-danger');$('#closebtnmodal').addClass('btn-alt-success');
               $('#myModal').modal('show');
               $('#'+id).find("[name='"+id+"_Delegated']").html('true');
               $('#'+id).find("[name='"+id+"_saved']").html('false');
               $('#'+id). find("[name='"+id+"_selecteduser']").show();
               $('#'+id).find("[name='"+id+"_selecteduser']").html(uname);
           }
           else
        	   {
        	   $("#preloader").hide();
               $('#status').text(responseData);
              $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
               $('#myModal').modal('show');
        	   }
         }).fail(function() {
            console.log('Failed');
            $('#status').text("There is some network issue.Please check your internet access.");
           $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
	           $('#myModal').modal('show');
        });
     }
    else
    	{
    	 $('#status').text("Please fill username and password field.");
    	$('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
         $('#myModal').modal('show');
    	}
}

function validateSaved(id)
{
	var uname = $('#'+id).find("[name='savedCredentialSelect']").val();
    if( !uname == "" && uname.length>1){
    	$("#preloader").show();
        $.ajax({ 
            url: 'validateSaved',
            data: {id: id,repoName:'${repoName}',uname:uname,'${_csrf.parameterName}':'${_csrf.token}'},
            type: 'post'
        }).done(function(responseData) { 
        	 var toSplit = responseData.split(",");
           if(toSplit[0]=='Success'){
        	   $("#preloader").hide();
               $('#status').text('Validation successful!');
                $('#closebtnmodal').removeClass('btn-alt-danger');$('#closebtnmodal').addClass('btn-alt-success');
               $('#myModal').modal('show');
               $('#'+id).find("[name='"+id+"_Delegated']").html('false');
               $('#'+id).find("[name='"+id+"_saved']").html('true');
               $('#'+id). find("[name='"+id+"_selecteduser']").show();
               $('#'+id).find("[name='"+id+"_selecteduser']").html(uname);
           }
           else
        	   {
        	   $("#preloader").hide();
        	   $('#status').text(responseData);
        	  $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
               $('#myModal').modal('show');
        	   }
         }).fail(function() {
        	   $("#preloader").hide();
            console.log('Failed');
            $('#status').text("There is some network issue.Please check your internet access.");
           $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
	           $('#myModal').modal('show');
        });
     }
    else
    	{
    	 $('#status').text("Please fill username and password field.");
    	$('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
         $('#myModal').modal('show');
    	}
}
 


	
function changeCredentialView(e, t) {
	var selected=t.val();
    if (selected=='credential')
    {
     $('#'+e).find('#delegatedcreadentialdiv').hide();
     $('#'+e).find('#owncredentialdiv').show();
     $('#'+e).find('#savedcredentialdiv').hide();
    }
    else if (selected=='saved')
    {
    	   $("#preloader").show();
   	 $.ajax({ 
         url: 'listOwnCredentialDeployment',
         data: {dbid: e,repoName:'${repoName}','${_csrf.parameterName}':'${_csrf.token}'},
         type: 'post'
     }).done(function(responseData) {
    	   $("#preloader").hide();
        var str='';
     	$.each(responseData, function(i, obj) {
     		str += '<option value='+obj.userName+'>'+obj.userName+'</option>';
    	    });
     	$('#'+e).find("[name='savedCredentialSelect']").empty();
    	$('#'+e).find("[name='savedCredentialSelect']").append(str);
      }).fail(function() {
    	   $("#preloader").hide();
         console.log('Failed');
         $('#status').text("There is some network issue.Please check your internet access.");
	           $('#myModal').modal('show');
     });
    	 $('#'+e).find('#savedcredentialdiv').show();
    	 $('#'+e).find('#delegatedcreadentialdiv').hide();
         $('#'+e).find('#owncredentialdiv').hide();
    }
    else
    	{
    	   $("#preloader").show();
    	 $.ajax({ 
             url: 'listDelegatePasswordDeployment',
             data: {dpId: e,repo:'${repoName}','${_csrf.parameterName}':'${_csrf.token}'},
             type: 'post'
         }).done(function(responseData) { 
        	   $("#preloader").hide();
            
            var str='';
         	$.each(responseData, function(i, obj) {
         		str += '<option value='+obj.userName+'>'+obj.userName+'</option>';
        	    });
         	$('#'+e).find("[name='DelegateCredentialUN']").empty();
        	$('#'+e).find("[name='DelegateCredentialUN']").append(str);
          }).fail(function() {
        	   $("#preloader").hide();
             console.log('Failed');
             $('#status').text("There is some network issue.Please check your internet access.");
 	           $('#myModal').modal('show');
         });
    	 $('#'+e).find('#delegatedcreadentialdiv').show();
         $('#'+e).find('#owncredentialdiv').hide();
         $('#'+e).find('#savedcredentialdiv').hide();
    	}
}









function saveUNandPWModel(dbid,trindex)
{
	var id=dbid;
	var uname = $('#model_'+id).find("[name='uname_model']").val();
	var upass = $('#model_'+id).find("[name='upass_model']").val();
	 if(( !uname == "" && uname.length>1) && (!upass == "" && upass.length>1)){	
		   $("#preloader").show();
	        $.ajax({ 
	            url: 'validate_db',
	            data: {id: id,uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
	            type: 'post'
	        }).done(function(responseData) { 
	           if(responseData=='Success'){
	        	   $.ajax({ 
	                   url: 'save_own_Password',
	                   data: {dbid: id,repoName:'${repoName}',uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
	                   type: 'post'
	               }).done(function(responseData) {
	                   if(responseData=='success'){
	                 	   $.ajax({ 
	                            url: 'pass_to_encoder',
	                            data: {upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
	                            type: 'post'
	                        }).done(function(responseData1)
	                     		   {
	                     	    $("#preloader").hide();
	                     	   $('#changeUN').modal('hide');
	                     	   $('#status').text('Password saved successfully!');
	                     	    $('#closebtnmodal').removeClass('btn-alt-danger');$('#closebtnmodal').addClass('btn-alt-success');
	                            $('#myModal').modal('show');  
	                            $('#'+id+'_'+trindex).find("[name='"+id+"_Delegated']").html('false');
	                            $('#'+id+'_'+trindex).find("[name='"+id+"_saved']").html('false');
	                            $('#'+id+'_'+trindex). find("[name='"+id+"_selecteduser']").show();
	                            $('#'+id+'_'+trindex).find("[name='"+id+"_selecteduser']").html(uname);	  
	                            $('#'+id+'_'+trindex).find("[name='"+id+"_selecteduserpass']").val(responseData1);
	                        }).fail(function() {
	                       	    $("#preloader").hide();
	                              console.log('Failed');
	                              $('#changeUN').modal('hide');
	                              $('#status').text("There is some network issue.Please check your internet access.");
	              	           $('#myModal').modal('show');
	                      });
	                    }
	                    else
	                 	   {
	                 	   $("#preloader").hide();
	                 	   $('#status').text(responseData);
	                 	 $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
	                 	  $('#changeUN').modal('hide');
	                        $('#myModal').modal('show');
	                 	   }
	            	   
	                }).fail(function() {
	                	  $("#preloader").hide();
	                   console.log('Failed');
	                   $('#status').text("There is some network issue.Please check your internet access.");
	                  $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
	                   $('#changeUN').modal('hide');
	       	           $('#myModal').modal('show');
	               });
	           }
	           else
	        	   {
	        	   $("#preloader").hide();
	        	   $('#status').text(responseData);
	        	  $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
	        	   $('#changeUN').modal('hide');
	               $('#myModal').modal('show');
	        	   }
	         }).fail(function() {
	        	  $("#preloader").hide();
	            console.log('Failed');
	            $('#status').text("There is some network issue.Please check your internet access.");
	           $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
	            $('#changeUN').modal('hide');
		           $('#myModal').modal('show');
	        });
	     }
	    else
	    	{
	    	 $('#status').text("Please fill username and password field.");
	    	$('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
	         $('#myModal').modal('show');
	         $('#changeUN').modal('hide');
	    	}
	
}

function validateUNandPWModel(dbid,trindex)
{     var id=dbid;
	var uname = $('#model_'+id).find("[name='uname_model']").val();
	var upass = $('#model_'+id).find("[name='upass_model']").val();
    if(( !uname == "" && uname.length>1) && (!upass == "" && upass.length>1)){
    	  $("#preloader").show();
        $.ajax({ 
            url: 'validate_db',
            data: {id: id,uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
            type: 'post'
        }).done(function(responseData) {
            if(responseData=='Success'){
         	   $.ajax({ 
                    url: 'pass_to_encoder',
                    data: {upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
                    type: 'post'
                }).done(function(responseData1)
             		   {
             	    $("#preloader").hide();
             	   $('#changeUN').modal('hide');
             	    $('#status').text('Validation successful!');
             	    $('#closebtnmodal').removeClass('btn-alt-danger');$('#closebtnmodal').addClass('btn-alt-success');
                    $('#myModal').modal('show');  
                    $('#'+id+'_'+trindex).find("[name='"+id+"_Delegated']").html('false');
                    $('#'+id+'_'+trindex).find("[name='"+id+"_saved']").html('false');
                    $('#'+id+'_'+trindex). find("[name='"+id+"_selecteduser']").show();
                    $('#'+id+'_'+trindex).find("[name='"+id+"_selecteduser']").html(uname);
                    $('#'+id+'_'+trindex).find("[name='"+id+"_selecteduserpass']").val(responseData1);
                    
                }).fail(function() {
               	    $("#preloader").hide();
                      console.log('Failed');
                      $('#status').text("There is some network issue.Please check your internet access.");
      	           $('#myModal').modal('show');
              });
            }
            else
         	   {
         	   $("#preloader").hide();
         	   $('#status').text(responseData);
         	 $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
                $('#myModal').modal('show');
                $('#changeUN').modal('hide');
         	   }
        	
         }).fail(function() {
        	  $("#preloader").hide();
            console.log('Failed');
            $('#status').text("There is some network issue.Please check your internet access.");
           $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
	           $('#myModal').modal('show');
	           $('#changeUN').modal('hide');
        });
     }
    else
    	{
    	 $('#status').text("Please fill username and password field.");
    	$('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
         $('#myModal').modal('show');
         $('#changeUN').modal('hide');
    	}
}

function validateDelegateModel(dbid,trindex)
{
	var id=dbid;
	var uname = $('#model_'+id).find("[name='DelegateCredentialUNModel']").val();
    if( !uname == "" && uname.length>1){
    	  $("#preloader").show();
        $.ajax({ 
            url: 'validateDelegate',
            data: {id: id,repoName:'${repoName}',uname:uname,'${_csrf.parameterName}':'${_csrf.token}'},
            type: 'post'
        }).done(function(responseData) {
        	  $("#preloader").hide();
        	 var toSplit = responseData.split(","); 
           if(toSplit[0]=='Success'){
               $('#status').text('Validation successful!');
                $('#closebtnmodal').removeClass('btn-alt-danger');$('#closebtnmodal').addClass('btn-alt-success');
               $('#changeUN').modal('hide');
               $('#myModal').modal('show');
               $('#'+id+'_'+trindex).find("[name='"+id+"_Delegated']").html('true');
               $('#'+id+'_'+trindex).find("[name='"+id+"_saved']").html('false');
               $('#'+id+'_'+trindex). find("[name='"+id+"_selecteduser']").show();
               $('#'+id+'_'+trindex).find("[name='"+id+"_selecteduser']").html(uname);     
           }
           else
        	   {
               $('#status').text(responseData);
              $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
               $('#changeUN').modal('hide');
               $('#myModal').modal('show');
        	   }
         }).fail(function() {
        	  $("#preloader").hide();
            console.log('Failed');
            $('#status').text("There is some network issue.Please check your internet access.");
           $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
	           $('#myModal').modal('show');
	           $('#changeUN').modal('hide');
        });
     }
    else
    	{
    	 $('#status').text("Please fill username and password field.");
    	$('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
         $('#myModal').modal('show');
         $('#changeUN').modal('hide');
    	}
}

function validateSavedModel(dbid,trindex)
{
	var id=dbid;
	var uname = $('#model_'+id).find("[name='savedCredentialSelectModel']").val();
   if( !uname == "" && uname.length>1){	
	   $("#preloader").show();
       $.ajax({ 
           url: 'validateSaved',
           data: {id: id,repoName:'${repoName}',uname:uname,'${_csrf.parameterName}':'${_csrf.token}'},
           type: 'post'
       }).done(function(responseData) { 
    	   $("#preloader").hide();
    		 var toSplit = responseData.split(","); 
          if(toSplit[0]=='Success'){
        	  $('#status').text('Validation successful!');
        	   $('#closebtnmodal').removeClass('btn-alt-danger');$('#closebtnmodal').addClass('btn-alt-success');
              $('#myModal').modal('show');
              $('#changeUN').modal('hide');
              $('#'+id+'_'+trindex).find("[name='"+id+"_Delegated']").html('false');
              $('#'+id+'_'+trindex).find("[name='"+id+"_saved']").html('true');
              $('#'+id+'_'+trindex). find("[name='"+id+"_selecteduser']").show();
              $('#'+id+'_'+trindex).find("[name='"+id+"_selecteduser']").html(uname);  
          }else
        	  {
          	  $('#status').text(responseData);
              $('#myModal').modal('show');
              $('#changeUN').modal('hide');
        	  }
        }).fail(function() {
        	  $("#preloader").hide();
           console.log('Failed');
           $('#status').text("There is some network issue.Please check your internet access.");
          $('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
	           $('#myModal').modal('show');
	           $('#changeUN').modal('hide');
       });
    }
   else
   	{
   	 $('#status').text("Please fill username and password field.");
   	$('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
        $('#myModal').modal('show');
        $('#changeUN').modal('hide');
   	}
}

function changeCredentialViewModel(e, t) {
	var selected=t.val();
    if (selected=='credential')
    {
     $('#model_'+e).find('#delegatedcredentialdivModel').hide();
     $('#model_'+e).find('#owncredentialdivModel').show();
     $('#model_'+e).find('#savedcredentialdivModel').hide();
    }
    else if (selected=='saved')
    {
    	  $("#preloader").show();
   	 $.ajax({ 
         url: 'listOwnCredentialDeployment',
         data: {dbid: e,repoName:'${repoName}','${_csrf.parameterName}':'${_csrf.token}'},
         type: 'post'
     }).done(function(responseData) { 
     	console.log(responseData);
     	  $("#preloader").hide();
        var str='';
     	$.each(responseData, function(i, obj) {
     		str += '<option value='+obj.userName+'>'+obj.userName+'</option>';
    	    });
     	$('#model_'+e).find("[name='savedCredentialSelectModel']").empty();
    	$('#model_'+e).find("[name='savedCredentialSelectModel']").append(str);
      }).fail(function() {
    	  $("#preloader").hide();
         $('#status').text("There is some network issue.Please check your internet access.");
	           $('#myModal').modal('show');
     });
    	 $('#model_'+e).find('#savedcredentialdivModel').show();
    	 $('#model_'+e).find('#delegatedcredentialdivModel').hide();
         $('#model_'+e).find('#owncredentialdivModel').hide();
    }
    else
    	{
    	  $("#preloader").show();
    	 $.ajax({ 
             url: 'listDelegatePasswordDeployment',
             data: {dpId: e,repo:'${repoName}','${_csrf.parameterName}':'${_csrf.token}'},
             type: 'post'
         }).done(function(responseData) {  
        	  $("#preloader").hide();
            var str='';
         	$.each(responseData, function(i, obj) {
         		str += '<option value='+obj.userName+'>'+obj.userName+'</option>';
        	    });
         	$('#'+e).find("[name='DelegateCredentialUNModel']").empty();
        	$('#'+e).find("[name='DelegateCredentialUNModel']").append(str);
          }).fail(function() {
        	  $("#preloader").hide();
             console.log('Failed');
             $('#status').text("There is some network issue.Please check your internet access.");
 	           $('#myModal').modal('show');
         });
    	 $('#model_'+e).find('#delegatedcredentialdivModel').show();
         $('#model_'+e).find('#owncredentialdivModel').hide();
         $('#model_'+e).find('#savedcredentialdivModel').hide();
    	}
}



function changeUNandPW(e)
{
	  $("#preloader").show();
	var dbid=e.attr('name').split("_")[0];
	var trid=e.attr('id').split("_")[1];
	console.log(dbid);
	console.log(trid);
	 $.ajax({ 
         url: 'listDelegatePasswordDeployment',
         data: {dpId: dbid,repo:'${repoName}','${_csrf.parameterName}':'${_csrf.token}'},
         type: 'post'
     }).done(function(responseData) {  
    	  $("#preloader").hide();
        var str='';
     	$.each(responseData, function(i, obj) {
     		str += '<option value='+obj.userName+'>'+obj.userName+'</option>';
    	    });	
     	$('#changeUN').empty();
    	$('#changeUN').append('<div class="modal-dialog" id="model_'+dbid+'"><div class="modal-content">'+
    			'<div class="">'+
    			'<div class="modal-header block-header block-header-default">'+
								'<h4 class="modal-title block-title" id="myModalLabel">Change Username and password</h4>'+
								'</div>'+
    			
    			  '</div><div class="modal-body p-0">'+
    			     '<div class="block-header pt-0 pb-0">'+
    			        '<div class="block-content pt-0">'+
    			          '<div class="displayJqueryModel">'+
    			             '<div class="row width-100">'+
    			               '<div class="block-header">'+
    			     '<select class="form-control mySelect" name="credential" onchange="changeCredentialViewModel('+dbid+',$(this));">'+
    			  		    '<option value="delegated" selected>Delegated Credential</option>'+    		 
    			    		 '<option value="saved" >Saved Credential</option>'+
    			    		 '<option value="credential" >Enter Credential</option>'+
    			    '</select>'+
    			    '</div></div>'+
    			    '<div class="">'+
    			    '<div class="">'+
    			       '<div class="form-group" id="owncredentialdivModel" style="display: none;">'+
    			        '<div class="mb-20"><label >User Name</label>'+
    			          '<input type="text" class="form-control" name="uname_model" placeholder="User Name">'+
    			        '</div>'+
    			         '<div class="mb-20"><label>Password</label>'+
    			         '<input type="password" class="form-control" name="upass_model">'+
    			         '<button type="button" name="savecredential" class="btn btn-alt-primary mt-10 xs-mb-5 xs-md-0-360" onclick="saveUNandPWModel('+dbid+','+trid+')">Save Password</button>&emsp;'+
    			         '<button type="button" class="btn btn-alt-primary mt-10" onclick="validateUNandPWModel('+dbid+','+trid+')">Validate</button></div>'+
    			       '</div>'+
    			       '<div class="form-group" id="delegatedcredentialdivModel" >'+
    			          '<div class="mb-20"><label >User Name</label>'+
    			               '<select class="form-control"  name="DelegateCredentialUNModel"></select></div>'+
    			               '<button type="button" class="btn btn-alt-primary" onclick="validateDelegateModel('+dbid+','+trid+')">Validate</button>'+
    			          '</div>'+
    			          '<div class="form-group" id="savedcredentialdivModel" style="display: none;"><div class="mb-20"><label>User Name</label>'+
    		    			'<select class="form-control" name="savedCredentialSelectModel"></select></div>'+
    		    			'<button type="button" class="btn btn-alt-primary" onclick="validateSavedModel('+dbid+','+trid+')">Validate</button>'+
    		    			'</div>'
    			          +  
    			          '</div></div></div></div></div></div>'+
    			    '<div class="modal-footer">'+
    			    '<button type="button" class="btn btn-alt-danger" data-dismiss="modal">Close</button>'+
    			    '</div></div>');
    	$('#changeUN').modal('show');
     	$('#model_'+dbid).find("[name='DelegateCredentialUNModel']").empty();
    	$('#model_'+dbid).find("[name='DelegateCredentialUNModel']").append(str);
      }).fail(function() {
    	  $("#preloader").hide();
         console.log('Failed');
         	$('.modal-dialog').modal('hide   ');
         $('#status').text("There is some network issue.Please check your internet access.");
         		
	           $('#myModal').modal('show');
	           
     });
	
}



 $(".chkbox").change(function() {
	var priority=$('.chkbox:checked').length;
    var value = $(this).val();
   var forid= value.split('---')[0];
   var dbname=value.split('---')[1];
   var showCred=value.split('---')[2];
   console.log(showCred)
        $list = $("#add");
    if (this.checked) {
    	$list.append('<form id="'+forid+'">'+
    			'<div class="col-md-12">'+
    			'<div class="block block-bordered">'+
    			'<div class="block-header block-header-default">'+
    			'<h3 class="block-title">'+dbname+'</h3>'+
    			'<div class="block-options">'+
    			'<div class="form-group">'+
    			'<ul class="nav navbar-nav"><li class="mr-10"><label class"col-form-label font-w600">priority</label></li><li><select class="form-control" name="priority">'+makeOption(priority)+' </select></li></ul>'+
    			'</div></div></div>'+
    			'<div class="block-header pl-0 pr-0">'+
    			'<div class="col-md-12">'+
    			'<div class="col-lg-6 mb-10">'+
    			'<label class="css-control css-control-primary css-control-sm css-checkbox"> '+
    			'<input type="checkbox" value="true"  class="css-control-input" name="Notify_Admin" onclick="boxDisable('+forid+', $(this));">'+
    			'<span class="css-control-indicator"></span> Notify Administrators </label>'+
    			'<label class="css-control css-control-primary css-control-sm css-checkbox xs-ml-0">'+
    			'<input type="checkbox" class="css-control-input" value="true" name="postwrappper">'+
    			' <span class="css-control-indicator"></span> Post Deployment Wrapper </label></div>'+
    			(showCred=='true'?(
    			'<div class="'+forid+'displayJquery">'+
    			'<div class="col-md-6">'+
    			'<div class="row">'+
    			'<div class=" block-header xs-width-100" >'+
    			'<select class="form-control mySelect" name="credential" onchange="changeCredentialView('+forid+',$(this));">'+
    			'<option value="delegated" selected>Delegated Credential</option><option value="saved" >Saved Credential</option><option value="credential" selected>Enter Credential</option></select>'
    			+'</div></div></div><div class="col-md-8 col-lg-6"><div class="block"><div class="">'+
    			'<div class="form-group" id="owncredentialdiv" >'+
    			'<div class="mb-20"><label>User Name</label><input type="text" class="form-control"  name="un" placeholder="User Name" required></div>'+
    			'<div class="mb-20"><label >Password</label><input type="password" class="form-control"  name="pw" required></div>'+
    			'<button type="button" name="savecredential" class="btn btn-alt-primary xs-mb-5 xs-md-0-360" onclick="saveUNandPW('+forid+')">Save Password</button>&emsp;'+
    			'<button type="button" class="btn btn-alt-primary" onclick="validateUNandPW('+forid+')">Validate</button></div>'
    			+'<div class="form-group" id="savedcredentialdiv" style="display: none;"><div class="mb-20"><label >User Name</label>'+
    			'<select class="form-control" name="savedCredentialSelect"></select></div>'+
    			'<button type="button" class="btn btn-alt-primary" onclick="validateSaved('+forid+')">Validate</button></div>'
    			+'<div class="form-group" id="delegatedcreadentialdiv" style="display: none;"><div class="mb-20"><label>User Name</label>'+
    			'<select class="form-control" name="DelegateCredentialUN"></select></div>'+
    			'<button type="button" class="btn btn-alt-primary" onclick="validateDelegate('+forid+')">Validate</button></div></div></div></div></div></div></div>'
    				):'')+
    			'<div class=""><div class=""><div class="block-content">'+
    			'<div class="table-responsive"><table class="table table-bordered table-vcenter xs-width-1000" id="'+forid+'sort">'+
    			'<thead><tr>'+
    			'<th class="text-center" style="width: 5%">delete</th>'+
    			'<th class="text-center" style="width: 5%;">sort</th>'+
    			'<th class="text-left" style="min-width: 10%;">Script Name</th>'+
    			'<th  style="display:none;width:0px">Delegated</th>'+
    			'<th style="display:none;width:0px">saved</th>'+
    			'<th class="text-center" style="width: 17%;">User Name</th>'+
    			'<th class="text-left" style="display:none;width:0px">Password</th>'+
    			'<th class="text-left" style="width: 25%;">parameters'+
    			'<c:if test="${mapTypeUsed==\'ORACLE\'}">'+
         		 '<small> (Space separated)</small>'+
           '</c:if>'+
    			 '<c:if test="${mapTypeUsed==\'MYSQL\'}">'+
                '<br>'+
              		 '<small>(Example : SET @var1 = 2;SET @var2 = \'sample\';)</small>'+
                '</c:if>'+
                '<c:if test="${mapTypeUsed==\'ORACLE\'}">'+
                '<br>'+
               	   '<small>(Example : 2 \'sample\')</small>'+
                '</c:if>'+
    			
    			'</th>'+
    			'<th class="text-left" style="width: 15%;">Error Handling</th>'+
    			'</tr></thead>'+
    			'<tbody ><c:forEach items="${selectedFiles}" var="files" varStatus="i">'+
    			'<tr class="ui-state-default" id="'+forid+'_${i.index}">'+
    			'<td class="text-center" ><button type="button"class="btn btn-sm btn-secondary js-tooltip-enabled del-btn"><i class="fa fa-times"></i></button></td>'+
    			'<td class="font-w600 text-center" ><i class="si si-cursor-move"></i></td>'+
    			'<td style="max-width:200px; overflow:auto" class="table-scroll"><input type="hidden" readonly name="files" id="fn_${i.index}" value="${files}">${files}</td>'+
    			'<td id="delegate_${i.index}" name="'+forid+'_Delegated" style="display:none;width:0px"></td>'+
    			'<td id="saved_${i.index}" name="'+forid+'_saved" style="display:none;width:0px"></td>'+
    			'<td class="text-center">'+
    			      '<button type="button" class="tdusername badge badge-primary" name="'+forid+'_selecteduser" id="un_${i.index}" onclick="changeUNandPW($(this))" style="border:none; cursor:pointer"></button>'+
    			'</td>'+
    			'<td class="text-center" style="display:none;width:0px">'+
			      '<input type="text" class="form-control" name="'+forid+'_selecteduserpass" id="pw_${i.index}" readonly >'+
			    '</td>'+
    			'<td class="text-center"><textarea class="form-control" id="param_${i.index}" name="parameters" placeholder="Type Parameters"></textarea></td>'+
    			'<td class="text-center">'+   
    			   '<select class="form-control" name="onError" id="err_${i.index}">'+
    			       '<option value="false" selected>Exit On Error</option>'+
    			       '<option value="true">Continue On Error</option></select>'+
    			'</td>'+
    			'</tr></c:forEach></tbody>'+
    			'</table></div></div></div></div></div></div></form>');
    	
     $('#'+forid+'sort tbody').sortable({
    		 helper: fixHelperModified,
    		 cursor: "move",
        	  stop: updateIndex,
        	  placeholder: "placeholder-style",
        	  start  : function(event, ui){
        		  	$(this).find('.placeholder-style  td:nth-child(4)').css('display', 'none')
        		  	$(this).find('.placeholder-style  td:nth-child(5)').css('display', 'none')
        		  	$(this).find('.placeholder-style  td:nth-child(7)').css('display', 'none')
        	        $(ui.helper).addClass("ui-helper");
        	        ui.helper.css('display', 'table');
        	    }
        	}).disableSelection();
        $('.del-btn').click(function(){
            $(this).parents('tr').first().remove();
        });
      
        }
    else {
      	 var str = '';
        var $select = $('[name="priority"]');
        $select.find('option').remove();
        for(var i = 1; i <=priority ; i++ ){
          str += '<option value='+i+'>'+i+'</option>';
        }
        $select.append(str);
        $list.find('#'+forid).slideUp("fast", function() {
            $(this).remove();
        });
    }
}); 

function submitAll()
{
	var form_id = [];
	  var $select = $('#add');
	  $select.find("form").each(function() {
		form_id.push(this.id);
	});
	  
	  var submit;
	  $.each(form_id , function(index, forid) { 
		  if ($("#"+forid).find('[name="Notify_Admin"]').is(':checked')) {
			  submit=true;
			}
		  else
			  {
				 $.each($("#"+forid).find('.tdusername') , function() { 
					 console.log($(this).text())
					 if($(this).text().length > 0)
						 submit=true;
					 else
						 {
						 submit=false;
						 return false;
						 }	 
				 });
				return submit;
		   }
		});
	
	if(submit)
		{
		  $("#preloader").show();
	  var totaldata={"deployRequestId":'${requestId}',"deployReq":[]};
	$.each(form_id , function(index, forid) { 
		var tablearray={"deployReqFile":[]};
		var notifyAdmin=false;
		var dbid=forid;
		var postwrapper=false;
		if ($("#"+forid).find('[name="Notify_Admin"]').is(':checked')) {
			notifyAdmin=true;
		}
		if ($("#"+forid).find('[name="postwrappper"]').is(':checked')) {
			postwrapper=true;
		}
		var priority=$("#"+forid).find('[name="priority"]').val();
	    var maincontent={priority:priority,dbid:dbid,postwraper:postwrapper,notifyAdmin:notifyAdmin};
		$('#'+forid+'sort > tbody > tr').each(function()
		{  var id=$(this).attr("id");
		   var i=id.split("_")[1];
			var fn=$(this).find('#fn_'+i).val();
		    var delegated=$(this).find('#delegate_'+i).html();
		    var saved=$(this).find('#saved_'+i).html();
		    var un=$(this).find('#un_'+i).text();
		    var pass=$(this).find('#pw_'+i).val();
		    var param=$(this).find('#param_'+i).val();
		    var err=$(this).find('#err_'+i).val();
			var inner={fileName:fn,delegated:delegated,saved:saved,un:un,pass:pass,err:err,param:param};
			tablearray.deployReqFile.push(inner);		
		});
		  var total=$.extend(maincontent, tablearray);
		  totaldata.deployReq.push(total);
		});
/* 	console.log(totaldata) */
  send(totaldata);
		}
	else
		{
		 var checked = $('input[type="checkbox"]:checked').length > 0;
		 console.log($('input[type="checkbox"]:checked').length)
		    if (!checked){
		    	 $('#status').text("A database has to be selected");
		    }
		    else
		    	{
		    	 $('#status').text("Database credentials required to deploy. Please provide credentials or select 'Notify Admin' to request Administrators to deploy.");
		    	}
		$('#closebtnmodal').removeClass('btn-alt-success');$('#closebtnmodal').addClass('btn-alt-danger');
          $('#myModal').modal('show');
		}
     
     
	}
	
	
	function send(data)
	{
		//console.log(data)
 $.ajax({
		        type : "POST",
		        url : "saveDeployRequestFileDetail",
		        data : JSON.stringify(data),
		        contentType: "application/json"
		       }).done(function(responseData) {		    	 
		        	console.log(responseData);
		        	if(responseData=="success")
		        		 $('<form action="submitDBandFileStep3" method="post" style="display:none">'+
		        				 '<input type="hidden"  value="${requestId}" name="reqid">'+
		        				 '<input type="hidden"  value="${repoName}" name="reponame">'+
		        				'<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />'+
		        		'</form>').appendTo('body').submit();
		       }).fail(function() {
		          console.log('Failed');
		          $('#status').text("There is some network issue.Please check your internet access.");
		 	           $('#myModal').modal('show');
		      }); 
	}
</script>


