require "test_helper"

class HaitianPrayerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get haitian_prayer_index_url
    assert_response :success
  end
end
