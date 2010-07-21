require 'spec_helper'

describe Admin::OverviewController do

  before(:each) do
    login
  end

  it "should render index" do
    get :index
    response.should be_success
  end

end
