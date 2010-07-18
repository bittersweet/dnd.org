require 'spec_helper'

describe OverviewController do
  it "should render overview" do
    @artist = Artist.make!
    Track.make!(:artist => @artist)

    get :index
    response.should be_success
  end
end
