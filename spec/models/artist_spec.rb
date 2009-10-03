require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Artist do

  before(:each) do
    @artist = Factory.create(:valid_artist)
  end

  it "should be valid" do
    @artist.should be_valid
  end

  it "should not be valid without a name" do
    @artist.name = ''
    @artist.should_not be_valid
  end

  it "should not be valid without a bio" do
    @artist.bio = ''
    @artist.should_not be_valid
  end

end

