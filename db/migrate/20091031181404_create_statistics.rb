class CreateStatistics < ActiveRecord::Migration
  def self.up
    create_table :statistics do |t|
      t.integer  :track_id
      t.string   :ip
      t.string   :browser
      t.datetime :played_at

      t.timestamps
    end
  end

  def self.down
    drop_table :statistics
  end
end
