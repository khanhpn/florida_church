require "test_helper"

class Admin::KnightColumbControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_knight_columb_index_url
    assert_response :success
  end
end
