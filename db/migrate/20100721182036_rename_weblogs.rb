class RenameWeblogs < ActiveRecord::Migration
  def self.up
    rename_table :weblogs, :articles
  end

  def self.down
    rename_table :articles, :weblogs
  end
end
