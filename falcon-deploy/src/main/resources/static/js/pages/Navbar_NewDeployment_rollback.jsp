<c:set var = "reqidd" scope = "session" value = "${requestId}"/>
<!-- <script>alert('${reqidd}');</script> -->

<c:if test = '${empty reqidd}'>
<c:set var = "reqidd" scope = "session" value = "${request.deployRequestId}"/>
<!-- <script>alert('${reqidd}');</script> -->
</c:if>

<c:if test = '${request.getRollbackfileSelectionBox()=="select-box"}'>
<script>
$(window).on("load", function() {
	console.log('${reqidd}');
	$('#text-box').hide();
	$('#select-box').show();
});
</script>
</c:if>

<c:if test = '${request.getRollbackfileSelectionBox()=="text-box"}'>
<script>
$(window).on("load", function() {
	$('#select-box').hide();
	$('#text-box').show();

});
</script>
</c:if>

<script > 
console.log("reqid="+'${reqidd}');
$(document).ready(function() {
	//alert('${reqidd}');
	$('#multiselect2').multiselect();
	$("#multiselect2_to").bind("DOMSubtreeModified", function() {
		if($("#multiselect2_to").children('option').length===0)
			$('#enablenext').prop("disabled",false);
		else
			$('#enablenext').prop("disabled",true);
		$('#dependentFileUL').empty();
        $('#dependentFileDiv').hide();

	});
	

});


$(function() {
    $('.section-changer').change(function(){
        $('.box-changer').hide();
        $('#' + $(this).val()).show();
        $('#dependentFileUL').empty();
        $('#dependentFileDiv').hide();
        $('#enablenext').prop("disabled",true); 
    });
});


/* filter code */

$('#DbUnselected').keyup(function () {
    var valthis = $(this).val().toLowerCase();
    var num = 0;
    $('select#multiselect2>option').each(function () {
        var text = $(this).text().toLowerCase();
        if(text.indexOf(valthis) !== -1)  
            {$(this).show(); $(this).prop('selected',true);}
        else{$(this).hide();}
         });
});
$('#Dbselected').keyup(function () {
    var valthis = $(this).val().toLowerCase();
    var num = 0;
    $('select#multiselect2_to>option').each(function () {
        var text = $(this).text().toLowerCase();
        if(text.indexOf(valthis) !== -1)  
            {$(this).show();
            $(this).prop('selected',true);}
        else{$(this).hide();}
         });
});
</script>


<script>

function SubmitFilesAndNext(){
	$("#preloader").show();
	var scriptType=$('#scriptType').val();
	 var selectedFiles=[];
	if(scriptType=='select-box')
		{
		$('#multiselect2_to option').prop('selected', true);
    	selectedFiles= $('#multiselect2_to').val();
		}
	else 
		{
		str = $('#textAreaBox').val().trim().replace(/(?:\r\n|\r|\n)/g, ',');
		selectedFiles= str.split(',');
		}
	
        $.ajax({ 
            url: 'deployRequestStep2to3',
            data: {'${_csrf.parameterName}':'${_csrf.token}',reqid:'${requestId}',repoName: '${repoName}',selectedFiles:selectedFiles},
            type: 'post'
        }).done(function(responseData) {
        	$("#preloader").hide();
        	if(responseData.indexOf("success") == 0)
        		{}
        		
        }).fail(function() {
        	$("#preloader").hide();
            console.log('Failed');
        });
    }

function validateSelectedFiles(){
	$("#preloader").show();
	var scriptType=$('#scriptType').val();
	 var selectedFiles;
	if(scriptType=='select-box')
		{
		$('#multiselect2_to option').prop('selected', true);
    	selectedFiles= $('#multiselect2_to').val();
		}
	else 
	{
		str = $('#textAreaBox').val().trim().replace(/(?:\r\n|\r|\n)/g, ',');
		selectedFiles= str.split(',');
	
		}
	if(selectedFiles.length>0)
		{
        $.ajax({ 
            url: 'validate_Rollback_Files',
            data: {reqid:'${reqidd}',repoName: '${repoName}',selectedFiles:selectedFiles,'${_csrf.parameterName}':'${_csrf.token}'},
            type: 'post'
        }).done(function(responseData) {
        	$("#preloader").hide();
        	var noerror=true;
        	$('#dependentFileDiv').css("display","");
        	$("#dependentFileUL").empty();
        	$("#dependentFileUL").append(makeUL(responseData));
   
        	var enableNext=find(responseData,false);
        	if(enableNext==null)
                   $('#enablenext').prop("disabled",false);
             else
     			   $('#enablenext').prop("disabled",true); 
        		 }).fail(function() {
            console.log('Failed');
        });
		}
	else
		$("#preloader").hide();
    }

     
function makeUL(lst) {
    var html = [];                
    html.push('<ul class="pl-20">');
    $(lst).each(function() { html.push(makeLI(this)) });
    html.push('</ul>');      
    return html.join("\n");
}
                
function makeLI(elem) {
    var html = [];                
    html.push('<li>');
    html.push(elem.fileName);
    if (elem.link)
        html.push('<a>' + elem.fileName + '</a>');
    if(elem.stripCheck&&elem.noerror==false)
    	html.push('<span style="color:red">&emsp;&emsp;'+ elem.stripMsg +'</span>')
    if(elem.empty&&elem.noerror==false)
    	html.push('<span style="color:red">&emsp;&emsp;Empty File</span>')
    if(elem.filetype==false&&elem.present&&elem.noerror==false)
    	html.push('<span style="color:red">&emsp;&emsp;File Type not supported please refer file type configuration.</span>')
    if(elem.present==false&&elem.noerror==false)
    	html.push('<span style="color:red">&emsp;&emsp;File not Present.Please check.</span>')
    if(elem.noerror)
    	html.push('<span style="color:green">&emsp;&emsp;Success</span>')
    if (elem.dependentFile)
        html.push('<span>' + makeUL(elem.dependentFile) + '</span>');
    html.push('</li>');
    return html.join("\n");
}

function find(source, id)
{
    for (key in source)
    {
        var item = source[key];
        if (item.noerror == id)
            return item;  
        if (item.dependentFile&&item.noerror==true)
        {
            var subresult = find(item.dependentFile, id);
            if (subresult)
                return subresult;
        }
    }
    return null;
}

function submitNextForm()
{
	$('#multiselect2_to option').prop('selected', true);
	 $("#nextForm").submit();
 }
</script>





          
