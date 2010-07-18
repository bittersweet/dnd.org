require 'machinist/active_record'

Artist.blueprint do
  name { "Artist #{sn}" }
  bio  { 'Lorem ipsum' }
end

Statistic.blueprint do
  track
  ip        { '127.0.0.1' }
  browser   { 'testing' }
  played_at { Time.now }
end

Track.blueprint do
  artist
  name             { "Track #{sn}" }
  section 0
  mp3_file_name    { "track_#{sn}.mp3" }
  mp3_content_type { 'audio/mpeg' }
  length           { 200 }
end

Weblog.blueprint do
  title   { "Weblog #{sn}" }
  content { "Lorem ipsum" }
end

User.blueprint do
  email { "user_#{sn}@test.com" }
end
