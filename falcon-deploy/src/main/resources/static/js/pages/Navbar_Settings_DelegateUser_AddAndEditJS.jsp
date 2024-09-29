<script>
	function checkTable(){
   		console.log($("table > tbody > tr").length);
	   if ($("table > tbody > tr").length == null || $("table > tbody > tr").length == 0){
	     $("#table-hide").hide();
	   }
	 };	
$('#selectBox').on('change', function() {
		 $("#db-small").hide();
		 DbUserAdd(); 
});
$('#selectBoxUser').on('change', function() {
	 $("#dbun-small").hide();
	 UsersAdd();
});
$('#userSearch').on('change', function() {
	 $("#user-small").hide();
});
</script>
  <script> 
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
		            url: 'searchMappingForDelegate',
		            data: {target: matchvalue},
		            type: 'get'
		        }).done(function(responseData) {
		        	  $("#preloader").hide();
		        	var empty=responseData.length;
		        	$('#repos1').children('label').remove();
		        	$('#repos1').children('input').remove();
		        	$('#repos1').children('div').remove();
		        	if(empty=='0') {
		        		 $('<label />', {class:"small",  text: 'Mapping "' +matchvalue+ '" is not found.'}).appendTo($('#repos1'));
		        		 $('#mappingSearch').removeClass('loadinggif');
		            }
		        	else
		        		{
			        	$.each(responseData, function(i, obj) {
			        		$('<div />',{id:'divdb0'+i}).appendTo('#repos1');
			        		 $('<input />', { class:'unstyled-button',type: 'button',id: 'btn0_'+obj.targetName, value: obj.targetName,onclick :"showAnswer(this)"}).appendTo($('#divdb0'+i));			    
			        		});
			        	$('#mappingSearch').removeClass('loadinggif');
		        		} }).fail(function() {
		        			  $("#preloader").hide();
		        });
		    }
		        else
		        	{
		        	$('#repoCard1').hide();
		        	$('#repos1').children('label').remove();$('#repos1').children('input').remove();
		        	}
		    }
		        });
    
    function showAnswer(obj){
    	var targetvalue=$(obj).val();
    	var but=$(obj).attr('id');
		 $('#mappingSearch').val(targetvalue);
     	$('#repoCard1').css("display","none");
    }
    function showAnswer1(obj){
    	var targetvalue=$(obj).val();
    	var but=$(obj).attr('id');
		 $('#userSearch').val(targetvalue);
     	$('#repoCard2').css("display","none");
		 $('#add').css("display","");
    }
function addDatabasePassword(){
		var targetvalue= $('#mappingSearch').val();
		var db= $('#selectBox').val();
		var username= $('#selectBoxUser').val();
		var user= $('#userSearch').val();

     if((targetvalue !=''||targetvalue.length!=0)&&(db!=''||db.length!=0)&&(username !=''||username.length!=0)&&(user !='' || user.length !=0))
     {
    	 $.ajax({         
           url: 'saveDelegatePasswordForUser',
           data: {db: username,email:user},
           type: 'get'
       }).done(function(responseData) {
       	if(responseData=='success') {    		
	        listDelegate();
	        DbUserAdd();
	        $('#finish').show();
       	}
       	 }).fail(function() {
       });
    }
     else
    	 {
    	 if(db.length==0)
    	 { $("#db-small").show(); }
         if(username.length==0)
         { $("#dbun-small").show();}
         if(user.length==0)	
         {	 $("#user-small").show();}
    	 }
}
    function checkThisEntry(){
		var targetvalue= $('#mappingSearch').val();
		  $("#preloader").show();
		    $.ajax({         
	            url: 'dbListForDelegate',
	            data: {target: targetvalue},
	            type: 'get'
	        }).done(function(responseData) {
	        	  $("#preloader").hide();
	        	var empty=responseData.length;
	        	$('#repos1').children('label').remove();
	        	$('#repos1').children('input').remove();
	        	$('#repos1').children('div').remove();
	        	
	        	if(empty=='0') {
	        		$('#userChooseDiv').show();
	            }
	        	else
	        		{
		        	$('#hideAndShow').show();
		        	 $('#mappingSearch').prop('readonly', true);
	        		$('#userChooseDiv').hide();
	        		listDelegate();
	        		  $('#selectBox').empty();
	        		  $('<option></option>').appendTo('#selectBox');
		        	$.each(responseData, function(i, obj) {
		        		$('<option value='+obj.id+'>'+obj.link+'</option>').appendTo('#selectBox');
		        		});
		        	$('#mappingSearch').removeClass('loadinggif');
		   		 $('#continueBtn').hide();
	        		} }).fail(function() {
	        			  $("#preloader").hide();
	        });
    }
    



    
    function listDelegate(){ 	
		var targetvalue= $('#mappingSearch').val();
		  $("#preloader").show();
    	  $.ajax({         
              url: 'listDelegatePasswordRest',
              data: {target: targetvalue},
              type: 'get'
          }).done(function(responseData) {
        	  $("#preloader").hide();
    	        	  $('#repos11').empty();
    	        	  $("#table-hide").show();
          		$('<div />',{id:'divRepo11', class:'table-responsive'}).appendTo('#repos11');
          		$('<table class="table table-striped table-bordered xs-width-1000 sm-width-1000"><thead>'+
    		  				'<tr>'+
    		  				'<th class="text-left">DATABASE (SAVED CREDENTIAL)</th>'+
    		  				'<th class="text-left">USERNAME</th>'+
    		  				'<th class="text-left">USER (GRANTEE)</th>'+
    		  				'<th class="text-center">ACTION</th>'+
    		  				'</tr></thead>'+
    				        '<tbody id="tbody">'+
    				 '</tbody></table>').appendTo('#divRepo11');	
    		  	$.each(responseData, function(i, obj) {
    		  		
    		  		$('<tr id="divRepo11'+i+'">'+
    		  				'<td>'+obj.dbName+'</td>'+
    	  					'<td>'+obj.userName+'</td>'+
    	  					'<td>'+obj.email+'</td>'+
    	  					"<td class='text-center'><button type='button' id="+obj.db+"-"+i+" class='btn btn-sm btn-alt-danger' onclick='deletePrivilege(this)'><span class='fa fa-trash'></span></button></td>"+
    	  					'</tr>').appendTo('#tbody');
    		  		});
    		  	checkTable();
    	        	$('#mappingSearch').removeClass('loadinggif');
    	   		 $('#continueBtn').hide();
          		 }).fail(function() {
          			  $("#preloader").hide();
          });
    }
    
 function UsersAdd(){	
    	var targetvalue=$('#mappingSearch').val();
      	var db = $('#selectBox').find(":selected").val();
      	var dbPassId = $('#selectBoxUser').find(":selected").val();
      	if((targetvalue !=''||targetvalue.length()!=0)&&(db!=''||db.length()!=0)&&(dbPassId !=''||dbPassId.length()!=0)){
        	$('#userSearch').empty();
        	  $('<option></option>').appendTo('#userSearch');
        	  $("#preloader").show();
        $.ajax({         
            url: 'listUserForDelegate',
            data: {name: targetvalue,id:db,dbPassId:dbPassId},
            type: 'get'
        }).done(function(responseData) {
        	  $("#preloader").hide();
	        	$.each(responseData, function(i, obj) {
	        		$('<option value='+obj.email+'>'+obj.fname+' '+obj.lname+' - '+obj.email+'</option>').appendTo('#userSearch');
	        		});
        }).fail(function() {
        	  $("#preloader").hide();
        });
      	}
    }
 
 function DbUserAdd(){
	  var val = $('#selectBox').val();
	  $('#selectBoxUser').empty();
	  $('#userSearch').empty();
	  $('<option></option>').appendTo('#selectBoxUser');
	  $('<option></option>').appendTo('#userSearch');
	var targetvalue=$('#mappingSearch').val();
	  $("#preloader").show();
    $.ajax({         
        url: 'listUserNameForDb',
        data: {name: targetvalue,id:val},
        type: 'get'
    }).done(function(responseData) {
    	  $("#preloader").hide();
        	$.each(responseData, function(i, obj) {
        		$('<option value='+obj.databasePasswordId+'>'+obj.userName+'</option>').appendTo('#selectBoxUser');
        		});
        	$('#mappingSearch').removeClass('loadinggif');
    		 }).fail(function()
    		{
    			  $("#preloader").hide();
    		}); 
 }
    
    
    function deletePrivilege(ele) {
    	 $('#textForDialog').text('Are you sure you want to delete this user delegation?'); 
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
		    	              	    var index =  arr[1];
		    	              	  $("#preloader").show();
		    	            		 $.ajax({         
		    	            	          url: 'deleteDelegateRest',
		    	            	          data: {delDb:value},
		    	            	          type: 'get'
		    	            	      }).done(function(responseData) {
		    	            	    	  $("#preloader").hide();
		    	            	    		   $("#divRepo11"+index).remove();
		    	            	    		   DbUserAdd();
		    	            	    		   checkTable();
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