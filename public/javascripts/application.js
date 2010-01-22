$(function(){

  setTimeout(function() {
    $("#flash_notice").slideUp();
  }, 2000);

  $("li.artist").click(function() {
    var url = $("a", this).attr("href");
    location.href=url;
  })

});
