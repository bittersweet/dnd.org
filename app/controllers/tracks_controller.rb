class TracksController < ApplicationController

  def index
    @tracks = Track.regular
  end

  def show
    @track  = Track.find(params[:id])
    @artist = @track.artist
    @tracks = @artist.tracks.reject { |t| t == @track }
  end

  def download
    render :nothing => true
    @track = Track.find(params[:id])
    @track.update_playcount(request.env)
    send_file @track.mp3.path, :type => @track.mp3.content_type, :disposition => 'attachment'
  end

end
