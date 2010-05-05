class RequiredlisteningController < ApplicationController

  def index
    @artists = Artist.requiredlistening

    respond_to do |format|
      format.html
      format.mobile do
        render :layout => 'application'
      end
    end
  end

  def show
    @artist = Artist.find(params[:id])
    @tracks = @artist.tracks.required_listening

    respond_to do |format|
      format.html
      format.mobile do
        render :layout => 'application'
      end
    end
  end

end
