class WeblogsController < ApplicationController

  def show
    @weblog = Weblog.find(params[:id])
  end

  def index
    @weblogs = Weblog.all
  end

end
