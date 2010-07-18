class RemoveUserFromWeblog < ActiveRecord::Migration
  def self.up
    remove_column :weblogs, :user_id
  end

  def self.down
    add_column :weblogs, :user_id, :integer
  end
end
