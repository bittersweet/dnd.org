class Track < ActiveRecord::Base

  def to_param
    "#{id}-#{name.parameterize}"
  end

  belongs_to :artist

  validates_presence_of :name, :on => :save, :message => "can't be blank"
  validates_presence_of :description, :on => :save, :message => "can't be blank"
  validates_presence_of :artist_id, :on => :save, :message => "can't be blank"

end
