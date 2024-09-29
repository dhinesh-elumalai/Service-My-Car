<script>
	function checkTable(){
   		console.log($("table > tbody > tr").length);
	   if ($("table > tbody > tr").length == null || $("table > tbody > tr").length == 0){
	     $("#table-hide").hide();
	   }
	 };
	 $('#UserSearch').on('change', function() {
		 $("#user-small").hide();
	});
	 $('#levelid').on('change', function() {
		 $("#level-small").hide();
	});
	 $('#selectedDb').on('change', function() {
		 $("#db-small").hide();
	});
	 
</script>
<c:choose>
	<c:when test="${MODE == 'Edit'}">

	 <script>		
		$(document).ready(function(){
			 var dbid=${Dbid};
			  var targetName = $("#mappingSearch").val();
		    $('#UserSearch').empty(); 
		    $('<option selected></option>').appendTo($('#UserSearch'));
			  $.ajax({         
		          url: 'list_all_users_approval',
		          data: {mapping:targetName,dbid:dbid},
		          type: 'get'
		      }).done(function(responseData) {
		 	    $.each(responseData, function(i, obj) {
		 	  	$('<option value="'+obj.email +'">'+$.trim(obj.firstName)+' '+$.trim(obj.lastName)+' - '+$.trim(obj.email)+'</option>').appendTo($('#UserSearch')) 
		 	  	});
		      		}).fail(function() {
		      });
		}); 

</script>
	
	<script type="text/javascript">
	  
	  
	  function submit()
	  {
		  var email=$("#UserSearch").val();
		  var targetName=$("#mappingSearch").val();
		  var level=$('#levelid').val();
		  var dbName=$("#selectedDb").val();
		  var dbid = dbName.split('-')[0];
		  if (((email.length != 0)||(email!= "")) && ((targetName.length != 0)||(targetName!= ""))&&((dbName.length != 0)||(dbName!= ""))&&(level.trim()))
			  {
			  $("#preloader").show();
			  $("#overlay").css("display","block");
	      $.ajax({         
	          url: 'save_approval',
	          data: {email: email,targetName :targetName,dbName :dbName,level:level},
	          type: 'get'
	      }).done(function(responseData) {
	      if(responseData=='success')
	    	  {
	    	  $('#table-hide').show();
	          $.ajax({         
	              url: 'find_approval_onEdit',
	              data: {mapping: targetName,dbid:$.trim(dbid)},
	              type: 'get'
	          }).done(function(responseData) {
	        	  $('#tbody').empty();
	        	  $("#preloader").hide();
	  	$.each(responseData, function(i, obj) {
	  		if($("#div"+obj.uid).length == 0)
	  			{	
		  		$('<tr id="divRepo11'+i+'">'+
	  					'<td>'+obj.db+'</td>'+
	  					'<td>'+(obj.dbEnabled?" <span class='badge badge-success'>Active</span> ":" <span class='badge badge-danger'>Inactive</span> ")+'</td>'+
	  					'<td>'+obj.uemail+'</td>'+
	  					'<td class="text-center">'+obj.level+'</td>'+
	  					"<td class='text-center'><button type='button' id="+obj.uid+"-"+obj.dbid+"-"+i+"-"+obj.targetName+" class='btn btn-sm btn-outline-danger' onclick='deletePrivilege(this)'><span class='fa fa-trash'></span></button></td>"+
	  					'</tr>').appendTo('#tbody');
		  		
	  			}
	  		});
	  	
	  	$('#UserSearch').empty(); 
	    $('<option selected></option>').appendTo($('#UserSearch'));
		  $.ajax({         
	          url: 'list_all_users_approval',
	          data: {mapping:targetName,dbid:dbid},
	          type: 'get'
	      }).done(function(responseData) {
	 		  $("#preloader").hide();
	 	    $.each(responseData, function(i, obj) {
	 	  	$('<option value="'+obj.email +'">'+$.trim(obj.firstName)+' '+$.trim(obj.lastName)+' - '+$.trim(obj.email)+'</option>').appendTo($('#UserSearch')) 
	 	  	});
	      		}).fail(function() {
	      		  $("#preloader").hide();
	      });
		  
	          }).fail(function() {
	        	  $("#preloader").hide();
	              console.log('Failed');
	          });
	          $("#overlay").css("display","none");
	    	  }
	      else
	    	  {
	    	  $("#preloader").hide();
	    	  }
	      }).fail(function() {
	    	  $("#preloader").hide();
	      });
	    }
		  else
			  {
			 		 if (email.trim().length == 0||email.trim()== "")
			 			$("#user-small").show();
					if(level.trim().length==0||level.trim()=="")
						$("#level-small").show();
			  }
	  }
	  
	  function deletePrivilege(ele) {
		  $('#textForDialog').text('Are you sure you want to delete this approver?'); 
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
		    	                    $(this).dialog("close");
		    	                 var value = $(ele).attr('id');
		    	       			 var arr = value.split('-');
		    	       			 var uid=arr[0];
		    	       			 var did=arr[1];
		    	       			 var index=arr[2];
		    	       			 var target=arr[3];
		    	       			  $("#preloader").show();
		    	       			 $.ajax({         
		    	       		          url: 'delete_approval',
		    	       		          data: {uid: uid,did :did,target :target},
		    	       		          type: 'get'
		    	       		      }).done(function(responseData) {
		    	       		    	  $("#preloader").hide();
		    	       		    	  var status=responseData;	  
		    	       		    	  if(status=='success')
		    	       		    		  {
		    	       		    		   $("#divRepo11"+index).remove();
		    	       		    		   checkTable();
		    	       		    		   var dbid=${Dbid};
		    	       		 			  var targetName = $("#mappingSearch").val();
		    	       		 		    $('#UserSearch').empty(); 
		    	       		 		    $('<option selected></option>').appendTo($('#UserSearch'));
		    	       		 			  $.ajax({         
		    	       		 		          url: 'list_all_users_approval',
		    	       		 		          data: {mapping:targetName,dbid:dbid},
		    	       		 		          type: 'get'
		    	       		 		      }).done(function(responseData) {
		    	       		 		 		
		    	       		 		 	    $.each(responseData, function(i, obj) {
		    	       		 		 	  	$('<option value="'+obj.email +'">'+$.trim(obj.firstName)+' '+$.trim(obj.lastName)+' - '+$.trim(obj.email)+'</option>').appendTo($('#UserSearch')) 
		    	       		 		 	  	});
		    	       		 		      		}).fail(function() {
		    	       		 		      });
		    	       		   			}
		    	       		      }).fail(function() {
		    	       		    	  $("#preloader").hide();
		    	       	          });
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
			
			};
			

			
 function deletePrivilegeOnEdit(ele) {
	 $('#textForDialog').text('Are you sure you want to delete this approver?'); 
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
	    	                    $(this).dialog("close");
	    	                    var value = $(ele).attr('id');
	    	       			 var arr = $("#selectedDb").val().split('-');
	    	       			 var uid=value;
	    	       			 var did=$.trim(arr[0]);
	    	       			 var target=$("#mappingSearch").val();
	    	       			  $("#preloader").show();
	    	       			 $.ajax({         
	    	       		          url: 'delete_approval',
	    	       		          data: {uid: uid,did :did,target :target},
	    	       		          type: 'get'
	    	       		      }).done(function(responseData) {
	    	       		    	  $("#preloader").hide();
	    	       		    	  var status=responseData;
	    	       		    	  if(status=='success')
	    	       		    		  {
	    	       		    		   $("#div"+uid).remove();
	    	       		    		   $("#h"+uid).remove();
	    	       		    		   checkTable();
	    	       		    		   
	    	       		    			 var dbid=${Dbid};
	    	       		   			  var targetName = $("#mappingSearch").val();
	    	       		   		    $('#UserSearch').empty(); 
	    	       		   		    $('<option selected></option>').appendTo($('#UserSearch'));
	    	       		   			  $.ajax({         
	    	       		   		          url: 'list_all_users_approval',
	    	       		   		          data: {mapping:targetName,dbid:dbid},
	    	       		   		          type: 'get'
	    	       		   		      }).done(function(responseData) {	   		 		
	    	       		   		 	    $.each(responseData, function(i, obj) {
	    	       		   		 	  	$('<option value="'+obj.email +'">'+$.trim(obj.firstName)+' '+$.trim(obj.lastName)+' - '+$.trim(obj.email)+'</option>').appendTo($('#UserSearch')) 
	    	       		   		 	  	});
	    	       		   		      		}).fail(function() {
	    	       		   		      });
	    	       		    		  }
	    	       		      
	    	       		      }).fail(function() {
	    	       		    	  $("#preloader").hide();
	    	       	          });
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
			
			};
	</script>
	</c:when>
	
	
	
<c:when test="${MODE== 'Add'}">
<script>	
$(document).ready(function(){
    $("#mappingSearch").on('keyup', function postinput(){	
    	var x = document.getElementById("mappingSearch").hasAttribute("readonly"); 
    	if(!x)
    	{
    	$('#repoCard1').css("display","block");
        var matchvalue = $("#mappingSearch").val(); 
        if( !matchvalue == ""&&matchvalue.length>1)
        	{
        	  $("#preloader").show();
	$('#mappingSearch').addClass('loadinggif');
        $.ajax({         
            url: 'search_all_mapping_deploy_privilege',
            data: {name: matchvalue},
            type: 'get'
        }).done(function(responseData) {
        	  $("#preloader").hide();
        	var empty=responseData.length;
        	$('#repos1').children('label').remove();
        	$('#repos1').children('input').remove();
        	$('#repos1').children('div').remove();
        	if(empty=='0') {
        		$('#userChooseDiv').hide();
        		 $('<label />', {class:"small",  text: 'Mapping "' +matchvalue+ '" is not found.'}).appendTo($('#repos1'));
        		 $('#mappingSearch').removeClass('loadinggif');
            }
        	else
        		{
	        	$.each(responseData, function(i, obj) {
	        		$('<div />',{id:'divdb0'+i}).appendTo('#repos1');
	        		 $('<input />', { class:'unstyled-button',type: 'button',id: 'btn0_'+obj.targetName, value: obj.targetName,onclick :"showAnswer234(this)"}).appendTo($('#divdb0'+i));
	        			
	        		});
	        	$('#mappingSearch').removeClass('loadinggif');
        		} }).fail(function() {
        			  $("#preloader").hide();
        });
    }
        else
        	{
        	$('#repoCard1').css("display","none");
        	$('#repos1').children('label').remove();$('#repos1').children('input').remove();
        	}
    }
        });
}); 

function showAnswer234(ele) {
	 var value = $(ele).val();
		$('#mappingSearch').val(value);
		$('#repoCard1').css("display","none");
	};
	
	

</script>
	  
  <script type="text/javascript">
  
  function checkThisEntry()
  {
	  var matchvalue = $("#mappingSearch").val();
	  if(matchvalue.length>0)
		{
		  $("#preloader").show();
		  $.ajax({         
	          url: 'check_availability_of_Mapping',
	          data: {name: matchvalue},
	          type: 'get'
	      }).done(function(responseData) {
	      if(responseData=='found')
	    	  {
		    	  $("#overlay").css("display","block");
		          $.ajax({         
		              url: 'find_approval',
		              data: {mapping: matchvalue},
		              type: 'get'
		          }).done(function(responseData) {
		        	  $("#preloader").hide();
		        	  $('#repos11').empty();
		  		$('<div />',{id:'divRepo11', class:'table-responsive'}).appendTo('#repos11');
		  		$('<table class="table table-striped table-bordered xs-width-500px"><thead>'+
		  				'<tr>'+
		  				'<th class="">DATABASE</th>'+
		  				'<th class="">STATUS</th>'+
		  				'<th class="s">USER</th>'+
		  				'<th class="text-center">LEVEL</th>'+
		  				'<th class="text-center">ACTION</th>'+
		  				'</tr></thead>'+
  				        '<tbody id="tbody">'+
  				 '</tbody></table>').appendTo('#divRepo11');	
		  	$.each(responseData, function(i, obj) {
		  		$("#table-hide").show();
		  		$('<tr id="divRepo11'+i+'">'+
	  					'<td>'+obj.db+'</td>'+
	  					'<td>'+(obj.dbEnabled?" <span class='badge badge-success'>Active</span> ":" <span class='badge badge-danger'>Inactive</span> ")+'</td>'+
	  					'<td>'+obj.uemail+'</td>'+
	  					'<td class="sm-text-right text-center">'+obj.level+'</td>'+
	  					"<td class='text-center'><button type='button' id="+obj.uid+"-"+obj.dbid+"-"+i+"-"+obj.targetName+" class='btn btn-sm btn-alt-danger' onclick='deletePrivilege(this)'><span class='fa fa-trash'></span></button></td>"+
	  					'</tr>').appendTo('#tbody');
		  		});

		          }).fail(function() {
		        	  $("#preloader").hide();
		              console.log('Failed');
		          });  $("#overlay").css("display","none");
		    	  $.ajax({         
		              url: 'get_all_db_for_selected_Mapping',
		              data: {name:matchvalue},
		              type: 'get'
		          }).done(function(responseData) {
		        	  $("#preloader").hide();
		  	      $.each(responseData, function(i, obj) {
		  	    	$('<option value="'+obj.id +'">'+$.trim(obj.link)+'</option>').appendTo($('#selectedDb')) 
		  	    	});
		          }).fail(function() {
		        	  $("#preloader").hide();
		          });  $("#overlay").css("display","none");
		    
		  $('#hideAndShow').css("display","");
		  $('#userChooseDiv').css("display","none");
		  $('#continueBtn').css("display","none");
		  $("#mappingSearch").attr("readonly", "true");  
	    	  }
	      else
		  {
	    	  $("#preloader").hide();
		  $('#userChooseDiv').css("display","");
		  $('#hideAndShow').css("display","none");
		  }
		  
		}).fail(function() {
			  $("#preloader").hide();
        }); 
   } 
	  else
      {
	  $('#userChooseDiv').css("display","");
	  $('#hideAndShow').css("display","none");
	  }
	

  }
  
 $("#selectedDb").change(function() {
	  $("#preloader").show();
	  var dbid=$(this).val();
	  var targetName = $("#mappingSearch").val();
    $('#UserSearch').empty(); 
    $('<option selected></option>').appendTo($('#UserSearch'));
	  $.ajax({         
          url: 'list_all_users_approval',
          data: {mapping:targetName,dbid:dbid},
          type: 'get'
      }).done(function(responseData) {
    	  $("#preloader").hide();
 		
 	    $.each(responseData, function(i, obj) {
 	  	$('<option value="'+obj.email +'">'+$.trim(obj.firstName)+' '+$.trim(obj.lastName)+' - '+$.trim(obj.email)+'</option>').appendTo($('#UserSearch')) 
 	  	});
      		}).fail(function() {
      		  $("#preloader").hide();
      });
});
  
  function submit()
  { 
      var email=$("#UserSearch").val();
	  var targetName=$("#mappingSearch").val();
	  var level=$('#levelid').val();
	  var dbName=$("#selectedDb").val();

	  if (((email.length != 0)||(email != "")) && ((targetName.length != 0)||(targetName != ""))&&((dbName.length != 0)||(dbName!= ""))&&(level.trim()))
        {
		  $("#preloader").show();
      $.ajax({         
          url: 'save_approval',
          data: {email: email,targetName :targetName,dbName :dbName,level:level},
          type: 'get'
      }).done(function(responseData) {
      if(responseData=='success')
    	  {
    	  $("#table-hide").show();
          $.ajax({         
              url: 'find_approval',
              data: {mapping: targetName},
              type: 'get'
          }).done(function(responseData) {
        	  $("#preloader").hide();
        	  $('#repos11').empty();
        	  $('<div />',{id:'divRepo11', class:'table-responsive'}).appendTo('#repos11');
		  		$('<table class="table table-striped table-bordered xs-width-500px">'+
		  				'<thead><tr>'+
		  				'<th class="text-center">DATABASE</th>'+
		  				'<th class="text-center">STATUS</th>'+
		  				'<th class="text-center">USER</th>'+
		  				'<th class="text-center">LEVEL</th>'+
		  				'<th class="text-center">ACTION</th>'+
		  				'</tr></thead>'+
				        '<tbody id="tbody">'+
				 '</tbody></table>').appendTo('#divRepo11');	
		  	$.each(responseData, function(i, obj) {
		  		
		  		$('<tr id="divRepo11'+i+'">'+
	  					'<td>'+obj.db+'</td>'+
	  					'<td>'+(obj.dbEnabled?" <span class='badge badge-success'>Active</span> ":" <span class='badge badge-danger'>Inactive</span> ")+'</td>'+
	  					'<td>'+obj.uemail+'</td>'+
	  					'<td class="sm-text-right text-center">'+obj.level+'</td>'+
	  					"<td class='text-center'><button type='button' id="+obj.uid+"-"+obj.dbid+"-"+i+"-"+obj.targetName+" class='btn btn-sm btn-alt-danger' onclick='deletePrivilege(this)'><span class='fa fa-trash'></span></button></td>"+
	  					'</tr>').appendTo('#tbody');
		  		});
		  	
		  	 var dbid=$("#selectedDb").val();
			  var targetName = $("#mappingSearch").val();
		    $('#UserSearch').empty(); 
		    $('<option selected></option>').appendTo($('#UserSearch'));
			  $.ajax({         
		          url: 'list_all_users_approval',
		          data: {mapping:targetName,dbid:dbid},
		          type: 'get'
		      }).done(function(responseData) {
		 		  $("#preloader").hide();
		 	    $.each(responseData, function(i, obj) {
		 	  	$('<option value="'+obj.email +'">'+$.trim(obj.firstName)+' '+$.trim(obj.lastName)+' - '+$.trim(obj.email)+'</option>').appendTo($('#UserSearch')) 
		 	  	});
		      		}).fail(function() {
		      });
		  	
        	  
          }).fail(function() {
              console.log('Failed');
              $("#preloader").hide();
          });  
    	  }
      else
    	  {
    	  $("#preloader").hide();
    	  }
      }).fail(function() {
    	  $("#preloader").hide();
      });   
  }
	  else
	  {
		  
		  if (dbName.trim().length == 0||dbName.trim()== "")
	 			$("#db-small").show();
		  if (email.trim().length == 0||email.trim()== "")
	 			$("#user-small").show();
			if(level.trim().length==0||level.trim()=="")
				$("#level-small").show();
	  }
  }
  
  function deletePrivilege(ele) {
	  $('#textForDialog').text('Are you sure you want to delete this approver?'); 
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
	    	                    $(this).dialog("close");
	    	                    $("#preloader").show();
	    	           		 var value = $(ele).attr('id');
	    	           		 var arr = value.split('-');
	    	           		 var uid=arr[0];
	    	           		 var did=arr[1];
	    	           		 var index=arr[2];
	    	           		 var target=arr[3];

	    	           		 $.ajax({         
	    	           	          url: 'delete_approval',
	    	           	          data: {uid: uid,did :did,target :target},
	    	           	          type: 'get'
	    	           	      }).done(function(responseData) {	
	    	           	    	  var status=responseData;	
	    	           	    	  if(status=='success')
	    	           	    		  {
	    	           	    		  $("#preloader").hide();
	    	           	    		   $("#divRepo11"+index).remove();
	    	           	    		   checkTable();
	    	           	    		   $('#UserSearch').empty(); 
	    	           	    		    $('<option selected></option>').appendTo($('#UserSearch'));
	    	           	    			  $.ajax({         
	    	           	    		          url: 'list_all_users_approval',
	    	           	    		          data: {mapping:targetName,dbid:dbid},
	    	           	    		          type: 'get'
	    	           	    		      }).done(function(responseData) {
	    	           	    		 		  $("#preloader").hide();
	    	           	    		 	    $.each(responseData, function(i, obj) {
	    	           	    		 	  	$('<option value="'+obj.email +'">'+$.trim(obj.firstName)+' '+$.trim(obj.lastName)+' - '+$.trim(obj.email)+'</option>').appendTo($('#UserSearch')) 
	    	           	    		 	  	});
	    	           	    		      		}).fail(function() {
	    	           	    		      });
	    	           	    			   
	    	           	    		  }
	    	           	      
	    	           	      }).fail(function() {
	    	           	    	  $("#preloader").hide();
	    	                     });
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
	 
		  var dbid=$("#selectedDb").val();
		  var targetName = $("#mappingSearch").val();

		};
		
		  
  </script>

 
</c:when>
</c:choose>
