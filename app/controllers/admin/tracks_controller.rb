class Admin::TracksController < ApplicationController
  # before_filter :require_user, :only => :new

  def new
    @track = Track.new
    @artist = Artist.all
  end
  
  def create
    @artist = Artist.all
    @track = Track.new(params[:track])
    if @track.save
      flash[:notice] = "Track saved"
      redirect_to root_path
    else
      render :new
    end
  end
  
  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to :back
    flash[:notice] = "Track verwijderd"
  end
  
  def index
    @track = Track.all.reverse
  end

end
