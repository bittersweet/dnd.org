class CreateWeblogs < ActiveRecord::Migration
  def self.up
    create_table :weblogs do |t|
      t.string    "title"
      t.text      "content"
      t.integer   "user_id"
      t.timestamps
    end
  end

  def self.down
    drop_table :weblogs
  end
end
