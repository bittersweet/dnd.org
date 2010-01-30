class RenameCreatedAtToPlayedAt < ActiveRecord::Migration
  def self.up
    rename_column :statistics, :created_at, :played_at
  end

  def self.down
    rename_column :tracks, :played_at, :created_at
  end
end
