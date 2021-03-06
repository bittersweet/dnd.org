class TrackJob < Struct.new(:track_id)
  def perform
    track = Track.find(track_id)
    Twitterupdate::update("New track: #{track.name} http://denachtdienst.org/tracks/#{track.to_param}")
  end
end
