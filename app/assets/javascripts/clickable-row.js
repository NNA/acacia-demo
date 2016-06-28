$(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.document.location = $(this).data("url");
    });
    $('.clickable-row .btn').on('click', function(e){
      e.stopPropagation();
	});
});