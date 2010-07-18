require File.dirname(__FILE__) + '/acceptance_helper'

feature "Feature name", %q{
  In order to display existing artists
  As a user
  I want to list artists
} do

  scenario "Artist index" do
    @artist = Artist.make!

    visit artists_index

    page.should have_css('#artistlist')
    page.should have_css('.artist')
    page.should have_content(@artist.name)
  end

  scenario "Artist show" do
    @artist = Artist.make!

    visit artist_show(@artist.id)

    page.should have_content(@artist.name)
  end
end
