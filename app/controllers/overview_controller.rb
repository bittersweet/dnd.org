class OverviewController < ApplicationController

  def index
    @artists = Artist.all
    @tracks = Track.latest
    @weblogs = Weblog.latest

    @stats = Statistic.playtime
  end

end
