class AddTypeToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :section, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :tracks, :section
  end
end
