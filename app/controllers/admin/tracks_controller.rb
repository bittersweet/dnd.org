class Admin::TracksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_artist, :except => [:destroy, :index]

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(params[:track])
    if @track.save
      flash[:notice] = "Track saved"
      redirect_to admin_tracks_path
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
    @track = Track.all
  end

protected

  def load_artist
    @artist = Artist.all
  end


end
