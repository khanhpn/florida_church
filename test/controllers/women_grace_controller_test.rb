require "test_helper"

class WomenGraceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get women_grace_index_url
    assert_response :success
  end
end
