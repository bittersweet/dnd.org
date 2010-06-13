class Admin::WeblogsController < ApplicationController
  before_filter :authenticate_user!

  layout 'admin'

  def index
    @weblog = Weblog.all.reverse
  end

  def new
    @weblog = Weblog.new
  end

  def create
    @weblog = Weblog.new(params[:weblog])
    if @weblog.save
      flash[:notice] = "Weblog post created"
      redirect_to admin_weblogs_path
    else
      render :new
    end
  end

  def edit
    @weblog = Weblog.find(params[:id])
  end

  def update
    @weblog = Weblog.find(params[:id])
    if @weblog.update_attributes(params[:weblog])
      redirect_to admin_weblogs_path
    else
      render "edit"
    end
  end

  def destroy
    @weblog = Weblog.find(params[:id])
    @weblog.destroy
    redirect_to :back
    flash[:notice] = "Post verwijderd"
  end

end
