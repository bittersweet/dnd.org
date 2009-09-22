class Artist < ActiveRecord::Base
  
  has_many :tracks
  
  validates_presence_of :name, :on => :save, :message => "can't be blank"
  validates_presence_of :bio, :on => :save, :message => "can't be blank"

end
