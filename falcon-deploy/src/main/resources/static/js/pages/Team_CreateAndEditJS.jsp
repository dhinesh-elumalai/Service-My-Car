<c:choose>
<c:when test="${MODE=='EDIT'}">
<sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN','TEAM_ADMIN')">
 <script>
  $(function () {
	    $('.DeleteTeamDialog').on("click", function (e) {
	        var link = this;
	        $('#textForDialog').text('Are you sure you want to remove this team?'); 

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
  
  function CloseFunction1(del)
  {
 	 var x=del.id;
 	 var arr = x.split('B1');
 		var value = arr[1]; 
 		$('#A1'+value).remove();
  }
  $(document).ready(function(){
	    $("#SearchUser1").on('keyup', function postinput(){	
	    	var teamname=$('#teamnameip').val();
	    	$('#repoCard1').css("display","block");
	        var matchvalue = $("#SearchUser1").val(); 
	        if( !matchvalue == ""&&matchvalue.length>1)
	        	{
	        	$('#SearchUser1').addClass('loadinggif');
	        $.ajax({ 
	            url: 'search_all_repo_Except_repo_present_in_team',
	            data: {name: matchvalue,teamName : teamname},
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
	        		 $('<input/>', { type: 'checkbox',id: 'cbdb_'+i, value: obj.repoName+"-rw",'class':'mr-sm-1 size-cb',onchange :"showAnswer1(this)"}).appendTo($('#divdb'+i));
	        		 $('<label/>', { id:'label'+i,'for': 'cbdb_'+i, text:  obj.repoName+" (READ & WRITE)",'class':'mr-sm-4'}).appendTo($('#divdb'+i));   
	        		
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
	    	var teamname=$('#teamnameip').val();
	    	$('#repoCard2').css("display","block");
	        var matchvalue = $("#SearchUser2").val(); 
	        if( !matchvalue == ""&&matchvalue.length>1)
	        	{
	        	$('#SearchUser2').addClass('loadinggif');
	        $.ajax({ 
	            url: 'search_role_Except_already_selected_role_forThisTeam',
	            data: {name: matchvalue,teamName : teamname},
	            type: 'get'
	        }).done(function(responseData) {
	        	var empty=responseData.length;
	        	$('#repos2').empty();
	        	if(empty=='0') {
	        		 $('<label />', {class:'small pl-15',  text: 'Role "' +matchvalue+ '" is not found.'}).appendTo($('#repos2'));
	        		 $('#SearchUser2').removeClass('loadinggif');
	            }
	        	else
	        		{
	        	$.each(responseData, function(i, obj) {
	        		$('<div />',{id:'divdb2'+i}).appendTo('#repos2');
	        		 $('<input />', { class:'unstyled-button',type: 'button',id: 'cbdb2_'+i, value: obj,onclick :"showAnswer2(this)"}).appendTo($('#divdb2'+i));	   
	        	});
	        	 $('#SearchUser2').removeClass('loadinggif');
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
	
		if(!$("#A2"+valueis).length) {
	     $( " <div class='input-group' id=A2"+valueis+"> <span class='input-group-addon' ><button type='button' id=B2"+valueis+" class=' btn-outline-primary btn-none' onclick='CloseFunction2(this)'><i class='si si-close'></i></button></span><input class='form-control' name='selectedRoles' type='hidden' value='"+valueis+"'  readonly><label class='form-control'>"+valueis+"</label></div>").appendTo($('#cardStart2'));
	    }
	    
	}
</script>

<script>
function DeleteUser(email)
{
	$("#overlay").css("display","block");
	var emailId=$(email).val();
	var teamname=$('#teamnameip').val();

    $.ajax({ 
        url: 'delete_user_by_email_in_team',
        data: {name: emailId,teamName:teamname},
        type: 'get'
    }).done(function(responseData) {
    	if(responseData=='success')
    		{
    		 var x=email.id;
    	 	 var arr = x.split('BB');
    	 		var value = arr[1]; 
    	 		$('#AA'+value).remove();
    	 		 $("#overlay").css("display","none");
    		} 
    	 else
			 $("#overlay").css("display","none");	
    		 }).fail(function() {
        console.log('Failed');$("#overlay").css("display","none");
    });
}
function DeleteRepo(repo)
{
	$("#overlay").css("display","block");
	var repoName=$(repo).val();
	var teamname=$('#teamnameip').val();
	 $.ajax({ 
	        url: 'delete_repo_by_reponame_in_team',
	        data: {name: repoName,teamName:teamname},
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
	        console.log('Failed');$("#overlay").css("display","none");
	    });
	}
	
	function DeleteRole(role)
	{
		$("#overlay").css("display","block");
		var roleName=$(role).val();
		var teamname=$('#teamnameip').val();
		 $.ajax({ 
		        url: 'delete_role_by_rolename_in_team',
		        data: {name: roleName,teamName:teamname},
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
		        console.log('Failed');$("#overlay").css("display","none");
		    });
		}
		
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
	    	var teamname=$('#teamnameip').val();
	    
	    	$('#repoCard').css("display","block");
	        var matchvalue = $("#SearchUser").val(); 
	        if( !matchvalue == ""&&matchvalue.length>1)
	        	{
	        	$('#SearchUser').addClass('loadinggif');
	        $.ajax({ 
	            url: 'search_all_users_except_Selectedusers',
	            data: {name: matchvalue,teamName :teamname},
	            type: 'get'
	        }).done(function(responseData) {
	        	console.log("output :",responseData);
	        	var empty=responseData.length;
	        	$('#repos').empty();
	        	if(empty=='0') {
	        		 $('<label />', {class:'small pl-15',  text: 'User "' +matchvalue+ '" is not found.'}).appendTo($('#repos'));
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
			{
	     $( " <div class='input-group' id=A"+uid+"> <span class='input-group-addon' ><button type='button' id=B"+uid+" class=' btn-outline-primary btn-none' onclick='CloseFunction(this)'><i class='si si-close'></i></button></span><input class='form-control' name='selectedUsers' type='hidden' value='"+uid+"'  readonly><label class='form-control'>"+valueis+"</label></div>").appendTo($('#cardStart'));
	    }    
	}
</script>
</sec:authorize>
</c:when>




<c:when test="${MODE=='ADD' }">
<script>
$("#tn").blur(function(){
	var typedValue=$("#tn").val();
	 $.ajax({ 
         url: 'check_for_teamname_already_present',
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
	        if( !matchvalue == ""&&matchvalue.length>1)
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
	        		 $('<label />', {class:'small pl-15',  text: 'User "' +matchvalue+ '" is not found.'}).appendTo($('#repos'));
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
			{
	     $( " <div class='input-group' id=A"+uid+"> <span class='input-group-addon' ><button type='button' id=B"+uid+" class=' btn-outline-primary btn-none' onclick='CloseFunction(this)'><i class='si si-close'></i></button></span><input class='form-control' name='selectedUsers' type='hidden' value='"+uid+"'  readonly><label class='form-control'>"+valueis+"</label></div>").appendTo($('#cardStart'));
	    }   
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
	        		$('<div />',{id:'divdb'+i,class:'rw-paading'}).appendTo('#repos1');
	        		 $('<input />', { type: 'checkbox',id: 'cbdb_'+i, value: obj.repoName+"-rw",'class':'mr-sm-1 size-cb',onchange :"showAnswer1(this)"}).appendTo($('#divdb'+i));
	        		 $('<label />', { id:'label'+i,'for': 'cbdb_'+i, text:  obj.repoName+" (READ & WRITE)",'class':'mr-sm-4'}).appendTo($('#divdb'+i));   
	      
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
	    	$('#repoCard2').css("display","block");
	        var matchvalue = $("#SearchUser2").val(); 
	        if( !matchvalue == ""&&matchvalue.length>1)
	        	{
	        	$('#SearchUser2').addClass('loadinggif');
	        $.ajax({ 
	            url: 'search_role_To_TeamAndUserCreation',
	            data: {name: matchvalue},
	            type: 'get'
	        }).done(function(responseData) {
	        	var empty=responseData.length;
	        	$('#repos2').empty();
	        	if(empty=='0') {
	        		 $('<label />', {class:'small pl-15',  text: 'Role "' +matchvalue+ '" is not found.'}).appendTo($('#repos2'));
	        		 $('#SearchUser2').removeClass('loadinggif');
	            }
	        	else
	        		{
	        	$.each(responseData, function(i, obj) {
	        		$('<div />',{id:'divdb2'+i}).appendTo('#repos2');
	        		 $('<input />', {  class:'unstyled-button',type: 'button',id: 'cbdb2_'+i, value: obj,onclick :"showAnswer2(this)"}).appendTo($('#divdb2'+i));	   
	        	});
	        	 $('#SearchUser2').removeClass('loadinggif');
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
	
		if(!$("#A2"+valueis).length) {
	     $( " <div class='input-group' id=A2"+valueis+"> <span class='input-group-addon' ><button type='button' id=B2"+valueis+" class=' btn-outline-primary btn-none' onclick='CloseFunction2(this)'><i class='si si-close'></i></button></span><input class='form-control' name='selectedRoles' type='hidden' value='"+valueis+"'  readonly><label class='form-control'>"+valueis+"</label></div>").appendTo($('#cardStart2'));
	    }
	    
	}
</script>
</c:when>
</c:choose>
