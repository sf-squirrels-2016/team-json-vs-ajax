$(document).ready(function () {

    $('.main_comment_div').hide();

    // Capture Show Form Button
    $('.comment_show_button').on("click", function(e) {  
        e.preventDefault();
        console.log($(this).next().next().next());
        $(this).next().next().next().show();        
    });
    // Capture Show Form Button

    // Capture Comment Form
    $('.comment_form').on("submit", function(e) {  
        e.preventDefault();
        var $uri = $(this).attr('action');
        var $data = $(this).serialize();

          console.log("=======================")
          console.log($uri)
          console.log($data)
          console.log("=======================")

        // ajax request starts
        var ajaxRequest = $.ajax({
          url: $uri,
          type: 'POST',
          data: $data
        });
        // ajax request ends

      //ajax success response
      ajaxRequest.done(function(serverResponse, status, jqXHR) {
        serverResponse.comment
        var div ="<div class='row' style='text-align: left; margin-top: 20px;'>" + 
        "<span class='glyphicon glyphicon-user' aria-hidden='true'></span> " + serverResponse.comment + "</div>"

        $('.comments_div').append(div);
        $('.main_comment_div').hide();
        $('.textArea').val('');



      });

    });
    // Capture Comment Form


});
