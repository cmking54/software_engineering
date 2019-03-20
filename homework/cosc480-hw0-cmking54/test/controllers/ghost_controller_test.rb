require 'test_helper'

class GhostControllerTest < ActionDispatch::IntegrationTest
  test "should get play" do
    get ghost_play_url
    assert_response :success
  end

end
