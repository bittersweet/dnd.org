require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Track do

  it "should succeed when creating a new valid_track" do
    Factory.create(:valid_track)
  end

  it "should be invalid when creating a invalid_track" do
    Factory.build(:invalid_track).should be_invalid
  end
end

