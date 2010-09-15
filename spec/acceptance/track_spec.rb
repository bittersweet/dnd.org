require File.dirname(__FILE__) + '/acceptance_helper'

feature "Track", %q{
  In order to display tracks
  As a user
  I want to list and manage tracks
} do

  scenario "Track index" do
    @track = Track.make!(:artist => Artist.make!)

    visit tracks_index

    current_path.should == "/tracks"

    page.should have_content(@track.name)
  end

  scenario "Track show" do
    @track = Track.make!(:artist => Artist.make!)

    visit track_show(@track.id)

    page.should have_content(@track.name)
  end

  scenario "Create track" do
    admin_login

    @artist = Artist.make!

    visit tracks_overview
    click 'New'
    fill_in 'track_name', :with => 'Track 1'
    select "#{@artist.name}", :from => 'track_artist_id'
    attach_file "track_mp3", File.join(::Rails.root, "spec/fixtures/track.mp3")

    click 'track_submit'

    page.should have_content("Track was successfully created.")
  end

  scenario "Edit track" do
    admin_login

    @track = Track.make!(:artist => Artist.make!)
    visit tracks_overview
    within("//tr[@id='track_#{@track.id}']") do
      click "Edit"
    end

    page.should have_content('Edit track')
    fill_in 'track_name', :with => 'Artist track'
    click 'track_submit'

    page.should have_content('Track was successfully updated.')
  end

  scenario "Delete track" do
    admin_login

    @track = Track.make!(:artist => Artist.make!)

    visit tracks_overview
    within("//tr[@id='track_#{@track.id}']") do
      click "Delete"
    end

    current_path.should == tracks_overview

    page.should have_content('Track was successfully deleted.')
    page.should_not have_content(@track.name)
  end
end
