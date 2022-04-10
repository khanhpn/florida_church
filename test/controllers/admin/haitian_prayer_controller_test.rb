require "test_helper"

class Admin::HaitianPrayerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_haitian_prayer_index_url
    assert_response :success
  end
end
