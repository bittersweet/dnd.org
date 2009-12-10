class RemoveFieldsFromStatistic < ActiveRecord::Migration
  def self.up
    remove_column :statistics, :played_at
    remove_column :statistics, :updated_at
  end

  def self.down
    add_column :statistics, :played_at
    add_column :statistics, :updated_at
  end
end
