class Track < ActiveRecord::Base

  def to_param
    "#{id}-#{name.parameterize}"
  end

  belongs_to :artist
  has_many :statistics
  
  has_attached_file :mp3, :path => ":rails_root/public/audio/:id/:filename", :url => "/audio/:id/:filename"

  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :description, :message => "can't be blank"
  validates_presence_of :artist_id, :message => "can't be blank"

  validates_attachment_presence :mp3, :message => "Don't forget to select a mp3"
  # validates_attachment_content_type :mp3, :content_type => ['audio/mpeg'], :message => "Please only select audio files"

  def update_playcount(env)
    s = Statistic.find_by_track_id(id, :conditions => ["played_at >= '#{30.seconds.ago.utc.strftime("%Y-%m-%d %H:%M:%S")}' AND played_at < '#{1.minute.from_now.utc.strftime("%Y-%m-%d %H:%M:%S")}'"])
    unless s
      Statistic.create(:track_id => id,
                       :ip => env["REMOTE_ADDR"],
                       :browser => env['HTTP_USER_AGENT'],
                       :played_at => Time.now)
    end
  end

end
