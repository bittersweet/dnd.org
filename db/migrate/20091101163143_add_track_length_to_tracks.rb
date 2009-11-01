class AddTrackLengthToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :length, :int
  end

  def self.down
    remove_column :tracks, :length
  end
end
