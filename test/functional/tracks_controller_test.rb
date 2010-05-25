require 'test_helper'

class TracksControllerTest < ActionController::TestCase

  test "index" do
    get :index

    assert_response :success
  end

  test "show" do
    a = Factory(:artist)
    t = Factory(:track, :artist => a)

    get :show, :id => t

    assert_response :success
  end

end
