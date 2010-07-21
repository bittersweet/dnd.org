class OverviewController < ApplicationController

  def index
    @articles = Article.latest
    @artists  = Artist.regular
    @stats    = Statistic.playtime
    @tracks   = Track.regular.latest
  end

end
