require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Artist do

  it "should succeed creating a new :valid_artist from the Factory" do
    Factory.create(:valid_artist)
  end

  it "should invalid :invalid_artist factory" do
    Factory.build(:invalid_artist).should be_invalid
  end
end
