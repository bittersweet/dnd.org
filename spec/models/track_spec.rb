require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Track do

  it "should succeed creating a new :valid_track from the Factory" do
    Factory.create(:valid_track)
  end

  it "should invalid :invalid_track factory" do
    Factory.build(:invalid_track).should be_invalid
  end
end
