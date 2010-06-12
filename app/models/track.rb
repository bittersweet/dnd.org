class Track < ActiveRecord::Base

  def to_param
    "#{id}-#{name.parameterize}"
  end

  belongs_to :artist
  has_many :statistics

  validates_presence_of :section
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :artist_id, :message => "can't be blank"

  has_attached_file :mp3, :path => ":rails_root/public/audio/:id/:filename", :url => "/audio/:id/:filename"
  validates_attachment_presence :mp3, :message => "Don't forget to select a mp3"
  validates_attachment_content_type :mp3, :content_type => ['audio/mpeg', 'audio/mpg', 'audio/mp3'], :message => "Please only select audio files"

  default_scope :order => 'created_at DESC'
  scope :latest, :limit => 10

  scope :regular, :conditions => "section = 1"
  scope :required_listening, :conditions => "section = 2"

  def update_playcount(env)
    Statistic.generate!(id, env)
  end

  def is_regular?
    section == 1
  end

protected

  # Will only execute callback if the length is nil, otherwise it will loop
  after_save :read_mp3, :if => "self.length.nil?"
  def read_mp3
    update_attribute(:length, Mp3Info.new(self.mp3.path).length)
  end

  after_create :update_twitter, :if => :is_regular?
  def update_twitter
    Delayed::Job.enqueue(TrackJob.new(id))
  end

end
