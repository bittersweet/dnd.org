atom_feed do |feed|
  feed.title("deNachtdienst.org tracks")
  feed.updated(@tracks.first.updated_at)
    
  for track in @tracks
    feed.entry(track) do |entry|
      entry.title(track.name)
      entry.content(track.description, :type => 'html')
      entry.author(track.artist_id)
    end
  end
end
