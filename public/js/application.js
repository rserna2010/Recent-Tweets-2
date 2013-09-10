$(document).ready(function(){

  bindSpinner()

  $('#twitter_form').on('submit', function(e) {
    e.preventDefault();
    makeMyAjaxCall()
  
  });

});


var bindSpinner = function(){

    $("#spinner").bind("ajaxSend", function() {
        $(this).show();
    }).bind("ajaxStop", function() {
        $(this).hide();
    }).bind("ajaxError", function() {
        $(this).hide();
    });

}

var makeMyAjaxCall = function(){
  $.ajax({
    url: '/',
    type: 'get',
  }).done(function(server_data){
    console.log(server_data)
    $('#tweets').append(server_data);
  });
}
