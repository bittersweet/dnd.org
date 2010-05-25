# Sequences
Factory.sequence(:weblog_name) { |n| "Weblog #{n}" }
Factory.sequence(:artist_name) { |n| "Artist #{n}" }
Factory.sequence(:track_name)  { |n| "Track #{n}" }

# Factories

Factory.define :user do |u|
  u.email { "test@test.com" }
end

Factory.define :artist do |a|
  a.name { Factory.next(:artist_name) }
  a.bio  { 'biography' }
end

Factory.define :track do |t|
  t.name      { Factory.next(:track_name) }
  t.artist_id { |t| t.association(:artist) }
  t.mp3 { 'test' }
  t.mp3_file_name { 'test' }
  t.mp3_content_type { 'audio/mpeg' }
  t.mp3_file_size { 'test' }
end

Factory.define :weblog do |w|
  w.user_id { |w| w.association(:user) }
  w.title   { Factory.next(:weblog_name) }
  w.content { 'test' }
end
