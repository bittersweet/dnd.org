class OverviewController < ApplicationController

  def index
    @artists = Artist.regular
    @tracks = Track.regular.latest
    @weblogs = Weblog.latest
    @stats = Statistic.playtime
  end

end
