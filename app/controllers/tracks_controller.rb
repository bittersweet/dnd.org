class TracksController < ApplicationController
  
  def show
    @track = Track.find(params[:id])
  end
  
  def index
    @track = Track.all.reverse
  end
  
end
