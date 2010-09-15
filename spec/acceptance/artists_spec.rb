require File.dirname(__FILE__) + '/acceptance_helper'

feature "Feature name", %q{
  In order to display artists
  As a user
  I want to list and manage artists
} do

  scenario "Artist index" do
    @artist = Artist.make!

    visit artists_index

    page.should have_content(@artist.name)
  end

  scenario "Artist show" do
    @artist = Artist.make!

    visit artist_show(@artist.id)

    page.should have_content(@artist.name)
  end

  scenario "Create artist" do
    admin_login

    visit artists_overview

    click 'New'
    fill_in 'artist_name', :with => 'Artist 1'
    fill_in 'artist_bio', :with => 'Artist bio'
    click 'artist_submit'

    page.should have_content('Artist was successfully created.')
    page.should have_content('Artist 1')
  end

  scenario "Edit artist" do
    admin_login

    @artist = Artist.make!

    visit artists_overview
    within("//tr[@id='artist_#{@artist.id}']") do
      click "Edit"
    end

    page.should have_content('Edit artist')
    fill_in 'artist_name', :with => 'Artist edit'
    fill_in 'artist_bio', :with => 'Artist bio edit'
    click 'artist_submit'

    page.should have_content('Artist was successfully updated.')
  end

  scenario "Delete artist" do
    admin_login

    @artist = Artist.make!

    visit artists_overview
    within("//tr[@id='artist_#{@artist.id}']") do
      click "Delete"
    end

    current_path.should == artists_overview

    page.should have_content('Artist was successfully deleted.')
    page.should_not have_content(@artist.name)
  end
end
