require 'spec_helper'

describe ArtistsController do
  before do
    @artist = Artist.make!
  end

  it "should render index" do
    get :index
    response.should be_success
  end

  it "should render show" do
    get :show, :id => @artist.id
    response.should be_success
  end
end
