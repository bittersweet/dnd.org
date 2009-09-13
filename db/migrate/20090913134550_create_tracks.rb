class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.string   "name"
      t.integer  "artist_id"
      t.string   "mp3_file_name"
      t.string   "mp3_content_type"
      t.string   "mp3_file_size"
      t.string   "description"
      t.integer  "playcount"
      t.timestamps
    end
  end

  def self.down
    drop_table :tracks
  end
end
