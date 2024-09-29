
<c:choose>
<c:when test="${MODE=='Edit'}">
<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN','TEAM_ADMIN')">

 <script>
  $(function () {

	    $('.DeleteTeamDialog').on("click", function (e) {
	        var link = this;
	        $('#textForDialog').text('Are you sure you want to remove this role?'); 

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
  

  
  
  function CloseFunction(del)
  {
 	 var x=del.id;
 	 var arr = x.split('B');
 		var value = arr[1]; 
 		$('#A'+value).remove();
  }
  $(document).ready(function(){
	    $("#SearchUser").on('keyup', function postinput(){	
	    	var rolename=$('#rolenameip').val();
	    
	    	$('#repoCard').css("display","block");
	    	
	        var matchvalue = $("#SearchUser").val(); 
	        if( !matchvalue == ""&&matchvalue.length>2)
	        	{
	        	$('#SearchUser').addClass('loadinggif');
	        $.ajax({ 
	            url: 'search_all_users_except_Selectedusers_in_role',
	            data: {name: matchvalue,roleName :rolename},
	            type: 'get'
	        }).done(function(responseData) {
	        	var empty=responseData.length;
	        	$('#repos').empty();
	        	if(empty=='0') {
	        		$('#repos').addClass('no-team-border');
	        		 $('<label />', {class:'small pl-15', text: 'User "' +matchvalue+ '" is not found.'}).appendTo($('#repos'));
	        		 $('#SearchUser').removeClass('loadinggif');
	            }
	        	else
	        		{
	        	$.each(responseData, function(i, obj) {
	        		$('<div />',{id:'divdb0'+i}).appendTo('#repos');
	        		 $('<input />', { class:'unstyled-button',type: 'button',id:obj.id, value: obj.firstName+' '+obj.lastName+' - '+obj.email,onclick :"showAnswer(this)"}).appendTo($('#divdb0'+i));
	        		});
	        	 $('#SearchUser').removeClass('loadinggif');
	        		} }).fail(function() {
	            console.log('Failed');
	        });
	    }
	        else
	        	{
	        	$('#repoCard').css("display","none");
	        	$('#repos').children('label').remove();$('#repos').children('input').remove();
	        	}
	        });
	});
  
  function showAnswer(ele) {
		  var valueis=$(ele).val();
          var uid=ele.id;
          
		if(!$("#A"+uid).length)
	     $( "<div class='input-group' id='A"+uid+"'> <span class='input-group-addon' ><button type='button' id='B"+uid+"' class=' btn-outline-primary btn-none' onclick='CloseFunction(this)'><i class='si si-close'></i></button></span><input class='form-control' name='selectedUsers' type='hidden' value='"+uid+"'  readonly><label class='form-control'>"+valueis+"</label></div>").appendTo($('#cardStart'));
	  
	    
	}
  
  
  
  
  function CloseFunction1(del)
  {
 	 var x=del.id;
 	 var arr = x.split('B1');
 		var value = arr[1]; 
 		$('#A1'+value).remove();
  } 
  $(document).ready(function(){
	    $("#SearchUser1").on('keyup', function postinput(){	
	    	var rolename=$('#rolenameip').val();
	    	$('#repoCard1').css("display","block");
	        var matchvalue = $("#SearchUser1").val(); 
	        if( !matchvalue == ""&&matchvalue.length>1)
	        	{
	        	$('#SearchUser1').addClass('loadinggif');
	        $.ajax({ 
	            url: 'search_all_repo_Except_repo_present_in_role',
	            data: {name: matchvalue,roleName : rolename},
	            type: 'get'
	        }).done(function(responseData) {
	        	var empty=responseData.length;
	        	$('#repos1').empty();
	        	if(empty=='0') {	        		
	        		$('#repos1').addClass('no-team-border');
	        		 $('<label />', {class:'small pl-15',  text: 'Repository "' +matchvalue+ '" is not found.'}).appendTo($('#repos1'));
	        		 $('#SearchUser1').removeClass('loadinggif');
	            }
	        	else
	        		{
	        	$.each(responseData, function(i, obj) {
	        		$('<div />',{id:'divdb'+i, class:'rw-paading'}).appendTo('#repos1');
	        		 $('<input />', { type: 'checkbox',id: 'cbdb_'+i, value: obj.repoName+"-rw",'class':'mr-sm-1 size-cb',onchange :"showAnswer1(this)"}).appendTo($('#divdb'+i));
	        		 $('<label />', { id:'label'+i,'for': 'cbdb_'+i, text:  obj.repoName+" (READ & WRITE)",'class':'mr-sm-4'}).appendTo($('#divdb'+i));   

	        		});
	        	$.each(responseData, function(i, obj) {
	        		 $('<input />', { type: 'checkbox',id: 'cbd_'+i, value: obj.repoName+"-ro",'class':'mr-sm-1 size-cb',onchange :"showAnswer1(this)"}).appendTo($('#divdb'+i));
	        		 $('<label />', { id:'label'+i,'for': 'cbd_'+i, text:  obj.repoName+" (READ ONLY)",'class':'mr-sm-1 size-cb','class':'mr-sm-2'}).appendTo($('#divdb'+i));   	        			
	        		});
	   
	        		}  $('#SearchUser1').removeClass('loadinggif');
	        		}).fail(function() {
	            console.log('Failed');
	        });
	    }
	        else
	        	{
	        	$('#repoCard1').css("display","none");
	        	$('#repos1').children('label').remove();$('#repos1').children('input').remove();
	        	}
	        });
	});
  
  function showAnswer1(ele) {
		var valueis=$(ele).val();
		 var arr = valueis.split('-');
		 var id=ele.id;
		 var idArr=id.split('_');
		 var idf=idArr[0];
		 var idb=idArr[1];
		 var x="",y="";
		 if(arr[1]=='ro')
		 {
			 x="rw";
			 y=" (READ ONLY)";
		 }
		 else
			 {
			 x="ro";
			  y=" (READ & WRITE)";
			 }
		 if(!$("#A1"+valueis).length)
	    if(ele.checked) {
	     $( " <div class='input-group' id=A1"+valueis+"> <span class='input-group-addon' ><button type='button' id=B1"+valueis+" class=' btn-outline-primary btn-none' onclick='CloseFunction1(this)'><i class='si si-close'></i></button></span><input class='form-control' name='selectedRepos' type='hidden' value='"+valueis+"'  readonly><label class='form-control'>"+arr[0]+" "+y+"</label></div>").appendTo($('#cardStart1'));

	     $('#A1'+arr[0]+'-'+x).remove();
	     if(idf=='cbd')
	     { $('#cbdb_'+idb).prop('checked', false); }
	      else if(idf=='cbdb')
	      { $('#cbd_'+idb).prop('checked', false);}
	     }
	    
	}
</script>

<script>
  function CloseFunction2(del)
  {
 	 var x=del.id;
 	 var arr = x.split('B2');
 		var value = arr[1]; 
 		$('#A2'+value).remove();
  }
  $(document).ready(function(){
	    $("#SearchUser2").on('keyup', function postinput(){	
	    	var rolename=$('#rolenameip').val();
	    	$('#repoCard2').css("display","block");
	        var matchvalue = $("#SearchUser2").val(); 
	        if( !matchvalue == ""&&matchvalue.length>2)
	        	{
	        	$('#SearchUser2').addClass('loadinggif');
	        $.ajax({ 
	            url: 'search_team_Except_already_selected_role_forThisRole',
	            data: {name: matchvalue,roleName : rolename},
	            type: 'get'
	        }).done(function(responseData) {
	        	var empty=responseData.length;
	        	$('#repos2').empty();
	        	if(empty=='0') {
	        		$('#repos2').addClass('no-team-border');
	        		 $('<label />', {class:'small pl-15',  text: 'Role "' +matchvalue+ '" is not found.'}).appendTo($('#repos2'));
	        		 $('#SearchUser2').removeClass('loadinggif');
	            }
	        	else
	        		{
	        	$.each(responseData, function(i, obj) {
	        		$('<div />',{id:'divdb2'+i}).appendTo('#repos2');
	        		 $('<input />', { class:'unstyled-button',type: 'button',id: 'btn2_'+obj, value: obj,onclick :"showAnswer2(this)"}).appendTo($('#divdb2'+i));   
	        		 $('#SearchUser2').removeClass('loadinggif');
	        	});
	        		} }).fail(function() {
	            console.log('Failed');
	        });
	    }
	        else
	        	{
	        	$('#repoCard2').css("display","none");
	        	$('#repos2').children('label').remove();$('#repos2').children('input').remove();
	        	}
	        });
	});
  
  
  function showAnswer2(ele) {
		var valueis=$(ele).val();	
		if(!$("#A2"+valueis).length)
	     $( " <div class='input-group' id=A2"+valueis+"> <span class='input-group-addon' ><button type='button' id=B2"+valueis+" class=' btn-outline-primary btn-none' onclick='CloseFunction2(this)'><i class='si si-close'></i></button></span><input class='form-control' name='selectedTeams' type='hidden' value='"+valueis+"'  readonly><label class='form-control'>"+valueis+"</label></div>").appendTo($('#cardStart2'));	    
	}
  

</script>

<script>
function DeleteUser(email)
{
	$("#overlay").css("display","block");
	var emailId=$(email).val();
	var rolename=$('#rolenameip').val();
    $.ajax({ 
        url: 'delete_user_by_email_in_role',
        data: {name: emailId,roleName: rolename},
        type: 'get'
    }).done(function(responseData) {
    	if(responseData=='success')
    		{
    		 var x=email.id;
    	 	 var arr = x.split('BB');
    	 		var value = arr[1]; 
    	 		$('#AA'+value).remove();
    	 		 $("#overlay").css("display","none");
    		}    else
   			 $("#overlay").css("display","none");	
    		 }).fail(function() {
        console.log('Failed'); 
        $("#overlay").css("display","none");
    });

}

function DeleteRepo(repo)
{
	$("#overlay").css("display","block");
	var repoName=$(repo).val();
	var rolename=$('#rolenameip').val();

	 $.ajax({ 
	        url: 'delete_repo_by_reponame_in_role',
	        data: {name: repoName,roleName : rolename},
	        type: 'get'
	    }).done(function(responseData) {
	    	if(responseData=='success')
	    		{
	    		 var x=repo.id;
	    	 	 var arr = x.split('BBB');
	    	 		var value = arr[1]; 
	    	 		$('#AAA'+value).remove();
	    	 		 $("#overlay").css("display","none");
	    		}  
	    	else
	   			 $("#overlay").css("display","none");	
	    		 }).fail(function() {
	        console.log('Failed');
	        $("#overlay").css("display","none");
	    });

	}
	
	function DeleteTeam(role)
	{
		$("#overlay").css("display","block");
		var teamName=$(role).val();
		var rolename=$('#rolenameip').val();

		 $.ajax({ 
		        url: 'delete_team_by_teamname_in_role',
		        data: {name: teamName,roleName : rolename},
		        type: 'get'
		    }).done(function(responseData) {
		    	if(responseData=='success')
		    		{
		    		 var x=role.id;
		    	 	 var arr = x.split('BBBB');
		    	 		var value = arr[1]; 
		    	 		$('#AAAA'+value).remove();
		    	 		 $("#overlay").css("display","none");
		    		} 
		    	 else
					 $("#overlay").css("display","none");
		    		 }).fail(function() {
		        console.log('Failed');
		        $("#overlay").css("display","none");
		    });
		}
		
</script>



</sec:authorize>
</c:when>




<c:when test="${MODE== 'Add'}">
<script>
$("#tn").blur(function(){
	var typedValue=$("#tn").val();
	
	 $.ajax({ 
         url: 'check_for_rolename_already_present',
         data: {name: typedValue},
         type: 'get'
     }).done(function(responseData) {
    	 if(responseData=='present')
    		 $('#tnError').css("display","block");
    	 
     }).fail(function() {
         console.log('Failed');
     });
});
$("#tn").focus(function(){
	 $('#tnError').css("display","none");
});
</script>
 <script>
  function CloseFunction(del)
  {
 	 var x=del.id;
 	 var arr = x.split('B');
 		var value = arr[1]; 
 		$('#A'+value).remove();
  }
  
  
  $(document).ready(function(){
	    $("#SearchUser").on('keyup', function postinput(){	
	    	$('#repoCard').css("display","block");
	    	
	        var matchvalue = $("#SearchUser").val(); 
	        if( !matchvalue == ""&&matchvalue.length>2)
	        	{
	        	$('#SearchUser').addClass('loadinggif');
	        $.ajax({ 
	            url: 'search_all_users',
	            data: {name: matchvalue},
	            type: 'get'
	        }).done(function(responseData) {
	        	var empty=responseData.length;
	        	$('#repos').empty();
	        	if(empty=='0') {
	        		 $('#repos').addClass('no-team-border');
	        		 $('<label />', {class:'small pl-15',  text: 'User "' +matchvalue+ '" is not found.'}).appendTo($('#repos'));
	        		 $('#SearchUser').removeClass('loadinggif');
	            }
	        	else
	        		{
	        	$.each(responseData, function(i, obj) {
	        		$('<div />',{id:'divdb0'+i}).appendTo('#repos');
	        		 $('<input />', { class:'unstyled-button',type: 'button',id:obj.id, value: obj.firstName+' '+obj.lastName+' - '+obj.email,onclick :"showAnswer(this)"}).appendTo($('#divdb0'+i));  
	        		});
	        	}
	        }).fail(function() {
	            console.log('Failed');
	        });
	    }
	        else
	        	{
	        	$('#repoCard').css("display","none");
	        	$('#repos').children('label').remove();$('#repos').children('input').remove();
	        	}
	        });
	});
  
  function showAnswer(ele) {
		var valueis=$(ele).val();
		var uid=ele.id;
		
		if(!$("#A"+uid).length)
	     $( "<div class='input-group' id='A"+uid+"'> <span class='input-group-addon' ><button type='button' id='B"+uid+"' class=' btn-outline-primary btn-none' onclick='CloseFunction(this)'><i class='si si-close'></i></button></span><input class='form-control' name='selectedUsers' type='hidden' value='"+uid+"'  readonly><label class='form-control'>"+valueis+"</label></div>").appendTo($('#cardStart'));   
	}
</script>
 <script>
  function CloseFunction1(del)
  {
 	 var x=del.id;
 	 var arr = x.split('B1');
 		var value = arr[1]; 
 		$('#A1'+value).remove();
  }
  $(document).ready(function(){
	    $("#SearchUser1").on('keyup', function postinput(){	
	    	$('#repoCard1').css("display","block");
	        var matchvalue = $("#SearchUser1").val(); 
	        if( !matchvalue == ""&&matchvalue.length>1)
	        	{
	        	$('#SearchUser1').addClass('loadinggif');
	        $.ajax({ 
	            url: 'search_all_repo',
	            data: {name: matchvalue},
	            type: 'get'
	        }).done(function(responseData) {
	        	var empty=responseData.length;
	        	$('#repos1').empty();
	        	if(empty=='0') {
	        		 $('<label />', {class:'small pl-15',  text: 'Repository "' +matchvalue+ '" is not found.'}).appendTo($('#repos1'));
	        		 $('#SearchUser1').removeClass('loadinggif');
	            }
	        	else
	        		{
	        	$.each(responseData, function(i, obj) {
	        		$('<div />',{id:'divdb'+i, class:'rw-paading'}).appendTo('#repos1');
	        		 $('<input />', { type: 'checkbox',id: 'cbdb_'+i, value: obj.repoName+"-rw",'class':'mr-sm-1 size-cb',onchange :"showAnswer1(this)"}).appendTo($('#divdb'+i));
	        		 $('<label />', { id:'label'+i,'for': 'cbdb_'+i, text:   obj.repoName+" (READ & WRITE)",'class':'mr-sm-4'}).appendTo($('#divdb'+i));   

	        
	        		});
	        	$.each(responseData, function(i, obj) {
	        		 $('<input />', { type: 'checkbox',id: 'cbd_'+i, value: obj.repoName+"-ro",'class':'mr-sm-1 size-cb',onchange :"showAnswer1(this)"}).appendTo($('#divdb'+i));
	        		 $('<label />', { id:'label'+i,'for': 'cbd_'+i, text:  obj.repoName+" (READ ONLY)",'class':'mr-sm-2'}).appendTo($('#divdb'+i));   	        			
	        		});
	        	 $('#SearchUser1').removeClass('loadinggif');
	        		} }).fail(function() {
	            console.log('Failed');
	        });
	    }
	        else
	        	{
	        	$('#repoCard1').css("display","none");
	        	$('#repos1').children('label').remove();$('#repos1').children('input').remove();
	        	}
	        });
	});
  
  function showAnswer1(ele) {
		var valueis=$(ele).val();
		 var arr = valueis.split('-');
		 var id=ele.id;
		 var idArr=id.split('_');
		 var idf=idArr[0];
		 var idb=idArr[1];
		 var x="",y="";
		 if(arr[1]=='ro')
		 {
			 x="rw";
			 y=" (READ ONLY)";
		 }
		 else
			 {
			 x="ro";
			  y=" (READ & WRITE)";
			 }
		 if(!$("#A1"+valueis).length)
	    if(ele.checked) {
	     $( " <div class='input-group' id=A1"+valueis+"> <span class='input-group-addon' ><button type='button' id=B1"+valueis+" class=' btn-outline-primary  btn-none' onclick='CloseFunction1(this)'><i class='si si-close'></i></button></span><input class='form-control' name='selectedRepos' type='hidden' value='"+valueis+"'  readonly><label class='form-control'>"+arr[0]+" "+y+"</label></div>").appendTo($('#cardStart1'));

	     $('#A1'+arr[0]+'-'+x).remove();
	     if(idf=='cbd')
	     { $('#cbdb_'+idb).prop('checked', false); }
	      else if(idf=='cbdb')
	      { $('#cbd_'+idb).prop('checked', false);}
	     }
	    
	}
</script>
 <script>
  function CloseFunction2(del)
  {
 	 var x=del.id;
 	 var arr = x.split('B2');
 		var value = arr[1]; 
 		$('#A2'+value).remove();
  }
  $(document).ready(function(){
	    $("#SearchUser2").on('keyup', function postinput(){	
	    	$('#repoCard2').css("display","block");
	        var matchvalue = $("#SearchUser2").val(); 
	        if( !matchvalue == ""&&matchvalue.length>2)
	        	{
	        	$('#SearchUser2').addClass('loadinggif');
	        $.ajax({ 
	            url: 'search_all_teams',
	            data: {name: matchvalue},
	            type: 'get'
	        }).done(function(responseData) {
	        	var empty=responseData.length;
	        	$('#repos2').empty();
	        	console.log("t/f :",empty);
	        	if(empty=='0') {
	        		 $('<label />', {class:'small pl-15',  text: 'Team "' +matchvalue+ '" is not found.'}).appendTo($('#repos2'));
	        		 $('#SearchUser2').removeClass('loadinggif');
	            }
	        	else
	        		{
	        	$.each(responseData, function(i, obj) {
	        		$('<div  />',{id:'divdb2'+i}).appendTo('#repos2');
	        		 $('<input />', { class:'unstyled-button',type: 'button',id: 'btn2_'+obj.teamName, value: obj.teamName,onclick :"showAnswer2(this)"}).appendTo($('#divdb2'+i));
	        		});
	        	 $('#SearchUser2').removeClass('loadinggif');
	        		} }).fail(function() {
	            console.log('Failed');
	        });
	    }
	        else
	        	{
	        	$('#repoCard2').css("display","none");
	        	$('#repos2').children('label').remove();
	        	$('#repos2').children('input').remove();
	        	}
	        });
	});
  
  function showAnswer2(ele) {
		var valueis=$(ele).val();	
		if(!$("#A2"+valueis).length)
	     $( " <div class='input-group' id=A2"+valueis+"> <span class='input-group-addon' ><button type='button' id=B2"+valueis+" class=' btn-outline-primary btn-none' onclick='CloseFunction2(this)'><i class='si si-close'></i></button></span><input class='form-control' name='selectedTeams' type='hidden' value='"+valueis+"'  readonly><label class='form-control'>"+valueis+"</label></div>").appendTo($('#cardStart2'));	    
	}
  
</script>

</c:when>
</c:choose>
