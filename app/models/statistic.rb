class Statistic < ActiveRecord::Base

  belongs_to :track, :counter_cache => true

  validates_uniqueness_of :created_at, :scope => :ip

  def self.generate!(id, env)
    Statistic.create(:track_id => id,
                     :ip => env["REMOTE_ADDR"],
                     :browser => env['HTTP_USER_AGENT'],
                     :created_at => Time.now)
  end

end
