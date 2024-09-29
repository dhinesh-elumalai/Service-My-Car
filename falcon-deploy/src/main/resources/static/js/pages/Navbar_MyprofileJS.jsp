<script>
 function showFields()
 {
document.getElementById('cpassbtn').style.display='none';
$("#appendData").append('<div class="form-group row" id="cp" > <label class="col-md-3 control-label text-right" for="cpass"><b>Current password:</b></label><div class="col-md-7 pl-0 pr-0"> <input id="cpass" onblur="checkPass()" onfocus="removeErr()" type="password" placeholder="Enter current password" class="form-control" autocomplete="off" required> <span class="fa fa-eye eye1 mr-15 color-primary" onmousedown="mouseDownc()" onmouseup="mouseUpc()"></span> <small id="tnError" style="color: red; display: none;">Incorrect password</small></div></div><div class="form-group row" id="np" > <label class="col-md-3 control-label text-right" for="npass"><b>New Password:</b></label><div class="col-md-7 pl-0 pr-0"> <input id="npass" name="newPassword" type="password" placeholder="Enter new password" class="form-control" autocomplete="off" required> <span class="fa fa-eye eye1 mr-15 color-primary" onmousedown="mouseDownn()" onmouseup="mouseUpn()"></span></div></div><div class="form-group row" id="rnp" > <label class="col-md-3 control-label text-right" for="rnpass"><b>Re-enter New Password:</b></label><div class="col-md-7 pl-0 pr-0"> <input id="rnpass" type="password" placeholder="Re-enter new password" class="form-control" autocomplete="off" name="conformPassword"> <span class="fa fa-eye eye1 mr-15 color-primary" onmousedown="mouseDownrn()" onmouseup="mouseUprn()"></span></div></div>');
$('#profile-edit').formValidation('addField', $("#npass"));
$('#profile-edit').formValidation('addField', $("#rnpass"));
 }
 function uploadingcheckpass()
 {
	 if($("#cp").length == 0) {
		 return true;
		}
	 else
		 {
	 var typedValue=$("#cpass").val();
    var returnValue=false;
		 $.ajax({ 
	         url: 'check_for_pass_match',
	         data: {name: typedValue,'${_csrf.parameterName}':'${_csrf.token}'},
	         type: 'post',
	         async: false,
	     }).done(function(responseData) {

	    	 if(responseData=='present')
	    	  {	returnValue=true; $("#updateSubmitBtn").removeAttr("disabled");}
	    	 if(responseData=='notpresent')
	    		 {
	    		 $('#tnError').css("display","block");
	    		 returnValue=false;
	    		 }
	    	 
	     }).fail(function() {
	    	 $("#preloader").hide();
	         console.log('Failed');
	     });
		 return returnValue;
		 }
    };
    $("#npass").focus(function(){
   	 $('#npass').css("border","");
   	$('#rnpass').css("border","");
    document.getElementById('npmismatch').style.display='none';
   });
    $("#rnpass").focus(function(){
   	 $('#npass').css("border","");
   	 $('#rnpass').css("border","");
     document.getElementById('npmismatch').style.display='none';
   });

</script>
<script>
function mouseDownc() {
    document.getElementById("cpass").type = 'text';
}

function mouseUpc() {
    document.getElementById("cpass").type = 'password';
}
function mouseDownn() {
    document.getElementById("npass").type = 'text';
}

function mouseUpn() {
    document.getElementById("npass").type = 'password';
}
function mouseDownrn() {
    document.getElementById("rnpass").type = 'text';
}

function mouseUprn() {
    document.getElementById("rnpass").type = 'password';
}
</script>
<script>
function checkPass(){
	var typedValue=$("#cpass").val();
	 $.ajax({ 
         url: 'check_for_pass_match',
         data: {name: typedValue,'${_csrf.parameterName}':'${_csrf.token}'},
         type: 'post'
     }).done(function(responseData) {
    	 if(responseData=='notpresent')
    		 $('#tnError').css("display","block");
    	 if(responseData=='present')
   	  	{$('#tnError').css("display","none"); $("#updateSubmitBtn").removeAttr("disabled");$("#updateSubmitBtn").removeClass('disabled');} 
     }).fail(function() {
         console.log('Failed');
     });
}
function removeErr(){
	 $('#tnError').css("display","none");
}
</script>