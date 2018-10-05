require 'test_helper'

class GameshousaiControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get gameshousai_home_url
    assert_response :success
  end

end
