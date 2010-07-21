require 'spec_helper'

describe Admin::ArtistsController do
  before(:each) do
    login
    @artist = Artist.make!
  end

  it "should render index" do
    get :index
    response.should be_success
  end

  it "should create a artist" do
    Artist.destroy_all

    post :create, :artist => {
      :name => 'artist name',
      :bio => 'bio'
    }
    response.should be_redirect

    Artist.count.should == 1
    Artist.last.name.should == 'artist name'
  end

  it "should render edit" do
    get :edit, :id => @artist
    response.should be_success
  end

  it "should update a artist" do
    post :update, :id => @artist, :artist => {
      :name => 'updated artist'
    }
    response.should be_redirect
    Artist.last.name.should == 'updated artist'
  end

  it "should destroy a artist" do
    post :destroy, :id => @artist
    response.should be_redirect
    Artist.count.should == 0
  end

end
