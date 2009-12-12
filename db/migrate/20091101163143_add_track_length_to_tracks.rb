class AddTrackLengthToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :length, :integer
  end

  def self.down
    remove_column :tracks, :length
  end
end
