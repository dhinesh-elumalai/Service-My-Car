<script src="${pageContext.request.contextPath}/static/js/plugins/jsForCM/codemirror.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/jsForCM/xml.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/jsForCM/htmlmixed.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/jsForCM/javascript.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/jsForCM/css.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/jsForCM/clike.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/jsForCM/matchbrackets.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/jsForCM/xml-fold.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/jsForCM/matchtags.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/jsForCM/sql.js"></script>
 <script>
      var textArea = document.getElementById('editor');
      var editor = CodeMirror.fromTextArea(textArea,{lineNumbers: true ,readOnly :true,theme: 'default',mode:'text', matchBrackets: true,matchTags: {bothTags: true}});
      var b= <c:out value="${DeletedLineNumbers}"/>
      for (var i=0; i <b.length; i++) { 
      editor.addLineClass(b[i], "wrap", "DeletedLineNumbers");
      }
      var c= <c:out value="${AddedLineNumbers}"/>
          for (var i=0; i <c.length; i++) { 
          editor.addLineClass(c[i], "wrap", "AddedLineNumbers");
          }
      
      function displayTheme()
      {
    	  var x = document.getElementById("theme").value;
          if(x=="cobalt")
        	    {editor.setOption("theme",'cobalt'); }
          else if(x=="3024-day")
        	    {editor.setOption("theme",'3024-day');}
          else if(x=="abcdef")
    	  		{editor.setOption("theme",'abcdef');}
          else if(x=="blackboard")
    	 		 {editor.setOption("theme",'blackboard');}
          else if(x=="colorforth")
    	  		{editor.setOption("theme",'colorforth');}
          else if(x=="eclipse")
    	 		 {editor.setOption("theme",'eclipse');}
          else if(x=="elegant")
    	  		{editor.setOption("theme",'elegant');}
          else if(x=="mbo")
    	 		 {editor.setOption("theme",'mbo');}
          else if(x=="neat")
    	 		 {editor.setOption("theme",'neat');}
          else if(x=="panda-syntax")
    	 		 {editor.setOption("theme",'panda-syntax');}
          else if(x=="paraiso-light")
    	  		{editor.setOption("theme",'paraiso-light');}
          else if(x=="rubyblue")
    	  		{editor.setOption("theme",'rubyblue');}
          else if(x=="default")
    	  		{editor.setOption("theme",'default');}
        }
      
      
     function displayLanguage()   
     {
    	 var y = document.getElementById("code").value;
    	 if(y=="xml")
    		 {editor.setOption("mode",'xml');}
    	 else if(y=="text/x-java")
    		 {editor.setOption("mode",'text/x-java');}
    	 else if(y=="text/x-csrc")
    	 {editor.setOption("mode",'text/x-csrc');}
    	 else if(y=="text/x-c++src")
    	 {editor.setOption("mode",'text/x-c++src');}
    	 else if(y=="sql")
    	 {editor.setOption("mode",'text/x-sql');}
    	 else if(y=="javascript")
    	 {editor.setOption("mode",'javascript');}
    	 else if(y=="css")
    	 {editor.setOption("mode",'css');}
    	
     }
     
      </script>
     <script>
      function checkthishash(form)
      {
    	  var e=form["oldHash"].value;
    	  var f=form["newHash"].value;
    	  if(e==f)
    		  {
    	
        		  $('#myModal1').modal('hide');
        		  $('#textForDialog').text('Please use different hash to view difference.'); 
        		  $('#dialog-confirm').dialog({
        		  	resizable: false,
        		      height: 200,
        		      width: 400,
        		      fluid: true,
        		      modal: true,
        		      position: { my: "center", at: "top+20%"},
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
        		  	               "class": ' btn btn-sm btn-alt-danger',
        		  	               click: function() {
        		  	                    $(this).dialog("close");
        		  	               }
        		  	           }
        		  	 ]	

        		  });
        		  
        		  return false;
        		  }
        	  else
        		  {
        		  return true;
        		  }
          }
        
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
          function commitFrom() {
        	  var input, filter, table, tr, td, i;
        	  input = document.getElementById("myInput");
        	  filter = input.value.toUpperCase();
        	  table = document.getElementById("myTable");
        	  tr = table.getElementsByTagName("tr");

        	 
        	  for (i = 0; i < tr.length; i++) {
        	    td = tr[i].getElementsByTagName("th")[1];
        	    if (td) {
        	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        	        tr[i].style.display = "";
        	      } else {
        	        tr[i].style.display = "none";
        	      }
        	    }
        	  }
        	}
          function commitTo() {
        	  var input, filter, table, tr, td, i;
        	  input = document.getElementById("myInput1");
        	  filter = input.value.toUpperCase();
        	  table = document.getElementById("myTable1");
        	  tr = table.getElementsByTagName("tr");

        	 
        	  for (i = 0; i < tr.length; i++) {
        	    td = tr[i].getElementsByTagName("th")[1];
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