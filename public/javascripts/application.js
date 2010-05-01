$(function(){

  setTimeout(function() {
    $("#flash_notice").slideUp();
  }, 2000);

  $("li.artist").click(function() {
    var url = $("a", this).attr("href");
    location.href=url;
  })

  $(".track_url").click(function(event) {
    var url = $(this).attr("href");
    location.href=url;
    return false
  })

});
