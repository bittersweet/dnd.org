$(function(){

  setTimeout(function() {
    $("#flash_notice").slideUp();
  }, 2000);

  $("li.artist").click(function() {
    var url = $("a", this).attr("href");
    location.href=url;
  })

  $(".noplay").click(function(event) {
    var url = $(this).attr("href");
    if ($(this).attr("target") == '_blank') {
      window.open(url);
    } else {
      location.href=url;
    }
    return false
  })

});
