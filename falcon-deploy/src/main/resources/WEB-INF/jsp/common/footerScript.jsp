
<script src="${pageContext.request.contextPath}/static/js/plugins/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/jstz.js"></script>

<!-- theme scripts -->
<script src="${pageContext.request.contextPath}/static/js/codebase.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/select2/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/dateFormatter.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/form-validation/js/formValidation.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/form-validation/js/bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/jquery-ui/jquery.ui.touch-punch.min.js"></script>

<script>
   jQuery(function(){
       Codebase.helper('select2');
   });
   </script>

<script>
 $(document).ready(function() {
	countUpdate();
	$("#preloader").hide();
	checkandUpdatePreference();
}); 
 $(document).ready(function(){
	 console.log("entered")
	  $('#popoverset').popover({ 
	    html : true,
	    trigger: "manual",
	    container: $(this).attr('id'),
	    animation: false,
	    offset: '110px 0px',
	    content: function() {
	      return $('#popover_content_wrapper').html();
	    }
	  }).on("mouseenter", function () {
	        var _this = this;
	        console.log(this.id)
	        $(this).popover("show");
	        $(this).addClass("active");
	        $(".popover").css("max-width", "1000px");
	        $(".popover-header").css("background","#324a7e");
	        $(".popover-header").css("padding","12px 10px");
	        $(".popover-header").css("color","white");
	        $(".popover").on("mouseleave", function () {
	        	 $('#popoverset').removeClass("active");
	            $(_this).popover('hide');
	        });
	    }).on("mouseleave", function () {
	        var _this = this;
	        setTimeout(function () {
	            if (!$(".popover:hover").length) {
	            	$(_this).removeClass("active");
	                $(_this).popover("hide")
	            }
	        }, 100);
	    });
	});
 function checkandUpdatePreference()
 {
	var cm_theme= localStorage.getItem('cm_theme');
	var cm_fonttype = localStorage.getItem('cm_fonttype');
	var cm_fontsize = localStorage.getItem('cm_fontsize');

if(cm_theme==null||cm_fonttype==null||cm_fontsize==null)
	{
		 $.ajax({ 
	          url: '${pageContext.request.contextPath}/userPreferences',
	          data: {},
	          type: 'get'
	      }).done(function(responseData)
	    	{
	    	  console.log(responseData)
	    	 	$.each(responseData, function(i, data) {
	    	 		localStorage.setItem(data.prop, data.propValue);
	    	 		});
	    	}).fail(function() {
	    	    console.log('Failed');
	    	});		
	 }
 }

function showModalForAbout()
{
	  $.ajax({ 
          url: '${pageContext.request.contextPath}/appVersion',
          data: {},
          type: 'get'
      }).done(function(responseData)
    	{
    	  $("#Aboutstatus").empty();
    	  $("#Aboutstatus").append(responseData);
    	  $("#aboutPageModal").modal('show');
    	}).fail(function() {
    	    console.log('Failed');
    	});
}
 
function countUpdate()
{
	  $.ajax({ 
          url: '${pageContext.request.contextPath}/listNotificationCount',
          data: {},
          type: 'get'
      }).done(function(responseData)
    		  {
    	  console.log(responseData.showServerMaintenence);//modal-popin
    	  if(responseData.showServerMaintenence=='true')
    	  {  $("#modal-popin").modal('show');}
    	  var count=0;
    	  count=responseData.approveCount+responseData.notifyCount;
    	  $("#NotifyCount").text(responseData.notifyCount);
    	  $("#ApproveCount").text(responseData.approveCount);
    	  $("#notifyCountNav").text(count);
    		  }).fail(function() {
    	            console.log('Failed');
    	      });
}

$("#notifyToggler").click(function(){
	dataForApproveAndNotify();
	});
	
function dataForApproveAndNotify()
{countUpdate();
	$('#NotifyDetailShower').addClass("block-mode-loading");
	 $.ajax({ 
        url: '${pageContext.request.contextPath}/listNotification',
        data: {},
        type: 'get'
    }).done(function(responseData)
  		  {
  	  console.log(responseData)
  	  	$('#NotifyDetailShower').removeClass("block-mode-loading");
 	var list='';
 	$.each(responseData.approvalNotification, function(i, data) {
 		
 		 list+='<li>'+'<i class="si si-check text-info"></i>'+'<div class="font-w600">'+data.description+'</div>'+'<div>'+
            '<a href="'+data.url+'">'+data.requestName+'</a>'+'</div>'+
            '</li>';
    
 	})
 $.each(responseData.adminNotification, function(i, data) {
 		
 		 list+='<li>'+'<i class="fa fa-unlock text-success"></i>'+'<div class="font-w600">'+data.description+'</div>'+'<div>'+
            '<a href="'+data.url+'">'+data.requestName+'</a>'+'</div>'+
            '</li>';
    
 	})
   	$('#bindDetail').children('li').remove();
 	$('#bindDetail').append(list); 	

  		  }).fail(function() {
  	            console.log('Failed');
  	      });
	}
	
	
	
$("#refreshData").click(function(){
	dataForApproveAndNotify();
	 });
</script>


<script>
$(document).ready(function() {
    $('.disabled_input input').attr('disabled','');        
    $('select[name="credential"]').on('change',function(){
    var  others = $(this).val();
        if(others == "credential"){           
        $('.disabled_input input').removeAttr('disabled');          
         }else{
         $('.disabled_input input').attr('disabled','disabled'); 
        }  

      });
    });
</script>
	<script>
		function goBack() {
			window.history.back();
		}
	</script>


<script>
$(document).ready(function(){
    $('.submit1').attr('disabled',true);
    $('.nn1').keyup(function(){
        if($(this).val().length !=0)
            $('.submit1').attr('disabled', false);            
        else
            $('.submit1').attr('disabled',true);
    })
});
</script>


<script>
$(document).ready(function(){
    $("#table-width").click(function(){
        $("table").toggleClass("min-width-100");
    });
});
</script>


