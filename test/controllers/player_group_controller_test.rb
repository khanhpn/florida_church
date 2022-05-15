require "test_helper"

class PlayerGroupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get player_group_index_url
    assert_response :success
  end
end
