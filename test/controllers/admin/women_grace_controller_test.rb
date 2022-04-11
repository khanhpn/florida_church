require "test_helper"

class Admin::WomenGraceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_women_grace_index_url
    assert_response :success
  end
end
