require 'spec_helper'

describe Artist do
  it "should not be valid without name" do
    artist = Artist.make(:name => nil)
    artist.should_not be_valid
  end

  it "should not be valid without bio" do
    artist = Artist.make(:bio => nil)
    artist.should_not be_valid
  end

  it "should not be valid without section" do
    artist = Artist.make(:section => nil)
    artist.should_not be_valid
  end

end
