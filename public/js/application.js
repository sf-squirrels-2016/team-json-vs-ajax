$(document).ready(function () {

  $('.comment_div').hide();

    // Capture Comment Form Submission
    $('.comment_show_button').on("click", function(e) {  
        e.preventDefault();
        console.log($(this).next().next().next());
        $(this).next().next().next().show();
        
    });
    // Capture Comment Form Submission


});
