Given /^I have tracks titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Track.create!(:name => title, :artist_id => "1", :description => title, :mp3_file_name => "test.mp3" )
  end
end

Given /^I have an artist named "([^\"]*)"$/ do |name|
  Artist.create!(:name => name, :bio => name)
end
