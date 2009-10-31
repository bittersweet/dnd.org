class RenamePlaycount < ActiveRecord::Migration
  def self.up
    rename_column :tracks, :playcount, :statistics_count
  end

  def self.down
    rename_column :tracks, :statistics_count, :playcount
  end
end
