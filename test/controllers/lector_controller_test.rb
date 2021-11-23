require "test_helper"

class LectorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lector_index_url
    assert_response :success
  end
end
