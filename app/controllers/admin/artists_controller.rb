class Admin::ArtistsController < ApplicationController

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(params[:artist])
    if @artist.save
      flash[:notice] = "Artist saved"
      redirect_to admin_artists_path
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to :back
    flash[:notice] = "Artist deleted"
  end
  
  def index
    @artist = Artist.all
  end

end
