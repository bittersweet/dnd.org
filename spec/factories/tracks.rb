Factory.define :valid_track, :class => Track do |t|
  t.name "Track title"
  t.description "Track description"
  t.artist_id 1
  t.mp3_file_name "Track mp3 file"
end

Factory.define :invalid_track, :class => Track do |t|
end

