require "test_helper"

class YouthControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get youth_index_url
    assert_response :success
  end
end
