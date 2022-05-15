require "test_helper"

class MarriageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get marriage_index_url
    assert_response :success
  end
end
