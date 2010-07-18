require 'spec_helper'

describe Statistic do
  it "should give played statistics" do
    @artist = Artist.make!
    @track = Track.make!(:artist => @artist)

    Statistic.make!(:track => @track)
    Statistic.make!(:track => @track, :played_at => 1.day.ago)
    Statistic.make!(:track => @track, :played_at => 2.days.ago)

    statistics = Statistic.playtime
    statistics["total_seconds"].should == 600
    statistics["total_plays"].should == 3
  end
end
