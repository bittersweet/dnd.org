class Admin::ArticlesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_sub_tab, :only => [:edit, :index]
  before_filter :find_article, :only => [:edit, :update, :destroy]

  layout 'admin'

  def index
    @articles = Article.ordered
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.save
    respond_with :admin, @article
  end

  def edit

  end

  def update
    @article.update_attributes(params[:article])
    respond_with :admin, @article
  end

  def destroy
    @article.destroy
    respond_with :admin, @article
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

end
