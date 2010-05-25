require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase

  test "index" do
    get :index

    assert_response :success
  end

  test "show" do
    a = Factory(:artist)

    get :show, :id => a.id

    assert_response :success
  end

end
