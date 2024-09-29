<script type="text/javascript">
$('#DropdownDate').multiselect({
    maxHeight: '300',
    buttonWidth: '200',
    onChange: function(element, checked) {
        var brands = $('#DropdownDate option:selected');
        var selected = [];
        $(brands).each(function(index, brand){
            selected.push([$(this).val()]);
        });
        document.getElementById('SelectedDates').value=selected;
    }
}); 

$('#DropdownDay').multiselect({
    maxHeight: '300',
    buttonWidth: '200',
    onChange: function(element, checked) {
        var brands = $('#DropdownDay option:selected');
        var selected = [];
        $(brands).each(function(index, brand){
            selected.push([$(this).val()]);
        });
        document.getElementById('SelectedDays').value=selected;
    }
}); 
  


$('#DropdownHour').multiselect({
    maxHeight: '300',
    buttonWidth: '200',
    onChange: function(element, checked) {
        var brands = $('#DropdownHour option:selected');
        var selected = [];
        $(brands).each(function(index, brand){
            selected.push([$(this).val()]);
        });
        document.getElementById('SelectedHours').value=selected;
    }
}); 



$('#DropdownDay1').multiselect({
    maxHeight: '300',
    buttonWidth: '200',
    onChange: function(element, checked) {
        var brands = $('#DropdownDay1 option:selected');
        var selected = [];
        $(brands).each(function(index, brand){
            selected.push([$(this).val()]);
        });
        document.getElementById('SelectedDays1').value=selected;
    }
}); 
  


$('#DropdownHour1').multiselect({
    maxHeight: '300',
    buttonWidth: '200',
    onChange: function(element, checked) {
        var brands = $('#DropdownHour1 option:selected');
        var selected = [];
        $(brands).each(function(index, brand){
            selected.push([$(this).val()]);
        });
        document.getElementById('SelectedHours1').value=selected;
    }
}); 




$('#DropdownHour2').multiselect({
    maxHeight: '300',
    buttonWidth: '200',
    onChange: function(element, checked) {
        var brands = $('#DropdownHour2 option:selected');
        var selected = [];
        $(brands).each(function(index, brand){
            selected.push([$(this).val()]);
        });
        document.getElementById('SelectedHours2').value=selected;
    }
}); 
</script>  