$(document).ready(function(){

  function nexttrack(current_track) {
    var nexttrack = current_track + 1;
    if (nexttrack < 10) {
      nexttrack = nexttrack.charAt(1);
    };
    var trackname = $("#track-" + nexttrack + " h2").html();
    var nexttrack_url = $("#track-" + nexttrack + " a.play").attr("href");
    setsongtitle(trackname);
    playtrack(nexttrack_url);
  };
  
  function prevtrack(current_track) {
    var prevtrack = current_track - 1;
    if (prevtrack < 10) {
      prevtrack = prevtrack.charAt(1);
    }
    var trackname = $("track-" + prevtrack + " h2").html();
    var prevtrack_url = $("#track-" + prevtrack + " a.play").attr("href");
    setsongtitle(trackname);
    playtrack(prevtrack_url);
  };
  
  function setsongtitle(title) {
    $("#player_song_title").html(title);
  };
  
  function playtrack(trackurl ) {
    $("#jplayer").setFile(trackurl).play();
  };

  $("a.play").click(function(event) {
    event.preventDefault();
    $("#player").slideDown();
    var trackname = $(this).prev().prev().html();
    var trackurl = $(this).attr("href");
    $("#player_song_title").html(trackname);    
    playtrack(trackurl);
  });

  $("#jplayer").jPlayer({
    ready: function () {
    },
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
    var current_track = $("#player_song_title a").attr("id");
    nexttrack(current_track);
  });
});