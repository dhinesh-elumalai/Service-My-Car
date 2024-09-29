<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<head>
<link href="${pageContext.request.contextPath}/static/css/codemirror.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/cobalt.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/blackboard.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/eclipse.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/neat.css" rel="stylesheet">
</head>
<body class="height-100vh">

<div id="preloader">
		<i class="fa fa-3x fa-cog fa-spin" style="color:#324a7e"></i>
		<p>Loading <br><small style="text-transform:capitalize">Please Wait</small></p>
	</div>
 <nav class="navbar  navbar-toggleable-xl navbar-light bg-faded row" style="border: 1px solid #ccc;">
	
											<ul class="nav navbar-nav  editor-head mr-auto">
											<li class="nav-item">
											<select class="theme form-control btn-secondary" id="theme" onchange="change()">
														<option value="cobalt">Cobalt</option>
														<option value="blackboard">Blackboard</option>
														<option value="eclipse" >Eclipse</option>
														<option value="neat" selected>Neat</option>
												</select></li>
												
												<li class="nav-item mr-10">
												<select class=" form-control btn-secondary language" id="code">
														<option value="'Menlo-Regular'">Menlo Regular</option>
														<option value="'PT Mono', monospace">PT Mono</option>
														<option value="'courier-new">Courier New</option>
														<option value="'Roboto Mono', monospace" selected>Roboto Mono</option>														
												</select></li>
												<li class="nav-item mr-10">
												<select class=" form-control btn-secondary fontsize" id="code1">
														<option value="12px">12 px</option>
														<option value="13px">13 px</option>
														<option value="14px" selected>14 px</option>
														<option value="15px">15 px</option>
														<option value="16px">16 px</option>														
												</select></li>
												<li class="nav-item mr-10 mt-1">
													<button type="button" class="btn btn-sm btn-primary" data-toggle="click-ripple" onClick="saveChanges()">Set as default</button>
												</li>
												
											</ul>
											<ul class="nav navbar-nav  editor-head " >
											<li class="nav-item mr-10 mt-1 nav-right">
													<a href="${pageContext.request.contextPath}/${DownloadPath}/${DownloadPath1}"><button type="button" class=" btn btn-sm btn-primary" data-toggle="click-ripple">Download</button></a>
												</li>
                                                <li class="nav-item mr-10 mt-1 nav-right">
													<a href="${pageContext.request.contextPath}/${path}/${path1}"><button type="button" class="  btn btn-sm btn-primary" data-toggle="click-ripple">RAW</button></a>
												</li>
											</ul>
</nav>
<textarea id="editor" name="textAreaValue" class="form-control" readonly style="display: none;"><c:forEach items="${contents}" var='reader'>${reader}<% out.print("\n");%></c:forEach></textarea>                                                                   
</body>
	<div id="dialog-confirm">
				<p id="textForDialog"></p>
			</div>
<%@include file="/WEB-INF/jsp/common/footerScript.jsp"%>
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
   	var cm_theme= localStorage.getItem('cm_theme');
  	if(cm_theme==null)
  		cm_theme="eclipse";
  	else
  		$("#theme option[value='"+cm_theme+"']").prop('selected', true);
      var editor = CodeMirror.fromTextArea(textArea,{lineNumbers: true ,readOnly :true,theme:cm_theme,mode:'text', matchBrackets: true,matchTags: {bothTags: true}});
          editor.setOption("mode",'text/x-sql');
          
         function change(){
           var x = document.getElementById("theme").value;
          if(x=="cobalt")
        	    {editor.setOption("theme",'cobalt'); }
          else if(x=="blackboard")
    	 		 {editor.setOption("theme",'blackboard');}
          else if(x=="eclipse")
    	 		 {editor.setOption("theme",'eclipse');}
          else if(x=="neat")
    	 		 {editor.setOption("theme",'neat');}
         
        }
      

     $(document).ready(function(){
    	 var cm_fonttype = localStorage.getItem('cm_fonttype');
    		var cm_fontsize = localStorage.getItem('cm_fontsize');
    		if(cm_fonttype!=null)
    			{
    			$('select.language option[value="'+cm_fonttype+'"]').prop('selected', true);
    			 $(".CodeMirror").css("font-family" , cm_fonttype);
    			}
    		if(cm_fontsize!=null)
    			{
    			$('select.fontsize option[value="'+cm_fontsize+'"]').prop('selected', true);
    			$(".CodeMirror").css("font-size" , cm_fontsize);
    			}
 	    $("select.language").change(function(){
 	        var fontfamily = $(".language option:selected").val();
 	        $(".CodeMirror").css("font-family" , fontfamily);
 	    });
 	    $("select.fontsize").change(function(){
 	        var size = $(".fontsize option:selected").val();
 	        $(".CodeMirror").css("font-size" , size);
 	    });  
 	});
     
     function saveChanges()
     {
     	localStorage.setItem('cm_fonttype', $("select.language").val());
     	localStorage.setItem('cm_fontsize', $("select.fontsize").val());
     	localStorage.setItem('cm_theme', $("#theme").val());
     	var items=[
     		{prop: "cm_fonttype", propValue: $("select.language").val()},
     		{prop: "cm_fontsize", propValue: $("select.fontsize").val()},
     		{prop: "cm_theme", propValue: $("#theme").val()}
     		];
     	console.log(items)
     	  $.ajax({ 
     		 type : "POST",
              url: '${pageContext.request.contextPath}/saveUserPreferences',
            	 data : JSON.stringify(items),
     		  contentType: "application/json"
          }).done(function(responseData)
        	{
         	 console.log(responseData);
        	}).fail(function() {
        	    console.log('Failed');
        	}); 
     	$('#textForDialog').text("Editor settings saved successfully.");
     	 $('#dialog-confirm').dialog({
     		  	resizable: false,
     		      height: 180,
     		      width: 350,
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
     		  	               text: "Close",
     		  	               "class": ' btn btn-sm btn-alt-danger',
     		  	               click: function() {
     		  	                    $(this).dialog("close");
     		  	               }
     		  	           }
     		  	 ]	

     		  });
     }
      </script>