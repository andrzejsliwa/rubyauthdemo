require 'test_helper'

class AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get callback" do
    get auth_callback_url
    assert_response :success
  end

  test "should get failure" do
    get auth_failure_url
    assert_response :success
  end

end
