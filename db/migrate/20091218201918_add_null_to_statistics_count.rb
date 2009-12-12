class AddNullToStatisticsCount < ActiveRecord::Migration
  def self.up
    change_column :tracks, :statistics_count, :integer, :default => 0
  end

  def self.down
    change_column :tracks, :statistics_count, :integer
  end
end
