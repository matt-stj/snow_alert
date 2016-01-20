$( document ).ready(function() {

  $("#search").on("keypress", function (e) {
    if (e.keyCode == 13) {
      return false;
    }
  });

})


$("#search").on("keyup", function() {
  var filter = $(this).val();
  var mountains = $(".search-results").children()
  $.each(mountains, function(){
    if ($(this).text().search(new RegExp(filter, "i")) === -1) {
      $(this).addClass("invisible")
    }
    else {
      $(this).removeClass("invisible")
    }
  })

})
