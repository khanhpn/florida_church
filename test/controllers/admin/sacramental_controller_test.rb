require "test_helper"

class Admin::SacramentalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_sacramental_index_url
    assert_response :success
  end
end
