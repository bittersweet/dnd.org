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
    if @article.save
      flash[:notice] = "Article created"
      redirect_to admin_articles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update_attributes(params[:article])
      redirect_to admin_articles_path
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_path
    flash[:notice] = "Article deleted"
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

end
