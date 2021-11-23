require "test_helper"

class Admin::AltarServerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_altar_server_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_altar_server_new_url
    assert_response :success
  end
end
