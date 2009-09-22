class Artist < ActiveRecord::Base
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
  has_many :tracks
  
  validates_presence_of :name, :on => :save, :message => "can't be blank"
  validates_presence_of :bio, :on => :save, :message => "can't be blank"

end
