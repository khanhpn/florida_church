require "test_helper"

class Admin::CouncilControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_council_index_url
    assert_response :success
  end
end
