require "test_helper"

class Admin::ArtCraftGroupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_art_craft_group_index_url
    assert_response :success
  end
end
