<script>
	$("#timezone option").each(function()
			{
		var val=$(this).val();
		if(val)
			{
			   var gmt='(GMT'+ moment(new Date()).tz(val).format("Z")+') '+val;
			    $(this).text(gmt) 
			}
		});

var timezone = jstz.determine();
$('#timezone').val(timezone.name()).trigger('change.select2');
function submitForm()
{
	$("#scheduledForm").submit();
}
$('.timepicker').timepicker({
			icons : {
				up : "fa fa-angle-double-up",
				down : "fa fa-angle-double-down",
			}
});
$("input[name='schedule']").click(function() {
	$('#date-sec').css('display',
	($(this).val() === 'false') ? 'block' : 'none');
});
	var date = new Date(${currentDateApp.getTime()});
		date.setDate(date.getDate());

		$('#date').datepicker({ 
		    startDate: date,
		    todayHighlight: true,
		    format: 'mm-dd-yyyy',
		    orientation: "bottom" 
		});
</script>
