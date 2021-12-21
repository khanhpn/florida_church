require "test_helper"

class CouncilControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get council_index_url
    assert_response :success
  end
end
