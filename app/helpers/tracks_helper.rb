module TracksHelper

  def time_since(time)
    (Time.now - time).to_i / (60*60*24)
  end

end
