require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get login_home_url
    assert_response :success
  end

end
