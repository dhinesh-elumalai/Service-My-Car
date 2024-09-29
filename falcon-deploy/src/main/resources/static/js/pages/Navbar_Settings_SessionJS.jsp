<script src="static/js/plugins/jquery.twbsPagination.min.js"></script>
<script>
$(document).on('click', 'a.DeleteDialog', function(e) {
    var link = this;
    e.preventDefault(); 
    $('#textForDialog').text('Are you sure you want to delete this session parameter?'); 
    $('#deleteRepo').modal('hide');

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
function startTab() {
    document.getElementById("defaultOpen").click();
}

$('.tablinks').on('click',function(){
    	$(".tablinks").removeClass("active");
    	$(this).addClass('active');
});


function Edit(id){
$('#myModal12').modal('show');
var script=$('#'+id).find('#script').val();
var selectedOpt=$('#'+id).find('#dbTypeID').val();
$('#scriptEdit').empty();
var modeD='${MODE}';
if(modeD!='GLOBAL')
	{
	$('#ModdescFormTypeDIV').empty();
	$('#ModdescFormTypeDIV').hide();
	}
$('#scriptEdit').append(script);
$('#editId').val(id);
$('#ModdescFormType').val(selectedOpt);	

}

function active(tab){$('#'+tab).removeClass('active');}

$(document).ready(function(){
    $("#Search").on('keyup', function postinput(){	
        var matchvalue = $("#Search").val(); 
      
        if( !matchvalue == ""&&matchvalue.length>1)
        	{
        	 $("#preloader").show();
        	$('#Search').addClass('loadinggif');
        	$('#paginationDiv').css("display","none");
        $.ajax({ 
            url: 'searchScript',
            data: {script: matchvalue},
            type: 'get'
        }).done(function(responseData)
        	{
        	 $("#preloader").hide();
        	$('#jsp_loaded_data').css("display","none");
        	$('#Ajax_loaded_data').children('tr').remove();
        	var empty=responseData.length;
        	if(empty==0) {
        		$("#emptyDataajax").show();
        		$("#thead").hide();
        		 $('#Search').removeClass('loadinggif');
        		 $('#paginationDiv').hide();
            }
        	else
        		{
        		$("#emptyDataajax").hide();
        		$("#thead").show();
        		$('#paginationDiv').show();
        	$.each(responseData, function(i, env) {        	
        		$("<tr id=aj'"+env.sessoionParameterId+"'> <td class='text-center'><textarea id='script' style='width:100%;background-color: #e9ecef;' class='mt-10 mb-10' name='script' readonly style='background-color: #e9ecef;'>"+env.script+"</textarea></td>"+(env.dbType=='ORACLE'?"<td class='text-center' style='width:3%'><span class='badge badge-success OracleBTN'>ORACLE</span> </td>":"<td class='text-center' style='width:3%'><span class='badge badge-danger MYSQLbTN'>MySQL</span> </td>")+" <td class='text-center'><div class='btn-group'><a href='#' onclick='Edit(aj"+env.sessoionParameterId+");'> <span class='fa fa-pencil btn btn-sm btn-alt-primary'></span></a> <a href='deleteSession?id="+env.sessoionParameterId+"'><span class='fa fa-trash btn btn-sm btn-alt-danger DeleteDialog'></span></a></div> <br> <a href='#' onclick='Update("+env.sessoionParameterId+");' class='btn btn-primary' id='update' role='button' style='display :none'>Update</a> <a href='showGlobalParams' class='btn btn-primary' id='cancel' role='button' style='display :none'>Cancel</a> </td> </tr>").appendTo($('#Ajax_loaded_data'));
        		});
        	 $('#Search').removeClass('loadinggif');
        		} }).fail(function() {
        			 $("#preloader").hide();
            console.log('Failed');
        });
    }
        else
        	{
        	$("#emptyDataajax").hide();
    		$("#thead").show();
           	$('#Ajax_loaded_data').children('tr').remove();
          	$('#jsp_loaded_data').css("display","");    
        	$('#paginationDiv').css("display","");
        	}
        });
}); 


$(document).ready(function(){
    $("#MappingSearch").on('keyup', function postinput(){	
    
        var matchvalue = $("#MappingSearch").val(); 
        if( !matchvalue == ""&&matchvalue.length>1)
        	{
        	 $("#preloader").show();
        	$('#MappingSearch').addClass('loadinggif');
        	$('#paginationDiv').css("display","none");
        $.ajax({ 
            url: 'searchMappingScript',
            data: {script: matchvalue},
            type: 'get'
        }).done(function(responseData) {
        	 $("#preloader").hide();
        	$('#jsp_datacard_id').css("display","none");
        	$('#restDataDisplay').css("display","");
        	var empty=responseData.length;
        	if(empty==0) {
        		$("#emptyDataajax").show();
        		$("#thead").hide();
        		$('#restDataDisplay').children('div').remove();
           		 $('#MappingSearch').removeClass('loadinggif');
           		$('#paginationDiv').hide();
            }
        	else
        		{
        		$('#paginationDiv').show();
        		$("#emptyDataajax").hide();
        		$("#thead").show();
        		$('#restDataDisplay').children('div').remove();

        	$.each(responseData, function(i, priv) {
        		 $("<div class='card card-inverse'  id='card"+i+"' style='background-color: #f9f9f; border-color: #11b700;height:300px;overflow-y:auto;'><div class='block-header block-header-default'><h5 class='block-title font-w600 color-primary'>"+priv.mapping+" <small style='font-size: 12px;font-style: italic;'>(Mapping)</small>"+(priv.enabled?" <span class='badge badge-success'>Active</span> ":" <span class='badge badge-danger'>Inactive</span> ")+((priv.sessionType=='ORACLE')?"<span class='badge badge-success OracleBTN'>ORACLE</span>":"<span class='badge badge-danger MYSQLbTN'>MySQL</span>")+"</h5></div><div class='card-text card-block' > <div class='' ><div class='mr-sm-12'><table class='table table-striped table-bordered '><thead class=''><tr><th>SESSION PARAMETER</th>"+
    					 (priv.enabled?"<th class='text-center'>ACTION</th>":"")+"</tr><tbody id='disp"+i+"'></tbody></thead></table></div>").appendTo($('#restDataDisplay'));        	
 		 $.each(priv.sessionParamDto, function(key,val)
    			{ 	   		
    			 $("<tr><td><textarea id='script'  name='script' style='width:100%;background-color: #e9ecef;' class='mt-10 mb-10' readonly>"+val.script+"</textarea></td>"+
    					 (priv.enabled?"<td class='text-center'><div class='btn-group'><a href='#'  onclick='Edit("+val.id+");'><span class='fa fa-pencil btn btn-sm btn-alt-primary'></span></a><a href='deleteMappingSession?id="+val.id+"'><span class='fa fa-trash btn btn-sm btn-alt-danger DeleteDialog'></span></a></div></td>":"")+"</tr>").appendTo($('#disp'+i));
    		    }); 
    			$('#card'+i).after($("</div> </div></div> <div class='col-md-12'>  <br></div>"));
            	$('#restDataDisplay').css("display","block");
	
        	});
        	 $('#MappingSearch').removeClass('loadinggif');
        		} }).fail(function() {
        			 $("#preloader").hide();    
        });
    }
        else
        	{
        	$("#emptyDataajax").hide();
    		$("#thead").show();
        	$('#restDataDisplay').children('div').remove();
        	$('#paginationDiv').css("display","");
        	$('#jsp_datacard_id').css("display","");
        	$('#restDataDisplay').css("display","none");
        	}
        });
}); 


$(document).ready(function(){
    $("#DBSearch").on('keyup', function postinput(){	
    
        var matchvalue = $("#DBSearch").val(); 
        if( !matchvalue == ""&&matchvalue.length>1)
        	{
        	 $("#preloader").show();
        	$('#DBSearch').addClass('loadinggif');
        	$('#paginationDiv').css("display","none");
        $.ajax({ 
            url: 'searchDBScript',
            data: {script: matchvalue},
            type: 'get'
        }).done(function(responseData) {
        	 $("#preloader").hide();
        	$('#jsp_datacard_id_db').css("display","none");
        	$('#restDataDisplayDb').css("display","");
        	var empty=responseData.length;
        	if(empty=='0') {
        		$("#emptyDataajax").show();
        		$("#thead").show();
        		$('#restDataDisplayDb').children('div').remove();
           		 $('#DBSearch').removeClass('loadinggif');
           		$('#paginationDiv').hide();
            }
        	else
        		{
        		$('#paginationDiv').show();
        		$("#emptyDataajax").hide();
        		$("#thead").show();
        		$('#restDataDisplayDb').children('div').remove();

        	$.each(responseData, function(i, priv) {
        		 $("<div class='card card-inverse'  id='card"+i+"' style='height:250px;overflow-y:auto;'><div class='block-header block-header-default'><h5 class='block-title color-primary font-w600''>"+priv.link+" <small style='font-size: 12px;font-style: italic;'>(Database)</small>"+(priv.dbEnabled?" <span class='badge badge-success'>Active</span>":" <span class='badge badge-danger'>Inactive</span>")+((priv.sessionType=='ORACLE')?" <span class='badge badge-success OracleBTN'>ORACLE</span>":" <span class='badge badge-danger MYSQLbTN'>MySQL</span>")+"</h5></div><div class='card-text card-block' > <div class=''><div class='mr-sm-12'><div class='table-responsive'><table class='table table-striped table-bordered '><thead><tr><th>SESSION PARAMETER</th><th class='text-center'>ACTION</th></tr></thead><tbody id='disp"+i+"'></tbody ></table></div></div>").appendTo($('#restDataDisplayDb'));        	
 		 $.each(priv.sessionParamDto, function(key,val)
    			{ 	    		
    			 $("<tr><td><textarea id='script' name='script' style='width:100%;background-color: #e9ecef;' class='mt-10 mb-10' readonly>"+val.script+"</textarea></td><td class='text-center'><div class='btn-group'><a href='#'  onclick='Edit("+val.id+");'><span class='fa fa-pencil btn btn-sm btn-alt-primary'></span></a><a href='deleteMappingSession?id="+val.id+"'><span class='fa fa-trash btn btn-sm btn-alt-danger DeleteDialog'></span></a></div></td></tr>").appendTo($('#disp'+i));
    		    }); 
    			$('#card'+i).after($("</div> </div></div> <div class='col-md-12'>  <br></div>"));
            	$('#restDataDisplayDb').css("display","block");
	
        	});
        	 $('#DBSearch').removeClass('loadinggif');
        		} }).fail(function() {
        			 $("#preloader").hide();    
        });
    }
        else
        	{
        	$("#emptyDataajax").hide();
    		$("#thead").show();
        	$('#restDataDisplayDb').children('div').remove();
        	$('#paginationDiv').css("display","");
        	$('#jsp_datacard_id_db').css("display","");
        	$('#restDataDisplayDb').css("display","none");
        	}
        });
}); 
</script>
<c:choose>
<c:when test="${MODE=='GLOBAL'}">
<script>
$(document).ready(function(){
$('#pagination').twbsPagination({
    totalPages: ${page.totalPages},
    initiateStartPageClick:false,
    visiblePages: 10,
    startPage: ${page.number + 1},
    onPageClick: function (event, page) {
    	var num=0;num=page;
    	window.location = "showGlobalParams?page="+(num-1);
    }
});
});
</script>
</c:when>
<c:when test="${MODE=='MAPPING'}">
<script>
$(document).ready(function(){
$('#pagination').twbsPagination({
    totalPages: ${page.totalPages},
    initiateStartPageClick:false,
    visiblePages: 10,
    startPage: ${page.number + 1},
    onPageClick: function (event, page) {
    	var num=0;num=page;
    	window.location = "showMapParams?page="+(num-1);
    }
});
});
</script>
</c:when>
<c:when test="${MODE=='DB'}">
<script>
$(document).ready(function(){
$('#pagination').twbsPagination({
    totalPages: ${page.totalPages},
    initiateStartPageClick:false,
    visiblePages: 10,
    startPage: ${page.number + 1},
    onPageClick: function (event, page) {
    	var num=0;num=page;
    	window.location = "showDBParams?page="+(num-1);
    }
});
});
</script>
</c:when>
</c:choose>