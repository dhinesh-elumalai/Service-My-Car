

 <script>
 var ret=false;
 function checkform(form){  
	 $("#preloader").show();
	    var en=$('#en').val();
		 $.ajax({ 
	         url: 'check_for_duplicate_environment',
	         data: {en: en},
	         type: 'get',
	         async: false,
	         cache: false,
	         dataType:'text'
	     }).done(function(responseData) {
	    	 $("#preloader").hide();
	    	 if(responseData=='present')
	    		 {
	    		 $('#fltnError').css("display","block");
	    		 ret= false;
	    		 }
	    	 else
	    		 ret= true;
	    	 
	     }).fail(function() {
	         console.log('Failed');
	         $("#preloader").hide();
	     });
return ret;
 }
 $("#en").focus(function(){
	 $('#fltnError').css("display","none");
}); 
	</script>