require File.dirname(__FILE__) + '/acceptance_helper'

feature "Feature name", %q{
  In order to see activity on the site
  As a admin
  I want to see the latest played tracks
} do

  scenario "Overview page" do
    admin_login

    @track = Track.make(:artist => Artist.make!)
    @statistic = Statistic.make!(:track => @track)

    visit admin_overview

    page.should have_content(@track.name)
  end
end
