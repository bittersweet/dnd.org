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
  
  def edit
    @artist = Artist.find(params[:id])
  end
  
  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      redirect_to artist_path(params[:id])
    else
      render "edit"
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
