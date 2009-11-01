class Admin::TracksController < ApplicationController
  before_filter :require_user

  def new
    @track = Track.new
    @artist = Artist.all
  end
  
  def create
    @artist = Artist.all
    @track = Track.new(params[:track])
    if @track.save
      @track.send_later(:twitterupdate)
      flash[:notice] = "Track saved"
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
    @artist = Artist.all
    @track = Track.find(params[:id])
  end
  
  def update
    @artist = Artist.all
    @track = Track.find(params[:id])
    if @track.update_attributes(params[:track])
      redirect_to admin_tracks_path
    else
      render "edit"
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
