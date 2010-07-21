class Artist < ActiveRecord::Base

  attr_accessible :name, :bio, :section

  def to_param
    "#{id}-#{name.parameterize}"
  end

  has_many :tracks, :dependent => :destroy

  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :bio, :message => "can't be blank"
  validates_presence_of :section, :message => "can't be blank"

  has_attached_file :avatar, :styles => {:medium => "280x280"},
                    :convert_options => {:all => "-strip"},
                    :path => ":rails_root/public/artists/:id/:style/:filename",
                    :url => "/artists/:id/:style/:filename"

  # validates_attachment_presence :avatar, :message => "Don't forget to include an image"
  # validates_attachment_content_type :avatar, :content_type => ['audio/mpeg', 'audio/mpg', 'audio/mp3'], :message => "Please only select audio files"

  default_scope :order => 'name ASC'

  scope :regular, :conditions => "section = 1"
  scope :requiredlistening, :conditions => "section = 2"

  def has_tracks?
    tracks.regular.count > 0
  end

end
