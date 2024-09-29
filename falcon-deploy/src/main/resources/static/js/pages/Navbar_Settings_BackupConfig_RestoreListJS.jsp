<script>
function toggle(source) {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i] != source)
            checkboxes[i].checked = source.checked;
    }
}
</script>
<c:choose>
     <c:when test="${MODE=='FilesInRepo'}">  
 <script>
 function restoring()
 {
	 document.getElementById('overlaygivBrigtness').style.display='block';
     return true;
 }
</script>
</c:when>
</c:choose>