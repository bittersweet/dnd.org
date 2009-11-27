class WeblogsController < ApplicationController

  def show
    @weblog = Weblog.find(params[:id])
  end

  def index
    @weblogs = Weblog.paginate(:page => params[:page], :per_page => 8, :order => 'created_at DESC')
  end
  
end
