require 'spec_helper'

describe ArticlesController do
  before do
    @article = Article.make!
  end

  it "should render index" do
    get :index
    response.should be_success
  end

  it "should render show" do
    get :show, :id => @article
    response.should be_success
  end
end
