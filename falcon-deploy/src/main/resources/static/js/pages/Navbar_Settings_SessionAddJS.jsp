<script>
window.onload = function () {
    startTab();
};

function startTab() {
	var mode=$("#mode").val();
	if(mode=='GLOBAL')
    document.getElementById("defaultOpen").click();
	if(mode=='DB')
	document.getElementById("defaultDB").click();
	if(mode=='MAPPING')
	document.getElementById("defaultMap").click();
}

function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}


$("#mapping").on('keyup', function postinput(){	
	
	var matchvalue=$("#mapping").val();
	if(matchvalue!='')
	{
		 $("#preloader").show();
    $.ajax({         
        url: 'searchMapping',
        data: {target: matchvalue},
        type: 'get'
    }).done(function(responseData) {
    	 $("#preloader").hide();
    	var empty=responseData.length;
    	$('#repos1').children('label').remove();
    	$('#repos1').children('input').remove();
    	$('#repos1').children('div').remove();
	 	$('#repoCard1').show();

    	if(empty=='0') {
    		 $('<label />', {class:"small",  text: 'Mapping "' +matchvalue+ '" is not found.'}).appendTo($('#repos1'));
    		 $('#mapping').removeClass('loadinggif');
        }
    	else
    		{

        	$.each(responseData, function(i, obj) {
        		$('<div />',{id:'divdb0'+i}).appendTo('#repos1');
        		 $("<input class='unstyled-button' type='button' id= 'btn0_"+obj.targetName+"' value= "+obj.targetName+" onclick ='showAnswer(this)'/>").appendTo($('#divdb0'+i));
        		});
        	$('#mapping').removeClass('loadinggif');
    		} }).fail(function() {
    			 $("#preloader").hide();
    			  alert('Failed');
    
    		});
	}
	
});



$("#db").on('keyup', function postinput(){	
	
	var matchvalue=$("#db").val();
	if(matchvalue!='')
		{
		 $("#preloader").show();
    $.ajax({         
        url: 'search_databases',
        data: {name: matchvalue},
        type: 'get'
    }).done(function(responseData) {
    	var empty=responseData.length;
    	$('#repos2').children('label').remove();
    	$('#repos2').children('input').remove();
    	$('#repos2').children('div').remove();
	 	$('#repoCard2').show();
	 	 $("#preloader").hide();
    	if(empty=='0') {
    		 $('<label/>', {class:"small",  text: 'Database "' +matchvalue+ '" is not found.'}).appendTo($('#repos2'));
    		 $('#db').removeClass('loadinggif');
        }
    	else
    		{
        	$.each(responseData, function(i, obj) {
        		$('<div />',{id:'divdb1'+i}).appendTo('#repos2');
        		 $("<input class='unstyled-button' type='button' id= '"+obj.id+"' value= "+obj.link+" onclick ='showAnswer1(this)'/>").appendTo($('#divdb1'+i));
        		});
        	$('#db').removeClass('loadinggif');
    		} }).fail(function() {
    			  alert('Failed');
    			  $("#preloader").hide();
    });
		}
	else
		{
		$('#repos2').empty();
		}
});
function showAnswer(obj){
	var targetvalue=$(obj).val();
	var but=$(obj).attr('id');
	 $('#mapping').val(targetvalue);
	 $('#repos1').empty();
}
function showAnswer1(obj){
	var targetvalue=$(obj).val();
	var but=$(obj).attr('id');
	 $('#db').val(targetvalue);
	 $('#dbId').val(but);
	 $('#repos2').empty();
}
</script>