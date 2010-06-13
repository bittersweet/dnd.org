class Statistic < ActiveRecord::Base

  belongs_to :track, :counter_cache => true

  validate :single_statistics

  def self.generate!(id, env)
    Statistic.create(:track_id => id,
                     :ip => env["REMOTE_ADDR"],
                     :browser => env['HTTP_USER_AGENT'],
                     :played_at => Time.now)
  end


  def self.playtime
    t = Track.select("length, statistics_count")

    t.inject({"total_plays" => 0, "total_seconds" => 0}) do |r, i|
      r["total_plays"] += i.statistics_count
      r["total_seconds"] += (i.statistics_count * i.length)
      r
    end
  end

protected

  def single_statistics
    if Statistic.find(:first, :conditions => ["track_id = ? AND ip = ? AND played_at > ? AND played_at < ?", self.track_id, self.ip, self.played_at - 5.seconds, self.played_at + 5.seconds])
      errors[:base] << 'Duplicate time entry'
    end
  end

end
