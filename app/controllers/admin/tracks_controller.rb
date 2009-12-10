class Admin::TracksController < ApplicationController
  before_filter :require_user
  before_filter :load_artist, :except => [:destroy, :index]

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(params[:track])
    mp3_info = Mp3Info.new(params[:track][:mp3].path)
    @track.length = mp3_info.length
    if @track.save
      @track.send_later(:twitterupdate)
      flash[:notice] = "Track saved"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
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

protected

  def load_artist
    @artist = Artist.all
  end


end
