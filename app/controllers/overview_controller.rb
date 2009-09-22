class OverviewController < ApplicationController

  def index
    @artists = Artist.all
    @tracks = Track.all.reverse
    @weblogs = Weblog.all.reverse
  end

end
