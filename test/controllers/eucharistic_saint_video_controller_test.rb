require "test_helper"

class EucharisticSaintVideoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get eucharistic_saint_video_index_url
    assert_response :success
  end
end
