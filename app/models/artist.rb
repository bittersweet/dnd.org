class Artist < ActiveRecord::Base

  def to_param
    "#{id}-#{name.parameterize}"
  end

  has_many :tracks

  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :bio, :message => "can't be blank"

  default_scope :order => 'name ASC'


  def has_tracks?
    tracks.regular.count > 0
  end

end
