class OverviewController < ApplicationController

  def index
    @artists = Artist.all
    @tracks = Track.find(:all, :limit => 10, :order => 'id DESC')
    @weblogs = Weblog.find(:all, :limit => 10, :order => 'id DESC')
  end

end
