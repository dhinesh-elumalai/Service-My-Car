<script>
	function checkTable(){
   		console.log($("table > tbody > tr").length);
	   if ($("table > tbody > tr").length == null || $("table > tbody > tr").length == 0){
	     $("#table-hide").hide();
	   }
	 };
	 $('#db').on('change', function() {
		 $("#db-small").hide();
	});
	 $('#username').keyup(function(){
		 $("#dbun-small").hide();
	});
	 $('#password').keyup(function(){
		 $("#dbpass-small").hide();
	});

</script>
<script>	
var ret=false;

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
		    	  $("#preloader").show();
		  		  $.ajax({         
		  	          url: 'databasePasswordList',
		  	          data: {name: matchvalue},
		  	          type: 'get'
		  	      }).done(function(responseData) {
			        	var empty=responseData.length;
		  	      if(empty!='0')
		  	    	  {
		  	    	 $("#preloader").hide();
		  		    	  $("#overlay").css("display","block");

		  		        	  $('#repos11').empty();
		  		        	  
		  		        	$('<div />',{id:'divRepo11', class:'table-responsive mt-50'}).appendTo('#repos11');
		  			  		$('<table class="table table-striped table-bordered xs-width-500px sm-width-1000"><thead>'+
		  			  				'<tr>'+
		  			  				'<th class="text-left">MAPPING</th>'+
		  			  				'<th class="text-left">DATABASE</th>'+
		  			  				'<th class="text-left">USERNAME</th>'+
		  			  				'<th class="text-center">ACTION</th>'+
		  			  				'</tr></thead>'+
		  	  				        '<tbody id="tbody">'+
		  	  				 '</tbody></table>').appendTo('#divRepo11');	
		  			  	$.each(responseData, function(i, obj) {
		  			  	$("#table-hide").show();
		  			  		$('<tr id="divRepo11'+i+'">'+
		  		  					'<td class="text-left">'+obj.targetName+'</td>'+
		  		  					'<td class="text-left">'+obj.dbName+'</td>'+
		  		  					'<td class="text-left">'+obj.userName+'</td>'+
		  		  					"<td class='text-center'><button type='button' id="+obj.db+"-"+obj.targetName+"-"+i+" class='btn btn-sm btn-outline-danger' onclick='deletePassword(this)'><span class='fa fa-trash'></span></button></td>"+
		  		  					'</tr>').appendTo('#tbody');
		  			  		}); 
		  	    	  }
		  	      else
		  		  {
		  	    	 $("#preloader").hide();
		  		  $('#userChooseDiv').css("display","");
		  		  $('#hideAndShow').css("display","none");
		  		  }

			    	  $.ajax({         
			              url: 'get_all_db_for_selected_Mapping',
			              data: {name:matchvalue},
			              type: 'get'
			          }).done(function(responseData) {
			        	   $("#preloader").hide();
			  	      $.each(responseData, function(i, obj) {
			  	  	  	$('<option value="'+obj.id +'">'+$.trim(obj.link)+'</option>').appendTo($('#db'))   	 
			  	    	});
			          }).fail(function() {
			        	  $("#preloader").hide();
			          }); 
			    
			  $('#hideAndShow').css("display","");
			  $('#userChooseDiv').css("display","none");
			  $('#continueBtn').css("display","none");
			  $("#mappingSearch").attr("readonly", "true"); 
		  		}).fail(function() {
		  			$("#preloader").hide();
		          });
		  	 
		    } 
		  	  else
		    {
		  	  $('#userChooseDiv').css("display","");
		  	  $('#hideAndShow').css("display","none");
		  	  }
		    	  
		      })
}
else
 $("#userChooseDiv").show();
 }
	    


	    $("#addPassword").on('click', function postinput(){	
	        var id = $('#db').val();
	        var uname = $('#username').val(); 
	        var upass = $('#password').val(); 
	        if(( uname != "" && uname.length>1)&&(id != "" && id.length>0) && (!upass == "" && upass.length>1)){
	        	$("#preloader").show();
	        $.ajax({ 
	            url: 'validate_db',
	            data: {id: id,uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
	            type: 'post'
	        }).done(function(responseData) { 
	
	           if(responseData=='Success'){
	  	    	  var userName=$("#username").val();
				  var targetName=$("#mappingSearch").val();
				  var password=$("#password").val();
				  var dbid = id;
				  $("#preloader").hide();
			  if (((userName.length != 0)||(userName!= "")) && ((targetName.length != 0)||(targetName!= ""))&&((password.length != 0)||(password!= "")))
				    	{
				  $("#preloader").show();
			      $.ajax({         
			          url: 'saveDelegate',
			          data: {userName: userName,targetName :targetName,db:dbid ,password:password},
			          type: 'get'
			      }).done(function(responseData) {
			      if(responseData=='success')
			    	  {
			    	  $('#status').text("Added successfully!");
		          	 $('#myModal').modal('show');
			           $.ajax({         
			              url: 'databasePasswordList',
			              data: {name: targetName},
			              type: 'get'
			          }).done(function(responseData) {
			        	  $("#preloader").hide();
			        	  $('#repos11').empty();
			        	  
			        	  $('<div />',{id:'divRepo11', class:'table-responsive mt-50'}).appendTo('#repos11');
		  			  		$('<table class="table table-striped table-bordered sm-width-1000"><thead>'+
		  			  				'<tr>'+
		  			  				'<th class="text-left">MAPPING</th>'+
	  			  					'<th class="text-left">DATABASE</th>'+
		  			  				'<th class="text-left">USERNAME</th>'+
		  			  				'<th class="text-center">ACTION</th>'+
		  			  				'</tr></thead>'+
		  	  				        '<tbody id="tbody">'+
		  	  				 '</tbody></table>').appendTo('#divRepo11');	
		  			  	$.each(responseData, function(i, obj) {	
		  			  	$("#table-hide").show();
		  			  		$('<tr id="divRepo11'+i+'">'+
		  		  					'<td class="text-left">'+obj.targetName+'</td>'+
		  		  					'<td class="text-left">'+obj.dbName+'</td>'+
		  		  					'<td class="text-left">'+obj.userName+'</td>'+
		  		  					"<td class='text-center'><button type='button' id="+obj.db+"-"+obj.targetName+"-"+i+" class='btn btn-sm btn-outline-danger' onclick='deletePassword(this)'><span class='fa fa-trash'></span></button></td>"+
		  		  					'</tr>').appendTo('#tbody');
		  			  		}); 
			          }).fail(function() {
			        	  $("#preloader").hide();
			              alert('Failed');
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
	            $('#status').text("There is some network issue please check your internet access");
		           $('#myModal').modal('show');
	        });
	        }
	        else
	        	{
	        	if(uname==""&&uname.length==0)
	        		$('#dbun-small').show();
	        	if(id==""&&id.length==0)
	        		$('#db-small').show();
	        	if(upass==""&&upass.length==0)
	        		$('#dbpass-small').show();
	        	
	        	}
	        
	    });
	    
	    
		    $("#validate").on('click', function postinput(){		
		        var id = $('#db').val();
		        var uname = $('#username').val(); 
		        var upass = $('#password').val(); 
		        if(( !uname == "" && uname.length>1) && (!upass == "" && upass.length>1)){
		        	 $("#preloader").show();
		        $.ajax({ 
		            url: 'validate_db',
		            data: {id: id,uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
		            type: 'post'
		        }).done(function(responseData) { 
		        	 $("#preloader").hide();
		           if(responseData=='Success'){
		     		  var userName=$("#username").val();
					  var targetName=$("#mappingSearch").val();
					  var password=$("#password").val();
						var oldusername = $("#oldusername").val();
					  var dbid = id;
				
				  if (((userName.length != 0)||(userName!= "")) && ((targetName.length != 0)||(targetName!= ""))&&((password.length != 0)||(password!= "")))
					{
					  $("#preloader").show();
				      $.ajax({         
				          url: 'updateDelegateRest',
				          data: {userName: userName,targetName :targetName,db:dbid ,password:password ,oldUserName:oldusername},
				          type: 'get'
				      }).done(function(responseData) {
				      if(responseData=='success')
				    	  {
				    $('#status').text("Succesfully updated!");
		           $('#myModal').modal('show');
				      }
				      $("#preloader").hide();
				      }).fail(function() {
				    	  $("#preloader").hide();
				      });
				  }	      
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
		            $('#status').text("There is some network issue please check your internet access");
			           $('#myModal').modal('show');
		        });
		        }
		        else
	        	{
	        	if(uname==""&&uname.length==0)
	        		$('#dbun-small').show();
	        	if(id==""&&id.length==0)
	        		$('#db-small').show();
	        	if(upass==""&&upass.length==0)
	        		$('#dbpass-small').show();
	        	
	        	}
		       
		    });
		    
		    
		    
		   var ret=false;
		    function checkform(form){  
		    	var id = $('#db').val(); 
		        var uname = $('#username').val(); 
		        var upass = $('#password').val(); 
		        if(( !uname == "" && uname.length>1) && (!upass == "" && upass.length>1)){
				   	 document.getElementById('overlaygivBrigtness').style.display='block';
				     $("#preloader").show();
		        $.ajax({ 
		            url: 'validate_db',
		            data: {id: id,uname:uname,upass:upass,'${_csrf.parameterName}':'${_csrf.token}'},
		            type: 'post',
			         async: false,
			         cache: false
		        }).done(function(responseData) {
		        	  $("#preloader").hide();
		        	if(responseData =='Success'){

		        		ret=true;
		        	}
		        	else{
		        		 $('#status').text(responseData);
				           $('#myModal').modal('show');
		        		ret=false
		        	}
		          }).fail(function() {
		        	  $("#preloader").hide();
		            console.log('Failed');
		            $('#status').text("There is some network issue please check your internet access");
			           $('#myModal').modal('show');
		        });
		        }
			   	 document.getElementById('overlaygivBrigtness').style.display='';

		   return ret;
		    }
	
		
		 
		    function deletePassword(ele) {
		    	 $('#textForDialog').text('Are you sure you want to delete this database credential?'); 
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
				    	                var del = $(ele).attr('id');
				    	  		    	  var arr = del.split('-');
				    	  		    	  var value = arr[0];
				    	  		    	  var target =  arr[1];
				    	  		 		 var index=arr[2];
				    	  		 		  $("#preloader").show();
				    	  				 $.ajax({         
				    	  			          url: 'deletePassword',
				    	  			          data: {dbpId:value,target :target},
				    	  			          type: 'get'
				    	  			      }).done(function(responseData) {
				    	  			    	  $("#preloader").hide();
				    	  			    	  var arr = responseData.split('-');
				    	  			    	  var status=arr[0];
				    	  			    	  var count=arr[1];
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
			   
		    function showAnswer234(ele) {
		   	 var value = $(ele).val();
		   		$('#mappingSearch').val(value);
		   		$('#repoCard1').css("display","none");
		   	};
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
	  
		    
		 
</script>