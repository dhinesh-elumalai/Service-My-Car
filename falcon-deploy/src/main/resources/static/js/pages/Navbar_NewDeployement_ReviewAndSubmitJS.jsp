<script>


$('div.show_hide').on("click", function() {
	 if ($(this).find('span').hasClass('fa fa-angle-down'))
	     {
			$(this).find('span').removeClass("fa fa-angle-down");
			$(this).find('span').addClass("fa fa-angle-up");
	       }
	   else {
	    	$(this).find('span').removeClass("fa fa-angle-up");
			$(this).find('span').addClass("fa fa-angle-down");		
	        }
    $(this).next('div.slidingDivs').stop().slideToggle('fast');
});
</script>
