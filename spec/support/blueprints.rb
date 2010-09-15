require 'machinist/active_record'

Article.blueprint do
  title   { "Article #{sn}" }
  content { "Lorem ipsum" }
end

Artist.blueprint do
  name    { "Artist #{sn}" }
  bio     { 'Lorem ipsum' }
  section { 1 }
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
  section          { 1 }
  mp3_file_name    { "track_#{sn}.mp3" }
  mp3_content_type { 'audio/mpeg' }
  length           { 200 }
end

User.blueprint do
  email { "user_#{sn}@test.com" }
  password { "user_#{sn}_pass" }
end
