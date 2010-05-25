require 'test_helper'

class OverviewControllerTest < ActionController::TestCase

  test "index" do
    get :index

    assert_response :success
  end

end
