class WeblogsController < ApplicationController

  def show
    @weblog = Weblog.find(params[:id])
  end

  def index
    @weblog = Weblog.all.reverse
  end
  
end
