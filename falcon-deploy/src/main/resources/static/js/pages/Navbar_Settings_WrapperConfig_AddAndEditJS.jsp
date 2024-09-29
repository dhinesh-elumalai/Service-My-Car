<script>
	function checkTable(){
   		console.log($("table > tbody > tr").length);
	   if ($("table > tbody > tr").length == null || $("table > tbody > tr").length == 0){
	     $("#table-hide").hide();
	   }
	 };
	 $('#FileSearch').on('change', function() {
		 $("#file-small").hide();
	});
	 $('#selectedDb').on('change', function() {
		 $("#db-small").hide();
	});
</script>
<c:choose>
	<c:when test="${MODE == 'Edit'}">

	<script type="text/javascript">
	function showAnswer234(ele) {
		 var value = $(ele).val();
			$('#selectedDb').val(value);
		};
		
		$(document).ready(function(){
			var mapping=$("#mappingSearch").val();
		$.ajax({         
            url: 'fileListForRepoForWrapperConfig',
            data: {mapName:mapping},
            type: 'get'
        }).done(function(responseData) {
	      $.each(responseData, function(i, obj) {
	  	$('<option value="'+obj+'">'+$.trim(obj)+'</option>').appendTo($('#FileSearch')) 
	    	});
        }).fail(function() {
      	 
        });
		});
		
		function submit()
		  { 
			  var file=$("#FileSearch").val();
			  var targetName=$("#mappingSearch").val();
			  var dbName=$("#selectedDb").val();
			  if (((file.length != 0)||(file!= "")) && ((targetName.length != 0)||(targetName!= ""))&&((dbName.length != 0)||(dbName!= "")))
				{
				  $("#preloader").show();
		      $.ajax({         
		          url: 'save_wrapper',
		          data: {file: file,targetName :targetName,dbName :dbName},
		          type: 'get'
		      }).done(function(responseData) {
		      if(responseData=='success')
		    	  {
		          $.ajax({         
		              url: 'find_wrappers',
		              data: {mapping: targetName},
		              type: 'get',
		          }).done(function(responseData) {
		        	  $("#preloader").hide();
		        	  //onjsp
		        	  	  $('#onjsp').empty();
		        	  $('#repos11').empty();
		        	  $('<div />',{id:'divRepo11', class:'table-responsive'}).appendTo('#repos11');
				  		$('<table class="table table-striped table-bordered xs-width-500px sm-width-1000"><thead>'+
				  				'<tr>'+
				  				'<th class="">DATABASE</th>'+
				  				'<th class="">STATUS</th>'+
				  				'<th class="">FILE NAME</th>'+
				  				'<th class="text-center">ACTION</th>'+
				  				'</tr></thead>'+
		  				        '<tbody id="tbody">'+
		  				 '</tbody></table>').appendTo('#divRepo11');	
				  	$.each(responseData, function(i, obj) {
				  		
				  		$('<tr id="divRepo11'+i+'">'+
			  					'<td>'+obj.dbName+'</td>'+
			  					'<td>'+(obj.dbEnabled?'<span class="badge badge-success">Active</span>':'<span class="badge badge-danger">Inactive</span>')+'</td>'+
			  					'<td>'+obj.fileName+'</td>'+
			  					"<td class='text-center'><button type='button' id="+i+'----'+obj.fileName+'----'+obj.dbid+" class='btn btn-sm btn-alt-danger' onclick='deletePrivilege(this)'><span class='fa fa-trash'></span></button></td>"+
			  					'</tr>').appendTo('#tbody');
				  		});
		        	  
			  $("#targetSearch").val("");
			  $("#dbSearch").val("");
			  $("#table-hide").show();
		          }).fail(function() {
		        	  $("#preloader").hide();
		              console.log('Failed');
		          });  
		    	  }
		      else if(responseData=='error')
		    	  {
		    	  $("#preloader").hide();
		    	  $('#ferror').css("display","");
		    	  $("#overlay").css("display","none");
		    	  }
		      }).fail(function() {
		    	  $("#preloader").hide();
		      });
		  }
		  else
			{
				  if (file.trim().length == 0||file.trim()== "") 
					  $("#file-small").show();
				  if(dbName.trim().length == 0||dbName.trim()== "")
				 	 $("#db-small").show();
			}
		}
		
		  $("#FileSearch").focus(function(){
				 $('#ferror').css("display","none");
			});
	  
		function deletePrivilege(ele) {
			 $('#textForDialog').text('Are you sure you want to delete this wrapper?'); 
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
			    	   				 var targetName=$("#mappingSearch").val();
			    	   				 var arr = value.split('----');
			    	   				 var did=$.trim(arr[2]);
			    	   				 var file=arr[1];
			    	   		         var index=arr[0];
			    	   		        
			    	   		         
			    	   				 $.ajax({         
			    	   			          url: 'delete_wrapper',
			    	   			          data: {file: file,did :did,target :targetName},
			    	   			          type: 'get'
			    	   			      }).done(function(responseData) {
			    	   			    	  $("#preloader").hide();
			    	   			    	  var arr = responseData.split('-');
			    	   			    	  var status=arr[0];
			    	   			    	  if(status=='success')
			    	   			    		  {
			    	   			    		   $("#divRepo11"+index).remove();
			    	   			    		   checkTable();	
			    	   			    		   $("#overlay").css("display","none");
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
	 $('#textForDialog').text('Are you sure you want to delete this wrapper?'); 
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
	    	       			 var index = $(ele).attr('id');
	    	       			 var dbname = index.split('----');
	    	       			 var dbid=dbname[1];
	    	       			 var filename=dbname[0];
	    	       			 var target=$("#mappingSearch").val();
	    	       			 $.ajax({         
	    	       		          url: 'delete_wrapper',
	    	       		          data: {file: $.trim(filename),did :$.trim(dbid),target :$.trim(target)},
	    	       		          type: 'get'
	    	       		      }).done(function(responseData) {
	    	       		    	  $("#preloader").hide();
	    	       		    	  var arr = responseData.split('-');
	    	       		    	  var status=arr[0];
	    	       		    	  if(status=='success')
	    	       		    		  {
	    	       		    		   $("#div_"+dbname[2]).remove();
	    	       		    		   checkTable();
	    	       		    		   $("#overlay").css("display","none");
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
            url: 'search_on_mapping',
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
	$('.primary-bg-lt').removeClass('primary-bg-lt');
	  $(ele).addClass('primary-bg-lt');
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
		              url: 'find_wrappers',
		              data: {mapping: matchvalue},
		              type: 'get'
		          }).done(function(responseData) {
		        	  $("#preloader").hide();
		        	  $('#repos11').empty();
		        	  $("#table-hide").show();
		        	  $('<div />',{id:'divRepo11', class:'table-responsive'}).appendTo('#repos11');
				  		$('<table class="table table-striped table-bordered xs-width-500px sm-width-1000"><thead>'+
				  				'<tr>'+
				  				'<th class="">DATABASE</th>'+
				  				'<th class="">STATUS</th>'+
				  				'<th class="">FILE NAME</th>'+
				  				'<th class="text-center">ACTION</th>'+
				  				'</tr></thead>'+
		  				        '<tbody id="tbody">'+
		  				 '</tbody></table>').appendTo('#divRepo11');	
				  	$.each(responseData, function(i, obj) {
				  		$("#table-hide").show();
				  		$('<tr id="divRepo11'+i+'">'+
			  					'<td>'+obj.dbName+'</td>'+
			  					'<td>'+(obj.dbEnabled?'<span class="badge badge-success">Active</span>':'<span class="badge badge-danger">Inactive</span>')+'</td>'+
			  					'<td>'+obj.fileName+'</td>'+
			  					"<td class='text-center'><button type='button' id="+i+'---'+obj.fileName+'---'+obj.dbid+" class='btn btn-sm btn-alt-danger' onclick='deletePrivilege(this)'><span class='fa fa-trash'></span></button></td>"+
			  					'</tr>').appendTo('#tbody');
				  		});
				  	checkTable();
				  	
		          }).fail(function() {
		        	  $("#preloader").hide();
		              console.log('Failed');
		          }); 
		          
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
		          });  
		    	  
		    	  $.ajax({         
		              url: 'fileListForRepoForWrapperConfig',
		              data: {mapName:matchvalue},
		              type: 'get'
		          }).done(function(responseData) {
		        	  $("#preloader").hide();
		  	      $.each(responseData, function(i, obj) {
		  	  	$('<option value="'+obj+'">'+$.trim(obj)+'</option>').appendTo($('#FileSearch')) 
		  	    	});
		          }).fail(function() {
		        	  $("#preloader").hide();
		        		});
		    
		  $('#hideAndShow').css("display","");
		  $('#userChooseDiv').css("display","none");
		  $('#continueBtn').css("display","none");
		  $("#mappingSearch").attr("readonly", "true");  
	    	  }
	      else
		  {
	    	  checkTable();
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
		  $("#preloader").hide();
	  $('#userChooseDiv').css("display","");
	  $('#hideAndShow').css("display","none");
	  }
  }
  
  function showAnswer(ele) {
	  $('.primary-bg-rt').removeClass('primary-bg-rt');
	  $(ele).addClass('primary-bg-rt');
		var valueis=$(ele).val();
	$('#selectedDb').val(valueis);
	    
	}
  
  function submit()
  { 
	  
	  var file=$("#FileSearch").val();
	  var targetName=$("#mappingSearch").val();
	  var dbName=$("#selectedDb").val();
	  if (((file.length != 0)||(file!= "")) && ((targetName.length != 0)||(targetName!= ""))&&((dbName.length != 0)||(dbName!= "")))
		  {
		  $("#preloader").show();
      $.ajax({         
          url: 'save_wrapper',
          data: {file: file,targetName :targetName,dbName :dbName},
          type: 'get'
      }).done(function(responseData) {
      if(responseData=='success')
    	  {
    	  $("#table-hide").show();
          $.ajax({         
              url: 'find_wrappers',
              data: {mapping: targetName},
              type: 'get'
          }).done(function(responseData) {
        	  $('#repos11').empty();
        	  $("#preloader").hide();
        	  $('<div />',{id:'divRepo11', class:'table-responsive'}).appendTo('#repos11');
		  		$('<table class="table table-striped table-bordered xs-width-500px sm-width-1000"><thead>'+
		  				'<tr>'+
		  				'<th >DATABASE</th>'+
		  				'<th >STATUS</th>'+
		  				'<th >FILE NAME</th>'+
		  				'<th class="text-center">ACTION</th>'+
		  				'</tr></thead>'+
				        '<tbody id="tbody">'+
				 '</tbody></table>').appendTo('#divRepo11');	
		  	$.each(responseData, function(i, obj) {
		  		
		  		$('<tr id="divRepo11'+i+'">'+
	  					'<td>'+obj.dbName+'</td>'+
	  					'<td>'+(obj.dbEnabled?'<span class="badge badge-success">Active</span>':'<span class="badge badge-danger">Inactive</span>')+'</td>'+
	  					'<td>'+obj.fileName+'</td>'+
	  					"<td class='text-center'><button type='button' id="+i+'---'+obj.fileName+'---'+obj.dbid+" class='btn btn-sm btn-alt-danger' onclick='deletePrivilege(this)'><span class='fa fa-trash'></span></button></td>"+
	  					'</tr>').appendTo('#tbody');
		  		});
        	  
	  $("#targetSearch").val("");
	  $("#dbSearch").val("");
	  $("#table-hide").show();
          }).fail(function() {
              console.log('Failed');
              $("#preloader").hide();
          }); 
    	  }
      else if(responseData=='error')
    	  {
    	  $("#preloader").hide();
    	  $("#ferror").css("display","");
    	  }
      }).fail(function() {
    	  $("#preloader").hide();
      });
  }
	  else
		{
			  if (file.trim().length == 0||file.trim()== "") 
				  $("#file-small").show();
			  if(dbName.trim().length == 0||dbName.trim()== "")
			 	 $("#db-small").show();
		}
  }
  
  $("#FileSearch").focus(function(){
		 $('#ferror').css("display","none");
	});
  
  function deletePrivilege(ele) {
	  $('#textForDialog').text('Are you sure you want to delete this wrapper?'); 
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
	    	           		 var targetName=$("#mappingSearch").val();
	    	           		 var arr = value.split('---');
	    	           		 var did=$.trim(arr[2]);
	    	           		 var file=arr[1];
	    	                    var index=arr[0];
	    	                    
	    	           		 $.ajax({         
	    	           	          url: 'delete_wrapper',
	    	           	          data: {file: file,did :did,target :targetName},
	    	           	          type: 'get'
	    	           	      }).done(function(responseData) {
	    	           	    	  $("#preloader").hide();
	    	           	    	  var arr = responseData.split('-');
	    	           	    	  var status=arr[0];
	    	           	    	  if(status=='success')
	    	           	    		  {
	    	           	    		   $("#divRepo11"+index).remove();
	    	           	    		   checkTable();
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
</c:choose>
