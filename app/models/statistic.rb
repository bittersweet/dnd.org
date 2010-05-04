class Statistic < ActiveRecord::Base

  belongs_to :track, :counter_cache => true

  # validates_uniqueness_of :played_at, :scope => :ip

  def validate
    if Statistic.find(:first, :conditions => ["played_at > ? AND played_at < ?", (DateTime.now - 5.seconds - 2.hours), (DateTime.now + 5.seconds - 2.hours)])
      errors.add_to_base "fail"
    end
  end

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

end
