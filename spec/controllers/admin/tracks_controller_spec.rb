require 'spec_helper'

describe Admin::TracksController do
  include Devise::TestHelpers

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end

  before(:each) do
    request.env['warden'] = mock_model(Warden, :authenticate => mock_user,
                                       :authenticate! => mock_user)
    User.make!(:password => 'test')

    @artist = Artist.make!
    @track = Track.make!(:artist => @artist)
  end

  it "should render index" do
    get :index
    response.should be_success
  end

  it "should create a track" do
    Track.destroy_all

    post :create, :track => {
      :mp3 => File.new(Rails.root + 'spec/fixtures/track.mp3'),
      :artist_id => @artist.id,
      :section => 1,
      :name => 'track title'
    }
    response.should be_redirect

    Track.count.should == 1
    Track.last.name.should == 'track title'
  end

  it "should render edit" do
    get :edit, :id => @track
    response.should be_success
  end

  it "should update a track" do
    post :update, :id => @track, :track => {
      :name => 'updated track'
    }
    response.should be_redirect
    Track.last.name.should == 'updated track'
  end

  it "should destroy a track" do
    post :destroy, :id => @track
    response.should be_redirect
    Track.count.should == 0
  end

end
