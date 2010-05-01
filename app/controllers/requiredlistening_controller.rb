class RequiredlisteningController < ApplicationController

  def index
    @artists = Artist.requiredlistening
  end

  def show
    @artist = Artist.find(params[:id])
    @tracks = @artist.tracks.required_listening
  end

end
