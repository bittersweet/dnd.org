class Statistic < ActiveRecord::Base

  belongs_to :track, :counter_cache => true

  # validates_uniqueness_of :played_at, :scope => :ip
  validate :single_statistics

  def self.generate!(id, env)
    Statistic.create(:track_id => id,
                     :ip => env["REMOTE_ADDR"],
                     :browser => env['HTTP_USER_AGENT'],
                     :played_at => Time.now)
  end


  def self.playtime
    t = Track.find(:all, :select => "length, statistics_count")
    array = []
    array2 = []
    t.each do |t|
      array.push t.length * t.statistics_count
      array2.push t.statistics_count
    end
    [array.sum, array2.sum]
  end

protected

  def single_statistics
    if Statistic.find(:first, :conditions => ["track_id = ? AND ip = ? AND played_at > ? AND played_at < ?", self.track_id, self.ip, self.played_at - 5.seconds, self.played_at + 5.seconds])
      errors[:base] << 'Duplicate time entry'
    end
  end

end
