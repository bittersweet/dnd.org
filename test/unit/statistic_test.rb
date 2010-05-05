require 'test_helper'

class StatisticTest < ActiveSupport::TestCase

  test "should not create double statistics" do
    Statistic.create(:track_id => 1, :ip => '127.0.0.1', :browser => 'test', :played_at => Time.now)
    Statistic.create(:track_id => 1, :ip => '127.0.0.2', :browser => 'test', :played_at => Time.now)
    Statistic.create(:track_id => 1, :ip => '127.0.0.1', :browser => 'test', :played_at => Time.now + 1.day)
    Statistic.create(:track_id => 1, :ip => '127.0.0.1', :browser => 'test', :played_at => Time.now + 2.seconds)
    Statistic.create(:track_id => 1, :ip => '127.0.0.1', :browser => 'test', :played_at => Time.now - 4.seconds)

    assert_equal 3, Statistic.count
  end

end
