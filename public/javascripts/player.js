$(document).ready(function(){

  $("a.play").click(function(event) {
    event.preventDefault();
    $("#player").slideDown();
    var track = $(this).prev().prev().html();
    $("#player h3").html(track);

  });

  $("#jplayer").jPlayer({
    ready: function () {
                $(this).setFile("assault.mp3").play();
                $("#player_song_title").html("DJ Assault - Ass and Titties");
    },
    height: 100,
    volume: 50,
    oggSupport: false
  })
  .jPlayerId("play", "player_play")
  .jPlayerId("pause", "player_pause")
  .jPlayerId("stop", "player_stop")
  .jPlayerId("loadBar", "player_progress_load_bar")
  .jPlayerId("playBar", "player_progress_play_bar")
  .onProgressChange( function(loadPercent, playedPercentRelative, playedPercentAbsolute, playedTime, totalTime) {
    var myPlayedTime = new Date(playedTime);
    var ptMin = (myPlayedTime.getUTCMinutes() < 10) ? "0" + myPlayedTime.getUTCMinutes() : myPlayedTime.getUTCMinutes();
    var ptSec = (myPlayedTime.getUTCSeconds() < 10) ? "0" + myPlayedTime.getUTCSeconds() : myPlayedTime.getUTCSeconds();
    $("#play_time").text(ptMin+":"+ptSec);

  })
  .onSoundComplete( function() {
    $(this).play();
  });
});