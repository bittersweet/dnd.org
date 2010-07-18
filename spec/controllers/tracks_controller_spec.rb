require 'spec_helper'

describe TracksController do
  before do
    @artist = Artist.make!
    @track = Track.make!(:artist => @artist)
  end

  it "should render index" do
    get :index
    response.should be_success
  end

  it "should render show" do
    get :show, :id => @track.id
    response.should be_success
  end

  it "should update playcount" do
    controller.should_receive(:send_file)

    get :download, :id => @track.id
    response.should be_success

    assert_equal 1, Statistic.count
  end
end
