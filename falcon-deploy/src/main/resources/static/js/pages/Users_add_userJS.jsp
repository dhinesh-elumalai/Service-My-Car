<script>
document.getElementById('team--role').addEventListener('change', function () {
    var val = $(this).val();
    if(val=="ADMIN" || val=="SUPER_ADMIN")
  		document.getElementById('privileges').style.display = 'none';
    else
    	document.getElementById('privileges').style.display = '';    	
    });
</script>

 <script>
 function emailverfify()
 {
	 var typedValue=$("#emailid").val();
	 $("#preloader").show();
	 $.ajax({ 
         url: 'check_for_userEmail_already_present',
         data: {name: typedValue},
         type: 'get'
     }).done(function(responseData) {
    	 $("#preloader").hide();
    	 if(responseData=='present')
    		 {
    		 $('#tnError').show();
    		 $('#userCreationSubmitButton').prop("disabled",true);
    		 }	
    	 else
    		 {
    		 $('#tnError').hide();
    		 $('#userCreationSubmitButton').prop("disabled",false);
    		 }
    	 
     }).fail(function() {
    	 $("#preloader").hide();
         console.log('Failed');
     });
 }
 

	
 $("#emailid").blur(function(){
	 emailverfify()
	});
 
$("#emailid").focus(function(){
		 $('#tnError').hide();
	});
	
  function CloseFunction(del)
  {
 	 var x=del.id;
 	 var arr = x.split('B');
 	 var value = arr[1]; 
 	 $('#A'+value).remove();
  }

  $("#SearchUser").blur(function(){
		var typedValue=$("#emailid").val();
});
	
  $(document).ready(function(){
	    $("#SearchUser").on('keyup', function postinput(){	
	    	$('#repoCard').css("display","block");
	        var matchvalue = $("#SearchUser").val(); 
	        if( !matchvalue == ""&&matchvalue.length>2)
	        	{
	        	$('#SearchUser').addClass('loadinggif');
	        $.ajax({ 
	            url: 'search_all_teams',
	            data: {name: matchvalue},
	            type: 'get'
	        }).done(function(responseData) {
	        	var empty=responseData.length;
	        	$('#repos').empty();
	        	if(empty=='0') {
	        		 $('<label />', {class:'small pl-15', text:'Team "' +matchvalue+ '" is not found.' }).appendTo($('#repos'));
	        		 $('#SearchUser').removeClass('loadinggif');
	            }
	        	else
	        		{
	        	$.each(responseData, function(i, obj) {
	        		$('<div  />',{id:'divdb0'+i}).appendTo('#repos');
	        		 $('<input />', { class:'unstyled-button  col-md-12 text-left',type: 'button',id: 'cbdb0_'+i, value: obj.teamName,onclick :"showAnswer(this)"}).appendTo($('#divdb0'+i));
	        		 $('#SearchUser').removeClass('loadinggif');	       
	        		});      

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
		if(!$("#A"+valueis).length){
	     $( " <div class='input-group' style='border-left:1px solid transparent	' id=A"+valueis+"> <span class='input-group-addon' ><button type='button' id=B"+valueis+" class=' btn-outline-primary btn-none' onclick='CloseFunction(this)'><i class='si si-close'></i></button></span><input class='form-control' style='border-left-color:#dedede' name='selectedTeams' type='hidden' value='"+valueis+"'  readonly><label class='form-control'>"+valueis+"</label></div>").appendTo($('#cardStart'));
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
	        		 $('<input />', { type: 'checkbox',class:'custom-control-input' ,id: 'cbdb_'+i, value: obj.repoName+"-rw",'class':'mr-sm-1 size-cb',onchange :"showAnswer1(this)"}).appendTo($('#divdb'+i));
	        		 $('<label />', { id:'label'+i,'for': 'cbdb_'+i, text:  obj.repoName+" (READ & WRITE)",'class':'mr-sm-4'}).appendTo($('#divdb'+i));   
	        		});
	        	$.each(responseData, function(i, obj) {
	        		 $('<input />', { type: 'checkbox',id: 'cbd_'+i, value: obj.repoName+"-ro",'class':'mr-sm-1 size-cb',onchange :"showAnswer1(this)"}).appendTo($('#divdb'+i));
	        		 $('<label />', { id:'label'+i,'for': 'cbd_'+i, text:  obj.repoName+" (READ ONLY)",'class':''}).appendTo($('#divdb'+i));   	        			 

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
	     $( " <div class='input-group' id=A1"+valueis+"> <span class='input-group-addon' ><button type='button' id=B1"+valueis+" class=' btn-outline-primary btn-none' onclick='CloseFunction1(this)'><i class='si si-close'></i></button></span><input name='selectedRepos' type='hidden' value='"+valueis+"'  readonly><label class='form-control'>"+arr[0]+" "+y+"</label></div>").appendTo($('#cardStart1'));

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
	        	 }
	        	}).fail(function() {
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
		if(!$("#A2"+valueis).length){ 
	     $( " <div class='input-group' style='border-left:1px solid transparent	' id=A2"+valueis+"> <span class='input-group-addon' ><button type='button' id=B2"+valueis+" class=' btn-outline-primary btn-none' onclick='CloseFunction2(this)'><i class='si si-close'></i></button></span><input class='form-control' name='selectedRoles' type='hidden' value='"+valueis+"'  readonly><label class='form-control'>"+valueis+"</label></div>").appendTo($('#cardStart2'));
	    }
	    
	}
</script>
