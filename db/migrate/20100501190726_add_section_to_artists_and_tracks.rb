class AddSectionToArtistsAndTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :section, :integer, :default => 0, :null => false
    add_column :artists, :section, :integer, :default => 0, :null => false

    add_index :tracks, :section
    add_index :artists, :section
  end

  def self.down
    remove_column :tracks, :section
    remove_column :artists, :section

    remove_index :tracks, :section
    remove_index :artists, :section
  end
end
