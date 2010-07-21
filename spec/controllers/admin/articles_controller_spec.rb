require 'spec_helper'

describe Admin::ArticlesController do
  before(:each) do
    login
    @article = Article.make!
  end

  it "should render index" do
    get :index
    response.should be_success
  end

  it "should create an article" do
    Article.destroy_all

    post :create, :article => {
      :title => 'article title',
      :content => 'lorem ipsum'
    }
    response.should be_redirect

    Article.count.should == 1
    Article.last.title.should == 'article title'
  end

  it "should render edit" do
    get :edit, :id => @article
    response.should be_success
  end

  it "should update an article" do
    post :update, :id => @article, :article => {
      :title => 'updated article',
      :content => 'updated content'
    }
    response.should be_redirect
    Article.last.title.should == 'updated article'
    Article.last.content.should == 'updated content'
  end

  it "should destroy an article" do
    post :destroy, :id => @article
    response.should be_redirect
    Article.count.should == 0
  end

end
