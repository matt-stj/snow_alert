
$( document ).ready(function() {

  $( "#undim" ).click(function() {
    $('.ui.modal').modal('hideDimmer')
  });

  $('.ui.dropdown')
  .dropdown();

  $('.message .close')
  .on('click', function() {
    $(this)
    .closest('.message')
    .transition('fade')
    ;
  })
  ;

  $('.ui.modal')
  .modal('show')
  ;


});
