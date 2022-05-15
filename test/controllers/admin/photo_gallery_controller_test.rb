require "test_helper"

class Admin::PhotoGalleryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_photo_gallery_index_url
    assert_response :success
  end
end
