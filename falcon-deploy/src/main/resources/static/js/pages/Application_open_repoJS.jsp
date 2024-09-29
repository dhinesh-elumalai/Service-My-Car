
<script>
function goBack() {
    window.history.back();
}
</script>
<script>
function BranchSearch() {

  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("th")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
</script>

<script>
function TagSearch() {

  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput3");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable3");
  tr = table.getElementsByTagName("tr");

  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("th")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
</script>
<script>
function FileFolderSearch() {

  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput4");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable4");
  tr = table.getElementsByTagName("tr");

  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("th")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
</script>
<script>
function BranchListSearch() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput6");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable6");
  tr = table.getElementsByTagName("tr");

  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("th")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
</script>
<script>
function BranchForLog() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput7");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable7");
  tr = table.getElementsByTagName("tr");

  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("th")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
</script>

 <script>
 function uploading()
 {
	 document.getElementById('overlay').style.display='block';
     return true;
 } 
 function switchBranchAndPull(reponame){
	 $("#switchBTN").hide();
	  $.ajax({ 
	         url: '${pageContext.request.contextPath}/switchToHead',
	         data: {reponame:reponame,'${_csrf.parameterName}':'${_csrf.token}'},
	         type: 'post'
	     }).done(function(responseData){
	  	 	console.log(responseData);
	  	 		if(responseData=='success'){
	  	 			pullRepo(reponame)
	  	 		}else{
	  	 	   	 $("#CopydataDiv").show();
	  			 $("#Copydata").empty();
	  			$("#Copydata").append(responseData);
	  	 		}	 		
	  	 	}).fail(function() {
	  	   	    console.log('Failed');
	  	   	});	
 }
 function pullRepo(reponame){
	 console.log(reponame)
	 $('#myModal12').modal('show');
	 $("#Copydata").empty();
	  $("#prog").show();
	  $("#ICOprog").show();
	  $("#bug").hide();
	  $("#ICObug").hide();
	  $("#suc").hide();
	  $("#ICOsuc").hide();
	  $("#CopydataDiv").show();
	  $('#myModal12').modal('show');
	  $("#Copydata").append("Falcon Deploy is pulling contents from remote git repository.");
	  $.ajax({ 
         url: '${pageContext.request.contextPath}/pullRepo',
         data: {reponame:reponame,'${_csrf.parameterName}':'${_csrf.token}'},
         type: 'post'
     }).done(function(responseData)
  	 	{
       	 $("#CopydataDiv").show();
		 $("#Copydata").empty();
 	$.each(responseData, function(i, req) {	
 	if(req=='err-stop')
 	{
 	  $("#prog").hide();
   	  $("#ICOprog").hide();
   	  $("#suc").hide();
  	  $("#ICOsuc").hide();	
   	  $("#bug").show();
   	  $("#ICObug").show();
 	}
 	else if(req=='stop')
 	 {
 		$("#switchBTN").hide();
 		 $("#prog").hide();
      	  $("#ICOprog").hide();
 		  $("#bug").hide();
       	  $("#ICObug").hide();
 		 $("#suc").show();
     	  $("#ICOsuc").show();	
 	 }else if(req=='ref_not_exist'){
 		 $("#switchBTN").show();
 		  $("#prog").hide();
 	   	  $("#ICOprog").hide();
 	   	  $("#suc").hide();
 	  	  $("#ICOsuc").hide();	
 	   	  $("#bug").show();
 	   	  $("#ICObug").show();
 	 }
    else
 	 {
 	  $("#prog").show();
  	  $("#ICOprog").show();
  	  $("#bug").hide();
  	  $("#ICObug").hide();
  	  $("#suc").hide();
  	  $("#ICOsuc").hide();
 		 $("#Copydata").append(req+"<br>");
 	  }
 	}); 
   	}).fail(function() {
   	    console.log('Failed');
   	});	 
 }

</script>


<script>
$(function () {
    $('.DeleteFileDialog').on("click", function (e) {
        var link = this;
        $('#textForDialog').text('Are you sure you want to delete this file?'); 
          $('#deleteRepo').modal('hide');
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


$(function () {
    $('.DeleteFolderDialog').on("click", function (e) {
        var link = this;
        $('#textForDialog').text('Are you sure you want to delete this folder?'); 
$('#deleteRepo').modal('hide');
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
   
   
//on window resize run function
$(window).resize(function () {
    fluidDialog();
});
$(document).on("dialogopen", ".ui-dialog", function (event, ui) {
    fluidDialog();
});
function fluidDialog() {
    var $visible = $(".ui-dialog:visible");
    // each open dialog
    $visible.each(function () {
        var $this = $(this);
        var dialog = $this.find(".ui-dialog-content").data("ui-dialog");
        // if fluid option == true
        if (dialog.options.fluid) {
            var wWidth = $(window).width();
            // check window width against dialog width
            if (wWidth < (parseInt(dialog.options.maxWidth) + 50))  {
                // keep dialog from filling entire screen
                $this.css("max-width", "90%");
            } else {
                // fix maxWidth bug
                $this.css("max-width", dialog.options.maxWidth + "px");
            }
            //reposition dialog
            dialog.option("position", dialog.options.position);
        }
    });
}
</script>