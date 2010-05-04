require 'test_helper'

class StatisticTest < ActiveSupport::TestCase

  test "should not create double statistics" do
    Statistic.create(:track_id => 1, :ip => '127.0.0.1', :browser => 'test', :played_at => Time.now)
    Statistic.create(:track_id => 1, :ip => '127.0.0.1', :browser => 'test', :played_at => Time.now + 1.second)

    assert_equal 1, Statistic.count
  end

end
