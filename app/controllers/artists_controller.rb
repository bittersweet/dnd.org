class ArtistsController < ApplicationController

  def index
    @artists = Artist.regular
  end

  def show
    @artist = Artist.find(params[:id])
    @tracks = @artist.tracks.ordered.regular
  end

end
