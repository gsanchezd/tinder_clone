require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get complete_profile" do
    get :complete_profile
    assert_response :success
  end

  test "should get save_profile" do
    get :save_profile
    assert_response :success
  end

end
