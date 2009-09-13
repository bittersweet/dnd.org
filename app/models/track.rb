class Track < ActiveRecord::Base

  belongs_to :artist

  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_presence_of :description, :on => :create, :message => "can't be blank"
  validates_presence_of :artist_id, :on => :create, :message => "can't be blank"

end
