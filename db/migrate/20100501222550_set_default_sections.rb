class SetDefaultSections < ActiveRecord::Migration
  def self.up
    Track.all.each do |t|
      t.update_attribute(:section, 1)
    end

    Artist.all.each do |a|
      a.update_attribute(:section, 1)
    end
  end

  def self.down
  end
end
