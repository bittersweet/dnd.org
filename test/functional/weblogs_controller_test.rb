require 'test_helper'

class WeblogsControllerTest < ActionController::TestCase
  test "show" do
    u = Factory(:user)
    w = Factory(:weblog, :user_id => u)

    get :show, :id => w

    assert_response :success
  end

  test "index" do
    get :index

    assert_response :success
  end
end
