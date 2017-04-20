$(function(){
  $('.btn-like').on('ajax:send', function(xhr){
    $('.btn-like').prop("disabled", true);
  });
});