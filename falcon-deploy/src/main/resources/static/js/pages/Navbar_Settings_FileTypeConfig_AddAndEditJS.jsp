

 <script>
 var ret=false;
 function checkform(form){  
	 $("#preloader").show();
	    var fileTypeName=$('#en').val();
		 $.ajax({ 
	         url: 'checkDuplicateFileType',
	         data: {fileTypeName: fileTypeName},
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