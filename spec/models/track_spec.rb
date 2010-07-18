require 'spec_helper'

describe Track do
  it "should be invalid without a title" do
    @track = Track.new
    @track.should_not be_valid
  end
end
