// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require semantic-ui
//= require_tree .

$( document ).ready(function() {
  searchMountains();

  
  $('.ui.dropdown')
  .dropdown();

  $('.login-form, .home-btn, .sub-header, .login-text, .new-member').hide();

  $('.login-form, .login-text')
    .transition({
      animation : 'fade up',
      duration  : 800,
      interval  : 400
    })
  ;

  // var delay=250;
  // setTimeout(function(){
    $('.sub-header')
    .transition({
      animation: 'scale',
      duration: 800});
  // }, delay);

  var delay=500;
  setTimeout(function(){
    $('.home-btn')
    .transition({
      animation: 'scale',
      duration: 1000}).transition({
        animation: 'bounce',
        duration: 1000});;
  }, delay);


  var delay=2000;
  setTimeout(function(){
    $('.new-member')
    .transition({
      animation: 'bounce',
      duration: 1000});
  }, delay);

  $('.message .close')
  .on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade')
    ;
  })
;


});


function searchMountains() {
  $("#search").on("keyup", function() {
    var filter = $(this).val();
    var mountains = $(".list").children()
    $.each(mountains, function(){
      if ($(this).text().search(new RegExp(filter, "i")) === -1) {
        $(this).addClass("hidden")
      }
      else {
        $(this).removeClass("hidden")
      }
    })

  })

}
