class Track < ActiveRecord::Base

  def to_param
    "#{id}-#{name.parameterize}"
  end

  belongs_to :artist
  
  has_attached_file :mp3, :path => ":rails_root/public/audio/:id/:filename", :url => "/audio/:id/:filename"

  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :description, :message => "can't be blank"
  validates_presence_of :artist_id, :message => "can't be blank"

  validates_attachment_presence :mp3, :message => "Don't forget to select a mp3"
  # validates_attachment_content_type :mp3, :content_type => ['audio/mpeg'], :message => "Please only select audio files"

end
