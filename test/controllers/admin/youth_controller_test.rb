require "test_helper"

class Admin::YouthControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_youth_index_url
    assert_response :success
  end
end
