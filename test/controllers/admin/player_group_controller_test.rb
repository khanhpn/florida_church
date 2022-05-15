require "test_helper"

class Admin::PlayerGroupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_player_group_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_player_group_new_url
    assert_response :success
  end
end
