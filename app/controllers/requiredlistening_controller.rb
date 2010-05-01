class RequiredlisteningController < ApplicationController

  def show
    @artist = Artist.find(params[:id])
    @tracks = @artist.tracks.required_listening
  end

end
