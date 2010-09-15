class Admin::ArtistsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_sub_tab, :only => [:edit, :index]
  before_filter :find_artist, :only => [:edit, :update, :destroy]

  layout 'admin'

  def index
    @artists = Artist.ordered
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(params[:artist])
    @artist.save
    respond_with(:admin, @artist)
  end

  def edit
  end

  def update
    @artist.update_attributes(params[:artist])
    respond_with(:admin, @artist)
  end

  def destroy
    @artist.destroy
    respond_with(:admin, @artist)
  end

  protected

  def find_artist
    @artist = Artist.find(params[:id])
  end

end
