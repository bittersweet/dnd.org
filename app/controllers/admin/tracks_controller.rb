class Admin::TracksController < ApplicationController
  before_filter :load_artist, :except => [:index, :destroy]
  before_filter :set_sub_tab, :only => [:index, :edit]
  before_filter :find_track, :only => [:edit, :update, :destroy]

  layout 'admin'

  respond_to :html

  def index
    @tracks = Track.ordered
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(params[:track])
    @track.save
    respond_with :admin, @track
  end

  def edit
  end

  def update
    @track.update_attributes(params[:track])
    respond_with :admin, @track
  end

  def destroy
    @track.destroy
    respond_with :admin, @track
  end

protected

  def load_artist
    @artists = Artist.all
  end

  def find_track
    @track = Track.find(params[:id])
  end

end
