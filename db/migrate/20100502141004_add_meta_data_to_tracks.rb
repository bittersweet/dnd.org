class AddMetaDataToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :artistlink, :string
    add_column :tracks, :buylink, :string
  end

  def self.down
    remove_column :tracks, :artistlink
    remove_column :tracks, :buylink
  end
end
