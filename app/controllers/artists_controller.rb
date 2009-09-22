class ArtistsController < ApplicationController

  def index
    @artist = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @tracks = @artist.tracks.all
  end

end
