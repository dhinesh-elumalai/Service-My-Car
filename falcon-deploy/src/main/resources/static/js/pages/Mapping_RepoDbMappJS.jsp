
<script >
jQuery(document).ready(function($) {
    $('.multiselect').multiselect();
});


</script>


 <script>
 $("#targetName").blur(function(){
		var typedValue=$("#targetName").val();
		
		 $.ajax({ 
	         url: 'check_for_targetname_already_present',
	         data: {name: typedValue},
	         type: 'get'
	     }).done(function(responseData) {
	    	 $("#preloader").hide();
	    	 if(responseData=='present')
	    		 $('#tnError').css("display","block");
	    	 
	     }).fail(function() {
	         console.log('Failed');
	     });
	});
	$("#targetName").focus(function(){
		 $('#tnError').css("display","none");
	});
$(document).ready(function(){
    $("#matchRepo").on('keyup', function postinput(){	
    	$('#repoCard').css("display","block");
        var matchvalue = $("#matchRepo").val(); 
        if( !matchvalue == ""&&matchvalue.length>1)
        	{   
        	$("#preloader").show();
	$('#matchRepo').addClass('loadinggif');
        $.ajax({         
            url: 'search_all_repo_except_already_added',
            data: {name: matchvalue},
            type: 'get'
        }).done(function(responseData) {
        	$("#preloader").hide();
        	var empty=responseData.length;
        	$('#repos').children('label').remove();
        	$('#repos').children('input').remove();
        	$('#repos').children('div').remove();
        	if(empty=='0') {
        		 $('<label />', {class:'small pl-15', text: 'Repository "' +matchvalue+ '" is not found.'}).appendTo($('#repos'));
        		 $('#matchRepo').removeClass('loadinggif');
            }
        	else
        		{
        	$.each(responseData, function(i, obj) {
        		$('<div />',{id:'divRepo'+i}).appendTo('#repos');
        		 $('<input />', { class:'unstyled-button',type: 'button',id: 'cb'+i, value: obj,onclick :"showAnswer234(this)"}).appendTo($('#divRepo'+i));
        		 $('#matchRepo').removeClass('loadinggif'); 
        		});
   
        		} }).fail(function() {
        			$("#preloader").hide();
        });
    }
        else
        	{
        	$('#repoCard').css("display","none");
        	$('#repos').children('label').remove();$('#repos').children('input').remove();
        	}
        });
}); 

function showAnswer234(ele) {
	 var value = $(ele).val();
	 $('#matchRepo').val(value);
		$('#repoCard').css("display","none");
	};
	
$('#DbUnselected').keyup(function () {
    var valthis = $(this).val().toLowerCase();
    var num = 0;
    $('select#DbUnselectedDropDownList>option').each(function () {
        var text = $(this).text().toLowerCase();
        if(text.indexOf(valthis) !== -1)  
            {$(this).show(); $(this).prop('selected',true);}
        else{$(this).hide();}
         });
});
$('#Dbselected').keyup(function () {
    var valthis = $(this).val().toLowerCase();
    var num = 0;
    $('select#DbselectedDropDownList>option').each(function () {
        var text = $(this).text().toLowerCase();
        if(text.indexOf(valthis) !== -1)  
            {$(this).show();
            $(this).prop('selected',true);}
        else{$(this).hide();}
         });
});
</script>

 <script type="text/javascript">
          $(function () {

        	    $('.deleteTarget').on("click", function (e) {
        	        var link = this;
        	        $('#textForDialog').text('Are you sure you want to delete this Mapping?'); 
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
        	        	            	   deleteTarget(link.id);
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

          function deleteTarget(targetName)
          {
        	  $("#preloader").show();
        	  $.ajax({         
                  url: 'deleteRepoToDb',
                  data: {targetName: targetName},
                  type: 'get'
              }).done(function(responseData) {
            	  $("#preloader").hide();
            	  console.log(responseData);
              if(responseData=='success')
            	{
            	  window.location ="mappings";
            	  }
              else
            	  {
            	  openRequestFound(responseData);
            	  }
              }).fail(function() {
      			$("#preloader").hide();
              });
          }
        	 
function openRequestFound(reqid)
{
	var str = reqid;
	var myarray = str.split(',');
			 $('#textForDialog').empty();
			 $("#ReqIdList").empty();
			 //<button class='btn btn-sm btn-primary' data-toggle='click-ripple'>Close all Requests and delete Mapping</button>
	        $('#textForDialog').append("Cannot delete this mapping. OPEN REQUEST found for the mapping you are trying to delete. Please close all OPEN REQUESTs and try again.<br><button class='btn btn-sm btn-primary' data-toggle='click-ripple' onClick='closeRequestsAndDeleteMapping()'>Close all Requests and delete Mapping</button><hr><b>Request Id</b> <br><ul id='ReqIdList'class='fa-ul'></ul>"); 
	        for(var i = 0; i < myarray.length; i++)
	        {
	           $("#ReqIdList").append('<li><i class="fa fa-angle-right fa-li"></i><b>'+myarray[i].trim()+'</b></li>');
	        }
	        $('#dialog-confirm').dialog({
	        	resizable: false,
	            height: 400,
	            width: 550,
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
	        	               text: "Close",
	        	               "class": ' btn btn-sm btn-alt-danger',
	        	               click: function() {
	        	            	   $(this).dialog("close");
	        	               }
	        	           }
	        			 ]	
	        }); 
}

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
        	function closeRequestsAndDeleteMapping()
        	{
        		$('#dialog-confirm').dialog('close');
        		var targetName='${target.getTargetName()}';
        		  $.ajax({         
                      url: 'CloseAnddeleteMap',
                      data: {targetName: targetName},
                      type: 'get'
                  }).done(function(responseData) {
                	  $("#preloader").hide();
                	  console.log(responseData);
                  if(responseData=='success')
                	{window.location ="mappings";}
                  else
                	  { deleteTarget(targetName); }
                  }).fail(function() {
          			$("#preloader").hide();
                  });
        	}
        	
        	function changeMapType(ele)
        	{
        	$("#preloader").show();
        	var type=ele.value;
        	 $.ajax({         
                 url: 'returnListForParticularType',
                 data: {type: type},
                 type: 'get'
             }).done(function(responseData) {
           	  $("#preloader").hide();
           	  console.log(responseData);
           	$('#DbUnselectedDropDownList').empty();
           	$.each(responseData, function(i, db) {
           		var text='';
           		if(db.aliasName !== null && db.aliasName !== '')
           			{
           				 $('#DbUnselectedDropDownList').append($("<option></option>").attr("value",db.id).text(db.aliasName)); 
           			}
           		if(db.aliasName === null || db.aliasName === '')
           			{
           				if(db.sid === null || db.sid === '')
           					$('#DbUnselectedDropDownList').append($("<option></option>").attr("value",db.id).text(db.hostName+":"+db.port+"/"+db.service));
           				else
           					$('#DbUnselectedDropDownList').append($("<option></option>").attr("value",db.id).text(db.hostName+":"+db.port+":"+db.sid));
           			
           			}		
           	});
             }).fail(function() {
     			$("#preloader").hide();
             });
        	}
          </script>  
          
          