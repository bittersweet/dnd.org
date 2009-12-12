class Statistic < ActiveRecord::Base

  belongs_to :track, :counter_cache => true

  validates_uniqueness_of :created_at, :scope => :ip

  def self.generate!(id, env)
    Statistic.create(:track_id => id,
                     :ip => env["REMOTE_ADDR"],
                     :browser => env['HTTP_USER_AGENT'],
                     :created_at => Time.now)
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
