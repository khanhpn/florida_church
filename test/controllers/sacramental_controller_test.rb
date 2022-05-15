require "test_helper"

class SacramentalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sacramental_index_url
    assert_response :success
  end
end
