require "test_helper"

class Admin::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_welcome_index_url
    assert_response :success
  end
end
