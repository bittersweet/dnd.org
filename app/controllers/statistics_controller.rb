class StatisticsController < ApplicationController

  def index
    @recently_played = Statistic.ordered.latest.includes(:track)
    @most_played = Track.most_played.latest
  end
end
