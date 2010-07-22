class OverviewController < ApplicationController

  def index
    @articles = Article.ordered.latest
    @artists  = Artist.ordered.regular
    @stats    = Statistic.playtime
    @tracks   = Track.ordered.regular.latest
  end

end
