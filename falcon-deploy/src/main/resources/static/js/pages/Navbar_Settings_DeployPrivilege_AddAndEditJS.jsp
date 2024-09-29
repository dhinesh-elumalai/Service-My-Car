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
	 $('#selectedDb').on('change', function() {
		 $("#db-small").hide();
	});
</script>
<c:choose>
	<c:when test="${MODE == 'Edit'}">

	
	<script type="text/javascript">
	$(document).ready(function(){
		  ifDbChanged();
	});	
	
		function ifDbChanged()
		{
			 $("#preloader").show();
			  var dbid=$("#selectedDb").val();
			  var targetName = $("#mappingSearch").val();
		    $('#UserSearch').empty(); 
		    $('<option selected></option>').appendTo($('#UserSearch'));
			  $.ajax({  
				  url: 'search_all_users_dp',
		          data: {mapping:targetName,dbid:dbid},
		          type: 'get'
		      }).done(function(responseData) {
		    	  $("#preloader").hide();
		 		
		 	    $.each(responseData, function(i, obj) {
		 	  	$('<option value="'+obj.email +'">'+$.trim(obj.firstName)+' '+$.trim(obj.lastName)+' - '+$.trim(obj.email)+'</option>').appendTo($('#UserSearch')) 
		 	  	});
		 	   checkTable();
		      		}).fail(function() {
		      		  $("#preloader").hide();
		      });
		}
	  
	  function submit()
	  {
		  var email=$("#UserSearch").val();
		  var targetName=$("#mappingSearch").val();
		  var dbName=$("#selectedDb").val();
		  var dbid = dbName.split('-')[0];
	
	  if (((email.length != 0)||(email!= "")) && ((targetName.length != 0)||(targetName!= ""))&&((dbName.length != 0)||(dbName!= "")))
		    	{
		  $("#preloader").show();
	      $.ajax({         
	          url: 'save_privilege',
	          data: {email: email,targetName :targetName,dbName :dbName},
	          type: 'get'
	      }).done(function(responseData) {
	      if(responseData=='success')
	    	  {
	    	  $("#table-hide").show();
	    	  $("#UserSearch").val("");
	    	  $('#repos3').empty();
	          $.ajax({         
	              url: 'find_privilege_onEdit',
	              data: {mapping: targetName,dbid:$.trim(dbid)},
	              type: 'get'
	          }).done(function(responseData) {
	        	  $("#preloader").hide();
	        	  $('#repos11').empty();
	        	  $('#onAddRechg').empty();
	        	  
	        	  $('<div />',{id:'divRepo11', class:'table-responsive '}).appendTo('#repos11');
			  		$('<table class="table table-striped table-bordered xs-width-500px sm-width-1000"><thead><tr><th>DATABASE</th><th>STATUS</th><th>USER</th><th class="text-center">ACTION</th></tr></thead>'+
			  				'<tbody id="tbody"></tbody></table>').appendTo('#divRepo11');
			  				$.each(responseData, function(i, obj) {
			  					$('<tr id="divRepo11'+i+'">'+
			  					'<td class="text-left">'+obj.db+'</td>'+
			  					'<td>'+(obj.dbEnabled?"<span class='badge badge-success'>Active</span>":"<span class='badge badge-danger'>Inactive</span>")+'</td>'+
			  					'<td>'+obj.uemail+'</td>'+
			  					"<td class='text-center'><button type='button' id="+obj.uid+"-"+obj.dbid+"-"+i+"-"+obj.targetName+" class='btn btn-sm btn-outline-danger' onclick='deletePrivilege(this)'><span class='fa fa-trash'></span></button></td>"+
			  					'</tr>').appendTo('#tbody');
			  				})
		  
	          }).fail(function() {
	        	  $("#preloader").hide();
	              console.log('Failed');
	          });
	          ifDbChanged();
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
		  $("#user-small").show();
		  }
	  }
	  
	  function deletePrivilege(ele) {
		  $('#textForDialog').text('Are you sure you want to delete this privilege?'); 
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
		    	     		          url: 'delete_deploy_privile',
		    	     		          data: {uid: uid,did :did,target :target},
		    	     		          type: 'get'
		    	     		      }).done(function(responseData) {
		    	     		    	  $("#preloader").hide();
		    	     		    	  var arr = responseData.split('-');
		    	     		    	  var status=arr[0];
		    	     		    	  var count=arr[1];
		    	     		    	  if(status=='success')
		    	     		    		  {
		    	     		    		  
		    	     		    		   $("#divRepo11"+index).remove();
		    	     		    		   ifDbChanged();
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
			

	//finished		
 function deletePrivilegeOnEdit(ele) {
	 $('#textForDialog').text('Are you sure you want to delete this privilege?'); 
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
	    	     			 var arr = $("#selectedDb").val().split('-');
	    	     			 var uid=value;
	    	     			 var did=$.trim(arr[0]);
	    	     			 var target=$("#mappingSearch").val();
	    	     			 $.ajax({         
	    	     		          url: 'delete_deploy_privile',
	    	     		          data: {uid: uid,did :did,target :target},
	    	     		          type: 'get'
	    	     		      }).done(function(responseData) {
	    	     		    	  $("#preloader").hide();
	    	     		    	  var arr = responseData.split('-');
	    	     		    	  var status=arr[0];
	    	     		    	  var count=arr[1];
	    	     		    	  if(status=='success')
	    	     		    		  {
	    	     		    		  ifDbChanged();
	    	     		    		   $("#div"+uid).remove();
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
    	$('#repoCard1').show();
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
        	$('#repos1').empty();
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
	
	  
	  $("#selectedDb").change(function() {
		  ifDbChanged();
	});	
		function ifDbChanged()
		{
			 $("#preloader").show();
			  var dbid=$("#selectedDb").val();
			  var targetName = $("#mappingSearch").val();
		    $('#UserSearch').empty(); 
		    $('<option selected></option>').appendTo($('#UserSearch'));
			  $.ajax({  
				  url: 'search_all_users_dp',
		          data: {mapping:targetName,dbid:dbid},
		          type: 'get'
		      }).done(function(responseData) {
		    	  $("#preloader").hide();
		 		
		 	    $.each(responseData, function(i, obj) {
		 	  	$('<option value="'+obj.email +'">'+$.trim(obj.firstName)+' '+$.trim(obj.lastName)+' - '+$.trim(obj.email)+'</option>').appendTo($('#UserSearch')) 
		 	  	});
		 	   checkTable();
		      		}).fail(function() {
		      		  $("#preloader").hide();
		      });
		}
	
		function showAnswer2334(ele) {
			$('.primary-bg-lt').removeClass('primary-bg-lt');
			$(ele).toggleClass('primary-bg-lt');
			 var value = $(ele).val(); 
			 var arr = value.slice(value.indexOf("-")+1);
				var email=$.trim(arr);
				$('#UserSearch').val(email);
			
			};

</script>
	  
  <script type="text/javascript">
  function checkThisEntry()
  {
	  var matchvalue = $("#mappingSearch").val();
	  if(matchvalue.length>0)
		{
		  $.ajax({         
	          url: 'check_availability_of_Mapping',
	          data: {name: matchvalue},
	          type: 'get'
	      }).done(function(responseData) {
	      if(responseData=='found')
	    	  {
		          $.ajax({         
		              url: 'find_privilege',
		              data: {mapping: matchvalue},
		              type: 'get'
		          }).done(function(responseData) {
		        	  $('#repos11').empty();
		  		$('<div />',{id:'divRepo11', class:'table-responsive'}).appendTo('#repos11');
		  		$('<table class="table table-striped table-bordered xs-width-500px sm-width-1000"><thead><tr><th>DATABASE</th><th>STATUS</th><th>USER</th><th class="text-center">ACTION</th></tr></thead>'+
		  				'<tbody id="tbody"></tbody></table>').appendTo('#divRepo11');
		  				$.each(responseData, function(i, obj) {
		  				  $('#table-hide').show();
		  					$('<tr id="divRepo11'+i+'">'+
		  					'<td>'+obj.db+'</td>'+
		  					'<td>'+(obj.dbEnabled?'<span class="badge badge-success">Active</span> ':'<span class="badge badge-danger">Inactive</span> ')+'</td>'+
		  					'<td class="text-capitalize">'+obj.uemail+'</td>'+
		  					"<td class='text-center'><button type='button' id="+obj.uid+"-"+obj.dbid+"-"+i+"-"+obj.targetName+" class='btn btn-sm btn-alt-danger' onclick='deletePrivilege(this)'><span class='fa fa-trash'></span></button></td>"+
		  					'</tr>').appendTo('#tbody');
		  				})
		  				
		          }).fail(function() {
		              console.log('Failed');
		          }); 
		          
		    	  $.ajax({         
		              url: 'get_all_db_for_selected_Mapping',
		              data: {name:matchvalue},
		              type: 'get'
		          }).done(function(responseData) {
		        	  $('<option selected></option>').appendTo($('#selectedDb'))  		
		  	      $.each(responseData, function(i, obj) {
		  	    	$('<option value="'+obj.id +'">'+$.trim(obj.link)+'</option>').appendTo($('#selectedDb')) 
		  	    	});
		          }).fail(function() {

		          });  $("#overlay").css("display","none");
		    
		  $('#hideAndShow').css("display","");
		  $('#userChooseDiv').css("display","none");
		  $('#continueBtn').css("display","none");
		  $("#mappingSearch").attr("readonly", "true");  
	    	  }
	      else
		  {
		  $('#userChooseDiv').css("display","");
		  $('#hideAndShow').css("display","none");
		  }
		  
		}).fail(function() {
        });
	 
  } 
	  else
  {
	  $('#userChooseDiv').css("display","");
	  $('#hideAndShow').css("display","none");
	  }
  }

  

  
  function submit()
  {
	  var email=$("#UserSearch").val();
	  var targetName=$("#mappingSearch").val();
	  var dbName=$("#selectedDb").val();
	  if (((email.length != 0)||(email!= "")) && ((targetName.length != 0)||(targetName!= ""))&&((dbName.length != 0)||(dbName!= "")))
		 {
		  
		  $("#overlay").css("display","block");
      $.ajax({         
          url: 'save_privilege',
          data: {email: email,targetName :targetName,dbName :dbName},
          type: 'get'
      }).done(function(responseData) {
      if(responseData=='success')
    	  {
    	  $('#repos3').empty();
    	  $('#table-hide').show();
    	  $('#UserSearch').val("");
          $.ajax({         
              url: 'find_privilege',
              data: {mapping: targetName},
              type: 'get'
          }).done(function(responseData) {
        	  $('#repos11').empty();
		  		$('<div />',{id:'divRepo11', class:'table-responsive'}).appendTo('#repos11');
		  		$('<table class="table table-striped table-bordered xs-width-500px"><thead><tr><th class="text-left">DATABASE</th><th>STATUS</th><th class="text-left">USER</th><th class="text-center">ACTION</th></tr></thead>'+
		  				'<tbody id="tbody"></tbody></table>').appendTo('#divRepo11');
		  				$.each(responseData, function(i, obj) {
		  					$('<tr id="divRepo11'+i+'">'+
		  					'<td>'+obj.db+'</td>'+
		  					'<td>'+(obj.dbEnabled?"<span class='badge badge-success'>Active</span>":"<span class='badge badge-danger'>Inactive</span>")+'</td>'+
		  					'<td>'+obj.uemail+'</td>'+
		  					"<td class='text-center'><button type='button' id="+obj.uid+"-"+obj.dbid+"-"+i+"-"+obj.targetName+" class='btn btn-sm btn-alt-danger' onclick='deletePrivilege(this)'><span class='fa fa-trash'></span></button></td>"+
		  					'</tr>').appendTo('#tbody');
		  				})
		  				 $('#UserSearch').empty(); 
		  			    $('<option selected></option>').appendTo($('#UserSearch'));
		  			  ifDbChanged();
          }).fail(function() {
              console.log('Failed');
          });  $("#overlay").css("display","none");
    	  }
   
      }).fail(function() {
      });
	  }
	   else
 	  {
		   console.log(dbName);
		   console.log(dbName.trim().length)
 	  if(email.trim().length == 0||email.trim()== "")
		  $("#user-small").show();
 	 if(dbName.trim().length == 0||dbName.trim()== "")
 		 $("#db-small").show();
 	  }
  }
  
  $("#selectedDb").change(function() {
	  $('#UserSearch').val(""); 
	  $('#repos3').empty();
  });
  function deletePrivilege(ele) {
	  $('#textForDialog').text('Are you sure you want to delete this privilege?'); 
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

	    	           		 $.ajax({         
	    	           	          url: 'delete_deploy_privile',
	    	           	          data: {uid: uid,did :did,target :target},
	    	           	          type: 'get'
	    	           	      }).done(function(responseData) {
	    	           	    	  var arr = responseData.split('-');
	    	           	    	  var status=arr[0];
	    	           	    	  var count=arr[1];
	    	           	    	  if(status=='success')
	    	           	    		  {
	    	           	    		   $("#divRepo11"+index).remove();  	
	    	           	    		  }
	    	           	    	  ifDbChanged();
	    	           	    	 
	    	           	      }).fail(function() {
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
</c:choose>
