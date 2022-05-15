require "test_helper"

class Admin::LectorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_lector_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_lector_new_url
    assert_response :success
  end
end
