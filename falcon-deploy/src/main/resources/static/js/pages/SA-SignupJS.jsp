<script>
 $('#zip').blur(function(){
  var zip = $(this).val();
  var city = '';
  var state = '';
  var country = '';
  $.getJSON('http://maps.googleapis.com/maps/api/geocode/json?address='+zip).done(function(response){
	  console.log(response);
    var address_components = response.results[0].address_components;
    $.each(address_components, function(index, component){
      var types = component.types;
      $.each(types, function(index, type){
        if(type == 'locality') {
          city = component.long_name;
        }
       
        if(type =='administrative_area_level_1') {
          state = component.long_name;
        }
        if(type =='country') {
        	country = component.long_name;
          }
          
       
      });
    });

    //pre-fill the city and state
    $('#city').val(city);
    $('#state').val(state);
    $('#country').val(country);
  });
});
 </script>    
  