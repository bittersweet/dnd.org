$(document).ready(function(){

  var song_title = $("#player_song_title");

  function setActive(current_track) {
    $("li.active").removeClass("active")
    $("#" + current_track).addClass("active")
  }

  function nextTrack(current_track) {
    var nexttrack = current_track + 1;
    setActive("track-" + nexttrack);
    var trackname = $("#track-" + nexttrack + " h2").html();
    var nexttrack_url = $("#track-" + nexttrack + " a.play").attr("href");
    /* If there are no more tracks to play */
    if (nexttrack_url == undefined) {
      $("#player").slideUp();
      return false;
    }
    setsongtitle(trackname);
    playtrack(nexttrack_url);
  }

  function prevTrack(current_track) {
    var prevtrack = current_track - 1;
    if (prevtrack < 10) {
      prevtrack = prevtrack.charAt(1);
    }
    var trackname = $("track-" + prevtrack + " h2").html();
    var prevtrack_url = $("#track-" + prevtrack + " a.play").attr("href");
    setsongtitle(trackname);
    playtrack(prevtrack_url);
  }

  function setsongtitle(title) {
    song_title.html(title);
  }

  function playtrack(trackurl ) {
    $("#jplayer").jPlayer("setFile", trackurl).jPlayer("play");
  }

  $("li.track").click(function(event) {
    $("#player").slideDown();
    var $this = $(this);
    setActive($this.attr("id"));
    var id = "#" + $this.attr("id") + " a.play";
    var trackname = $this.children().html();
    var trackurl = $(id).attr("href");
    setsongtitle(trackname);
    playtrack(trackurl);
  });

  $("a.play").click(function(event) {
    event.preventDefault();
    $("#player").slideDown();
    var $this = $(this);
    var trackname = $this.prev().html();
    var trackurl = $this.attr("href");
    setsongtitle(trackname);
    playtrack(trackurl);
  });

	$("#jplayer").jPlayer({
		ready: function () {},
		volume: 50,
		oggSupport: false,
    /* disable html5 support for now */
    nativeSupport: false,
	})
	.jPlayer("onProgressChange", function(loadPercent, playedPercentRelative, playedPercentAbsolute, playedTime, totalTime) {
		$("#play_time").text($.jPlayer.convertTime(playedTime));
		// $("#total_time").text($.jPlayer.convertTime(totalTime));
	})
	.jPlayer("onSoundComplete", function() {
    var current_track = $("#player_song_title a").attr("id");
    nextTrack(parseInt(current_track));
	});
});
