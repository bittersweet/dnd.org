require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Artist do

  it "should succeed when creating a new valid_artist" do
    Factory.create(:valid_artist)
  end

  it "should be invalid when creating a invalid artist" do
    Factory.build(:invalid_artist).should be_invalid
  end
end

