require "test_helper"

class Admin::CategoryGalleryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_category_gallery_index_url
    assert_response :success
  end
end
