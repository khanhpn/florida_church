require "test_helper"

class ArtCraftGroupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get art_craft_group_index_url
    assert_response :success
  end
end
