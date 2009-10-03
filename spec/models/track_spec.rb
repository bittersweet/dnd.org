require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Track do
 
  before(:each) do
    @track = Factory.create(:valid_track)
  end

  it "should be valid" do
    @track.should be_valid
  end

  it "should not be valid without a name" do
    @track.name = ''
    @track.should_not be_valid
  end

  it "should not be valid without a description" do
    @track.description = ''
    @track.should_not be_valid
  end
  
  it "should not be valid without a artist_id" do
    @track.artist_id = ''
    @track.should_not be_valid
  end

end

