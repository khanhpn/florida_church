require "test_helper"

class BaptismControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get baptism_index_url
    assert_response :success
  end
end
