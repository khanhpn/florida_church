require "test_helper"

class Admin::EucharisticSaintVideoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_eucharistic_saint_video_index_url
    assert_response :success
  end
end
