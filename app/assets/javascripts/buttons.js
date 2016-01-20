$( document ).ready(function() {

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

})
