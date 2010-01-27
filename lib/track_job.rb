class TrackJob < Struct.new(:track)
  def perform
    track = Track.find(track)
    Twitterupdate::update("New track: #{track.title} http://denachtdienst.org/tracks/#{track.to_param}")
  end
end
