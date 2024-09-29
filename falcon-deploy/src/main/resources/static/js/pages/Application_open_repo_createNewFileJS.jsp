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
 <c:if test="${accessControl=='READ/WRITE'}">
     <script>
      var textArea = document.getElementById('editor');
      var editor = CodeMirror.fromTextArea(textArea,{lineNumbers: true,readOnly :false,theme: 'default',mode:'text', matchBrackets: true,matchTags: {bothTags: true}});
     
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
      
      </c:if>