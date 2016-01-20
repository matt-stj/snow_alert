$( document ).ready(function() {

  $('.login-form, .home-btn, .sub-header, .login-text, .new-member').hide();

  $('.login-form, .login-text')
  .transition({
    animation : 'fade up',
    duration  : 800,
    interval  : 400
  })
  ;


  $('.sub-header')
  .transition({
    animation: 'scale',
    duration: 800});

  })
