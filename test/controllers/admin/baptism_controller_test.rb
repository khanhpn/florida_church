require "test_helper"

class Admin::BaptismControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_baptism_index_url
    assert_response :success
  end
end
