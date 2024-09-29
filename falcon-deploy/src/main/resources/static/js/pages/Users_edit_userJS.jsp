 <script type="text/javascript">
   var d=document.getElementById('updatedTimestamp123').value;
   if(d==null||d=="")
   	{
   	document.getElementById('updatedTimestamp').value="";
   	}
   </script>      
 
    
<sec:authorize access="hasAnyAuthority('SUPER_ADMIN','ADMIN')">
<script>
document.getElementById('team--role').addEventListener('change', function () {
	
						var val = $(this).val();
						if (val == "ADMIN"  || val=="SUPER_ADMIN") 
							document.getElementById('privileges').style.display = 'none';							
						else 
							document.getElementById('privileges').style.display = '';
						
					});
var s=document.getElementById('team--role');
var si=s.options[s.selectedIndex].value;
if(si=="ADMIN" || si=="SUPER_ADMIN")
document.getElementById('privileges').style.display = 'none';
</script>
</sec:authorize>




  <sec:authorize access="hasAnyAuthority('ADMIN','SUPER_ADMIN')">
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
	        var uemail=$('#emailForUser').val();
	        if( !matchvalue == ""&&matchvalue.length>1)
	        	{
	        	$('#SearchUser').addClass('loadinggif');
	        $.ajax({ 
	            url: 'search_all_teams_except_userpresent_for_user',
	            data: {name: matchvalue,uemail : uemail},
	            type: 'get'
	        }).done(function(responseData) {
	        	var empty=responseData.length;
	        	$('#repos').empty();
	        	if(empty=='0') {
	         		$('#repos').addClass('no-team-border');
	        		 $('<label />', {class:'small pl-15',  text: 'Team "' +matchvalue+ '" is not found.'}).appendTo($('#repos'));
	        		 $('#SearchUser').removeClass('loadinggif');
	            }
	        	else
	        		{
	        	$.each(responseData, function(i, obj) {
	        		$('<div  />',{id:'divdb0'+i}).appendTo('#repos');
	        		 $('<input />', {  class:'unstyled-button',type: 'button',id: 'cbdb0_'+i, value: obj.teamName,onclick :"showAnswer(this)"}).appendTo($('#divdb0'+i));

	        		});
	        	 $('#SearchUser').removeClass('loadinggif');
	        		} }).fail(function() {
	            console.log('Failed');
	        });
	    }
	        else
	        	{
	        	$('#repoCard').css("display","none");
	        	$('#repos').children('label').remove();
	        	$('#repos').children('input').remove();
	        	}
	        });
	});
  
  function showAnswer(ele) {
		var valueis=$(ele).val();
		if(!$("#A"+valueis).length) {
	     $( " <div class='input-group' id=A"+valueis+"> <span class='input-group-addon' ><button type='button' id=B"+valueis+" class=' btn-outline-primary btn-none' onclick='CloseFunction(this)'><i class='si si-close'></i></button></span><input class='form-control' name='selectedTeams' type='hidden' value='"+valueis+"'  readonly><label class='form-control'>"+valueis+"</label></div>").appendTo($('#cardStart'));
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
	        var uemail=$('#emailForUser').val();
	        if( !matchvalue == ""&&matchvalue.length>1)
	        	{
	        	$('#SearchUser1').addClass('loadinggif');
	        $.ajax({ 
	            url: 'search_all_repo_ecept_user_present',
	            data: {name: matchvalue,uemail : uemail},
	            type: 'get'
	        }).done(function(responseData) {

	        	//console.log("output :",responseData);
	        	var isSafari = /Safari/.test(navigator.userAgent) && /Apple Computer/.test(navigator.vendor);
	        	var empty=responseData.length;
	        	$('#repos1').children('label').remove();
	        	$('#repos1').children('input').remove();
	        	$('#repos1').children('div').remove();
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

	        		 if (isSafari) {
		        		 $('#divdb'+i).addClass('mac');
		        	 }

	        		});
	        	$.each(responseData, function(i, obj) {
	        		 $('<input />', { type: 'checkbox',id: 'cbd_'+i, value: obj.repoName+"-ro",'class':'mr-sm-1 size-cb',onchange :"showAnswer1(this)"}).appendTo($('#divdb'+i));
	        		 $('<label />', { id:'label'+i,'for': 'cbd_'+i, text:  obj.repoName+" (READ ONLY)",'class':'mr-sm-2'}).appendTo($('#divdb'+i));   	        			

	        		});
	        	 $('#SearchUser1').removeClass('loadinggif');
	        	 
	        	
	        		} 
	        	
	        	
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
	    	$('#repoCard2').css("display","block");
	        var matchvalue = $("#SearchUser2").val(); 
	        var uemail=$('#emailForUser').val();
	        if( !matchvalue == ""&&matchvalue.length>1)
	        	{
	        	$('#SearchUser2').addClass('loadinggif');
	        $.ajax({ 
	            url: 'search_role_execpt_user_present',
	            data: {name: matchvalue,uemail : uemail},
	            type: 'get'
	        }).done(function(responseData) {
	        	var empty=responseData.length;
	        	$('#repos2').children('label').remove();
	        	$('#repos2').children('input').remove();
	        	$('#repos2').children('div').remove();
	        	if(empty=='0') {
	        		$('#repos2').addClass('no-team-border');
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
	        	$('#repos2').children('label').remove();
	        	$('#repos2').children('input').remove();
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
function DeleteTeam(team)
{
	$("#overlay").css("display","block");
	var teamName=$(team).val();
	var uemail=$('#emailForUser').val();

    $.ajax({ 
        url: 'delete_team_by_email_in_user',
        data: {teamName: teamName,user : uemail},
        type: 'get'
    }).done(function(responseData) {
    	if(responseData=='success')
    		{
    		 var x=team.id;
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

function DeleteRepo(Repo)
{
	$("#overlay").css("display","block");
	var repoName=$(Repo).val();
	var uemail=$('#emailForUser').val();

    $.ajax({ 
        url: 'delete_Repo_by_email_in_user',
        data: {repoName: repoName,uemail : uemail},
        type: 'get'
    }).done(function(responseData) {
    	if(responseData=='success')
    		{
    		 var x=Repo.id;
    	 	 var arr = x.split('BBBBB');
    	 		var value = arr[1]; 
    	 		$('#AAAAA'+value).remove();
    	 		 $("#overlay").css("display","none");
    		}  
    	   else
    			 $("#overlay").css("display","none");
    		 }).fail(function() {
    			 $("#overlay").css("display","none");
        console.log('Failed');
    });
}

function DeleteRole(Role)
{
	$("#overlay").css("display","block");
	var roleName=$(Role).val();
	var uemail=$('#emailForUser').val();

    $.ajax({ 
        url: 'delete_Role_by_email_in_user',
        data: {roleName: roleName,uemail: uemail},
        type: 'get'
    }).done(function(responseData) {
    	if(responseData=='success')
    		{
    		 var x=Role.id;
    	 	 var arr = x.split('BBBBBB');
    	 		var value = arr[1]; 
    	 		$('#AAAAAA'+value).remove();
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
 
 
  <script type="text/javascript">
    
          $(function () {
        	    $('#DeleteUserDialog').on("click", function (e) {
        	        var link = this;
        	        $('#textForDialog').text('Are you sure you want to delete this User?'); 
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
          </script> 
          
<sec:authorize access="hasAnyAuthority('TEAM_ADMIN')">
<script>

function DeleteTeam(team)
{
	$("#overlay").css("display","block");
	var teamName=$(team).val();
	var uemail=$('#emailForUser').val();

    $.ajax({ 
        url: 'delete_team_by_email_in_user',
        data: {teamName: teamName,user : uemail},
        type: 'get'
    }).done(function(responseData) {
    	if(responseData=='success')
    		{
    		 var x=team.id;
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
	        var uemail=$('#emailForUser').val();
	        if( !matchvalue == ""&&matchvalue.length>1)
	        	{
	        	$('#SearchUser').addClass('loadinggif');
	        $.ajax({ 
	            url: 'search_all_teams_except_userpresent_for_user_with_TA',
	            data: {name: matchvalue,uemail : uemail},
	            type: 'get'
	        }).done(function(responseData) {
	        	var empty=responseData.length;
	        	$('#repos').children('label').remove();
	        	$('#repos').children('input').remove();
	        	$('#repos').children('div').remove();
	        	if(empty=='0') {
	        		 $('<label />', {class:'small pl-15',  text: 'No Team is Available with name '+matchvalue}).appendTo($('#repos'));
	        		 $('#SearchUser').removeClass('loadinggif');
	            }
	        	else
	        		{
	        	$.each(responseData, function(i, obj) {

	        		$('<div  />',{id:'divdb0'+i}).appendTo('#repos');
	        		 $('<input />', {  class:'unstyled-button',type: 'button',id: 'cbdb0_'+i, value: obj.teamName,onclick :"showAnswer(this)"}).appendTo($('#divdb0'+i));
	        	
	        		});
	        	 $('#SearchUser').removeClass('loadinggif');
	        		} }).fail(function() {
	            console.log('Failed');
	        });
	    }
	        else
	        	{
	        	$('#repoCard').css("display","none");
	        	$('#repos').children('label').remove();
	        	$('#repos').children('input').remove();
	        	}
	        });
	});
  
  function showAnswer(ele) {
		var valueis=$(ele).val();
	
		if(!$("#A"+valueis).length) {
	     $( " <div class='input-group' id=A"+valueis+"> <span class='input-group-addon' ><button type='button' id=B"+valueis+" class=' btn-outline-primary btn-none' onclick='CloseFunction(this)'><i class='si si-close'></i></button></span><input class='form-control' name='selectedTeams' type='hidden' value='"+valueis+"'  readonly><label class='form-control'>"+valueis+"</label></div>").appendTo($('#cardStart'));
	    }
	    
	}
</script>
</sec:authorize>