require "test_helper"

class Admin::StaffControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_staff_index_url
    assert_response :success
  end
end
