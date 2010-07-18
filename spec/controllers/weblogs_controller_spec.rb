require 'spec_helper'

describe WeblogsController do
  before do
    @weblog = Weblog.make!
  end

  it "should render index" do
    get :index
    response.should be_success
  end

  it "should render show" do
    get :show, :id => @weblog
    response.should be_success
  end
end
