require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get oauth" do
    get :oauth
    assert_response :success
  end

  test "should get oauth_c" do
    get :oauth_c
    assert_response :success
  end

end
